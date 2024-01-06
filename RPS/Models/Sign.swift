//
//  Sign.swift
//  RPS
//
//  Created by Charday Neal on 1/5/24.
//

import Foundation

enum Sign {
    case rock, paper, scissors
    
    func play(_ computerChoice: Sign) -> GameState {
        if self == computerChoice{
            return .draw
        }
        if self == .scissors {
            return computerChoice == .rock ? .lose : .win
        }
        if self == .rock {
            return computerChoice == .scissors ? .win : .lose
        }
        else {
            return computerChoice == .scissors ? .lose : .win
        }
    }
}

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

