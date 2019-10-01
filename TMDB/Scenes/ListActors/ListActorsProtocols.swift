//
//  ListActorsProtocols.swift
//  TMDB
//
//  Created by Samira.Marassy on 10/1/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
protocol ListActorsPresenterProtocol: BasePresenterProtoc
func getActors(forPage page: Int, compelation: @escaping (Result<Any, Error>) -> Void) {
    <#code#>
}
ol {
    
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
    func getActors(forPage page:Int ,  compelation: @escaping (Result<Any,Error>) -> Void)
}

protocol ListActorsPresenterAssembable : BasePresenterAssembable{
    
}
