//
//  MenuVC.swift
//  Sweet Dreams App
//
//  Created by Uladzislau Daratsiuk on 6/14/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "background6")
        return image
    }()
    
    lazy var mainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.textAlignment = .center
        button.setTitle("Sweet Dreams", for: .normal)
        button.titleLabel?.font = UIFont(name: "PartyLetPlain", size: 84)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.minimumScaleFactor = 0.5
        button.addTarget(self, action: #selector(handleEnter), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    
    lazy var sloganLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.white.withAlphaComponent(1)
        label.font = UIFont(name: "PartyLetPlain", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.layer.cornerRadius = 2
        label.clipsToBounds = true
        label.text = "Magic place for your dreams..."
        label.numberOfLines = 2
        return label
    }()

    fileprivate func setupNavBar(){
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.title = "Welcome"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "PartyLetPlain", size: 30)!]

    }
    
    fileprivate func setupView(){
        backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        mainButton.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        mainButton.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor).isActive = true
        mainButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        mainButton.leftAnchor.constraint(equalTo: backgroundImageView.leftAnchor,constant: 10).isActive = true
        mainButton.rightAnchor.constraint(equalTo: backgroundImageView.rightAnchor,constant: -10).isActive = true
        
        sloganLabel.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        sloganLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        sloganLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        sloganLabel.leftAnchor.constraint(equalTo: backgroundImageView.leftAnchor,constant: 10).isActive = true
        sloganLabel.rightAnchor.constraint(equalTo: backgroundImageView.rightAnchor,constant: -10).isActive = true
        
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImageView)
        view.addSubview(mainButton)
        view.addSubview(sloganLabel)
        setupNavBar()
        setupView()
        animationHandler()
    }


}
