//
//  ViewController.swift
//  PetProject
//
//  Created by roman Khilchenko on 01.01.2023.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    //MARK: - Private properties
    
    private let resultLabel: UILabel = {
        let result = UILabel()
        result.translatesAutoresizingMaskIntoConstraints = false
        result.text = "0"
        result.textAlignment = .right
        result.adjustsFontSizeToFitWidth = true
        result.minimumScaleFactor = 0.8
        result.lineBreakMode = .byWordWrapping
        result.sizeToFit()
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
        setupStackView(spacing: 20)
    }()
    
    private lazy var preUpperStackView: UIStackView = {
        setupStackView(spacing: 20)
    }()
    
    private lazy var middleStackView: UIStackView = {
        setupStackView(spacing: 20)
    }()
    
    private lazy var preMiddleStackView: UIStackView = {
        setupStackView(spacing: 20)
    }()
    
    private lazy var zeroStack: UIStackView = {
        setupStackView(spacing: 20)
    }()
    
    private lazy var commaEqualStackView: UIStackView = {
        setupStackView(spacing: 20)
    }()
    
    private lazy var lowStackView: UIStackView = {
        setupStackView(spacing: 20)
    }()
    
    private lazy var zeroButton: UIButton = {
        let zeroButton = setupButton(title: "0")
        zeroButton.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return zeroButton
    }()
    
    private lazy var oneButton: UIButton = {
        let oneButton = setupButton(title: "1")
        oneButton.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return oneButton
    }()
    
    private lazy var twoButton: UIButton = {
        let twoButton = setupButton(title: "2")
        twoButton.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return twoButton
    }()
    
    private lazy var threeButton: UIButton = {
        let threeButton = setupButton(title: "3")
        threeButton.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return threeButton
    }()
    
    private lazy var fourButton: UIButton = {
        let fourButton = setupButton(title: "4")
        fourButton.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return fourButton
    }()
    
    private lazy var fiveButton: UIButton = {
        let fiveButton = setupButton(title: "5")
        fiveButton.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return fiveButton
    }()
    
    private lazy var sixButton: UIButton = {
        let sixButton = setupButton(title: "6")
        sixButton.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return sixButton
    }()
    
    private lazy var sevenButton: UIButton = {
        let sevenButton = setupButton(title: "7")
        sevenButton.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return sevenButton
    }()
    
    private lazy var eightButton: UIButton = {
        let eightButton = setupButton(title: "8")
        eightButton.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return eightButton
    }()
    
    private lazy var nineButton: UIButton = {
        let nineButton = setupButton(title: "9")
        nineButton.addTarget(self, action: #selector(numberPressed), for: .touchUpInside)
        return nineButton
    }()
    
    private lazy var resetButton: UIButton = {
        let resetButton = setupButton(title: "C")
        resetButton.addTarget(self, action: #selector(resetTap), for: .touchUpInside)
        return resetButton
    }()
    
    private lazy var negativeButton: UIButton = {
        setupButton(title: "⁺∕₋")
    }()
    
    private lazy var percentButton: UIButton = {
        setupButton(title: "%")
    }()
    
    private lazy var divideButton: UIButton = {
        setupButton(title: "÷")
    }()
    
    private lazy var multiplyButton: UIButton = {
        setupButton(title: "×")
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
    
    //MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    //MARK: - Private methods
    
    @objc private func numberPressed(sender: UIButton) {
        let number = sender.currentTitle
            resultLabel.text = resultLabel.text! + number!
                sender.getAnimation()
        
        
    }
    
    @objc private func resetTap(sender: UIButton) {
        resultLabel.text = "0"
    }
    
    private func setupLayout() {
        [mainStack] .forEach { view.addSubview($0) }
        [resultLabel, upperStackView, preUpperStackView, middleStackView, preMiddleStackView, lowStackView] .forEach { mainStack.addArrangedSubview($0) }
        [resetButton, negativeButton, percentButton, divideButton] .forEach { upperStackView.addArrangedSubview($0) }
        [sevenButton, eightButton, nineButton, multiplyButton] .forEach { preUpperStackView.addArrangedSubview($0) }
        [fourButton, fiveButton, sixButton, minusButton] .forEach { middleStackView.addArrangedSubview($0) }
        [oneButton, twoButton, threeButton, plusButton] .forEach { preMiddleStackView.addArrangedSubview($0) }
        [zeroButton] .forEach { zeroStack.addArrangedSubview($0) }
        [commaButton, equalButton] .forEach { commaEqualStackView.addArrangedSubview($0) }
        [zeroStack, commaEqualStackView] . forEach { lowStackView.addArrangedSubview($0)}
        NSLayoutConstraint.activate([
            
            resultLabel.heightAnchor.constraint(equalToConstant: 100),
            

            mainStack.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 10),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            zeroStack.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}

//MARK: - Extentions

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
        return button
    }
}
