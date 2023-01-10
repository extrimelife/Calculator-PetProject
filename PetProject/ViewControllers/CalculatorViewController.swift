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
        result.textAlignment = .right
        result.textColor = .white
        result.font = UIFont.systemFont(ofSize: 80, weight: .light)
        return result
    }()
    
    private let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private lazy var upperStackView: UIStackView = {
        setupStackView(spacing: 10)
    }()
    
    private lazy var preUpperStackView: UIStackView = {
        setupStackView(spacing: 10)
    }()
    
    private lazy var middleStackView: UIStackView = {
        setupStackView(spacing: 10)
    }()
    
    private lazy var preMiddleStackView: UIStackView = {
        setupStackView(spacing: 10)
    }()
    
    private lazy var zeroStack: UIStackView = {
        setupStackView(spacing: 10)
    }()
    
    private lazy var lowStackView: UIStackView = {
        setupStackView(spacing: 10)
    }()
    
    private lazy var moreStack: UIStackView = {
        setupStackView(spacing: 10)
        
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
    
    @objc private func buttonTap(sender: UIButton) {
        resultLabel.text = sender.currentTitle
        sender.shine()
    }
    
    private func setupLayout() {
       
        [mainStack] .forEach { view.addSubview($0) }
        [resultLabel, upperStackView, preUpperStackView, middleStackView, preMiddleStackView, moreStack] .forEach { mainStack.addArrangedSubview($0) }
        [resetButton, negativeButton, percentButton, divideButton] .forEach { upperStackView.addArrangedSubview($0) }
        [sevenButton, eightButton, nineButton, multiplyButton] .forEach { preUpperStackView.addArrangedSubview($0) }
        [fourButton, fiveButton, sixButton, minusButton] .forEach { middleStackView.addArrangedSubview($0) }
        [oneButton, twoButton, threeButton, plusButton] .forEach { preMiddleStackView.addArrangedSubview($0) }
        [zeroButton] .forEach { zeroStack.addArrangedSubview($0) }
        [commaButton, equalButton] .forEach { lowStackView.addArrangedSubview($0) }
        [zeroStack, lowStackView] . forEach { moreStack.addArrangedSubview($0)}
        NSLayoutConstraint.activate([

            resultLabel.heightAnchor.constraint(equalToConstant: 100),
            
            mainStack.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 10),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            
            zeroStack.widthAnchor.constraint(equalToConstant: 200),
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
        button.layer.cornerRadius = 35
        button.clipsToBounds = true
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50, weight: .medium)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }
}
