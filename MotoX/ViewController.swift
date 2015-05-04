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
    @IBOutlet var text1: UITextField!

    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        afficheMoto()
       
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var Moto_image: UIImageView!
    
    
    
    //creer une fonction pour afficher les motos
    func afficheMoto() {
        
        let entityDescription =
        NSEntityDescription.entityForName("Moto",
            inManagedObjectContext: managedObjectContext!)

    
        let test = Nsin
    
    
    
    }
    
    

}

