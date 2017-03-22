//
//  ViewController.swift
//  CoreySalzer-Lab1
//
//  Created by Corey Salzer on 1/31/17.
//  Copyright © 2017 Corey Salzer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var originalPriceTextField: UITextField!
    @IBOutlet weak var discountTextField: UITextField!
    @IBOutlet weak var salesTaxTextField: UITextField!
    @IBOutlet weak var finalPriceLabel: UILabel!
    
    var formatter: NumberFormatter!
    
    enum localeIdentifiers : String {
        case US = "en_US"
        case France = "fr_FR"
        case Japan = "ja_JP"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = NSLocale(localeIdentifier: localeIdentifiers.US.rawValue) as Locale!

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func editingChanged(_ sender: UITextField) {
        updateView()
 
    }
    @IBAction func usFlagImageClicked(_ sender: UIButton) {
        formatter.locale = NSLocale(localeIdentifier: localeIdentifiers.US.rawValue) as Locale!
        updateView()
    }
    
    @IBAction func japanFlagImageClicked(_ sender: UIButton) {
        formatter.locale = NSLocale(localeIdentifier: localeIdentifiers.Japan.rawValue) as Locale!
        updateView()
    }
    
    @IBAction func franceFlagImageClicked(_ sender: UIButton) {
        formatter.locale = NSLocale(localeIdentifier: localeIdentifiers.France.rawValue) as Locale!
        updateView()
    }
    
    func updateView() {
        let inputtedOriginalPrice:String? = originalPriceTextField.text
        let inputtedDiscount:String? = discountTextField.text
        let inputtedSalesTax:String? = salesTaxTextField.text
        
        var originalPrice:Double = 0
        var discount:Double = 0
        var salesTax:Double = 0
        
        if inputtedOriginalPrice != nil && Double(inputtedOriginalPrice!) != nil{
            originalPrice = Double(inputtedOriginalPrice!)!
        }
        
        if inputtedDiscount != nil && Double(inputtedDiscount!) != nil{
            discount = Double(inputtedDiscount!)!
        }
        
        if inputtedSalesTax != nil && Double(inputtedSalesTax!) != nil{
            salesTax = Double(inputtedSalesTax!)!
        }
        
        let discountedPrice:Double = originalPrice - discount/100 * originalPrice
        let finalPrice:Double = discountedPrice + salesTax/100 * originalPrice
        
        let displayText = formatter.string(for: finalPrice)
        finalPriceLabel.text = displayText
    }
}

