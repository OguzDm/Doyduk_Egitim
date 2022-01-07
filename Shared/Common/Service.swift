//
//  Service.swift
//  Doyduk
//
//  Created by Oğuz Demirhan on 24.12.2021.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    enum endpoint{
        case categories
        case dishes
        case special(no:Int)
        
        var query:String {
            switch self {
            case .categories:
                return "categories"
            case .dishes:
                return "dishes"
            case .special(let no):
                return "dishes/\(no)"
            }
        }
    }
    
    enum DoydukError:Error {
        
        case decodingError
        case dataError
        case urlError
        case responseError
        
        var localizedDescription: String {
            
            switch self {
            case .decodingError:
                return "Decoding error"
            case .dataError:
                return "Data error"
            case .urlError:
                return "URL error"
            case .responseError:
                return "Response error"
            }
        }
    }
    
    
    
    func fetchRequest<T: Decodable>(endpoint : endpoint,model: T.Type,completion: @escaping (Result<T, DoydukError>) -> Void){
        
        let requestString = "\(Constants.baseURL)\(endpoint.query)"
        
        guard let requestURL = URL(string: requestString) else {
            completion(.failure(.urlError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: requestURL) { data, resp, err in
            
            guard let httpResponse = resp as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                completion(.failure(.responseError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response))
                }
            }
            catch{
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}
