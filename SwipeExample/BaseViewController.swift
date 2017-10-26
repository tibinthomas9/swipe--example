//
//  ViewController.swift
//  SwipeExample
//
//  Created by Prethush on 22/03/17.
//  Copyright © 2017 Experion Technologies. All rights reserved.
//

import UIKit
import PageMenu

class BaseViewController: UIViewController {

    var pageMenu : CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Array to keep track of controllers in page menu
        var controllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        let yellowController = self.getControllerWithStoryboardID("yellowController") as? YellowViewController
        if let uwController = yellowController{
            uwController.title = "Yellow"
            controllerArray.append(uwController)
        }
        
        let blueController = self.getControllerWithStoryboardID("blueController") as? BlueViewController
        if let uwController = blueController{
            uwController.title = "Blue"
            controllerArray.append(uwController)
        }
        
        let greenController = self.getControllerWithStoryboardID("greenController") as? GreenViewController
        if let uwController = greenController{
            uwController.title = "Green"
            controllerArray.append(uwController)
        }
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        let parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(4.3),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorPercentageHeight(0.1)
        ]
        
        var heightOffset: CGFloat = 0.0
        
        if let navHeight = self.navigationController?.navigationBar.frame.height{
            heightOffset = navHeight
        }
        
        heightOffset += UIApplication.shared.statusBarFrame.height
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0, y: heightOffset, width: self.view.frame.width, height: self.view.frame.height - heightOffset), pageMenuOptions: parameters)
        
        pageMenu?.delegate = self
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func getControllerWithStoryboardID(_ id: String) -> UIViewController{
        return (UIStoryboard(name: "Main", bundle: Bundle.main)).instantiateViewController(withIdentifier: id)
    }
    
}

extension BaseViewController: CAPSPageMenuDelegate{
    func willMoveToPage(_ controller: UIViewController, index: Int){
    }
    
    func didMoveToPage(_ controller: UIViewController, index: Int){
    }
    
}

