//
//  GameboardTests.swift
//  TicTacToeTests
//
//  Created by Daniela Parra on 10/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameboardTests: XCTestCase {
    
    func testMark() {
        let board = GameBoard()
        let mark = board[(0,0)]
        XCTAssertNil(mark)
    }

    func testCreatingEmptyBoard() {
        
        let board = GameBoard()
        for x in 0...2 {
            for y in 0...2 {
                XCTAssertNil(board[(x,y)])
            }
        }
    }
    
    func testPlacingMarks() {
        var board = GameBoard()
        
        XCTAssertNoThrow(try board.place(mark: .x, on: (0,0)))
        let mark = board[(0,0)]
        //XCTAssert(mark == .x) same as below
        XCTAssertEqual(mark, .x)
        
        for x in 0...2 {
            for y in 0...2 {
                if x == 0 && y == 0 {
                    XCTAssertEqual(mark, .x)
                    continue
                }
                XCTAssertNil(board[(x,y)])
            }
        }
    }
    
    func testBoardIsFull() {
        //We could use a double for loop but this is just another way of doing it.
        var board = GameBoard()
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .x, on: (0,1))
        try! board.place(mark: .x, on: (0,2))
        try! board.place(mark: .x, on: (1,0))
        try! board.place(mark: .x, on: (1,1))
        try! board.place(mark: .x, on: (1,2))
        try! board.place(mark: .x, on: (2,0))
        try! board.place(mark: .x, on: (2,1))
        try! board.place(mark: .x, on: (2,2))
        XCTAssertTrue(board.isFull)
    }
}
