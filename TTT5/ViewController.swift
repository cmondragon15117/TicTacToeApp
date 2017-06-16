//
//  ViewController.swift
//  TTT5
//
//  Created by Crista Mondragon on 3/20/15.
//  Copyright (c) 2015 Mondragon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Outlets
    @IBOutlet weak var topLabel: UILabel!
    
    //Image Views
    @IBOutlet weak var topLeft: CustomImageView!
    @IBOutlet weak var topCenter: CustomImageView!
    @IBOutlet weak var topRight: CustomImageView!
    
    @IBOutlet weak var middleLeft: CustomImageView!
    @IBOutlet weak var middleCenter: CustomImageView!
    @IBOutlet weak var middleRight: CustomImageView!
    
    @IBOutlet weak var bottomLeft: CustomImageView!
    @IBOutlet weak var bottomCenter: CustomImageView!
    @IBOutlet weak var bottomRight: CustomImageView!
    

    //Variables
    var playerNumber = 1
    //Images
    let xImage = UIImage(named: "1")
    let oImage = UIImage(named: "2")
    let greenImage = UIImage(named: "greenImage")
    let blueImage = UIImage(named: "lightBlue")
    
    //Functions
    func resetGameBoard(){
        topLeft.image = blueImage
        topCenter.image = greenImage
        topRight.image = blueImage
        middleLeft.image = greenImage
        middleCenter.image = blueImage
        middleRight.image = greenImage
        bottomLeft.image = blueImage
        bottomCenter.image = greenImage
        bottomRight.image = blueImage
        playerNumber = 1
        topLabel.text = "Player 1's turn!"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        topLabel.text = "Player 1 goes first!"
        
        
        
    }
    
    //Ignore this
    var player1WonAlert = UIAlertController(title: "Player 1 Won!", message: "Wish to play again?", preferredStyle: UIAlertControllerStyle.actionSheet)
    var player2WonAlert = UIAlertController(title: "Player 2 Won!", message: "Wish to play again?", preferredStyle: UIAlertControllerStyle.actionSheet)
    var tieAlert = UIAlertController(title: "Whoops, Cat's Game", message: "Wish to play again?", preferredStyle: UIAlertControllerStyle.actionSheet)
    //var resetAlertButton = UIAlertAction(title: "Reset Game", style: UIAlertActionStyle.Default, handler: resetGameBoard(view2))

    

    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        
        print("Tapping")
        
        var locationOfTap = sender.location(in: view)
        
        print(locationOfTap)
        
        //changeImage uses class CustomImageView
        
        func changeImage(_ imageView: CustomImageView) {
            
            if imageView.frame.contains(locationOfTap) {
                
                print("WORK")
                
                if playerNumber == 1 {
                    imageView.image = xImage
                    //imageView.playerWhoOwns = 1
                    //imageView.beenTapped = true
                    print(playerNumber)
                    playerNumber = playerNumber + 1
                    topLabel.text = "Player 2's turn!"
                    
                }
                else if playerNumber == 2 {
                    imageView.image = oImage
                    //imageView.playerWhoOwns = 2
                    //imageView.beenTapped = true
                    print(playerNumber)
                    playerNumber = playerNumber - 1
                    topLabel.text = "Player 1's turn!"
                    
                }
                else {
                    
                    print("Dead")
                }
                
            }
            else {
                //println("Not tapping square")
            }
            
        }
        
        //Change Images for all image views:
        changeImage(topLeft)
        changeImage(topCenter)
        changeImage(topRight)
        changeImage(middleLeft)
        changeImage(middleCenter)
        changeImage(middleRight)
        changeImage(bottomLeft)
        changeImage(bottomCenter)
        changeImage(bottomRight)
        
        func findIfWinner(_ imageView1: CustomImageView, imageView2: CustomImageView, imageView3: CustomImageView)->Int {
            if imageView1.image == xImage && imageView1.image == imageView2.image && imageView2.image == imageView3.image {
                print("X won")
                topLabel.text = "Player 1 won!"
                return 1
            }
            else if imageView1.image == oImage && imageView1.image == imageView2.image && imageView2.image == imageView3.image {
                print("O won")
                topLabel.text = "Player 2 won!"
                return 2
            }
            else {
                return 0
            }
            
        }
        
        //Warnings caused by Swift depreciating some features
        
        //Rows
        findIfWinner(topLeft, imageView2: topCenter, imageView3: topRight)
        findIfWinner(middleLeft, imageView2: middleCenter, imageView3: middleRight)
        findIfWinner(bottomLeft, imageView2: bottomCenter, imageView3: bottomRight)
        //Columns
        findIfWinner(topLeft, imageView2: middleLeft, imageView3: bottomLeft)
        findIfWinner(topCenter, imageView2: middleCenter, imageView3: bottomCenter)
        findIfWinner(topRight, imageView2: middleRight, imageView3: bottomRight)
        //Diagonals
        findIfWinner(topLeft, imageView2: middleCenter, imageView3: bottomRight)
        findIfWinner(topRight, imageView2: middleCenter, imageView3: bottomLeft)
    }

    @IBAction func didTouchButton(_ sender: UIButton) {
        resetGameBoard()
    }
    
    
    
    
    
    
    
    
}

















