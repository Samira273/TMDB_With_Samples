//
//  ListActorsAdaptor.swift
//  TMDB
//
//  Created by Samira.Marassy on 10/1/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

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

        tableView.register(UINib(nibName: "ActorsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        let cell : ActorsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ActorsTableViewCell
        cell.cellLabel.text = list?[indexPath.row].name
//        let path = list?[indexPath.row].profilePath ?? " "
//        let url = "https://image.tmdb.org/t/p/w500/"+path
        if let path = list?[indexPath.row].profilePath {
           let url = "https://image.tmdb.org/t/p/w500/"+path
           cell.cellImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "avatar"))
        }
        
       return cell
    }
    
    
}
