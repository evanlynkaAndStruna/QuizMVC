//
//  AnswerButton.swift
//  QuizMVC
//
//  Created by Aleksandra on 25/11/2019.
//  Copyright © 2019 PrestigeTeam. All rights reserved.
//

import Foundation
import UIKit

protocol AnswerButtonDelegate : class {
    func handleTap(tappedView : UIButton)
}

class AnswerButton: UIButton {
    weak var viewTappedDelegate : AnswerButtonDelegate?
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        viewTappedDelegate?.handleTap(tappedView: self)
    }
}

