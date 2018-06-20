//
//  AboutVC.swift
//  Sweet Dreams App
//
//  Created by Uladzislau Daratsiuk on 6/14/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {

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
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.white.withAlphaComponent(1)
        label.font = UIFont(name: "SavoyeLetPlain", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.layer.cornerRadius = 2
        label.clipsToBounds = true
        label.text = "Developed by:"
        return label
    }()
    
    lazy var developerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.white.withAlphaComponent(1)
        label.font = UIFont(name: "SavoyeLetPlain", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.layer.cornerRadius = 2
        label.clipsToBounds = true
        label.text = "Uladzislau Daratsiuk"
        return label
    }()
    
    lazy var emailButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "email"), for: .normal)
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleEmail), for: .touchUpInside)
        return button
    }()
    
    lazy var facebookButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "facebook"), for: .normal)
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleFacebook), for: .touchUpInside)
        return button
    }()
    
    lazy var twitterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "twitter"), for: .normal)
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleTwitter), for: .touchUpInside)
        return button
    }()
    
    lazy var youtubeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "youtube"), for: .normal)
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleYoutube), for: .touchUpInside)
        return button
    }()
    
    lazy var rateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "rate"), for: .normal)
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleRate), for: .touchUpInside)
        return button
    }()
    
    
    fileprivate func setupNavBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"back"), style: .plain, target: self, action: #selector(handleBack))
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.title = "About us"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "PartyLetPlain", size: 30)!]
    }
    
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
        
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        developerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        developerLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        developerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        developerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        developerLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        emailButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailButton.topAnchor.constraint(equalTo: developerLabel.bottomAnchor, constant: 150).isActive = true
        emailButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        emailButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        rateButton.centerXAnchor.constraint(equalTo: emailButton.centerXAnchor).isActive = true
        rateButton.bottomAnchor.constraint(equalTo: emailButton.topAnchor, constant: -30).isActive = true
        rateButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        rateButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        twitterButton.centerYAnchor.constraint(equalTo: emailButton.centerYAnchor).isActive = true
        twitterButton.leftAnchor.constraint(equalTo: emailButton.rightAnchor, constant: 30).isActive = true
        twitterButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        twitterButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        facebookButton.centerYAnchor.constraint(equalTo: emailButton.centerYAnchor).isActive = true
        facebookButton.rightAnchor.constraint(equalTo: emailButton.leftAnchor, constant: -30).isActive = true
        facebookButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        facebookButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        youtubeButton.centerXAnchor.constraint(equalTo: emailButton.centerXAnchor).isActive = true
        youtubeButton.topAnchor.constraint(equalTo: emailButton.bottomAnchor, constant: 30).isActive = true
        youtubeButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        youtubeButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImageView)
        view.addSubview(glassView)
        view.addSubview(titleLabel)
        view.addSubview(developerLabel)
        view.addSubview(emailButton)
        view.addSubview(facebookButton)
        view.addSubview(twitterButton)
        view.addSubview(rateButton)
        view.addSubview(youtubeButton)
        setupNavBar()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
