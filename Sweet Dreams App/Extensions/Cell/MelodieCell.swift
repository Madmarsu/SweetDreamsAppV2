//
//  MelodieCell.swift
//  Sweet Dreams App
//
//  Created by Uladzislau Daratsiuk on 6/14/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

class MelodieCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    let melodieIconImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.image = UIImage(named: "train")
        return image
    }()
    
    
    let melodieName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.white.withAlphaComponent(1)
        label.font = UIFont(name: "SavoyeLetPlain", size: 20)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.layer.cornerRadius = 2
        label.clipsToBounds = true
        label.text = "Text"
        return label
    }()
    
    func  setupView(){
        addSubview(melodieIconImage)
        addSubview(melodieName)
        
        melodieIconImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 1).isActive = true
        melodieIconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        melodieIconImage.widthAnchor.constraint(equalToConstant: 65).isActive = true
        melodieIconImage.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        melodieName.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        melodieName.topAnchor.constraint(equalTo: melodieIconImage.bottomAnchor,constant: 2).isActive = true
        melodieName.heightAnchor.constraint(equalToConstant: 25).isActive = true
        melodieName.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        melodieName.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
    
    func updateCellData(melodie: Melodie){
        melodieName.text = melodie.name
        melodieIconImage.image = UIImage(named: melodie.icon)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
