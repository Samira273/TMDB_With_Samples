//
//  ListActorsModel.swift
//  TMDB
//
//  Created by Samira.Marassy on 10/1/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class ListActorsModel :  BaseModel ,ListActorsModelProtocol{
    func getActors(forPage page: Int, compelation: @escaping (Result<Any, Error>) -> Void) {
        
        let networkCompleted :  (Result< APIResponse<Person>, NetworkError> , StatusCode?) -> Void = { result,status  in
            switch result {
                
            case .success(let response):
                compelation(.success(response.results ?? []))
                
            case .failure(let error):
                compelation(.failure(error))
            }
        }
        NetworkManager.shared.getActors(pageNumber: page, completion: networkCompleted)
        
    }
    
    
}
