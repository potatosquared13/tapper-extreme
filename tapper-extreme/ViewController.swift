//
//  ViewController.swift
//  tapper-extreme
//
//  Created by Daniel Eldrick Villanueva on 07/05/2019.
//  Copyright © 2019 lapaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
    //Properties
    var maxTaps: Int = 0
    var currentTaps: Int = 0
    
    
    //Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapLbl: UILabel!
    
    @IBAction func onCoinTapped(sender: UIButton!) {
        currentTaps = currentTaps + 1
        updateTapsLbl()
        
        if isGameOver() {
            restartGame()
        }
    }
    
    @IBAction func onPlayBtnPressed(sender: UIButton!) {  //pass the object that is tapped
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            logoImg.isHidden = true
            playBtn.isHidden = true
            howManyTapsTxt.isHidden = true
            
            tapBtn.isHidden = false
            tapLbl.isHidden = false
            
            
            maxTaps = Int(howManyTapsTxt.text!)!     //text may or may not have a value. it gaurantees that there is a value
            currentTaps = 0
            
            updateTapsLbl()
        }
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        logoImg.isHidden = false
        playBtn.isHidden = false
        howManyTapsTxt.isHidden = false
        
        tapBtn.isHidden = true
        tapLbl.isHidden = true
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    func updateTapsLbl() {
        tapLbl.text = "\(currentTaps) Taps"
    }
}

