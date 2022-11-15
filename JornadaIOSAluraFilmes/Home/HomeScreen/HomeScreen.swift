//
//  HomeScreen.swift
//  JornadaIOSAluraFilmes
//
//  Created by Fernanda Perovano on 12/11/22.
//

import UIKit

class HomeScreen: UIView {

    lazy var movieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.text = "Filmes Populares"
        return label
    }()
    
    lazy var tableview: UITableView = {
       let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.register(UserDetailTableViewCell.self, forCellReuseIdentifier: UserDetailTableViewCell.identifier)
        tableview.backgroundColor = .systemPurple
        return tableview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupConstraints()
        self.configBackGround()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackGround() {
        self.backgroundColor = .purple
    }
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, datasource: UITableViewDataSource) {
        self.tableview.delegate = delegate
        self.tableview.dataSource = datasource
    }
    
    private func setupConstraints() {
        self.addSubview(movieLabel)
        self.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            
            self.movieLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 87),
            self.movieLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.tableview.topAnchor.constraint(equalTo: self.movieLabel.bottomAnchor, constant: 32),
            self.tableview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableview.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.tableview.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        ])
    }
}
