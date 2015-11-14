//
//  ViewIngredients.swift
//  Order Pizza
//
//  Created by Nivardo Ibarra on 11/13/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import UIKit

protocol ingredientsPizzaDelegate {
    func setPizzaIngredients(ingredients:[String:String])
}

class ViewIngredients: UIViewController {
    @IBOutlet weak var switchHam: UISwitch!
    @IBOutlet weak var switchPepperoni: UISwitch!
    @IBOutlet weak var switchTurkey: UISwitch!
    @IBOutlet weak var switchSausage: UISwitch!
    @IBOutlet weak var switchOlive: UISwitch!
    @IBOutlet weak var switchOnion: UISwitch!
    @IBOutlet weak var switchPepper: UISwitch!
    @IBOutlet weak var switchPineapple: UISwitch!
    @IBOutlet weak var switchAnchovy: UISwitch!
    
    var delegate: ingredientsPizzaDelegate? = nil
    var ingredients = [String: String]()
    var pizzaIngredientsTmp:  Pizza?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setIngredientsOn()
        ingredients = (pizzaIngredientsTmp?.ingredients)!
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
    
    func setIngredientsOn() {
        for (_, value) in (pizzaIngredientsTmp?.ingredients)! {
            switch value {
            case "Ham":
                switchHam.setOn(true, animated: true)
            case "Pepperoni":
                switchPepperoni.setOn(true, animated: true)
            case "Turkey":
                switchTurkey.setOn(true, animated: true)
            case "Sausage":
                switchSausage.setOn(true, animated: true)
            case "Olive":
                switchOlive.setOn(true, animated: true)
            case "Onion":
                switchOnion.setOn(true, animated: true)
            case "Pepper":
                switchPepper.setOn(true, animated: true)
            case "Pineapple":
                switchPineapple.setOn(true, animated: true)
            case "Anchovy":
                switchAnchovy.setOn(true, animated: true)
            default:
                switchHam.setOn(false, animated: true)
            }
            
        }
        
        // Ingresar los que ya tien al dictonario no borrarlos
    }

    func existIngredient(key: String) -> Bool {
        if  (ingredients[key] == nil) {
            return true
        }else {
            return false
        }
    }
    
    func availableSpace() -> Bool {
        if ingredients.count < 5 {
            return true
        }else {
            return false
        }
        
    }
    
    @IBAction func setHam(sender: AnyObject) {
        let added = switchHam.on
        if added != true {
            ingredients["Ham"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Ham"] = "Ham"
            }else {
                switchHam.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func setPepperoni(sender: AnyObject) {
        let added = switchPepperoni.on
        if added != true {
            ingredients["Pepperoni"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Pepperoni"] = "Pepperoni"
            }else {
                switchPepperoni.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func setTurkey(sender: AnyObject) {
        let added = switchTurkey.on
        if added != true {
            ingredients["Turkey"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Turkey"] = "Turkey"
            }else {
                switchTurkey.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func setSausage(sender: AnyObject) {
        let added = switchSausage.on
        if added != true {
            ingredients["Sausage"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Sausage"] = "Sausage"
            }else {
                switchSausage.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func setOlive(sender: AnyObject) {
        let added = switchOlive.on
        if added != true {
            ingredients["Olive"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Olive"] = "Olive"
            }else {
                switchOlive.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func setOnion(sender: AnyObject) {
        let added = switchOnion.on
        if added != true {
            ingredients["Onion"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Onion"] = "Onion"
            }else {
                switchOnion.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func setPepper(sender: AnyObject) {
        let added = switchPepper.on
        if added != true {
            ingredients["Pepper"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Pepper"] = "Pepper"
            }else {
                switchPepper.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func setPineapple(sender: AnyObject) {
        let added = switchPineapple.on
        if added != true {
            ingredients["Pineapple"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Pineapple"] = "Pineapple"
            }else {
                switchPineapple.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func setAnchovy(sender: AnyObject) {
        let added = switchAnchovy.on
        if added != true {
            ingredients["Anchovy"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Anchovy"] = "Anchovy"
            }else {
                switchAnchovy.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    func setPizzaIngredients(ingredients: [String: String]) {
        //Stept: 3
        if delegate != nil {
            delegate!.setPizzaIngredients(ingredients)
            //            self.navigationController?.popViewControllerAnimated(true)
        }
    }

}
