//
//  GreenViewController.swift
//  SwipeExample
//
//  Created by Prethush on 22/03/17.
//  Copyright © 2017 Experion Technologies. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {
   
    @IBAction func textFieldEditing(_ sender: UITextField) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        sender.inputView = datePickerView
        
        
        
    datePickerView.addTarget(self, action: #selector(GreenViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)

    }
    @IBOutlet weak var datetextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        datetextField.text = dateFormatter.string(from: sender.date)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
