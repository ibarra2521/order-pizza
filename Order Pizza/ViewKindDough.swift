//
//  ViewKindDough.swift
//  Order Pizza
//
//  Created by Nivardo Ibarra on 11/13/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import UIKit

protocol doughPizzaDelegate {
    func setPizzaDough(dough:String)
}

class ViewKindDough: UIViewController {
    @IBOutlet weak var switchThin: UISwitch!
    @IBOutlet weak var switchCrisp: UISwitch!
    @IBOutlet weak var switchThick: UISwitch!
    
    var pizzaCheeseTmp:  Pizza?
    var delegate: doughPizzaDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDough()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setDough() {
        if let doughOld = pizzaCheeseTmp?.kindDough {
            switch doughOld {
            case "Thin":
                switchThin.setOn(true, animated: true)
            case "Crisp":
                switchCrisp.setOn(true, animated: true)
            case "Thick":
                switchThick.setOn(true, animated: true)
            default:
                switchThin.setOn(false, animated: true)
            }
        }
    }
    
    @IBAction func setThin(sender: AnyObject) {
            switchCrisp.setOn(false, animated: true)
            switchThick.setOn(false, animated: true)
            setPizzaDough("Thin")
    }

    @IBAction func setCrisp(sender: AnyObject) {
        switchThin.setOn(false, animated: true)
        switchThick.setOn(false, animated: true)
        setPizzaDough("Crisp")
    }
    
    @IBAction func setThick(sender: AnyObject) {
        switchThin.setOn(false, animated: true)
        switchCrisp.setOn(false, animated: true)
        setPizzaDough("Thick")
    }
    
    func setPizzaDough(dough: String) {
        if delegate != nil {
            delegate!.setPizzaDough(dough)
            //            self.navigationController?.popViewControllerAnimated(true)
        }
    }
}
