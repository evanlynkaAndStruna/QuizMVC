//
//  ViewController.swift
//  QuizMVC
//
//  Created by Aleksandra on 25/11/2019.
//  Copyright © 2019 PrestigeTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var answerButton: [AnswerButton]!
    @IBOutlet weak var questionLabel: UILabel!
    
    let questionPickerImplementation : QuestionPicker = QuestionPickerImpl()
    let scoreCounterImpl : ScoreCounter = ScoreCounterImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        answerButton.forEach {$0.viewTappedDelegate = self}
        prepareTheQuestion()
    }
    
    func prepareTheQuestion(){
        questionPickerImplementation.pickAQuestion()
        questionLabel.text = questionPickerImplementation.pickedQuestion?.question
        
        answerButton[0].setTitle(questionPickerImplementation.pickedQuestion?.answerA, for: .normal)
        answerButton[1].setTitle(questionPickerImplementation.pickedQuestion?.answerB, for: .normal)
        answerButton[2].setTitle(questionPickerImplementation.pickedQuestion?.answerC, for: .normal)
        answerButton[3].setTitle(questionPickerImplementation.pickedQuestion?.answerD, for: .normal)
        answerButton.forEach{
            $0.backgroundColor = .blue
        }
    }
    
    
    func handleTheAnswer(goodOrBad:String,sender: UIButton){
        var backgroundColorAns : UIColor = .red
        if goodOrBad == "Good answer!"{
            scoreCounterImpl.increaseScore()
            backgroundColorAns = .green
        }
        questionLabel.text = goodOrBad
        UIView.animate(withDuration: 1.5, delay: 0.0, options:[], animations: {
            sender.backgroundColor = backgroundColorAns
        }, completion:nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            if self.questionPickerImplementation.amountOfQuestionsInBase > 0{
                self.prepareTheQuestion()
            }else{
                //show the result
                self.questionLabel.text = "Your score : \(self.scoreCounterImpl.score)"
                self.answerButton.forEach{
                    $0.backgroundColor = .blue
                    $0.titleLabel!.text = "-"
                    $0.isUserInteractionEnabled = false
                }
            }
        }
    }
    
}
extension ViewController : AnswerButtonDelegate
{
    func handleTap(tappedView: UIButton) {
        if questionPickerImplementation.pickedQuestion?.correctAnswer.rawValue == tappedView.tag{
            handleTheAnswer(goodOrBad: "Good answer!", sender: tappedView)
        }else{
            handleTheAnswer(goodOrBad: "Bad answer :(", sender: tappedView)
        }
    }
}


