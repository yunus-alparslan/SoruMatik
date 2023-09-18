//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelQuestionText: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    var questionNumber = 0
    var quest = Question()
   
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateText()
    }

    @IBAction func actionButton(_ sender: UIButton) {
        
        let buttonactionTrueFalse = sender.currentTitle
        let questionTf = quest.questionList[questionNumber].questionTf
        
        
        if buttonactionTrueFalse == questionTf{
            trueButton.backgroundColor = UIColor.green
            
        }
        else{
            falseButton.backgroundColor = UIColor.red
        }
        
        
        if questionNumber  + 1 < quest.questionList.count{
            questionNumber  += 1
       
        }
        else{
            questionNumber = 0
        }

        Timer.scheduledTimer(timeInterval: 0.5 , target: self, selector:
              #selector(updateText), userInfo: nil, repeats: false)
  
        
    }
    
    @objc func updateText(){
        falseButton.backgroundColor = clearUIColor()
        trueButton.backgroundColor = clearUIColor()
        labelQuestionText.text = quest.questionList[questionNumber].questionText
        progressBar.progress = Float(questionNumber + 1 ) / Float(quest.questionList.count)
    }
    
     func clearUIColor()-> UIColor{
        return UIColor.clear
    }
    
}

