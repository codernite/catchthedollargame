//
//  ViewController.swift
//  CatchTheKennyGame
//
//  Created by Ali Kalburcu on 4.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0
    var timer = Timer()
    var counter = 0
    var dollarArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    
    
    //labels
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    //images
    @IBOutlet weak var dollar1: UIImageView!
    @IBOutlet weak var dollar2: UIImageView!
    @IBOutlet weak var dollar3: UIImageView!
    @IBOutlet weak var dollar4: UIImageView!
    @IBOutlet weak var dollar5: UIImageView!
    @IBOutlet weak var dollar6: UIImageView!
    @IBOutlet weak var dollar7: UIImageView!
    @IBOutlet weak var dollar8: UIImageView!
    @IBOutlet weak var dollar9: UIImageView!
    @IBOutlet weak var dollar10: UIImageView!
    @IBOutlet weak var dollar11: UIImageView!
    @IBOutlet weak var dollar12: UIImageView!
    @IBOutlet weak var dollar13: UIImageView!
    @IBOutlet weak var dollar14: UIImageView!
    @IBOutlet weak var dollar15: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "$ \(score)"
        
        //Highscore check
        
        let storedHighScore = UserDefaults.standard.object(forKey:"highscore")
        
        if storedHighScore == nil {
            
            highScore = 0
            highScoreLabel.text = "High $ \(highScore)"
            
        }
        
        if let newScore = storedHighScore as? Int {
            
            highScore = newScore
            highScoreLabel.text = "High $ \(highScore)"
        }
        
        dollar1.isUserInteractionEnabled = true
        dollar2.isUserInteractionEnabled = true
        dollar3.isUserInteractionEnabled = true
        dollar4.isUserInteractionEnabled = true
        dollar5.isUserInteractionEnabled = true
        dollar6.isUserInteractionEnabled = true
        dollar7.isUserInteractionEnabled = true
        dollar8.isUserInteractionEnabled = true
        dollar9.isUserInteractionEnabled = true
        dollar10.isUserInteractionEnabled = true
        dollar11.isUserInteractionEnabled = true
        dollar12.isUserInteractionEnabled = true
        dollar13.isUserInteractionEnabled = true
        dollar14.isUserInteractionEnabled = true
        dollar15.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target:self, action:#selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target:self, action:#selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target:self, action:#selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target:self, action:#selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target:self, action:#selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target:self, action:#selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target:self, action:#selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target:self, action:#selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target:self, action:#selector(increaseScore))
        let recognizer10 = UITapGestureRecognizer(target:self, action:#selector(increaseScore))
        let recognizer11 = UITapGestureRecognizer(target:self, action:#selector(increaseScore))
        let recognizer12 = UITapGestureRecognizer(target:self, action:#selector(increaseScore))
        let recognizer13 = UITapGestureRecognizer(target:self, action:#selector(increaseScore))
        let recognizer14 = UITapGestureRecognizer(target:self, action:#selector(increaseScore))
        let recognizer15 = UITapGestureRecognizer(target:self, action:#selector(increaseScore))
        
        dollar1.addGestureRecognizer(recognizer1)
        dollar2.addGestureRecognizer(recognizer2)
        dollar3.addGestureRecognizer(recognizer3)
        dollar4.addGestureRecognizer(recognizer4)
        dollar5.addGestureRecognizer(recognizer5)
        dollar6.addGestureRecognizer(recognizer6)
        dollar7.addGestureRecognizer(recognizer7)
        dollar8.addGestureRecognizer(recognizer8)
        dollar9.addGestureRecognizer(recognizer9)
        dollar10.addGestureRecognizer(recognizer10)
        dollar11.addGestureRecognizer(recognizer11)
        dollar12.addGestureRecognizer(recognizer12)
        dollar13.addGestureRecognizer(recognizer13)
        dollar14.addGestureRecognizer(recognizer14)
        dollar15.addGestureRecognizer(recognizer15)
        
        dollarArray = [dollar1, dollar2, dollar3, dollar4, dollar5, dollar6, dollar7, dollar8, dollar9, dollar10, dollar11, dollar12, dollar13, dollar14, dollar15]
        
        //Timers
        
        counter = 30
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.3, target:self, selector: #selector(hideDollar), userInfo:nil, repeats: true)
        
        hideDollar()
        
    }
    
    
    @objc func hideDollar(){
        for dollar in dollarArray{
            dollar.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(dollarArray.count-1)))
        dollarArray[random].isHidden = false
    }
    
    @objc func increaseScore() {

        score += 1
        scoreLabel.text = "$ \(score)"

    }
    
    @objc func countDown(){

        counter -= 1
        timeLabel.text = String(counter)
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()

            for dollar in dollarArray{
                dollar.isHidden = true
            }
            
            
            
            //HighScore
            if self.score > self.highScore {
                
                self.highScore = self.score
                highScoreLabel.text = "High $ \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey:"highscore")
            }
            
            //Alert
            
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style:UIAlertAction.Style.cancel, handler:nil)
            let replayButton = UIAlertAction(title:"Replay", style: UIAlertAction.Style.default) {
                
        (UIAlertAction) in
         //replay function
                
                self.score = 0
                self.scoreLabel.text = "$ \(self.score)"
                self.counter = 30
                self.timeLabel.text = String(self.counter)
                
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.3, target:self, selector: #selector(self.hideDollar), userInfo:nil, repeats: true)
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated:true, completion:nil)
        }
        
    }


}

