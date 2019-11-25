//
//  QuestionPickerImpl.swift
//  QuizMVC
//
//  Created by Aleksandra on 25/11/2019.
//  Copyright © 2019 PrestigeTeam. All rights reserved.
//

import Foundation

protocol QuestionPicker{
    var pickedQuestion : Question?{get}
    var amountOfQuestionsInBase : Int {get}
    func pickAQuestion()
}

enum AnswerOption : Int{
    case A = 0
    case B = 1
    case C = 2
    case D = 3
}
struct Question{
    var question : String
    var answerA : String
    var answerB : String
    var answerC : String
    var answerD : String
    var correctAnswer : AnswerOption
}
class QuestionPickerImpl : QuestionPicker{
    private(set) var pickedQuestion: Question?

    private(set) var questionsArray = [Question(question: "Ile mam lat?", answerA: "5", answerB: "10", answerC: "20", answerD: "22", correctAnswer: .D), Question(question: "Ile mam nóg?", answerA: "2", answerB: "4", answerC: "6", answerD: "8", correctAnswer: .A),Question(question: "Ile mam dzieci?", answerA: "1", answerB: "0", answerC: "3", answerD: "2", correctAnswer: .B),Question(question: "Ile mam samochodow?", answerA: "9", answerB: "8", answerC: "0", answerD: "1", correctAnswer: .C)]
    private(set) var amountOfQuestionsInBase : Int = 0
    
    func pickAQuestion() {
        let index = getRandomNumber(from: 0, to: questionsArray.count - 1)
        pickedQuestion = questionsArray[index]
        questionsArray.remove(at: index)
        
        amountOfQuestionsInBase = questionsArray.count
    }
    
   private func getRandomNumber(from: Int, to: Int) -> Int{
        let number : Int
        if to > 0{
            number = Int.random(in: from ..< to)
        }else{
            return 0
        }
        return number
    }
    
}
