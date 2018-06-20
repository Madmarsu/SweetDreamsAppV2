//
//  BabyHandlers.swift
//  Sweet Dreams App
//
//  Created by Uladzislau Daratsiuk on 6/15/18.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

extension BabyVC {
    @objc public func handleBack(){
        let vc = UINavigationController(rootViewController: MainVC())
        present(vc, animated: true, completion: nil)
    }
    
    @objc public func handleMenu(){
        if (menuShowing){
            UIView.animate(withDuration: 0.3) {
                self.menuHeightAnchor?.isActive = false
                self.menuHeightAnchor = self.menuView.heightAnchor.constraint(equalToConstant: 0)
                self.menuHeightAnchor?.isActive = true
                self.view.layoutIfNeeded()
            }
        }else{
            UIView.animate(withDuration: 0.3, animations: {
                self.menuHeightAnchor?.isActive = false
                self.menuHeightAnchor = self.menuView.heightAnchor.constraint(equalToConstant: 250)
                self.menuHeightAnchor?.isActive = true
                self.view.layoutIfNeeded()
            }) { (true) in
            }
        }
        menuShowing = !menuShowing
    }
    
    @objc public func handleShare(){
        let activityVC = UIActivityViewController(activityItems: ["Take a look on this amazing App. called Sweet Dreams"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @objc public func handleBackground(melodie: Melodie){
        self.backgroundImageView.alpha = 0.3
        self.descriptionLabel.alpha = 0.3
        UIView.animate(withDuration: 0.5, animations: {
            self.backgroundImageView.image = UIImage(named: melodie.background)
            self.backgroundImageView.alpha = 1
            self.descriptionLabel.text = melodie.desc
            self.descriptionLabel.alpha = 1
        }, completion: nil)
    }
    
    @objc public func creatMelodiesArray()->[Melodie]{
        var array: [Melodie] = []
 
        let item1 = Melodie(name: "Cleaner", icon: "cleaner", background: "background23", melodie: "cleaner", desc: "Sound to relax Baby To Go To Sleep Soothing Vacuum Cleaner")
        let item2 = Melodie(name: "Dryer", icon: "dryer", background: "background23", melodie: "dryer", desc: "Hair Dryer White Noise for your Baby")
        let item3 = Melodie(name: "Airplain", icon: "plain", background: "background23", melodie: "plain", desc: "You've reached cruising altitude on your transatlantic flight")
        let item4 = Melodie(name: "Fan", icon: "fan", background: "background23", melodie: "fan", desc: "The sound of a oscillating fan")
    
        array.append(item1)
        array.append(item2)
        array.append(item3)
        array.append(item4)
        
        return array
    }
    
    @objc public func creatMenuArray() -> [Menu] {
        var array: [Menu] = []
        
        let item1 = Menu(name: "Main", icon: "main", vc: MainVC())
        let item2 = Menu(name: "Tutorial", icon: "tutorial", vc: TutorialVC())
        let item3 = Menu(name: "About", icon: "about", vc: AboutVC())
        
        array.append(item1)
        array.append(item2)
        array.append(item3)
        return array
    }
    
    @objc public func playTrack(trackName: String){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: trackName, ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            let session = AVAudioSession.sharedInstance()
            try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
            playerSlider.minimumValue = 0.0
            playerSlider.maximumValue = Float(audioPlayer.duration)
            _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainVC.updateSlider), userInfo: nil, repeats: true )
            do {
                try session.setCategory(AVAudioSessionCategoryPlayback)
            }catch{
                print("error")
            }
            audioPlayer.play()
            playButton.setImage(UIImage(named: "pause"), for: .normal)
            hideMenu()
        }catch {
            print(error)
        }
    }
    
    @objc public func updateSlider(){
        playerSlider.value = Float(audioPlayer.currentTime)
        let time = Int(audioPlayer.currentTime)
        let trackSeconds = Int(time) % 60
        let trackMin = Int(time / 60)
        timeLabel.text = String(trackMin) + ":" + String(trackSeconds)
    }
    
    @objc public func handlePlay(){
        if audioPlayer.isPlaying == false {
            audioPlayer.play()
            playButton.setImage(UIImage(named: "pause"), for: .normal)
        }else if audioPlayer.isPlaying == true {
            audioPlayer.pause()
            playButton.setImage(UIImage(named: "play"), for: .normal)
        }else{
            print(Error.self)
        }
    }
    
    @objc public func handleRepeat(){
        if audioPlayer.isPlaying{
            audioPlayer.currentTime = 0
            audioPlayer.play()
        }else{
            audioPlayer.currentTime = 0
            audioPlayer.play()
        }
    }
    
    @objc public func handleSlider(){
        if audioPlayer.isPlaying == true {
            audioPlayer.stop()
            audioPlayer.currentTime = TimeInterval(playerSlider.value)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }else{
            print(Error.self)
        }
        
    }
    
    @objc public func handleLoop(){
        if audioPlayer.numberOfLoops == 0 {
            audioPlayer.numberOfLoops = -1
            dotLabel.isHidden = false
        }else{
            audioPlayer.numberOfLoops = 0
            dotLabel.isHidden = true
        }
    }
    
    @objc public func firstTrack(trackName: String){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: trackName, ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            let session = AVAudioSession.sharedInstance()
            try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
            playerSlider.minimumValue = 0.0
            playerSlider.maximumValue = Float(audioPlayer.duration)
            _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainVC.updateSlider), userInfo: nil, repeats: true )
            do {
                try session.setCategory(AVAudioSessionCategoryPlayback)
            }catch{
                print("error")
            }
            audioPlayer.stop()
        }catch {
            print(error)
        }
    }
    
    @objc public func hideMenu(){
        menuShowing = false
        UIView.animate(withDuration: 0.3) {
            self.menuHeightAnchor?.isActive = false
            self.menuHeightAnchor = self.menuView.heightAnchor.constraint(equalToConstant: 0)
            self.menuHeightAnchor?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
}
