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
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    private let myRefreshControler = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actorsTable.delegate = self
        actorsTableDataSource = ListActorsAdaptor()
        actorsTable.dataSource = actorsTableDataSource
        presenter = ListActorsPresenter(view: self, model: ListActorsModel())
        activity.isHidden = true
        self.myRefreshControler.attributedTitle = NSAttributedString(string: "Refreshing")
        myRefreshControler.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        actorsTable.refreshControl = myRefreshControler
        presenter.loadActors()
        actorsTable.reloadData()
    }
    
    @objc func refresh(sender:AnyObject) {
        // Code to refresh table view
//        searchBar.resignFirstResponder()
//        searchBar.endEditing(true)
        //            homeScreenPresenter?.settingPageNo(page: 1)
        //            homeScreenPresenter?.bringAndRender(caller : "refresh")
        actorsTableDataSource?.clear(reload: true)
        presenter.refreshActores()
        self.myRefreshControler.endRefreshing()
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y/(scrollView.contentSize.height - scrollView.frame.size.height)
        let relativeHeight = 1 - (actorsTable.rowHeight / (scrollView.contentSize.height - scrollView.frame.size.height))
        if y >= relativeHeight{
            presenter.loadMoreActores()
            DispatchQueue.main.async {
                self.actorsTable.reloadData()
            }
        }
    }
}
