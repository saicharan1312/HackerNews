//
//  ViewController.swift
//  HackerNews
//
//  Created by Sai Charan Thummalapudi on 6/25/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newsTable: UITableView!
    var viewModelObj = NewsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setNewsTable()
        extractData()
    }
    
    func setNewsTable() {
        newsTable.dataSource = self
        newsTable.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelObj.getCountTotalNews()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTable.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        let newsForCell = viewModelObj.getNewsFor(row: indexPath.row)
        cell.setData(data: newsForCell)
        return cell
    }
}

extension ViewController {
    func extractData() {
        viewModelObj.fetchData(url: dataUrls.newsUrl.rawValue) {
            DispatchQueue.main.async {
                self.newsTable.reloadData()
            }
        }
    }
}
