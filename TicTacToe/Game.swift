//
//  Game.swift
//  TicTacToe
//
//  Created by Cody Morley on 6/10/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

// THIS CONTROLLER WILL TAKE THE FUCTIONALITY OF RUNNING THE GAME OUT OF THE VCs
import Foundation

struct Game {
    //MARK: - Properties -
    private(set) var board: GameBoard = GameBoard()
    internal var activePlayer: GameBoard.Mark? = .x
    internal var gameIsOver: Bool = false
    internal var winningPlayer: GameBoard.Mark? = nil
    
    
    //MARK: - Actions -
    mutating internal func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
    }
    
    mutating internal func makeMark(at coordinate: Coordinate) throws {
        guard let player = activePlayer else { return }
        try board.place(mark: player, on: coordinate)
        if game(board: board, isWonBy: player) {
            winningPlayer = player
            gameIsOver = true
            activePlayer = nil
            NSLog("\(player.stringValue) WINS!")
        } else if board.isFull {
            winningPlayer = nil
            gameIsOver = true
            activePlayer = nil
            NSLog("Game to the cat.")
        } else {
            if activePlayer == .x {
                activePlayer = .o
            } else {
                activePlayer = .x
            }
        }
    }
}
