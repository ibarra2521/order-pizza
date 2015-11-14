//
//  viewSizePizza.swift
//  Order Pizza
//
//  Created by Nivardo Ibarra on 11/12/15.
//  Copyright © 2015 Nivardo Ibarra. All rights reserved.
//

import UIKit

protocol sizePizzaDelegate {
    func setPizzaSize(size:String)
}

class ViewSizePizza: UIViewController {
    var pizzaCheeseTmp:  Pizza?
    var delegate: sizePizzaDelegate? = nil
    
    @IBOutlet weak var switchSmall: UISwitch!
    @IBOutlet weak var switchMedian: UISwitch!
    @IBOutlet weak var switchBig: UISwitch!
    
//    var viewMain = ViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setSize()
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
    
    func setSize() {
        if let sizeOld = pizzaCheeseTmp?.size {
            switch sizeOld {
            case "Small":
                switchSmall.setOn(true, animated: true)
            case "Median":
                switchMedian.setOn(true, animated: true)
            case "Big":
                switchBig.setOn(true, animated: true)
            default:
                switchSmall.setOn(false, animated: true)
            }
        }
    }
    
    @IBAction func switchSmall(sender: AnyObject) {
        switchMedian.setOn(false, animated: true)
        switchBig.setOn(false, animated: true)
        setPizzaSize("Small")
    }
    @IBAction func switchMedian(sender: AnyObject) {
        switchSmall.setOn(false, animated: true)
        switchBig.setOn(false, animated: true)
        setPizzaSize("Median")
    }
    
    @IBAction func switchBig(sender: AnyObject) {
        switchSmall.setOn(false, animated: true)
        switchMedian.setOn(false, animated: true)
        setPizzaSize("Big")
    }
    
    func setPizzaSize(size: String) {
        if delegate != nil {
            delegate!.setPizzaSize(size)
            //            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
}
