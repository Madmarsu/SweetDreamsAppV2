//
//  MainVC.swift
//  Sweet Dreams App
//
//  Created by Uladzislau Daratsiuk on 6/14/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit
import AVFoundation

class MainVC: UIViewController {
    
    let melodieCellId = "melodieCellId"
    let menuCellId = "menuCellId"
    var listOfMelodies: [Melodie] = []
    var menuList: [Menu] = []
    var audioPlayer = AVAudioPlayer()
    var menuHeightAnchor: NSLayoutConstraint?
    var menuShowing = false
    
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
    
    lazy var menuView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    lazy var menuTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.white.withAlphaComponent(1)
        label.font = UIFont(name: "SavoyeLetPlain", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.layer.cornerRadius = 2
        label.clipsToBounds = true
        label.text = "Menu"
        return label
    }()
    
    lazy var menuLogo: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "menu")
        return image
    }()
    
    lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 1, bottom: 1, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(MenuCell.self, forCellWithReuseIdentifier: menuCellId)
        view.backgroundColor = UIColor.black.withAlphaComponent(0)
        view.isScrollEnabled = true
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
        label.text = "Select your sound:"
        return label
    }()
    
    lazy var melodieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 1, bottom: 1, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(MelodieCell.self, forCellWithReuseIdentifier: melodieCellId)
        view.backgroundColor = UIColor.black.withAlphaComponent(0)
        view.isScrollEnabled = true
        return view
    }()
    
    lazy var playButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "play"), for: .normal)
        button.tintColor = UIColor.white.withAlphaComponent(0.7)
        button.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handlePlay), for: .touchUpInside)
        button.layer.borderColor = UIColor.white.cgColor.copy(alpha: 0.3)
        button.layer.borderWidth = 1
        return button
    }()
    
    lazy var repeatButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "repeat"), for: .normal)
        button.tintColor = UIColor.white.withAlphaComponent(0.7)
        button.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleRepeat), for: .touchUpInside)
        button.layer.borderColor = UIColor.white.cgColor.copy(alpha: 0.3)
        button.layer.borderWidth = 1
        return button
    }()
    
    lazy var loopButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "loop"), for: .normal)
        button.tintColor = UIColor.white.withAlphaComponent(0.7)
        button.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleLoop), for: .touchUpInside)
        button.layer.borderColor = UIColor.white.cgColor.copy(alpha: 0.3)
        button.layer.borderWidth = 1
        return button
    }()
    
    lazy var playerSlider: UISlider = {
       let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.tintColor = UIColor.white.withAlphaComponent(0.9)
        slider.addTarget(self, action: #selector(handleSlider), for: .allEvents)
        slider.tintColor = UIColor.purple.withAlphaComponent(0.7)
        return slider
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.white.withAlphaComponent(1)
        label.font = UIFont(name: "SavoyeLetPlain", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.layer.cornerRadius = 2
        label.clipsToBounds = true
        label.text = "Here is a story.."
        label.numberOfLines = 2
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.white.withAlphaComponent(1)
        label.font = UIFont(name: "SavoyeLetPlain", size: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.layer.cornerRadius = 2
        label.clipsToBounds = true
        label.numberOfLines = 1
        return label
    }()
    
    let dotLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 5
        label.layer.borderColor = UIColor.white.cgColor.copy(alpha: 0.7)
        label.layer.borderWidth = 1
        label.clipsToBounds = true
        label.numberOfLines = 1
        label.backgroundColor = UIColor.purple
        label.clipsToBounds = true
        label.isHidden = true
        return label
    }()
    
    
    
    
    fileprivate func setupNavBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"menu"), style: .plain, target: self, action: #selector(handleMenu))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"share"), style: .plain, target: self, action: #selector(handleShare))
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
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
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        melodieCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        melodieCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        melodieCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        melodieCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        melodieCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playButton.topAnchor.constraint(equalTo: melodieCollectionView.bottomAnchor, constant: 40).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        repeatButton.rightAnchor.constraint(equalTo: playButton.leftAnchor, constant: -20).isActive = true
        repeatButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        repeatButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        repeatButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        playerSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playerSlider.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 10).isActive = true
        playerSlider.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        playerSlider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        playerSlider.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        timeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        loopButton.leftAnchor.constraint(equalTo: playButton.rightAnchor, constant: 20).isActive = true
        loopButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        loopButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loopButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        dotLabel.leftAnchor.constraint(equalTo: loopButton.rightAnchor, constant: -8).isActive = true
        dotLabel.topAnchor.constraint(equalTo: loopButton.topAnchor).isActive = true
        dotLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        dotLabel.widthAnchor.constraint(equalToConstant: 10).isActive = true
        
        menuView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        menuView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        menuView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        menuHeightAnchor = menuView.heightAnchor.constraint(equalToConstant: 0)
        menuHeightAnchor?.isActive = true
        
        menuTitleLabel.centerXAnchor.constraint(equalTo: menuView.centerXAnchor).isActive = true
        menuTitleLabel.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 10).isActive = true
        menuTitleLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        menuTitleLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        menuLogo.centerYAnchor.constraint(equalTo: menuTitleLabel.centerYAnchor).isActive = true
        menuLogo.leftAnchor.constraint(equalTo: menuTitleLabel.rightAnchor, constant: 10).isActive = true
        menuLogo.heightAnchor.constraint(equalToConstant: 30).isActive = true
        menuLogo.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        menuCollectionView.centerXAnchor.constraint(equalTo: menuView.centerXAnchor).isActive = true
        menuCollectionView.topAnchor.constraint(equalTo: menuTitleLabel.bottomAnchor, constant: 5).isActive = true
        menuCollectionView.widthAnchor.constraint(equalToConstant: 240).isActive = true
        menuCollectionView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImageView)
        view.addSubview(glassView)
        view.addSubview(titleLabel)
        view.addSubview(melodieCollectionView)
        view.addSubview(playButton)
        view.addSubview(repeatButton)
        view.addSubview(playerSlider)
        view.addSubview(descriptionLabel)
        view.addSubview(timeLabel)
        view.addSubview(loopButton)
        view.addSubview(dotLabel)
        view.addSubview(menuView)
        menuView.addSubview(menuTitleLabel)
        menuView.addSubview(menuLogo)
        menuView.addSubview(menuCollectionView)
        firstTrack(trackName: "city")
        setupNavBar()
        setupView()
        melodieCollectionView.delegate = self
        melodieCollectionView.dataSource = self
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        listOfMelodies = creatMelodiesArray()
        menuList = creatMenuArray()
    }

  

}
