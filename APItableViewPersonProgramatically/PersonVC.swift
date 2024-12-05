//
//  ViewController.swift
//  APItableViewPersonProgramatically
//
//  Created by Srikanth Kyatham on 12/3/24.
//

import UIKit

class PersonVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let tableView = CustomTableView()
    private let viewModel = PersonViewModel()
    
    var url = "https://jsonplaceholder.typicode.com/users"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
        fetchDataAndupdateUI()
    }
    
    func fetchDataAndupdateUI() {
        viewModel.fetchPerson(from: url) { [weak self]  in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            ])
    }
}

extension PersonVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfpersons
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonCell
        guard let person = viewModel.personAtIndex(index: indexPath.row) else { return cell }
        cell.config(from: person)
        return cell
    }
    
}
