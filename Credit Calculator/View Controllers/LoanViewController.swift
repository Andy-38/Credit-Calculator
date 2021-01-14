//
//  LoanViewController.swift
//  Credit Calculator
//
//  Created by Андрей Двойцов on 24.12.2020.
//

import UIKit

class LoanViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var monthlyPaymentLabel: UILabel! //платеж
    @IBOutlet weak var nperTextField: UITextField! //срок кредита
    @IBOutlet weak var pvTextField: UITextField! //сумма кредита
    @IBOutlet weak var rateTextField: UITextField! //процент
    
    // MARK: - Inherited Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // вызывается когда пользователь коснулся экрана
        super.touchesBegan(touches, with: event)
        view.endEditing(true) // убираем клавиатуру
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMonthlyPaymentLabel()
    }
    
    // MARK: - Methods
    func updateMonthlyPaymentLabel() {
        monthlyPaymentLabel.text = nil
        guard let nper = Double(nperTextField.text ?? "") else {return}
        // guard это что-то вроде if, но только с частью else
        guard let pv = Double(pvTextField.text ?? "") else {return}
        let rateRight = rateTextField.text?.replacingOccurrences(of: ",", with: ".", options: .regularExpression, range: nil)
        // заменяем , на . потому что в стандартной циферной клавиатуре точки нет!
        guard let rate = Double(rateRight ?? "") else {return}
        let monthlyPayment = abs(ExcelFormulas.pmt(rate: (rate/100)/12, nper: nper, pv: pv))
        let formatter = NumberFormatter() // для форматирования результата
        formatter.currencySymbol = "₽" // валюта - рубли
        formatter.numberStyle = .currency // денежный формат
        guard let monthlyPaymentText = formatter.string(from: NSNumber(value: monthlyPayment)) else {return} //если не получилось преобразовать - то выходим из функции
        monthlyPaymentLabel.text = "Ежемесячный платеж: \(monthlyPaymentText)"
    }
    
    // MARK: - Actions
    @IBAction func fieldEditingChange(_ sender: UITextField) {
        updateMonthlyPaymentLabel() // рассчитываем месячный платеж
    }
}
