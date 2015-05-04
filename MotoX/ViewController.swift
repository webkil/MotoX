//
//  ViewController.swift
//  MotoX
//
//  Created by Macmini_Dagon on 30.04.15.
//  Copyright (c) 2015 Macmini_Dagon. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let managedObjectContext =
    (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext

    
    
    
    @IBOutlet var MarqueLabel: UILabel!
    @IBOutlet var ModelLabel: UILabel!
    @IBOutlet var CylindreeLabel: UILabel!
    @IBOutlet var KilometrageLabel: UILabel!

    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //essayer de récupérer un élément de la base de données....
     //   let entityDescription =

        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

