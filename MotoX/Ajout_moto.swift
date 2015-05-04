//
//  Ajout_moto.swift
//  MotoX
//
//  Created by Macmini_Dagon on 01.05.15.
//  Copyright (c) 2015 Macmini_Dagon. All rights reserved.
//

import UIKit
import CoreData

class Ajout_moto: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    let managedObjectContext =
    (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext
    
    @IBOutlet var marquetextfield: UITextField!
    @IBOutlet var modeltextfield: UITextField!
    @IBOutlet var kilometragetextfield: UITextField!
    @IBOutlet var cylindreetextfield: UITextField!
    @IBOutlet var SaveButton: UIButton!
    @IBOutlet var Precedent_button: UIButton!

    @IBOutlet var Image_view: UIImageView!

//Fonction presser
    func longPress(sender:UILongPressGestureRecognizer!) {
        
        if (sender.state == UIGestureRecognizerState.Ended) {
            println("Long press Ended");
        } else if (sender.state == UIGestureRecognizerState.Began) {
            println("Long press detected.");
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Save_action(sender: AnyObject) {
      //appel de la fonction de sauvegarde
    save(self)
        
    }
    
    func save (AnyObject){
        let entityDescription =
        NSEntityDescription.entityForName("Moto",
            inManagedObjectContext: managedObjectContext!)

   
        let moto = Moto(entity: entityDescription!,
            insertIntoManagedObjectContext: managedObjectContext)

        
        
        moto.marque = marquetextfield.text
        moto.model = modeltextfield.text
        moto.cylindree = cylindreetextfield.text
        moto.kilometrage = kilometragetextfield.text
        
       // marquetextfield.text = match.valueForKey("name") as! String
        println(NSManagedObject.indexOfAccessibilityElement(kilometragetextfield.text).description)
   
        println(moto.objectID)
    
       // func hello ViewController.indexOfAccessibilityElement(moto.objectID)
      
    }
    
   
    
}
