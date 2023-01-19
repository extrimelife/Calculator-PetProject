//
//  ViewController.swift
//  PetProject
//
//  Created by roman Khilchenko on 01.01.2023.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    //MARK: - Private properties
    
    private var stillTyping = false
    private var firstOperand: Double!
    private var secondOperand: Double!
    private var operationSign: String!
    private let maxLength = 9
    private var currentInput: Double {
        get {
            return Double(resultLabel.text!)!
        }
        set {
            resultLabel.text = "\(newValue)"
            stillTyping = false
        }
    }
    
    private let resultLabel: UILabel = {
        let result = UILabel()
        result.translatesAutoresizingMaskIntoConstraints = false
        result.text = "0"
        result.textAlignment = .right
        result.adjustsFontSizeToFitWidth = true
        result.minimumScaleFactor = 0.5
        result.lineBreakMode = .byWordWrapping
        result.textColor = .white
        result.font = UIFont.systemFont(ofSize: 80, weight: .light)
        return result
    }()
    
    private let mainStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    private lazy var upperStackView: UIStackView = {
        setupStackView(spacing: 16)
    }()
    
    private lazy var preUpperStackView: UIStackView = {
        setupStackView(spacing: 16)
    }()
    
    private lazy var middleStackView: UIStackView = {
        setupStackView(spacing: 16)
    }()
    
    private lazy var preMiddleStackView: UIStackView = {
        setupStackView(spacing: 16)
    }()
    
    private lazy var zeroStack: UIStackView = {
        setupStackView(spacing: 16)
    }()
    
    private lazy var commaEqualStackView: UIStackView = {
        setupStackView(spacing: 16)
    }()
    
    private lazy var lowStackView: UIStackView = {
        setupStackView(spacing: 16)
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
        let divideButton = setupButton(title: "÷")
        divideButton.addTarget(self, action: #selector(twoOperandsPressed), for: .touchUpInside)
        return divideButton
    }()
    
    private lazy var multiplyButton: UIButton = {
        let multiplyButton = setupButton(title: "×")
        multiplyButton.addTarget(self, action: #selector(twoOperandsPressed), for: .touchUpInside)
        return multiplyButton
    }()
    
    private lazy var minusButton: UIButton = {
        let minusButton = setupButton(title: "-")
        minusButton.addTarget(self, action: #selector(twoOperandsPressed), for: .touchUpInside)
        return minusButton
    }()
    
    private lazy var plusButton: UIButton = {
        let plusButton = setupButton(title: "+")
        plusButton.addTarget(self, action: #selector(twoOperandsPressed), for: .touchUpInside)
        return plusButton
    }()
    
    private lazy var equalButton: UIButton = {
        let equalButton = setupButton(title: "=")
        equalButton.addTarget(self, action: #selector(equalSignPressed), for: .touchUpInside)
        return equalButton
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
        guard let number = sender.currentTitle else { return }
        guard let resultText = resultLabel.text else { return }
        if stillTyping {
            if resultText.count < maxLength {
                resultLabel.text = resultText + number
            }
        } else {
            resultLabel.text = number
            stillTyping = true
        }
        sender.getAnimation()
    }
    
    @objc private func twoOperandsPressed(sender: UIButton) {
        operationSign = sender.currentTitle
        firstOperand = currentInput
        stillTyping = false
        sender.getAnimation()
    }
    
    
    @objc private func equalSignPressed(sender: UIButton) {
        if stillTyping {
            secondOperand = currentInput
        }
        switch operationSign {
        case "÷" :
            operateWithTwoOperands{$0 / $1}
        case "×" :
            operateWithTwoOperands{$0 * $1}
        case "-" :
            operateWithTwoOperands{$0 - $1}
        case "+" :
            operateWithTwoOperands{$0 + $1}
        default: break
        }
        sender.getAnimation()
    }
    
    @objc private func resetTap(sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        resultLabel.text = "0"
        stillTyping = false
        operationSign = ""
        sender.getAnimation()
    }
    
    private func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        stillTyping = false
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
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
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
