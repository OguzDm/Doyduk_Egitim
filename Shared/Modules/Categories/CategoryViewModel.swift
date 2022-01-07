//
//  CategoryViewModel.swift
//  Egitim_Doyduk (iOS)
//
//  Created by Remzi Solmaz on 5.01.2022.
//

import SwiftUI

enum ViewState {
    case loading
    case error
    case ready
}

class CategoryViewModel : BaseVieModel {
    
    @Published var categories: [DoydukResult] =  [DoydukResult]()
    @Published var chiefSpecial: DoydukResult?
   
}
extension CategoryViewModel {
    
    public func fetchCategories() {
        
        state = .loading
        
        Service.shared.fetchRequest(endpoint: .categories, model: DoydukModel.self) { [weak self] response in
            switch response {
            case .success(let model):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self?.categories = model.result ?? [DoydukResult]()
                    self?.state = .ready
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.state = .error
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    public func fetchCheifSpecial() {
        
        state = .loading
        let no = Int.random(in: 1..<34)
        Service.shared.fetchRequest(endpoint: .special(no: no), model: CheifSpecielModel.self) { [weak self] response in
            switch response {
            case .success(let model):
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self?.chiefSpecial = model.result
                    self?.state = .ready
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.state = .error
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    
}

