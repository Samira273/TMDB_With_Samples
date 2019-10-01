//
//  ListActorsPresenter.swift
//  TMDB
//
//  Created by Samira.Marassy on 10/1/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class ListActorsPresenter : BasePresenter ,ListActorsPresenterProtocol , ListActorsPresenterAssembable{
    
    var view: ListActorsViewController?
    var currentPage: Int = 1
    var model: ListActorsModel
    
    required init(view: ListActorsViewController, model: ListActorsModel) {
        self.view = view
        self.model = model
    }
    

    typealias View = ListActorsViewController
    
    typealias Model = ListActorsModel

    func activateSearch() {
        
    }
    
    func cancelSearch() {
        
    }
    
   
    func loadActors() {
        model.getActors(forPage: currentPage, compelation: {result in
            switch result{
                
            case .success(let actorsResult):
                self.view?.setData(persons: actorsResult as? [Person] ?? [])
                
            case .failure(let error):
                self.view?.showErrorMessage(title: error.localizedDescription , message: "Network error")
            }
        })
    }
    
    func refreshActores() {
        self.currentPage = 1
        self.loadActors()
    }
    
    func loadMoreActores() {
        self.currentPage += 1
        self.loadActors()
    }
    
    
}
