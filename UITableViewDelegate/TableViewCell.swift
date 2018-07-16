//
//  TableView.swift
//  UITableViewDelegate
//
//  Created by Chris Gallagher on 7/14/18.
//  Copyright © 2018 Chris Gallagher. All rights reserved.
//

import Foundation
import UIKit

protocol TableCellDelegate : class {
	
	func TableCellButtonClicked (_ sender: TableViewCell)
	
}

class TableViewCell: UITableViewCell {
	
	var button = UIButton()
	weak var delegate: TableCellDelegate?
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		setupCell()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupCell() {
		
		button.translatesAutoresizingMaskIntoConstraints = false
		button.backgroundColor = UIColor.purple
		button.addTarget(self, action:#selector(buttonClicked), for: .touchUpInside)
		addSubview(button)
		
		// Constraints
		button.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45).isActive = true
		button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
		button.topAnchor.constraint(equalTo: self.topAnchor, constant: 10 ).isActive = true
		button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10 ).isActive = true

	}
	
	@objc func buttonClicked ( sender: UIButton) {
		
		delegate?.TableCellButtonClicked(self)
	}
	
}

