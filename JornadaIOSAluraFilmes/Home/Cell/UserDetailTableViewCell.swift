//
//  UserDetailTableViewCell.swift
//  JornadaIOSAluraFilmes
//
//  Created by Fernanda Perovano on 13/11/22.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {
    
    static let identifier: String = "UserDetailTableViewCell"
    
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.backgroundColor = .red
        stack.spacing = 16.0
        return stack
    }()
    
    lazy var subStackview: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.backgroundColor = .green
        return stack
    }()
    
    lazy var movieImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "mudancaDeHabito")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 40
        return image
    }()
    
    lazy var nameMovieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    lazy var launchDayMovieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        self.contentView.addSubview(self.mainStackView)
        self.mainStackView.addArrangedSubview(movieImage)
        self.mainStackView.addArrangedSubview(self.subStackview)
        self.subStackview.addArrangedSubview(self.nameMovieLabel)
        self.subStackview.addArrangedSubview(self.launchDayMovieLabel)
    }
    
    public func setupCell(data: Service) {
        self.movieImage.image = data.poster_path
        self.nameMovieLabel.text = data.title
        self.launchDayMovieLabel.text = data.release_data
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            self.mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.movieImage.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            self.movieImage.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 25),
            self.movieImage.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor),
            self.movieImage.heightAnchor.constraint(equalToConstant: 150),
            self.movieImage.widthAnchor.constraint(equalToConstant: 100),
            
//            self.nameMovieLabel.heightAnchor.constraint(equalToConstant: 30),
//            self.launchDayMovieLabel.heightAnchor.constraint(equalToConstant: 30)
            
//            self.subStackview.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 20),
//            self.subStackview.leadingAnchor.constraint(equalTo: self.movieImage.trailingAnchor, constant: 40),
//            self.subStackview.bottomAnchor.constraint(equalTo: self.mainStackView.bottomAnchor, constant: 40),
            
//            self.nameMovieLabel.topAnchor.constraint(equalTo: subStackview.topAnchor, constant: 75),
//            self.nameMovieLabel.leadingAnchor.constraint(equalTo: subStackview.leadingAnchor, constant: 8),
//
//            self.launchDayMovieLabel.topAnchor.constraint(equalTo: nameMovieLabel.bottomAnchor, constant: 8),
//            self.launchDayMovieLabel.leadingAnchor.constraint(equalTo: subStackview.leadingAnchor, constant: 8),
        ])
    }
}


