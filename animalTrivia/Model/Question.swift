//
//  Question.swift
//  animalTrivia
//
//  Created by Raein Mehraban Teymouri on 8/22/19.
//  Copyright © 2019 Raein Mehraban Teymouri. All rights reserved.
//

import Foundation

struct Question: Codable {
    
    var question: String
    var answers: [String]
    var correctAnswer: String
    var explanation: String
    
}
