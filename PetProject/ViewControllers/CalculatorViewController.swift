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
        result.backgroundColor = .white
        return result
    }()
    
    
    private let zeroButton: UIButton = {
        let zero = UIButton()
        zero.translatesAutoresizingMaskIntoConstraints = false
        zero.setTitle("0", for: .normal)
        return zero
    }()
    
    private let oneButton: UIButton = {
        let one = UIButton()
        one.translatesAutoresizingMaskIntoConstraints = false
        one.setTitle("1", for: .normal)
        return one
    }()
    
    
    private let twoButton: UIButton = {
        let two = UIButton()
        two.translatesAutoresizingMaskIntoConstraints = false
        two.setTitle("2", for: .normal)
        return two
    }()
    
    
    private let threeButton: UIButton = {
        let three = UIButton()
        three.translatesAutoresizingMaskIntoConstraints = false
        three.setTitle("3", for: .normal)
        return three
    }()
    
    
    private let fourButton: UIButton = {
        let four = UIButton()
        four.translatesAutoresizingMaskIntoConstraints = false
        four.setTitle("4", for: .normal)
        return four
    }()
    
    
    private let fiveButton: UIButton = {
        let five = UIButton()
        five.translatesAutoresizingMaskIntoConstraints = false
        five.setTitle("5", for: .normal)
        return five
    }()
    
    
    private let sixButton: UIButton = {
        let six = UIButton()
        six.translatesAutoresizingMaskIntoConstraints = false
        six.setTitle("6", for: .normal)
        return six
    }()
    
    
    private let sevenButton: UIButton = {
        let seven = UIButton()
        seven.translatesAutoresizingMaskIntoConstraints = false
        seven.setTitle("7", for: .normal)
        return seven
    }()
    
    
    private let eightButton: UIButton = {
        let eight = UIButton()
        eight.translatesAutoresizingMaskIntoConstraints = false
        eight.setTitle("8", for: .normal)
        return eight
    }()
    
    
    private let nineButton: UIButton = {
        let nine = UIButton()
        nine.translatesAutoresizingMaskIntoConstraints = false
        nine.setTitle("9", for: .normal)
        return nine
    }()
    
    
    private let resetButton: UIButton = {
        let reset = UIButton()
        reset.translatesAutoresizingMaskIntoConstraints = false
        reset.setTitle("C", for: .normal)
        return reset
    }()
    
    
    private let negativeButton: UIButton = {
        let negative = UIButton()
        negative.translatesAutoresizingMaskIntoConstraints = false
        negative.setTitle("±", for: .normal)
        return negative
    }()
    
    private let percentButton: UIButton = {
        let percent = UIButton()
        percent.translatesAutoresizingMaskIntoConstraints = false
        percent.setTitle("%", for: .normal)
        return percent
    }()
    
    private let divideButton: UIButton = {
        let divide = UIButton()
        divide.translatesAutoresizingMaskIntoConstraints = false
        divide.setTitle("/", for: .normal)
        return divide
    }()
    
    private let multiplyButton: UIButton = {
        let multiply = UIButton()
        multiply.translatesAutoresizingMaskIntoConstraints = false
        multiply.setTitle("*", for: .normal)
        return multiply
    }()
    
    private let minusButton: UIButton = {
        let minus = UIButton()
        minus.translatesAutoresizingMaskIntoConstraints = false
        minus.setTitle("-", for: .normal)
        return minus
    }()
    
    private let plusButton: UIButton = {
        let plus = UIButton()
        plus.translatesAutoresizingMaskIntoConstraints = false
        plus.setTitle("+", for: .normal)
        return plus
    }()
    
    private let equalButton: UIButton = {
        let equal = UIButton()
        equal.translatesAutoresizingMaskIntoConstraints = false
        equal.setTitle("=", for: .normal)
        return equal
    }()
    
    private let commaButton: UIButton = {
        let comma = UIButton()
        comma.translatesAutoresizingMaskIntoConstraints = false
        comma.setTitle(",", for: .normal)
        return comma
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
       
        [resultLabel, zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton, resetButton, negativeButton, percentButton, divideButton, multiplyButton, minusButton, plusButton, equalButton, commaButton] .forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            resultLabel.heightAnchor.constraint(equalToConstant: 200),
            resultLabel.widthAnchor.constraint(equalToConstant: 100),
            resultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            zeroButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            zeroButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            oneButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            oneButton.bottomAnchor.constraint(equalTo: zeroButton.topAnchor),
            
            twoButton.leadingAnchor.constraint(equalTo: oneButton.trailingAnchor),
            twoButton.bottomAnchor.constraint(equalTo: zeroButton.topAnchor),
            
            threeButton.leadingAnchor.constraint(equalTo: twoButton.trailingAnchor),
            threeButton.bottomAnchor.constraint(equalTo: zeroButton.topAnchor),
            
            fourButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fourButton.bottomAnchor.constraint(equalTo: oneButton.topAnchor),
            
            fiveButton.leadingAnchor.constraint(equalTo: fourButton.trailingAnchor),
            fiveButton.bottomAnchor.constraint(equalTo: twoButton.topAnchor),
            
            sixButton.leadingAnchor.constraint(equalTo: fiveButton.trailingAnchor),
            sixButton.bottomAnchor.constraint(equalTo: threeButton.topAnchor),
            
            sevenButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sevenButton.bottomAnchor.constraint(equalTo: fourButton.topAnchor),
            
            eightButton.leadingAnchor.constraint(equalTo: sevenButton.trailingAnchor),
            eightButton.bottomAnchor.constraint(equalTo: fiveButton.topAnchor),
            
            nineButton.leadingAnchor.constraint(equalTo: eightButton.trailingAnchor),
            nineButton.bottomAnchor.constraint(equalTo: sixButton.topAnchor),
            
            resetButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            resetButton.bottomAnchor.constraint(equalTo: sevenButton.topAnchor),
            
            negativeButton.leadingAnchor.constraint(equalTo: resetButton.trailingAnchor),
            negativeButton.bottomAnchor.constraint(equalTo: eightButton.topAnchor),
            
            percentButton.leadingAnchor.constraint(equalTo: negativeButton.trailingAnchor),
            percentButton.bottomAnchor.constraint(equalTo: nineButton.topAnchor),
            
            divideButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor),
            divideButton.leadingAnchor.constraint(equalTo: percentButton.trailingAnchor),
            
            
        ])
    }
}

