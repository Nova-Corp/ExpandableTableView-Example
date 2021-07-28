//
//  ViewController.swift
//  ExpandableTableView-Example
//
//  Created by ADMIN on 28/07/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

struct HomeData {
    let header: String
    var selected: Bool = true
    let content: [String]
    
    mutating func isSelected() { selected = !selected }
}

class ViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    var homeData: [HomeData] = [
        HomeData(header: "Section 1", content: ["Cell 1", "Cell 2", "Cell 3", "Cell 4"]),
        HomeData(header: "Section 2", content: ["Cell 1", "Cell 2",]),
        HomeData(header: "Section 3", content: ["Cell 1", "Cell 2", "Cell 3"]),
        HomeData(header: "Section 5", content: ["Cell 1"]),
        HomeData(header: "Section 6", content: ["Cell 1", "Cell 2"]),
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TableViewCell Config
        let homeCellNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeTableView.register(homeCellNib, forCellReuseIdentifier: "HomeTableViewCell")
        
        let homeHeaderCellNib = UINib(nibName: "HeaderTableViewCell", bundle: nil)
        homeTableView.register(homeHeaderCellNib, forCellReuseIdentifier: "HeaderTableViewCell")
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell")
        headerView?.addTapGestureRecognizer(with: #selector(handleTap(sender:)), target: self, tag: section)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        112
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        guard let section: Int = sender.view?.tag else { return }
        homeData[section].isSelected()
        homeTableView.reloadData()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        homeData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeData[section].selected ? 0 : homeData[section].content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Cell"
        return cell
    }
}
