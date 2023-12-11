//
//  SeSACTestingTests.swift
//  SeSACTestingTests
//
//  Created by 서승우 on 2023/12/08.
//

import XCTest
@testable import SeSACTesting

// LoginVC 내 valid 메서드
final class SeSACTestingTests: XCTestCase {

    var sut: LoginViewController! // 시스템이 테스트를 하려는 대상(system under test의 약자)

    override func setUpWithError() throws {
        // 테스트 시작 전 값 세팅
        let sb = UIStoryboard(name: "Login", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        sut = vc
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // 테스트 이후 초기화(nil)
        sut = nil
    }

    func test_loginViewController_validEmail_returnTrue() throws {
        sut.emailTextField.text = "jack@test.com"
        XCTAssertTrue(sut.isValidEmail(), "@ 없거나 6글자 미만임")
    }

    // 테스트 결과가 성공이지만, 사실 실패 케이스를 테스트 한 것
    func test_loginViewController_validEmail_returnFalse() throws {
        sut.emailTextField.text = "jacktest.com"
        XCTAssertFalse(sut.isValidEmail(), "테스트가 성공해버릿네?")
    }

    func test_loginViewController_testing_returnNil() throws {
        sut.emailTextField = nil
        XCTAssertNil(sut.emailTextField, "Nil")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
