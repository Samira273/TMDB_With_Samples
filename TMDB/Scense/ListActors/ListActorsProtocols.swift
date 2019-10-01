//
//  ListActorsProtocols.swift
//  TMDB
//
//  Created by Samira.Marassy on 10/1/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
protocol ListActorsPresenterProtocol: BasePresenterProtocol {
    
    var currentPage:Int { get set }
    
    func activateSearch()
    func cancelSearch()
    func loadActors()
    func refreshActores()
    func loadMoreActores()
    
}

protocol ListActorsViewProtocol:BaseViewProtocol {
    
}

protocol ListActorsModelProtocol:BaseModelProtocol {
    func getActors(forPage page:Int , compelation: Result<Any,Error>)
}
