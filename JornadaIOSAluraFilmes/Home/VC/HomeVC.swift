//
//  HomeVC.swift
//  JornadaIOSAluraFilmes
//
//  Created by Fernanda Perovano on 12/11/22.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?
    var addFilmes: [Service] = [
        Service(title: "Órfã 2: A Origem", release_data: "Lançamento: 27/09/22", poster_path: UIImage(named: "filme")),
        Service(title: "Minions 2: A Origem de Gru", release_data: "Lançamento: 30/06/22", poster_path: UIImage(named: "filme")),
        Service(title: "Thor: Amor e Trovão", release_data: "Lançamento: 07/07/22", poster_path: UIImage(named: "filme")),
        Service(title: "Avatar", release_data: "Lançamento: 18/12/22", poster_path: UIImage(named: "filme"))
    ]
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.configTableViewProtocols(delegate: self, datasource: self)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.addFilmes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        cell?.setupCell(data: self.addFilmes[indexPath.row])
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 194
    }
}
