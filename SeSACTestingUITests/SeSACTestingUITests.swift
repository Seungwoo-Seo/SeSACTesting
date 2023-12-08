//
//  SeSACTestingUITests.swift
//  SeSACTestingUITests
//
//  Created by 서승우 on 2023/12/08.
//

import XCTest

final class SeSACTestingUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        app.textFields["passwordTextField"].tap()   // 앱 번들 내에서 passwordTextField라는 식별자를 가진 텍스트필드를 찾는다
        app.textFields["passwordTextField"].typeText("1234124")

        app.textFields["idTextField"].tap()
        app.textFields["idTextField"].typeText("1234124")

        app.textFields["emailTextField"].tap()
        app.textFields["emailTextField"].typeText("333")

        app.buttons["loginButton"].tap()

        XCTAssertTrue(app.staticTexts["다음 페이지"].exists, "다음 페이지 글씨 안보임")
    }

    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
