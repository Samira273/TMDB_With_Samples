//
//  ListActorsViewController.swift
//  Sample MVP
//
//  Created by Bassem Abbas on 9/18/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

class ListActorsViewController: BaseViewController<ListActorsPresenter> , UITableViewDelegate , ListActorsViewProtocol {
    
    @IBOutlet weak var actorsTable: UITableView!
     var actorsTableDataSource : ListActorsAdaptor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actorsTable.delegate = self
        actorsTableDataSource = ListActorsAdaptor()
        actorsTable.dataSource = actorsTableDataSource
        presenter = ListActorsPresenter(view: self, model: ListActorsModel())
        presenter.loadActors()
        actorsTable.reloadData()
    }
    
    func setData(persons : [Person]){
        actorsTableDataSource?.add(items: persons)
        DispatchQueue.main.async {
            self.actorsTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(120)
    }
    
    func showErrorMessage(title: String?, message: String?) {
        
    }
}
