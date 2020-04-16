//
//  GameTests.swift
//  TicTacToeTests
//
//  Created by Wyatt Harrell on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {

    /*
     (0,0) (1,0) (2,0)
     (0,1) (1,1) (2,1)
     (0,2) (1,2) (2,2)
    */

    func testCreatingEmptyBoard() {
        let game = Game()

        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(game.board[(x, y)])
            }
        }
    }
    
    func testMakingMark() {
        var game = Game()
        
        XCTAssertNil(game.board[(1, 1)])
        try! game.makeMark(at: (1, 1))
        XCTAssertNotNil(game.board[(1, 1)])
        XCTAssertEqual(game.board[(1, 1)], GameBoard.Mark.x)
        
        XCTAssertNil(game.board[(0, 0)])
        try! game.makeMark(at: (0, 0))
        XCTAssertNotNil(game.board[(0, 0)])
        XCTAssertNotEqual(game.board[(0, 0)], GameBoard.Mark.x)
        XCTAssertEqual(game.board[(0, 0)], GameBoard.Mark.o)
    }
    
    func testRetartingBoard() {
        var game = Game()

        try! game.makeMark(at: (1, 1))

        XCTAssertNotNil(game.board[(1, 1)])
        
        game.restart()
        
        for x in 0..<3 {
            for y in 0..<3 {
                XCTAssertNil(game.board[(x, y)])
            }
        }
    }
    
    func testActivePlayer() {
        var game = Game()

        XCTAssertEqual(game.activePlayer, GameBoard.Mark.x)
        try! game.makeMark(at: (0, 0))
        
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.o)
        try! game.makeMark(at: (0, 1))
        
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.x)
        try! game.makeMark(at: (1,1))
        
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.o)
        try! game.makeMark(at: (0,2))
        
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.x)
        try! game.makeMark(at: (1,2))
        
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.o)
        try! game.makeMark(at: (1,0))
        
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.x)
        try! game.makeMark(at: (2,0))
        
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.o)
        try! game.makeMark(at: (2,2))
        
        XCTAssertEqual(game.activePlayer, GameBoard.Mark.x)
        try! game.makeMark(at: (2,1))
        
        XCTAssertEqual(game.activePlayer, nil)
    }
    
    func testGameIsOverCatsGame() {
        var game = Game()

        XCTAssertFalse(game.gameIsOver)
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (2, 2))
        try! game.makeMark(at: (2, 1))
                
        XCTAssertTrue(game.gameIsOver)
    }
    
    func testGameIsOverWin() {
        var game = Game()

        XCTAssertFalse(game.gameIsOver)
        
        try! game.makeMark(at: (0, 0))
        XCTAssertFalse(game.gameIsOver)

        try! game.makeMark(at: (0, 1))
        XCTAssertFalse(game.gameIsOver)

        try! game.makeMark(at: (1, 0))
        XCTAssertFalse(game.gameIsOver)

        try! game.makeMark(at: (0, 2))
        XCTAssertFalse(game.gameIsOver)

        try! game.makeMark(at: (2, 0))
        XCTAssertTrue(game.gameIsOver)
    }
    
    func testWinningPlayerX() {
        var game = Game()

        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (2, 0))
        
        XCTAssertNotEqual(game.winningPlayer, GameBoard.Mark.o)
        XCTAssertEqual(game.winningPlayer, GameBoard.Mark.x)
    }
    
    func testWinningPlayerO() {
        var game = Game()

        try! game.makeMark(at: (2, 1))
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 0))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (2, 0))
        try! game.makeMark(at: (2, 2))
        
        XCTAssertEqual(game.winningPlayer, GameBoard.Mark.o)
        XCTAssertNotEqual(game.winningPlayer, GameBoard.Mark.x)
    }
    
    func testInvalidMove() throws {
        var game = Game()
        
        try! game.makeMark(at: (2, 1))
        
        do {
            try game.makeMark(at: (2, 1))
        } catch {
            XCTAssertEqual(error as! GameBoardError, GameBoardError.invalidSquare)
        }
        
        try game.makeMark(at: (1, 1))
        
        do {
            try game.makeMark(at: (1, 1))
        } catch {
            XCTAssertEqual(error as! GameBoardError, GameBoardError.invalidSquare)
        }
        
    }
    
    /*
     (0,0) (1,0) (2,0)
     (0,1) (1,1) (2,1)
     (0,2) (1,2) (2,2)
    */
    
}
