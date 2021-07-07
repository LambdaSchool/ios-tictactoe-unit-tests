//
//  GameAI.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func game(board: GameBoard, isWonBy player: GameBoard.Mark) -> Bool {
    
    //checks first column
    //    if board[(0, 0)] == player &&
    //        board[(0, 1)] == player &&
    //        board[(0, 2)] == player {
    //        return true
    //    }
    
    //checks all column, verticals
    for x in 0..<3 {
        var numMarks = 0
        for y in 0..<3 {
            //check what player
            if board[(x, y)] == player {
                numMarks += 1
            }
        }
        if numMarks == 3 {
            return true
        }
    }
    //testing horizontals
    for y in 0..<3 {
        var numMarks = 0
        
        for x in 0..<3 {
            if board[(x, y)] == player {
                numMarks += 1
            }
        }
        if numMarks == 3 {
            return true
        }
    }
    // Check diagonals
    // left to right
    let ltr: [Coordinate] = [(0,0), (1, 1), (2,2)]
    var numMatches = 0
    for coord in ltr {
        if board[coord] == player {
            numMatches += 1
        }
    }
    if numMatches == 3 {
        return true
    }
    
    // right to left
    let rtl: [Coordinate] = [(2,0), (1, 1), (0,2)]
    numMatches = 0
    for coord in rtl {
        if board[coord] == player {
            numMatches += 1
        }
    }
    if numMatches == 3 {
        return true
    }
    
    //non winning cases
    for x in 0..<3 {
        var numMarks = 0
        
        for y in 0..<3 {
            if board[(x, y)] == player {
                numMarks += 1
            }
        }
        if numMarks != 3 {
            return true
        }
    }
    return false
    
}
