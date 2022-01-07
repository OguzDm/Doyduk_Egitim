//
//  DetailViewModel.swift
//  Egitim_Doyduk (iOS)
//
//  Created by Remzi Solmaz on 5.01.2022.
//

import Foundation

class BaseVieModel: ObservableObject{
    
    @Published var state: ViewState =  .ready
    var errorMessage:String? = nil
}

class CategoryDetailViewModel : BaseVieModel {
    
    let category:DoydukResult
    
    init(_ category: DoydukResult) {
        self.category = category
        super.init()
    }
    
    @Published var dishes: [DoydukResult] =  [DoydukResult]()
   
    private var allDishes: [DoydukResult] =  [DoydukResult]() {
        didSet{
            
            dishes = allDishes.filter({ $0.categoryID == category.id})
        }
        
    }
    
}
extension CategoryDetailViewModel {
    
    public func fetchDishes() {
        
        state = .loading
        
        Service.shared.fetchRequest(endpoint: .dishes, model: DoydukModel.self) { [weak self] response in
            
            switch response {
            case .success(let model):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self?.allDishes = model.result ?? [DoydukResult]()
                    self?.state = .ready
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.state = .error
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
        

//        Service.shared.fetchRequest(endpoint: .dishes) {[weak self] response in
//
//
//            switch response {
//            case .success(let model):
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                    self?.allDishes = model.result ?? [DoydukResult]()
//                    self?.state = .ready
//                }
//
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    self?.state = .error
//                    self?.errorMessage = error.localizedDescription
//                }
//            }
//        }
    }
}

