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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        prepareTheQuestion()
    }
    
    func prepareTheQuestion(){
        questionPickerImplementation.pickAQuestion()
        questionLabel.text = questionPickerImplementation.pickedQuestion?.question
    answerButton[0].setTitle(questionPickerImplementation.pickedQuestion?.answerA, for: .normal)
    answerButton[1].setTitle(questionPickerImplementation.pickedQuestion?.answerB, for: .normal)
    answerButton[2].setTitle(questionPickerImplementation.pickedQuestion?.answerC, for: .normal)
    answerButton[3].setTitle(questionPickerImplementation.pickedQuestion?.answerD, for: .normal)
    }
    
    @IBAction func answerPicked(_ sender: UIButton) {
        if questionPickerImplementation.pickedQuestion?.correctAnswer.rawValue == sender.accessibilityIdentifier{
            
        }
    }
    
}

