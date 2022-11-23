//
//  ClassesEngSoftTests.swift
//  ENG-SOFTWARE-APPTests
//
//  Created by Daniel Gomes Xavier on 22/11/22.
//

@testable import ENG_SOFTWARE_APP

class PresenterSpy: ViewControllerPresentable {
    
    private(set) var buttonTapped = false

    func didTapButton() {
        buttonTapped.toggle()
    }
    
}

class ViewControllerSpy: ViewControllerViewable {

    private(set) var implementTextCalled = false
    private(set) var text: String?
    
    func implement(text: String) {
        implementTextCalled.toggle()
        self.text = text
    }
}
