//
//  MelodieCollectionExt.swift
//  Sweet Dreams App
//
//  Created by Uladzislau Daratsiuk on 6/14/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import Foundation
import UIKit

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == melodieCollectionView {
            return listOfMelodies.count
        }else{
            return menuList.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == melodieCollectionView {
            let melodie = listOfMelodies[indexPath.row]
            let cell = melodieCollectionView.dequeueReusableCell(withReuseIdentifier: melodieCellId, for: indexPath) as! MelodieCell
            cell.updateCellData(melodie: melodie)
            cell.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            cell.layer.cornerRadius = 5
            return cell
        }else{
            let menu = menuList[indexPath.row]
            let cell = menuCollectionView.dequeueReusableCell(withReuseIdentifier: menuCellId, for: indexPath) as! MenuCell
            cell.updateCellData(menu: menu)
            cell.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
            cell.layer.cornerRadius = 5
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == melodieCollectionView {
            let melodie = listOfMelodies[indexPath.row]
            handleBackground(melodie: melodie)
            playTrack(trackName: melodie.melodie)
        }else{
            let menu = menuList[indexPath.row]
            let vc = UINavigationController(rootViewController: menu.vc)
            present(vc, animated: true, completion: nil)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == melodieCollectionView {
            return CGSize(width: 80, height: 90)
        }else{
            return CGSize(width: 70, height: 70)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == melodieCollectionView {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 10)
        }else{
         return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 10)
        }
    }
    
}
