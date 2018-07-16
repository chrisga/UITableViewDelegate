//
//  ViewController.swift
//  UITableViewDelegate
//
//  Created by Chris Gallagher on 7/14/18.
//  Copyright © 2018 Chris Gallagher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var tableView = UITableView()
	var tableContents = ["Apple", "Banana", "Coconut"]
	let tableViewCellID = "tableViewCellID"

	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		setupTableView()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func setupTableView() {
		
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(TableViewCell.self, forCellReuseIdentifier: tableViewCellID)
		view.addSubview(tableView)
		
		// Constraints
		tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		tableView.topAnchor.constraint(equalTo: view.topAnchor, constant:25).isActive = true
		tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
	}
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, TableCellDelegate {
	func TableCellButtonClicked(_ sender: TableViewCell) {
		
		if let cellIndexPath = tableView.indexPath(for: sender) {
			print("Row clicked: \(cellIndexPath.row)")
		}
	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return tableContents.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellID, for: indexPath) as! TableViewCell
		cell.textLabel?.text = tableContents[indexPath.row]
		cell.delegate = self
		return cell
	}

}
