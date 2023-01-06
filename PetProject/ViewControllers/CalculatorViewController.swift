//
//  ViewController.swift
//  PetProject
//
//  Created by roman Khilchenko on 01.01.2023.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    private let resultLabel: UILabel = {
        let result = UILabel()
        result.translatesAutoresizingMaskIntoConstraints = false
        result.layer.cornerRadius = 25
        result.clipsToBounds = true
        result.backgroundColor = .white
        result.backgroundColor = .black
        return result
    }()
    
    
    private lazy var upperStackView: UIStackView = {
        setupStackView(spacing: 5)
    }()
    
    private lazy var preUpperStackView: UIStackView = {
        setupStackView(spacing: 5)
    }()
    
    private lazy var middleStackView: UIStackView = {
        setupStackView(spacing: 5)
    }()
    
    private lazy var preMiddleStackView: UIStackView = {
        setupStackView(spacing: 5)
    }()
    
    private lazy var zeroStack: UIStackView = {
       setupStackView(spacing: 5)
    }()
    
    private lazy var lowStackView: UIStackView = {
        setupStackView(spacing: 5)
    }()
    
    
    private lazy var zeroButton: UIButton = {
        setupButton(title: "0")
    }()
    
    private lazy var oneButton: UIButton = {
        setupButton(title: "1")
    }()
    
    
    private lazy var twoButton: UIButton = {
        setupButton(title: "2")
    }()
    
    
    private lazy var threeButton: UIButton = {
        setupButton(title: "3")
    }()
    
    
    private lazy var fourButton: UIButton = {
        setupButton(title: "4")
    }()
    
    
    private lazy var fiveButton: UIButton = {
       setupButton(title: "5")
    }()
    
    
    private lazy var sixButton: UIButton = {
       setupButton(title: "6")
    }()
    
    
    private lazy var sevenButton: UIButton = {
       setupButton(title: "7")
    }()
    
    
    private lazy var eightButton: UIButton = {
       setupButton(title: "8")
    }()
    
    
    private lazy var nineButton: UIButton = {
       setupButton(title: "9")
    }()
    
    
    private lazy var resetButton: UIButton = {
      setupButton(title: "C")
    }()
    
    
    private lazy var negativeButton: UIButton = {
        setupButton(title: "±")
    }()
    
    private lazy var percentButton: UIButton = {
       setupButton(title: "%")
    }()
    
    private lazy var divideButton: UIButton = {
        setupButton(title: "/")
    }()
    
    private lazy var multiplyButton: UIButton = {
       setupButton(title: "*")
    }()
    
    private lazy var minusButton: UIButton = {
        setupButton(title: "-")
    }()
    
    private lazy var plusButton: UIButton = {
       setupButton(title: "+")
    }()
    
    private lazy var equalButton: UIButton = {
       setupButton(title: "=")
    }()
    
    private lazy var commaButton: UIButton = {
       setupButton(title: ",")
    }()
    
    
    
override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
       // view.backgroundColor = .darkGray
        
        [resultLabel, upperStackView, preUpperStackView, middleStackView, preMiddleStackView, zeroStack, lowStackView] .forEach { view.addSubview($0) }
        [resetButton, negativeButton, percentButton, divideButton] .forEach {upperStackView.addArrangedSubview($0)}
        [sevenButton, eightButton, nineButton, multiplyButton] .forEach {preUpperStackView.addArrangedSubview($0)}
        [fourButton, fiveButton, sixButton, minusButton] .forEach {middleStackView.addArrangedSubview($0)}
        [oneButton, twoButton, threeButton, plusButton] .forEach {preMiddleStackView.addArrangedSubview($0)}
        [commaButton, equalButton] .forEach {lowStackView.addArrangedSubview($0)}
        [zeroButton] .forEach {zeroStack.addArrangedSubview($0)}
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         //   resultLabel.heightAnchor.constraint(equalToConstant: 300),
            resultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: upperStackView.topAnchor),
            
            
            upperStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            upperStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            preUpperStackView.topAnchor.constraint(equalTo: upperStackView.bottomAnchor, constant: 5),
            preUpperStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            preUpperStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            middleStackView.topAnchor.constraint(equalTo: preUpperStackView.bottomAnchor, constant: 5),
            middleStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            middleStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            preMiddleStackView.topAnchor.constraint(equalTo: middleStackView.bottomAnchor, constant: 5),
            preMiddleStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            preMiddleStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            zeroStack.topAnchor.constraint(equalTo: preMiddleStackView.bottomAnchor, constant: 5),
            zeroStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            zeroStack.trailingAnchor.constraint(equalTo: lowStackView.leadingAnchor, constant: -5),
            zeroStack.widthAnchor.constraint(equalToConstant: 195),
            zeroStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            lowStackView.topAnchor.constraint(equalTo: preMiddleStackView.bottomAnchor, constant: 5),
            lowStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            lowStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

//MARK: - SetupStackView

extension CalculatorViewController {
    private func setupStackView(spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = spacing
        return stackView
    }
}


extension CalculatorViewController {
    private func setupButton(title: String?) -> UIButton {
        let button = UIButton()
       // button.layer.cornerRadius = button.frame.size.width / 2
       // button.clipsToBounds = true
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50, weight: .medium)
        button.backgroundColor = .orange
        return button
    }
}
