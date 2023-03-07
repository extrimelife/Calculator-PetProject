//
//  ViewController.swift
//  PetProject
//
//  Created by roman Khilchenko on 01.01.2023.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    //MARK: - Private properties
    
    private let signModel = Sign.getSignModel()
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
            if separatorArray[1] == "0"  {
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
        result.textAlignment = .right
        result.adjustsFontSizeToFitWidth = true
        result.minimumScaleFactor = 0.5
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
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 20
        return stack
    }()
    
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
    private lazy var upperStackView: UIStackView = {
        setupStackView(spacing: 0)
    }()
    
    private lazy var preUpperStackView: UIStackView = {
        setupStackView(spacing: 0)
    }()
    
    private lazy var middleStackView: UIStackView = {
        setupStackView(spacing: 0)
    }()
    
    private lazy var preMiddleStackView: UIStackView = {
        setupStackView(spacing: 0)
    }()
    
    private lazy var zeroStack: UIStackView = {
        setupStackView(spacing: 0)
    }()
    
    private lazy var commaEqualStackView: UIStackView = {
        setupStackView(spacing: 10)
    }()
    
    private lazy var lowStackView: UIStackView = {
        setupStackView(spacing: 15)
    }()
    
    private lazy var zeroButton: UIButton = {
        setupButton()
    }()
    
    private lazy var oneButton: UIButton = {
        setupButton()
    }()
    
    private lazy var twoButton: UIButton = {
        setupButton()
    }()
    
    private lazy var threeButton: UIButton = {
        setupButton()
    }()
    
    private lazy var fourButton: UIButton = {
        setupButton()
    }()
    
    private lazy var fiveButton: UIButton = {
        setupButton()
    }()
    
    private lazy var sixButton: UIButton = {
        setupButton()
    }()
    
    private lazy var sevenButton: UIButton = {
        setupButton()
    }()
    
    private lazy var eightButton: UIButton = {
        setupButton()
    }()
    
    private lazy var nineButton: UIButton = {
        setupButton()
    }()
    
    private lazy var resetButton: UIButton = {
        let resetButton = setupButton()
        resetButton.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
        return resetButton
    }()
    
    private lazy var negativeButton: UIButton = {
        let negativeButton = setupButton()
        negativeButton.addTarget(self, action: #selector(negativeButtonPressed), for: .touchUpInside)
        return negativeButton
    }()
    
    private lazy var percentButton: UIButton = {
        let percentButton = setupButton()
        percentButton.addTarget(self, action: #selector(percentButtonPressed), for: .touchUpInside)
        return percentButton
    }()
    
    private lazy var divideButton: UIButton = {
        setupButton()
    }()
    
    private lazy var multiplyButton: UIButton = {
        setupButton()
    }()
    
    private lazy var minusButton: UIButton = {
        setupButton()
    }()
    
    private lazy var plusButton: UIButton = {
        setupButton()
    }()
    
    private lazy var equalButton: UIButton = {
        let equalButton = setupButton()
        equalButton.addTarget(self, action: #selector(equalSignButtonPressed), for: .touchUpInside)
        return equalButton
    }()
    
    private lazy var dotButton: UIButton = {
        let dotButton = setupButton()
        dotButton.addTarget(self, action: #selector(dotButtonPressed), for: .touchUpInside)
        return dotButton
    }()
    
    //MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionPressNumberButton()
        actionPressOperationButton()
        setupLayout()
        getSignModel()
    }
    
    override func viewLayoutMarginsDidChange() {
        getNewLayerButtonLandscape()
        setupStackViewLandscape()
    }
    
    //MARK: - Private methods
    
    private func getSignModel() {
        resultLabel.text = signModel.result
        zeroButton.setTitle(signModel.zero, for: .normal)
        oneButton.setTitle(signModel.one, for: .normal)
        twoButton.setTitle(signModel.two, for: .normal)
        threeButton.setTitle(signModel.three, for: .normal)
        fourButton.setTitle(signModel.four, for: .normal)
        fiveButton.setTitle(signModel.five, for: .normal)
        sixButton.setTitle(signModel.six, for: .normal)
        sevenButton.setTitle(signModel.seven, for: .normal)
        eightButton.setTitle(signModel.eight, for: .normal)
        nineButton.setTitle(signModel.nine, for: .normal)
        resetButton.setTitle(signModel.reset, for: .normal)
        negativeButton.setTitle(signModel.negativ, for: .normal)
        percentButton.setTitle(signModel.percent, for: .normal)
        divideButton.setTitle(signModel.divide, for: .normal)
        multiplyButton.setTitle(signModel.multiply, for: .normal)
        minusButton.setTitle(signModel.minus, for: .normal)
        plusButton.setTitle(signModel.plus, for: .normal)
        equalButton.setTitle(signModel.equal, for: .normal)
        dotButton.setTitle(signModel.dot, for: .normal)
    }
    
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
        secondOperand = currentInput
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
        if resultLabel.text?.count ?? 0 > maxLength {
            resultLabel.text = printScientificFormatter.string(for: currentInput)
        } else if operationSign == "-" {
            firstOperand -= secondOperand
        } else if  operationSign == "÷" {
            firstOperand /= secondOperand
        } else {
            isStillTyping = true
            isCommaPlaced = false
            sender.getAnimation()
        }
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
            
            resetButton.heightAnchor.constraint(equalToConstant: 75),
            resetButton.widthAnchor.constraint(equalToConstant: 75),
            
            negativeButton.heightAnchor.constraint(equalToConstant: 75),
            negativeButton.widthAnchor.constraint(equalToConstant: 75),
            
            percentButton.heightAnchor.constraint(equalToConstant: 75),
            percentButton.widthAnchor.constraint(equalToConstant: 75),
            
            divideButton.heightAnchor.constraint(equalToConstant: 75),
            divideButton.widthAnchor.constraint(equalToConstant: 75),
            
            sevenButton.heightAnchor.constraint(equalToConstant: 75),
            sevenButton.widthAnchor.constraint(equalToConstant: 75),
            
            eightButton.heightAnchor.constraint(equalToConstant: 75),
            eightButton.widthAnchor.constraint(equalToConstant: 75),
            
            nineButton.heightAnchor.constraint(equalToConstant: 75),
            nineButton.widthAnchor.constraint(equalToConstant: 75),
            
            multiplyButton.heightAnchor.constraint(equalToConstant: 75),
            multiplyButton.widthAnchor.constraint(equalToConstant: 75),
            
            fourButton.heightAnchor.constraint(equalToConstant: 75),
            fourButton.widthAnchor.constraint(equalToConstant: 75),
            
            fiveButton.heightAnchor.constraint(equalToConstant: 75),
            fiveButton.widthAnchor.constraint(equalToConstant: 75),
            
            sixButton.heightAnchor.constraint(equalToConstant: 75),
            sixButton.widthAnchor.constraint(equalToConstant: 75),
            
            minusButton.heightAnchor.constraint(equalToConstant: 75),
            minusButton.widthAnchor.constraint(equalToConstant: 75),
            
            oneButton.heightAnchor.constraint(equalToConstant: 75),
            oneButton.widthAnchor.constraint(equalToConstant: 75),
            
            twoButton.heightAnchor.constraint(equalToConstant: 75),
            twoButton.widthAnchor.constraint(equalToConstant: 75),
            
            threeButton.heightAnchor.constraint(equalToConstant: 75),
            threeButton.widthAnchor.constraint(equalToConstant: 75),
            
            plusButton.heightAnchor.constraint(equalToConstant: 75),
            plusButton.widthAnchor.constraint(equalToConstant: 75),
            
            dotButton.heightAnchor.constraint(equalToConstant: 75),
            dotButton.widthAnchor.constraint(equalToConstant: 75),
            
            equalButton.heightAnchor.constraint(equalToConstant: 75),
            equalButton.widthAnchor.constraint(equalToConstant: 75),
            
            zeroButton.heightAnchor.constraint(equalToConstant: 75),
            
            zeroStack.widthAnchor.constraint(equalToConstant: 180),
            
            commaEqualStackView.widthAnchor.constraint(equalTo: zeroStack.widthAnchor, multiplier: 1/1),
            
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }
}

//MARK: - Extentions

extension CalculatorViewController {
    private func setupStackView(spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = spacing
        stackView.distribution = .equalSpacing
        return stackView
    }
    
    private func setupButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 35
        button.clipsToBounds = true
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
        }
    }
    
    private func getNewLayerButtonLandscape() {
        let buttons = [resetButton, negativeButton, percentButton,
                       divideButton, sevenButton, eightButton,
                       nineButton, multiplyButton, fourButton,
                       fiveButton, sixButton, minusButton,
                       oneButton, twoButton, threeButton,
                       plusButton, zeroButton, dotButton,
                       equalButton]
        buttons .forEach { button in
            if UIDevice.current.orientation.isLandscape {
                button.layer.cornerRadius = 15
                button.clipsToBounds = true
            } else {
                button.layer.cornerRadius = 35
                button.clipsToBounds = true
            }
            isStillTyping = true
        }
    }
    
    private func setupStackViewLandscape() {
        let stacksView = [upperStackView, preUpperStackView,
                          middleStackView, preMiddleStackView, zeroStack,
                          commaEqualStackView, lowStackView]
        stacksView .forEach { stackView in
            if UIDevice.current.orientation.isLandscape {
                mainStack.distribution = .fillEqually
                stackView.distribution = .fillEqually
                stackView.alignment = .center
                stackView.spacing = 10
            } else {
                mainStack.distribution = .fill
                mainStack.alignment = .fill
                stackView.distribution = .equalSpacing
                stackView.alignment = .fill
                stackView.spacing = 13
            }
        }
    }
}



