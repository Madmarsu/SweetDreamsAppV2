//
//  File.swift
//  Sweet Dreams App
//
//  Created by Uladzislau Daratsiuk on 6/14/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import Foundation
import UIKit

extension MenuVC {
    @objc public func handleEnter(){
        let vc = UINavigationController(rootViewController: MainVC())
        present(vc, animated: true, completion: nil)
    }
    
    @objc public func animationHandler(){
        UIView.animate(withDuration: 0.7) {
            self.mainButton.alpha = 1
        }
    }
}
