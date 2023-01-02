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
        zero.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return zero
    }()
    
    private let oneButton: UIButton = {
        let one = UIButton()
        one.translatesAutoresizingMaskIntoConstraints = false
        one.setTitle("1", for: .normal)
        one.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return one
    }()
    
    
    private let twoButton: UIButton = {
        let two = UIButton()
        two.translatesAutoresizingMaskIntoConstraints = false
        two.setTitle("2", for: .normal)
        two.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return two
    }()
    
    
    private let threeButton: UIButton = {
        let three = UIButton()
        three.translatesAutoresizingMaskIntoConstraints = false
        three.setTitle("3", for: .normal)
        three.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return three
    }()
    
    
    private let fourButton: UIButton = {
        let four = UIButton()
        four.translatesAutoresizingMaskIntoConstraints = false
        four.setTitle("4", for: .normal)
        four.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return four
    }()
    
    
    private let fiveButton: UIButton = {
        let five = UIButton()
        five.translatesAutoresizingMaskIntoConstraints = false
        five.setTitle("5", for: .normal)
        five.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return five
    }()
    
    
    private let sixButton: UIButton = {
        let six = UIButton()
        six.translatesAutoresizingMaskIntoConstraints = false
        six.setTitle("6", for: .normal)
        six.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return six
    }()
    
    
    private let sevenButton: UIButton = {
        let seven = UIButton()
        seven.translatesAutoresizingMaskIntoConstraints = false
        seven.setTitle("7", for: .normal)
        seven.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return seven
    }()
    
    
    private let eightButton: UIButton = {
        let eight = UIButton()
        eight.translatesAutoresizingMaskIntoConstraints = false
        eight.setTitle("8", for: .normal)
        eight.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return eight
    }()
    
    
    private let nineButton: UIButton = {
        let nine = UIButton()
        nine.translatesAutoresizingMaskIntoConstraints = false
        nine.setTitle("9", for: .normal)
        nine.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return nine
    }()
    
    
    private let resetButton: UIButton = {
        let reset = UIButton()
        reset.translatesAutoresizingMaskIntoConstraints = false
        reset.setTitle("C", for: .normal)
        reset.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return reset
    }()
    
    
    private let negativeButton: UIButton = {
        let negative = UIButton()
        negative.translatesAutoresizingMaskIntoConstraints = false
        negative.setTitle("±", for: .normal)
        negative.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return negative
    }()
    
    private let percentButton: UIButton = {
        let percent = UIButton()
        percent.translatesAutoresizingMaskIntoConstraints = false
        percent.setTitle("%", for: .normal)
        percent.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return percent
    }()
    
    private let divideButton: UIButton = {
        let divide = UIButton()
        divide.translatesAutoresizingMaskIntoConstraints = false
        divide.setTitle("/", for: .normal)
        divide.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return divide
    }()
    
    private let multiplyButton: UIButton = {
        let multiply = UIButton()
        multiply.translatesAutoresizingMaskIntoConstraints = false
        multiply.setTitle("*", for: .normal)
        multiply.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return multiply
    }()
    
    private let minusButton: UIButton = {
        let minus = UIButton()
        minus.translatesAutoresizingMaskIntoConstraints = false
        minus.setTitle("-", for: .normal)
        minus.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return minus
    }()
    
    private let plusButton: UIButton = {
        let plus = UIButton()
        plus.translatesAutoresizingMaskIntoConstraints = false
        plus.setTitle("+", for: .normal)
        plus.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return plus
    }()
    
    private let equalButton: UIButton = {
        let equal = UIButton()
        equal.translatesAutoresizingMaskIntoConstraints = false
        equal.setTitle("=", for: .normal)
        equal.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return equal
    }()
    
    private let commaButton: UIButton = {
        let comma = UIButton()
        comma.translatesAutoresizingMaskIntoConstraints = false
        comma.setTitle(",", for: .normal)
        comma.titleLabel?.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        return comma
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .darkGray
        [resultLabel, zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton, resetButton, negativeButton, percentButton, divideButton, multiplyButton, minusButton, plusButton, equalButton, commaButton] .forEach { view.addSubview($0) }
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            resultLabel.heightAnchor.constraint(equalToConstant: 200),
            resultLabel.widthAnchor.constraint(equalToConstant: 100),
            resultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
          //  zeroButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
           // zeroButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            zeroButton.topAnchor.constraint(equalTo: oneButton.bottomAnchor),
            zeroButton.centerXAnchor.constraint(equalTo: oneButton.centerXAnchor),
            zeroButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            zeroButton.heightAnchor.constraint(equalToConstant: 150),
            zeroButton.widthAnchor.constraint(equalToConstant: 230),
            
           //oneButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            //oneButton.topAnchor.constraint(equalTo: fourButton.bottomAnchor),
           // oneButton.bottomAnchor.constraint(equalTo: zeroButton.topAnchor),
            oneButton.topAnchor.constraint(equalTo: fourButton.bottomAnchor),
            oneButton.centerXAnchor.constraint(equalTo: fourButton.centerXAnchor),
            oneButton.heightAnchor.constraint(equalToConstant: 150),
            oneButton.widthAnchor.constraint(equalToConstant: 150),
            
            //twoButton.leadingAnchor.constraint(equalTo: oneButton.trailingAnchor),
           // twoButton.bottomAnchor.constraint(equalTo: zeroButton.topAnchor),
            twoButton.topAnchor.constraint(equalTo: fiveButton.bottomAnchor),
            twoButton.centerXAnchor.constraint(equalTo: fiveButton.centerXAnchor),
            twoButton.bottomAnchor.constraint(equalTo: zeroButton.topAnchor),
            twoButton.heightAnchor.constraint(equalToConstant: 150),
            twoButton.widthAnchor.constraint(equalToConstant: 150),
            
           // threeButton.leadingAnchor.constraint(equalTo: twoButton.trailingAnchor),
            threeButton.topAnchor.constraint(equalTo: sixButton.bottomAnchor),
            threeButton.centerXAnchor.constraint(equalTo: sixButton.centerXAnchor),
            threeButton.bottomAnchor.constraint(equalTo: zeroButton.topAnchor),
            threeButton.heightAnchor.constraint(equalToConstant: 150),
            threeButton.widthAnchor.constraint(equalToConstant: 150),
            
          //  fourButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fourButton.centerYAnchor.constraint(equalTo: fiveButton.centerYAnchor),
            fourButton.trailingAnchor.constraint(equalTo: fiveButton.leadingAnchor),
            fourButton.heightAnchor.constraint(equalToConstant: 150),
            fourButton.widthAnchor.constraint(equalToConstant: 150),
            
            
            fiveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fiveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 120),
            fiveButton.heightAnchor.constraint(equalToConstant: 150),
            fiveButton.widthAnchor.constraint(equalToConstant: 150),
            
           
            // sixButton.leadingAnchor.constraint(equalTo: fiveButton.trailingAnchor),
           // sixButton.centerYAnchor.constraint(equalTo: fiveButton.centerYAnchor, constant: 200),
           // sixButton.bottomAnchor.constraint(equalTo: threeButton.topAnchor),
            sixButton.centerYAnchor.constraint(equalTo: fiveButton.centerYAnchor),
            sixButton.leadingAnchor.constraint(equalTo: fiveButton.trailingAnchor, constant: -30),
            sixButton.heightAnchor.constraint(equalToConstant: 150),
            sixButton.widthAnchor.constraint(equalToConstant: 150),
            
           // sevenButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sevenButton.centerXAnchor.constraint(equalTo: fourButton.centerXAnchor),
            sevenButton.trailingAnchor.constraint(equalTo: eightButton.leadingAnchor),
            sevenButton.bottomAnchor.constraint(equalTo: fourButton.topAnchor),
            sevenButton.heightAnchor.constraint(equalToConstant: 150),
            sevenButton.widthAnchor.constraint(equalToConstant: 150),
            
            // eightButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor),
            //eightButton.leadingAnchor.constraint(equalTo: sevenButton.trailingAnchor),
            eightButton.centerXAnchor.constraint(equalTo: fiveButton.centerXAnchor),
            eightButton.bottomAnchor.constraint(equalTo: fiveButton.topAnchor),
            eightButton.heightAnchor.constraint(equalToConstant: 150),
            eightButton.widthAnchor.constraint(equalToConstant: 150),
            
           // nineButton.leadingAnchor.constraint(equalTo: eightButton.trailingAnchor),
            nineButton.centerXAnchor.constraint(equalTo: sixButton.centerXAnchor),
            nineButton.bottomAnchor.constraint(equalTo: sixButton.topAnchor),
            nineButton.heightAnchor.constraint(equalToConstant: 150),
            nineButton.widthAnchor.constraint(equalToConstant: 150),
            
            resetButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            resetButton.bottomAnchor.constraint(equalTo: sevenButton.topAnchor),
            resetButton.heightAnchor.constraint(equalToConstant: 150),
            resetButton.widthAnchor.constraint(equalToConstant: 150),
            
            negativeButton.leadingAnchor.constraint(equalTo: resetButton.trailingAnchor),
            negativeButton.bottomAnchor.constraint(equalTo: eightButton.topAnchor),
            negativeButton.heightAnchor.constraint(equalToConstant: 150),
            negativeButton.widthAnchor.constraint(equalToConstant: 150),
            
            percentButton.leadingAnchor.constraint(equalTo: negativeButton.trailingAnchor),
            percentButton.bottomAnchor.constraint(equalTo: nineButton.topAnchor),
            percentButton.heightAnchor.constraint(equalToConstant: 150),
            percentButton.widthAnchor.constraint(equalToConstant: 150),
            
            divideButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor),
            divideButton.leadingAnchor.constraint(equalTo: percentButton.trailingAnchor),
            divideButton.heightAnchor.constraint(equalToConstant: 150),
            divideButton.widthAnchor.constraint(equalToConstant: 150),
            
        ])
    }
}

