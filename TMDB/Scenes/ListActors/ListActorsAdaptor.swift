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
    var list: [Person]? = []
    
    var reloadData: (() -> Void)?
    
    var showEmptyState: ((Bool) -> Void)?
    
    func add(item: Person) {
        list?.append(item)
    }
    
    func add(items: [Person]) {
        for person in items{
            self.add(item: person)
        }
//        list = list ?? [] + items
//        list? += items
//        list = items
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
        if let path = list?[indexPath.row].profilePath {
            let url = "https://image.tmdb.org/t/p/w500/"+path
            cell.cellImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "avatar"))
        }
        
//        if let lastCell = tableView.cellForRow(at: IndexPath(row: tableView.numberOfRows(inSection: 0)-1, section: 0)) {
//             let lastCellBottomY = lastCell.frame.maxY
//             let delta = tableView.contentSize.height - lastCellBottomY
//            if delta <
//        }
        return cell
    }
    
}
