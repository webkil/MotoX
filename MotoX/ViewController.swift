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

    
    
    @IBOutlet var image: UIImageView!
    
    @IBOutlet var MarqueLabel: UILabel!
    @IBOutlet var ModelLabel: UILabel!
    @IBOutlet var CylindreeLabel: UILabel!
    @IBOutlet var KilometrageLabel: UILabel!
  

    
   
    
    override func viewDidLoad() {
     //   super.viewDidLoad()
        recherchemoto()
        
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    //creer une fonction pour afficher les motos
    func recherchemoto() {
        let entityDescription =
        NSEntityDescription.entityForName("Moto",
            inManagedObjectContext: managedObjectContext!)
        
        let request = NSFetchRequest()
        request.entity = entityDescription
        
        let pred = NSPredicate(format: "(marque = %@)", "YamahaR1")
        request.predicate = pred
        
        var error: NSError?
        
        var objects = managedObjectContext?.executeFetchRequest(request,
            error: &error)
        
        if let results = objects {
            
            if results.count > 0 {
                let match = results[0] as! NSManagedObject
                
                MarqueLabel.text = match.valueForKey("marque") as? String
                ModelLabel.text = match.valueForKey("model") as? String
                CylindreeLabel.text = match.valueForKey("cylindree") as? String
                KilometrageLabel.text = match.valueForKey("kilometrage") as? String
                image = match.valueForKey("photo") as? UIImageView
                
            } else {
                ""
            }
        }
    }

}

