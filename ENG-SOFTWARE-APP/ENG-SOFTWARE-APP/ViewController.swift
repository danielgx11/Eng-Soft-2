//
//  ViewController.swift
//  ENG-SOFTWARE-APP
//
//  Created by Daniel Gomes Xavier on 22/11/22.
//

import UIKit

protocol ViewControllerPresentable: AnyObject {

    func didTapButton()
}

class ViewController: UIViewController {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Aguardando..."
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Verificar aluno", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var presenter: ViewControllerPresentable
    
    init(presenter: ViewControllerPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initState()
    }

    @objc
    private func didTapButton() {
        presenter.didTapButton()
    }

}

extension ViewController {

    private func initState() {
        view.backgroundColor = .white
        
        view.addSubview(contentView)
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(textLabel)
        
        NSLayoutConstraint.activate(
            [
                contentView.topAnchor.constraint(equalTo: view.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                button.heightAnchor.constraint(equalToConstant: 24),
                
                stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ]
        )
    }
}

extension ViewController: ViewControllerViewable {

    func implement(text: String) {
        textLabel.text = text
    }
}
