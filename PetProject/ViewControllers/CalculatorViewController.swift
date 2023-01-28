//
//  ViewController.swift
//  PetProject
//
//  Created by roman Khilchenko on 01.01.2023.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    //MARK: - Private properties
    
    private var isStillTyping = false
    private var isCommaPlaced = false
    private var firstOperand: Double = 0
    private var secondOperand: Double = 0
    private var operationSign: String?
    private let maxLength = 9
    private var currentInput: Double {
        get {
            return Double(resultLabel.text!)!
        }
        set {
            let value = "\(newValue)"
            let separatorArray = value.components(separatedBy: ".")
            if separatorArray[1] == "0" {
                resultLabel.text = "\(separatorArray[0])"
            } else {
                resultLabel.text = "\(newValue)"
            }
            isStillTyping = false
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
        stack.distribution = .fillEqually
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
    
    private lazy var commaEqualStackView: UIStackView = {
        setupStackView(spacing: 10)
    }()
    
    private lazy var lowStackView: UIStackView = {
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
        let resetButton = setupButton(title: "C")
        resetButton.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
        return resetButton
    }()
    
    private lazy var negativeButton: UIButton = {
        let negativeButton = setupButton(title: "⁺∕₋")
        negativeButton.addTarget(self, action: #selector(negativeButtonPressed), for: .touchUpInside)
        return negativeButton
    }()
    
    private lazy var percentButton: UIButton = {
        let percentButton = setupButton(title: "%")
        percentButton.addTarget(self, action: #selector(percentButtonPressed), for: .touchUpInside)
        return percentButton
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
        let equalButton = setupButton(title: "=")
        equalButton.addTarget(self, action: #selector(equalSignButtonPressed), for: .touchUpInside)
        return equalButton
    }()
    
    private lazy var dotButton: UIButton = {
        let dotButton = setupButton(title: ".")
        dotButton.addTarget(self, action: #selector(dotButtonPressed), for: .touchUpInside)
        return dotButton
    }()
    
    //MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionPressNumberButton()
        actionPressOperationButton()
        setupLayout()
    }
    
    //MARK: - Private methods
    
    @objc private func numberButtonPressed(sender: UIButton) {
        guard let number = sender.currentTitle else { return }
        guard let resultText = resultLabel.text else { return }
        if isStillTyping && currentInput != 0 {
            if resultText.count < maxLength {
                resultLabel.text = resultText + number
            }
        } else {
            resultLabel.text = number
            isStillTyping = true
        }
        sender.getAnimation()
    }
    
    @objc private func twoOperandButtonPressed(sender: UIButton) {
        operationSign = sender.currentTitle
        firstOperand = currentInput
        isStillTyping = false
        isCommaPlaced = false
        sender.getAnimation()
    }
    
    
    @objc private func equalSignButtonPressed(sender: UIButton) {
        if isStillTyping {
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
        isCommaPlaced = false
        sender.getAnimation()
    }
    
    @objc private func resetButtonPressed(sender: UIButton) {
        firstOperand = 0
        secondOperand = 0
        currentInput = 0
        resultLabel.text = "0"
        isStillTyping = false
        isCommaPlaced = false
        operationSign = ""
        sender.getAnimation()
    }
    
    @objc private func negativeButtonPressed(sender: UIButton) {
        currentInput = -currentInput
        sender.getAnimation()
    }
    
    @objc private func percentButtonPressed(sender: UIButton) {
        if firstOperand == 0 {
            currentInput = currentInput / 100
        } else {
            secondOperand = firstOperand * currentInput / 100
            currentInput = secondOperand
        }
        isStillTyping = false
        sender.getAnimation()
    }
    
    @objc private func dotButtonPressed(sender: UIButton) {
        guard var dotResult = resultLabel.text else { return }
        if isStillTyping && !isCommaPlaced {
            resultLabel.text = dotResult + "."
            isCommaPlaced = true
        } else if !isStillTyping && !isCommaPlaced {
            dotResult = "0."
        }
        sender.getAnimation()
    }


    private func operateWithTwoOperands(operation: (Double, Double) -> Double) {
        currentInput = operation(firstOperand, secondOperand)
        isStillTyping = false
    }
    
    private func setupLayout() {
        [mainStack] .forEach { view.addSubview($0) }
        [resultLabel, upperStackView,
         preUpperStackView, middleStackView,
         preMiddleStackView, lowStackView] .forEach { mainStack.addArrangedSubview($0) }
        [resetButton, negativeButton,
         percentButton, divideButton] .forEach { upperStackView.addArrangedSubview($0) }
        [sevenButton, eightButton,
         nineButton, multiplyButton] .forEach { preUpperStackView.addArrangedSubview($0) }
        [fourButton, fiveButton,
         sixButton, minusButton] .forEach { middleStackView.addArrangedSubview($0) }
        [oneButton, twoButton,
         threeButton, plusButton] .forEach { preMiddleStackView.addArrangedSubview($0) }
        [zeroButton] .forEach { zeroStack.addArrangedSubview($0) }
        [dotButton, equalButton] .forEach { commaEqualStackView.addArrangedSubview($0) }
        [zeroStack, commaEqualStackView] . forEach { lowStackView.addArrangedSubview($0)}
        NSLayoutConstraint.activate([
            
        
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            
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
    
    private func setupButton(title: String?) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        button.backgroundColor = .orange
        return button
    }
    
    private func actionPressNumberButton() {
        let numberButtons = [zeroButton, oneButton,
                             twoButton, threeButton,
                             fourButton, fiveButton,
                             sixButton, sevenButton,
                             eightButton, nineButton]
        numberButtons.forEach { numberButton in
            numberButton.addTarget(self, action: #selector(numberButtonPressed), for: .touchUpInside)
        }
    }
    
    private func actionPressOperationButton() {
        let operationButtons = [divideButton, multiplyButton,
                                minusButton, plusButton]
        operationButtons.forEach { operationButton in
            operationButton.addTarget(self, action: #selector(twoOperandButtonPressed), for: .touchUpInside)
            operationButton.addTarget(self, action: #selector(equalSignButtonPressed), for: .touchDown)
        }
    }
}



