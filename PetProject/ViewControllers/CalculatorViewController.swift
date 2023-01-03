//
//  ViewController.swift
//  PetProject
//
//  Created by roman Khilchenko on 01.01.2023.
//

import UIKit

final class CalculatorViewController: UIViewController {
    
    private lazy var upperStackView: UIStackView = {
        setupStackView()
    }()
    
    private lazy var preUpperStackView: UIStackView = {
        setupStackView()
    }()
    
    private lazy var middleStackView: UIStackView = {
        setupStackView()
    }()
    
    private lazy var preMiddleStackView: UIStackView = {
        setupStackView()
    }()
    
    private lazy var lowStackView: UIStackView = {
        setupStackView()
    }()
    
    
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
        zero.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return zero
    }()
    
    private let oneButton: UIButton = {
        let one = UIButton()
        one.translatesAutoresizingMaskIntoConstraints = false
        one.setTitle("1", for: .normal)
        one.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return one
    }()
    
    
    private let twoButton: UIButton = {
        let two = UIButton()
        two.translatesAutoresizingMaskIntoConstraints = false
        two.setTitle("2", for: .normal)
        two.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return two
    }()
    
    
    private let threeButton: UIButton = {
        let three = UIButton()
        three.translatesAutoresizingMaskIntoConstraints = false
        three.setTitle("3", for: .normal)
        three.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return three
    }()
    
    
    private let fourButton: UIButton = {
        let four = UIButton()
        four.translatesAutoresizingMaskIntoConstraints = false
        four.setTitle("4", for: .normal)
        four.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return four
    }()
    
    
    private let fiveButton: UIButton = {
        let five = UIButton()
        five.translatesAutoresizingMaskIntoConstraints = false
        five.setTitle("5", for: .normal)
        five.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return five
    }()
    
    
    private let sixButton: UIButton = {
        let six = UIButton()
        six.translatesAutoresizingMaskIntoConstraints = false
        six.setTitle("6", for: .normal)
        six.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return six
    }()
    
    
    private let sevenButton: UIButton = {
        let seven = UIButton()
        seven.translatesAutoresizingMaskIntoConstraints = false
        seven.setTitle("7", for: .normal)
        seven.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return seven
    }()
    
    
    private let eightButton: UIButton = {
        let eight = UIButton()
        eight.translatesAutoresizingMaskIntoConstraints = false
        eight.setTitle("8", for: .normal)
        eight.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return eight
    }()
    
    
    private let nineButton: UIButton = {
        let nine = UIButton()
        nine.translatesAutoresizingMaskIntoConstraints = false
        nine.setTitle("9", for: .normal)
        nine.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return nine
    }()
    
    
    private let resetButton: UIButton = {
        let reset = UIButton()
        reset.translatesAutoresizingMaskIntoConstraints = false
        reset.setTitle("C", for: .normal)
        reset.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return reset
    }()
    
    
    private let negativeButton: UIButton = {
        let negative = UIButton()
        negative.translatesAutoresizingMaskIntoConstraints = false
        negative.setTitle("±", for: .normal)
        negative.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return negative
    }()
    
    private let percentButton: UIButton = {
        let percent = UIButton()
        percent.translatesAutoresizingMaskIntoConstraints = false
        percent.setTitle("%", for: .normal)
        percent.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return percent
    }()
    
    private let divideButton: UIButton = {
        let divide = UIButton()
        divide.translatesAutoresizingMaskIntoConstraints = false
        divide.setTitle("/", for: .normal)
        divide.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return divide
    }()
    
    private let multiplyButton: UIButton = {
        let multiply = UIButton()
        multiply.translatesAutoresizingMaskIntoConstraints = false
        multiply.setTitle("*", for: .normal)
        multiply.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return multiply
    }()
    
    private let minusButton: UIButton = {
        let minus = UIButton()
        minus.translatesAutoresizingMaskIntoConstraints = false
        minus.setTitle("-", for: .normal)
        minus.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return minus
    }()
    
    private let plusButton: UIButton = {
        let plus = UIButton()
        plus.translatesAutoresizingMaskIntoConstraints = false
        plus.setTitle("+", for: .normal)
        plus.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return plus
    }()
    
    private let equalButton: UIButton = {
        let equal = UIButton()
        equal.translatesAutoresizingMaskIntoConstraints = false
        equal.setTitle("=", for: .normal)
        equal.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return equal
    }()
    
    private let commaButton: UIButton = {
        let comma = UIButton()
        comma.translatesAutoresizingMaskIntoConstraints = false
        comma.setTitle(",", for: .normal)
        comma.titleLabel?.font = UIFont.systemFont(ofSize: 80, weight: .thin)
        return comma
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.backgroundColor = .darkGray
        [resultLabel, upperStackView, preUpperStackView, middleStackView, preMiddleStackView, lowStackView] .forEach { view.addSubview($0) }
        [resetButton, negativeButton, percentButton, divideButton] .forEach {upperStackView.addArrangedSubview($0)}
        [sevenButton, eightButton, nineButton, multiplyButton] .forEach {preUpperStackView.addArrangedSubview($0)}
        [fourButton, fiveButton, sixButton, minusButton] .forEach {middleStackView.addArrangedSubview($0)}
        [oneButton, twoButton, threeButton, plusButton] .forEach {preMiddleStackView.addArrangedSubview($0)}
        [zeroButton, commaButton, equalButton] .forEach {lowStackView.addArrangedSubview($0)}
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            resultLabel.heightAnchor.constraint(equalToConstant: 200),
            resultLabel.widthAnchor.constraint(equalToConstant: 100),
            resultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            upperStackView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor),
            upperStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            upperStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            preUpperStackView.topAnchor.constraint(equalTo: upperStackView.bottomAnchor),
            preUpperStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            preUpperStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            middleStackView.topAnchor.constraint(equalTo: preUpperStackView.bottomAnchor),
            middleStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            middleStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            preMiddleStackView.topAnchor.constraint(equalTo: middleStackView.bottomAnchor),
            preMiddleStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            preMiddleStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            lowStackView.topAnchor.constraint(equalTo: preMiddleStackView.bottomAnchor),
            lowStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            lowStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            lowStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

//MARK: - SetupStackView

extension CalculatorViewController {
    private func setupStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }
}



