//
//  PersonCellTableViewCell.swift
//  APItableViewPersonProgramatically
//
//  Created by Srikanth Kyatham on 12/3/24.
//

import UIKit

class PersonCell: UITableViewCell {
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        setUpConstraints()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints(){
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func config(from person: PersonModel) {
        let text = """
                ID: \(person.id ?? 0)
                Name: \(person.name ?? "N/A")
                Username: \(person.username ?? "N/A")
                email: \(person.email ?? "N/A")
                Address: Street \(person.address?.street ?? "N/A")  Suite: \(person.address?.suite ?? "N/A") 
                City: \(person.address?.city ?? "N/A") ZipCode: \(person.address?.zipcode ?? "N/A")
                lat: \(person.address?.geo?.lat ?? "N/A") lng: \(person.address?.geo?.lng ?? "N/A")
                Phone: \(person.phone ?? "N/A")
                """
        label.text = text
    }

}
