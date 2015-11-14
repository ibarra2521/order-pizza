//
//  ViewKindCheese.swift
//  Order Pizza
//
//  Created by Nivardo Ibarra on 11/13/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import UIKit

// Step: 1
protocol cheesePizzaDelegate {
    func setPizzaCheese(cheese:String)
}

class ViewKindCheese: UIViewController {
    @IBOutlet weak var switchMozzarella: UISwitch!
    @IBOutlet weak var switchCheddar: UISwitch!
    @IBOutlet weak var switchParmesan: UISwitch!
    @IBOutlet weak var switchNoCheese: UISwitch!
    
    var pizzaCheeseTmp:  Pizza?
    // Stept: 2
    var delegate: cheesePizzaDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCheese()
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
    
    func setCheese() {
        if let cheeseOld = pizzaCheeseTmp?.kindCheese {
            switch cheeseOld {
            case "Mozzarella":
                switchMozzarella.setOn(true, animated: true)
            case "Cheddar":
                switchCheddar.setOn(true, animated: true)
            case "Parmesan":
                switchParmesan.setOn(true, animated: true)
            case "No Cheese":
                switchNoCheese.setOn(true, animated: true)
            default:
                switchNoCheese.setOn(false, animated: true)
            }
        }
    }
    
    @IBAction func setMozzarella(sender: AnyObject) {
        switchCheddar.setOn(false, animated: true)
        switchParmesan.setOn(false, animated: true)
        switchNoCheese.setOn(false, animated: true)
        setPizzaCheese("Mozzarella");
    }

    @IBAction func setCheddar(sender: AnyObject) {
        switchMozzarella.setOn(false, animated: true)
        switchParmesan.setOn(false, animated: true)
        switchNoCheese.setOn(false, animated: true)
        setPizzaCheese("Cheddar");
    }

    @IBAction func setParmesan(sender: AnyObject) {
        switchMozzarella.setOn(false, animated: true)
        switchCheddar.setOn(false, animated: true)
        switchNoCheese.setOn(false, animated: true)
        setPizzaCheese("Parmesan");
    }
    
    @IBAction func setNoCheese(sender: AnyObject) {
        switchMozzarella.setOn(false, animated: true)
        switchCheddar.setOn(false, animated: true)
        switchParmesan.setOn(false, animated: true)
        setPizzaCheese("No Cheese");
    }
    
    func setPizzaCheese(cheese: String) {
        //Stept: 3
        if delegate != nil {
            delegate!.setPizzaCheese(cheese)
            //            self.navigationController?.popViewControllerAnimated(true)
        }
    }

    
}
