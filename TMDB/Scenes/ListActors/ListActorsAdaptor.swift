//
//  ListActorsAdaptor.swift
//  TMDB
//
//  Created by Samira.Marassy on 10/1/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import UIKit

class ListActorsAdaptor : NSObject , BaseListAdapterProtocol, UITableViewDataSource{
    
    
    typealias DataType = Person
    var list: [Person]?
    
    var reloadData: (() -> Void)?
    
    var showEmptyState: ((Bool) -> Void)?
    
    func add(item: Person) {
        
    }
    
    func add(items: [Person]) {
        list = items
    }
    
    func update(item: Person) {
        
    }
    
    func count() -> Int {
        return list?.count ?? 0
    }
    
    func isLastIndex(index: IndexPath) -> Bool {
        guard let count = list?.count else{
            return false
        }
        if index.row == count-1{
            return true
        }else{
            return false
        }
    }
    
    func clear(reload: Bool) {
        if reload{
            list?.removeAll()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.count()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
