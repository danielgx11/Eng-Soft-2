//
//  PresenterTests.swift
//  ENG-SOFTWARE-APPTests
//
//  Created by Daniel Gomes Xavier on 22/11/22.
//

import XCTest
@testable import ENG_SOFTWARE_APP

final class PresenterTests: XCTestCase {
    
    var viewControllerSpy: ViewControllerSpy!
    var presenter: Presenter!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        viewControllerSpy = ViewControllerSpy()
        
        presenter = Presenter()
        presenter.attach(view: viewControllerSpy)
    }

    func testImplementTextWasCalled() throws {
        presenter.didTapButton()
                
        XCTAssertTrue(viewControllerSpy.implementTextCalled, "O texto não foi implementado corretamente")
    }
    
    func testImplementText() throws {
        presenter.didTapButton()
                
        XCTAssertNotNil(viewControllerSpy.text, "O texto é nulo")
    }
}
