//
//  TutorialVC.swift
//  Sweet Dreams App
//
//  Created by Uladzislau Daratsiuk on 6/14/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

class TutorialVC: UIViewController {
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "background6")
        return image
    }()
    
    lazy var glassView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        return view
    }()
    
    let firstTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.white.withAlphaComponent(1)
        label.font = UIFont(name: "SavoyeLetPlain", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.layer.cornerRadius = 2
        label.clipsToBounds = true
        label.text = "To start just select one of the sounds and it will strat playing sound automatically"
        label.numberOfLines = 3
        return label
    }()
    
    lazy var firstImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "fireplace")
        return image
    }()
    
    let secondTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.white.withAlphaComponent(1)
        label.font = UIFont(name: "SavoyeLetPlain", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.layer.cornerRadius = 2
        label.clipsToBounds = true
        label.text = "Control buttons for player help you to play sound, set up the loop or restart sound "
        label.numberOfLines = 3
        return label
    }()
    
    lazy var secondImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "play")
        image.tintColor = .white
        image.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.layer.borderColor = UIColor.white.cgColor.copy(alpha: 0.3)
        image.layer.borderWidth = 1
        return image
    }()
    
    fileprivate func setupNavBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"back"), style: .plain, target: self, action: #selector(handleBack))
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.title = "Tutorial"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "PartyLetPlain", size: 30)]
    }
    
    let thirdTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.white.withAlphaComponent(1)
        label.font = UIFont(name: "SavoyeLetPlain", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.layer.cornerRadius = 2
        label.clipsToBounds = true
        label.text = "Menu can help you easy to navigate thru our application"
        label.numberOfLines = 3
        return label
    }()
    
    lazy var thirdImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "menu")
        return image
    }()
    
    fileprivate func setupView(){
        backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        glassView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        glassView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        glassView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        glassView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        glassView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        glassView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        firstTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstTextLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        firstTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        firstTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        firstTextLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        firstImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        firstImageView.topAnchor.constraint(equalTo: firstTextLabel.bottomAnchor, constant: 10).isActive = true
        firstImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        firstImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        secondTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondTextLabel.topAnchor.constraint(equalTo: firstImageView.bottomAnchor, constant: 10).isActive = true
        secondTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        secondTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        secondTextLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        secondImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondImageView.topAnchor.constraint(equalTo: secondTextLabel.bottomAnchor, constant: 10).isActive = true
        secondImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        secondImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        thirdTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdTextLabel.topAnchor.constraint(equalTo: secondImageView.bottomAnchor, constant: 10).isActive = true
        thirdTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        thirdTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        thirdTextLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        thirdImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        thirdImageView.topAnchor.constraint(equalTo: thirdTextLabel.bottomAnchor, constant: 10).isActive = true
        thirdImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        thirdImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }

    fileprivate func addViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(glassView)
        glassView.addSubview(firstTextLabel)
        glassView.addSubview(firstImageView)
        glassView.addSubview(secondTextLabel)
        glassView.addSubview(secondImageView)
        glassView.addSubview(thirdTextLabel)
        glassView.addSubview(thirdImageView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setupNavBar()
        setupView()
    }
}
