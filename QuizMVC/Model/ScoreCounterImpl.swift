//
//  ScoreCounterImpl.swift
//  QuizMVC
//
//  Created by Aleksandra on 25/11/2019.
//  Copyright © 2019 PrestigeTeam. All rights reserved.
//

import Foundation

protocol ScoreCounter{
    func increaseScore()
    var score : Int {get}
}

class ScoreCounterImpl : ScoreCounter{
    func increaseScore() {
        score = score + 1
    }
    
    var score: Int = 0
}
