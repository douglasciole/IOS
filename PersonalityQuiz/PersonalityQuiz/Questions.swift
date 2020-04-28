//
//  Questions.swift
//  PersonalityQuiz
//
//  Created by user169155 on 4/27/20.
//  Copyright © 2020 Daniel. All rights reserved.
//
import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum ResponseType {
    case single, multiple, ranged
}

enum AnimalType: Character {
    case dog = "🐶",
        cat = "🐱",
        rabbit = "🐰",
        turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
                return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .cat:
            return " Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on details. Slow and steaady wins the race."
        }
    }
}


