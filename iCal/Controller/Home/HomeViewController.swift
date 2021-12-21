//
//  HomeViewController.swift
//  iCal
//
//  Created by Maiqui Cedeño on 13/09/21.
//

import UIKit

//Without extensions
final class HomeViewController: UIViewController {
    
    //MARK: - IBOulets
    @IBOutlet weak var resultLabel: UILabel!
    
    //Numbers
    @IBOutlet weak var numberZeroButton: UIButton!
    @IBOutlet weak var numberOneButton: UIButton!
    @IBOutlet weak var numberTwoButton: UIButton!
    @IBOutlet weak var numberThreeButton: UIButton!
    @IBOutlet weak var numberFourButton: UIButton!
    @IBOutlet weak var numberFiveButton: UIButton!
    @IBOutlet weak var numberSixButton: UIButton!
    @IBOutlet weak var numberSevenButton: UIButton!
    @IBOutlet weak var numberEightButton: UIButton!
    @IBOutlet weak var numberNineButton: UIButton!
    @IBOutlet weak var numberDecimalButton: UIButton!
    
    //Operators
    @IBOutlet weak var operatorACButton: UIButton!
    @IBOutlet weak var operatorPlusMinusButton: UIButton!
    @IBOutlet weak var operatorPercentButton: UIButton!
    @IBOutlet weak var operatorDivisionButton: UIButton!
    @IBOutlet weak var operatorMultiplicationButton: UIButton!
    @IBOutlet weak var operatorSubstractionButton: UIButton!
    @IBOutlet weak var operatorAdditionButton: UIButton!
    @IBOutlet weak var operatorResultButton: UIButton!
    
    //MARK: - Private variables
    private var total: Double = 0
    private var temp: Double = 0
    private var isOperationSelected = false
    private var isDecimal = false
    private var operation: OperationType = .none
    
    //MARK: - Constants
    private let kDecimalSeparator = Locale.current.decimalSeparator
    private let kMaxLenght = 9
    private let kMaxValue: Double = 999999999
    private let kMinValue = 0.00000001
    
    private enum OperationType {
        case none
        case addiction
        case substraction
        case multiplication
        case division
        case percent
    }
    
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        return formatter
    }()
    
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
    //MARK: - Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        result()
    }
    
    //MARK: - IBActions
    @IBAction func operatorACAction(_ sender: UIButton) {
        clearValues()
        sender.shine()
    }
    
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        if operation != .percent {
            result()
        }
        isOperationSelected = true
        operation = .percent
        result()
        sender.shine()
    }
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        result()
        isOperationSelected = true
        operation = .division
        sender.shine()
    }
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        result()
        isOperationSelected = true
        operation = .multiplication
        sender.shine()
    }
    
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        result()
        isOperationSelected = true
        operation = .substraction
        sender.shine()
    }
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        result()
        isOperationSelected = true
        operation = .addiction
        sender.shine()
    }
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        result()
        sender.shine()
    }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        let currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !isOperationSelected && currentTemp.count >= kMaxLenght {
            return
        }
        
        resultLabel.text = resultLabel.text! + kDecimalSeparator!
        isDecimal = true
        sender.shine()
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
        operatorACButton.setTitle("C", for: .normal)
        var currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !isOperationSelected && currentTemp.count >= kMaxLenght {
            return
        }
        
        if isOperationSelected {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            isOperationSelected = false
        }
        
        if isDecimal {
            currentTemp = "\(currentTemp)\(kDecimalSeparator)"
            isDecimal = false
        }
        
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        sender.shine()
    }
    
    func setupUI() {
        numberZeroButton.roundEdge()
        numberOneButton.roundEdge()
        numberTwoButton.roundEdge()
        numberThreeButton.roundEdge()
        numberFourButton.roundEdge()
        numberFiveButton.roundEdge()
        numberSixButton.roundEdge()
        numberSevenButton.roundEdge()
        numberEightButton.roundEdge()
        numberNineButton.roundEdge()
        numberDecimalButton.roundEdge()
        operatorACButton.roundEdge()
        operatorPlusMinusButton.roundEdge()
        operatorPercentButton.roundEdge()
        operatorDivisionButton.roundEdge()
        operatorMultiplicationButton.roundEdge()
        operatorSubstractionButton.roundEdge()
        operatorAdditionButton.roundEdge()
        operatorResultButton.roundEdge()
        numberDecimalButton.setTitle(kDecimalSeparator, for: .normal)
    }
    
    func clearValues() {
        operation = .none
        operatorACButton.setTitle("AC", for: .normal)
        if temp != 0 {
            print("temp is: \(temp)")
            temp = 0
            resultLabel.text = "0"
        }else {
            total = 0
            result()
        }
    }
    
    func result() {
        switch operation {
        case .none:
            break
        case .addiction:
            total += temp
            break
        case .substraction:
            total -= temp
            break
        case .multiplication:
            total *= temp
            break
        case .division:
            total /= temp
            break
        case .percent:
            temp /= 100
            total = temp
            break
        }
        
        if total <= kMaxValue || total >= kMinValue {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        print("Total = \(total)")
    }
    
}
