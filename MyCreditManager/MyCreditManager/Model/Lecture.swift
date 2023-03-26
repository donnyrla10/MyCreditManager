//
//  Lecture.swift
//  MyCreditManager
//
//  Created by 김영선 on 2023/03/26.
//

import Foundation

class Lecture {
    private let name: String
    private var score: Score
    
    init(name: String, score: Score) {
        self.name = name
        self.score = score
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getScore() -> Score {
        return self.score
    }
    
    func updateScore(score: Score) {
        self.score = score
    }
}
