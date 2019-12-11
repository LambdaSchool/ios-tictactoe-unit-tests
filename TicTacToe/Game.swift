//
//  Game.swift
//  TicTacToe
//
//  Created by Lambda_School_Loaner_204 on 12/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let activePlayer = activePlayer else { return }
        
        try board.place(mark: activePlayer, on: coordinate)
        
        if game(board: board, isWonBy: activePlayer) {
            winningPlayer = activePlayer
            gameIsOver = true
        } else if board.isFull {
            gameIsOver = true
        } else {
            self.activePlayer = activePlayer == .x ? GameBoard.Mark.o : GameBoard.Mark.x
        }
    }

    private(set) var board: GameBoard

    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?
    
}
