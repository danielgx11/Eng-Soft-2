//
//  Presenter.swift
//  ENG-SOFTWARE-APP
//
//  Created by Daniel Gomes Xavier on 22/11/22.
//

protocol ViewControllerViewable: AnyObject {
    
    func implement(text: String)
}

final class Presenter: ViewControllerPresentable {

    weak var view: ViewControllerViewable?
    
    func attach(view: ViewControllerViewable) {
        self.view = view
    }

    func didTapButton() {
        let isTrue = Bool.random()
        
        view?.implement(text: isTrue ? "Aprovado" : "Reprovado")
    }
}
