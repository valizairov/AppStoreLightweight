//
//  SearchViewController.swift
//  AppStoreLightweight
//
//  Created by Vali Zairov on 2/23/21.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableViewController: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SearchViewController")
        DataManager.shared.fetchData()

        // Do any additional setup after loading the view.
    }
    

}
