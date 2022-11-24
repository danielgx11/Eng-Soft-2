//
//  ENG_SOFTWARE_APPTests.swift
//  ENG-SOFTWARE-APPTests
//
//  Created by Daniel Gomes Xavier on 22/11/22.
//

import XCTest
@testable import ENG_SOFTWARE_APP

final class ENG_SOFTWARE_APPTests: XCTestCase {
    
    var presentSpy: PresenterSpy!
    var viewControllerSut: ViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        presentSpy = PresenterSpy()
        
        viewControllerSut = ViewController(presenter: presentSpy)
        viewControllerSut.beginAppearanceTransition(true, animated: false)
        viewControllerSut.endAppearanceTransition()
    }

    func testButtonTapped() throws {
        viewControllerSut.button.sendActions(for: .touchUpInside)
        
        XCTAssertTrue(presentSpy.buttonTapped, "O botão não foi clicado corretamente")
    }
}
