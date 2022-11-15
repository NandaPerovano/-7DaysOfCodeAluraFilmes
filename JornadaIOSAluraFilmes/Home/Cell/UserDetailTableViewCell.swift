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
        //let stack = UIStackView(arrangedSubviews: [movieImage])
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.backgroundColor = .purple
        [movieImage, subStackview].forEach { view in
            stack.addArrangedSubview(view)
        }
        stack.spacing = 16.0
        return stack
    }()
    
    lazy var subStackview: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.backgroundColor = .purple
        [nameMovieLabel,launchDayMovieLabel].forEach { view in
            stack.addArrangedSubview(view)
        }
        return stack
    }()
    
    lazy var movieImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "filme")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 10
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
        self.contentView.addSubview(self.subStackview)
        self.contentView.addSubview(self.movieImage)
        self.contentView.addSubview(self.nameMovieLabel)
        self.contentView.addSubview(self.launchDayMovieLabel)
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
            self.mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -250),
            self.mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.movieImage.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            self.movieImage.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 25),
            self.movieImage.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor),
            self.movieImage.heightAnchor.constraint(equalToConstant: 180),
            self.movieImage.widthAnchor.constraint(equalToConstant: 90),
            
            self.subStackview.topAnchor.constraint(equalTo: mainStackView.topAnchor),
            self.subStackview.leadingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            self.subStackview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.subStackview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.nameMovieLabel.topAnchor.constraint(equalTo: subStackview.topAnchor, constant: 75),
            self.nameMovieLabel.leadingAnchor.constraint(equalTo: subStackview.leadingAnchor, constant: 8),
            
            self.launchDayMovieLabel.topAnchor.constraint(equalTo: nameMovieLabel.bottomAnchor, constant: 8),
            self.launchDayMovieLabel.leadingAnchor.constraint(equalTo: subStackview.leadingAnchor, constant: 8),
            
            
        ])
    }
}


