//
//  CustomTableView.swift
//  APItableViewPersonProgramatically
//
//  Created by Srikanth Kyatham on 12/3/24.
//

import UIKit

class CustomTableView: UITableView {
    init() {
        super.init(frame: .zero, style: .plain)
        translatesAutoresizingMaskIntoConstraints = false
        estimatedRowHeight = 200
        rowHeight = UITableView.automaticDimension
        register(PersonCell.self, forCellReuseIdentifier: "PersonCell")
        
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
