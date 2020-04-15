//
//  Game.swift
//  TicTacToe
//
//  Created by Wyatt Harrell on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    
    private(set) var board: GameBoard

    internal var activePlayer: GameBoard.Mark?
    internal var gameIsOver: Bool
    internal var winningPlayer: GameBoard.Mark?

    mutating internal func restart() {
        board = GameBoard()
        activePlayer = GameBoard.Mark.x
        gameIsOver = false
    }
    
    init()  {
        self.board = GameBoard()
        self.gameIsOver = false
        activePlayer = GameBoard.Mark.x
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        if activePlayer == GameBoard.Mark.x {
            do {
                try board.place(mark: .x, on: coordinate)
            } catch {
                throw GameBoardError.invalidSquare
            }
            gameIsOver = game(board: board, isWonBy: .x)
            
            if gameIsOver {
                activePlayer = nil
                winningPlayer = .x
            } else if gameIsOver == false && board.isFull {
                activePlayer = nil
                winningPlayer = nil
                gameIsOver = true
            } else {
                activePlayer = GameBoard.Mark.o
            }
            
        } else if activePlayer == GameBoard.Mark.o {
            do {
                try board.place(mark: .o, on: coordinate)
            } catch {
                throw GameBoardError.invalidSquare
            }
            gameIsOver = game(board: board, isWonBy: .o)
            
            if gameIsOver {
                activePlayer = nil
                winningPlayer = .o
            } else if gameIsOver == false && board.isFull {
                activePlayer = nil
                winningPlayer = nil
                gameIsOver = true
                // Isn't tested becuase it cannot happen.
                // X is always last to move in Cat's game
                // But I am keeping it just in case I am wrong :-)
            } else {
                activePlayer = GameBoard.Mark.x
            }
            
        }
    }
}
