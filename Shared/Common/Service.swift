//
//  Service.swift
//  Doyduk
//
//  Created by Oğuz Demirhan on 24.12.2021.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    enum endpoint: String {
        case categories = "categories"
        case dishes = "dishes"
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
    
    func fetchRequest(endpoint : endpoint,completion: @escaping (Result<DoydukModel, DoydukError>) -> ()){
        
        let requestString = "\(Constants.baseURL)\(endpoint.rawValue)"
        
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
                let response = try JSONDecoder().decode(DoydukModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(response))
                    print(response)
                }
            }
            catch{
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}
