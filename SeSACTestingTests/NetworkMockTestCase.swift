//
//  NetworkMockTestCase.swift
//  SeSACTestingTests
//
//  Created by 서승우 on 2023/12/13.
//

import XCTest
@testable import SeSACTesting

// Test Double 키워드

// FIRST 원칙
// Fast - 빨라야한다
// Independent - 독립적이여야한다
// Repeat - 걔속해서 같은 값이 나와야한다
// Self Vlidationg - 일관성이 있어ㅑ 한다
// Timely - 적절하게

final class NetworkMockTestCase: XCTestCase {

    var sut: NetworkProvider!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        sut.fetchLotto { lotto in

        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
