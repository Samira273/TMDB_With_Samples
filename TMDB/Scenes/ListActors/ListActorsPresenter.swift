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
        self.loadActors()
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
                
            case .success(_):
                <#code#>
            case .failure(_):
                <#code#>
            }
            
            })
    }
    
    func refreshActores() {
        
    }
    
    func loadMoreActores() {
        
    }
    
    
}
