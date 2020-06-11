//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {
    
    func testWinCheckingVertical1() {
        let game = Game()
        var board = game.board
        /*
        x o -
        x o -
        x - -
        */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 2))
        XCTAssertTrue(game.game(board: board, isWonBy: .x))
        XCTAssertFalse(game.game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingVertical2() {
        let game = Game()
        var board = game.board
        /*
         x o -
         x o -
         - o -
         */
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertTrue(game.game(board: board, isWonBy: .o))
        XCTAssertFalse(game.game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingHorizontal1() {
        let game = Game()
        var board = game.board
        /*
         x x x
         - o -
         o - -
         */
        
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (2, 0))
        XCTAssertTrue(game.game(board: board, isWonBy: .x))
        XCTAssertFalse(game.game(board: board, isWonBy: .o))
    }
    
    func testWinCheckingHorizontal2() {
        let game = Game()
        var board = game.board
        /*
         x - -
         o o o
         x - x
         */
        
        try! board.place(mark: .x, on: (0 ,0))
        try! board.place(mark: .o, on: (2, 1))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (0, 1))
        try! board.place(mark: .x, on: (2, 2))
        try! board.place(mark: .o, on: (1, 1))
        XCTAssertTrue(game.game(board: board, isWonBy: .o))
        XCTAssertFalse(game.game(board: board, isWonBy: .x))
    }
    
    func testWinCheckingDiagonal1() {
        let game = Game()
        var board = game.board
        /*
         x - -
         - x -
         o o x
         */
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .o, on: (0, 2))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(game.game(board: board, isWonBy: .x))
        XCTAssertFalse(game.game(board: board, isWonBy: .o))
        
        
    }
    
    func testWinCheckingDiagonal2() {
        let game = Game()
        var board = game.board
        /*
         x - o
         - o -
         o x x
         */
        try! board.place(mark: .x, on: (0 ,0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (2, 2))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .x, on: (1, 2))
        try! board.place(mark: .o, on: (0, 2))
        XCTAssertTrue(game.game(board: board, isWonBy: .o))
        XCTAssertFalse(game.game(board: board, isWonBy: .x))
    }
    
    func testIncompleteGame() {
        let game = Game()
        var board = game.board
        /*
        x - o
        - o -
        - - x
        */
        try! board.place(mark: .x, on: (0 ,0))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (2, 2))
        try! board.place(mark: .o, on: (1, 1))
        XCTAssertFalse(game.game(board: board, isWonBy: .o))
        XCTAssertFalse(game.game(board: board, isWonBy: .x))
        
    }

    func testCatsGame() {
        let game = Game()
        var board = game.board
        /*
        o x o
        x x o
        x o x
        */
        
        try! board.place(mark: .x, on: (1, 0))
        try! board.place(mark: .o, on: (0, 0))
        try! board.place(mark: .x, on: (1, 1))
        try! board.place(mark: .o, on: (1, 2))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (2, 1))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (2, 0))
        try! board.place(mark: .x, on: (2, 2))
        XCTAssertTrue(board.isFull)
        XCTAssertFalse(game.game(board: board, isWonBy: .o))
        XCTAssertFalse(game.game(board: board, isWonBy: .x))
    }
}
