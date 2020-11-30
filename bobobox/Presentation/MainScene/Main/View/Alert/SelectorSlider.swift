//
//  SelectorSlider.swift
//  bobobox
//
//  Created by Fatah on 30/11/20.
//

import UIKit

class SelectorSlider: UIView {
    @IBOutlet weak var sliderTableView: UITableView!
    
    var didSelect: ((key: String, value: String)?) -> Void = { _ in }
    var data = [Int: (key: String, value: String)]() {
        didSet { setupTableView() }
    }
    
    private func setupTableView() {
        sliderTableView.dataSource = self
        sliderTableView.delegate = self
        
        sliderTableView.reloadData()
    }
}

extension SelectorSlider: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row]?.value
        
        print(indexPath)
        
        return cell
    }
}

extension SelectorSlider: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelect(data[indexPath.row])
        removeFromSuperview()
    }
}
