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

    }
    
    //MARK: - IBActions
    @IBAction func operatorACAction(_ sender: Any) {
    }
    
    @IBAction func operatorPlusMinusAction(_ sender: Any) {
    }
    
    @IBAction func operatorPercentAction(_ sender: Any) {
    }
    
    @IBAction func operatorDivisionAction(_ sender: Any) {
    }
    
    @IBAction func operatorMultiplicationAction(_ sender: Any) {
    }
    
    @IBAction func operatorSubstractionAction(_ sender: Any) {
    }
    
    @IBAction func operatorAdditionAction(_ sender: Any) {
    }
    
    @IBAction func operatorResultAction(_ sender: Any) {
    }
    
    @IBAction func numberDecimalAction(_ sender: Any) {
    }
    
    @IBAction func numberAction(_ sender: Any) {
        
    }
    
    
}
