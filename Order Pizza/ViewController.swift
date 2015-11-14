//
//  ViewController.swift
//  Order Pizza
//
//  Created by Nivardo Ibarra on 11/11/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, sizePizzaDelegate, doughPizzaDelegate, cheesePizzaDelegate, ingredientsPizzaDelegate, orderPizzaDelegate {

    @IBOutlet weak var btnSize: UIButton!
    @IBOutlet weak var btnDough: UIButton!
    @IBOutlet weak var btnCheese: UIButton!
    @IBOutlet weak var btnIngredients: UIButton!
    
    
    var customPizza: Pizza = Pizza()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SizePizza" {
            let secondView:ViewSizePizza = segue.destinationViewController as! ViewSizePizza
            secondView.pizzaCheeseTmp = customPizza
            secondView.delegate = self
        }else if segue.identifier == "KindDough" {
            let doughView:ViewKindDough = segue.destinationViewController as! ViewKindDough
            doughView.pizzaCheeseTmp = customPizza
            doughView.delegate = self
        }else if segue.identifier == "KindCheese" {
            let cheeseView:ViewKindCheese = segue.destinationViewController as! ViewKindCheese
            cheeseView.pizzaCheeseTmp = customPizza
            cheeseView.delegate = self
        }else if segue.identifier == "Ingredients" {
            let ingredientsView:ViewIngredients = segue.destinationViewController as! ViewIngredients
            ingredientsView.pizzaIngredientsTmp = customPizza
            ingredientsView.delegate = self
        }
    }
    
    func showAlertMessage (title: String, message: String, owner:UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.ActionSheet)
        alert.addAction(UIAlertAction(title: "Accept", style: UIAlertActionStyle.Default, handler:{ (ACTION :UIAlertAction!)in
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func btnConfirmOrder(sender: AnyObject) {
        if validateSelectionSteps(){
            let viewConfirmOrder = self.storyboard?.instantiateViewControllerWithIdentifier("ConfirmOrder") as? ViewConfirmOrder
            viewConfirmOrder!.delegate = self
            viewConfirmOrder!.orderPizza = customPizza
            self.navigationController?.pushViewController(viewConfirmOrder!, animated: true)
            
        }else {
            showAlertMessage("Warning", message: "You need to select missing items", owner: self)
        }
    }
    
    func validateSelectionSteps() -> Bool{
        if (customPizza.size != nil && customPizza.kindDough != nil && customPizza.kindCheese != nil && customPizza.ingredients.count != 0) {
            return true
        }
        return false
    }
    
    func setPizzaSize(size: String) {
        customPizza.size = size
    }
    
    func setPizzaDough(dough: String) {
        customPizza.kindDough = dough
    }
    
    // Step: 4
    func setPizzaCheese(cheese: String){
        customPizza.kindCheese = cheese
    }
    
    func setPizzaIngredients(ingredients: [String: String]) {
        customPizza.ingredients = ingredients
    }
    
    func newOrder() {
        customPizza.size = nil
        customPizza.kindDough = nil
        customPizza.kindCheese = nil
        customPizza.ingredients = [String: String]()
    }
}

