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
    var gameStarted : Bool{get}
    func pickAQuestion()
//    func prepareQuestions()
}

enum AnswerOption : String{
    case A = "A"
    case B = "B"
    case C = "C"
    case D = "D"
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
    var pickedQuestion: Question?
    var gameStarted: Bool = false
    //var questions = [Question]()

    var questionsArray = [Question(question: "Ile mam lat?", answerA: "5", answerB: "10", answerC: "20", answerD: "22", correctAnswer: .D), Question(question: "Ile mam nóg?", answerA: "2", answerB: "4", answerC: "6", answerD: "8", correctAnswer: .A),Question(question: "Ile mam dzieci?", answerA: "1", answerB: "0", answerC: "3", answerD: "2", correctAnswer: .B),Question(question: "Ile mam samochodow?", answerA: "9", answerB: "8", answerC: "0", answerD: "1", correctAnswer: .C)]
    
    
    func pickAQuestion() {
        let index = getRandomNumber(from: 0, to: questionsArray.count - 1)
        pickedQuestion = questionsArray[index]
        questionsArray.remove(at: index)
    }
    
    func getRandomNumber(from: Int, to: Int) -> Int{
        let number = Int.random(in: from ..< to)
        return number
    }
    
//    func prepareQuestions() {
//        gameStarted = true
//        questions = questionsBase
//    }
//
//    func endGame(){
//
//    }
    
}
