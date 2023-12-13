//
//  NetworkTestCase.swift
//  SeSACTestingTests
//
//  Created by 서승우 on 2023/12/13.
//

import XCTest
@testable import SeSACTesting

final class NetworkTestCase: XCTestCase {

    var sut: NetworkManager!

    override func setUpWithError() throws {
        sut = NetworkManager.shared
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    // unittest는 동기 테스트에 최적화 되어 있다.
    //비동기 테스트: expectation / fulfill / wait
    func testExample() throws {

        let promise = expectation(description: "Lotto Number Completion Handler")

        sut.fetchLotto { lotto in
             print(lotto.bnusNO, lotto.drwNoDate, lotto.drwtNo1)

            XCTAssertLessThanOrEqual(lotto.bnusNO, 45)
            XCTAssertGreaterThanOrEqual(lotto.bnusNO, 1)

            promise.fulfill() // 정의해둔 expectation이 충족되는 시점에 호출해서 동작을 수행했음을 알려줌
        }

        wait(for: [promise], timeout: 10) // 비동기 작업을 기다림. 타임아웃 시간이 지나면 실패로 간주!
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
