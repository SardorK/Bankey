//
//  DummyViewController.swift
//  Bankey
//
//  Created by User 2 on 04/10/22.
//

import UIKit

class DummyViewController: UIViewController{
    
    let stackView = UIStackView()
    let welcomeLabel = UILabel()
    let button = UIButton(type: .system)
    weak var logoutDelegate: LogoutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    func style(){
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5.0
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Welcome"
        welcomeLabel.font = .systemFont(ofSize: 28.0, weight: .bold)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log out", for: .normal)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(logoutTapped), for: .primaryActionTriggered)
    }
    
    @objc func logoutTapped(){
        logoutDelegate?.didLogout()
    }
    
    
    func layout(){
        stackView.addArrangedSubview(welcomeLabel)
        stackView.addArrangedSubview(button)
        view.addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
