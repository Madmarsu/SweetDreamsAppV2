//
//  MelodieModel.swift
//  Sweet Dreams App
//
//  Created by Uladzislau Daratsiuk on 6/14/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import Foundation
import UIKit

class Melodie: NSObject {
    let name: String
    let icon: String
    let background: String
    let melodie: String
    let desc: String
    
    init(name: String,icon: String, background: String , melodie: String, desc: String){
        self.name = name
        self.icon = icon
        self.background = background
        self.melodie = melodie
        self.desc = desc
        
    }
}
