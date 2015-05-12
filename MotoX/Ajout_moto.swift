//
//  Ajout_moto.swift
//  MotoX
//
//  Created by Macmini_Dagon on 01.05.15.
//  Copyright (c) 2015 Macmini_Dagon. All rights reserved.
//

import UIKit
import CoreData

class Ajout_moto: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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

    var imagechangee = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //pour le clique sur la photo
        let tapGestureRecognizer:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "chooseImage:")
        tapGestureRecognizer.numberOfTapsRequired = 1
        
        Image_view.addGestureRecognizer(tapGestureRecognizer)
        Image_view.userInteractionEnabled = true

 
         }
    
        
        
    
    
    //Fonction presser
    func longPress(sender:UILongPressGestureRecognizer!) {
        
    //    if (sender.state == UIGestureRecognizerState.Ended) {
            println("Long press Ended");
      //  } else if (sender.state == UIGestureRecognizerState.Began) {
   //         println("Long press detected.");
       // }
    }
    
    //Pour choix image
    
    
    func chooseImage(recognizer:UITapGestureRecognizer){
        let imagePicker:UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
       
        imagechangee = true
        
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let pickedImage:UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage!
        
        // small picture
        let smallPicture = scaleImageWith(pickedImage,
    
        // Taille de l'image actuelle
        newSize: CGSizeMake(343, 128))
        
        var sizeOfImageView:CGRect = Image_view.frame
        sizeOfImageView.size = smallPicture.size
        Image_view.frame = sizeOfImageView
        
        Image_view.image = smallPicture
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
       
        imagechangee = false
    }
    
    
    
    func scaleImageWith(image:UIImage, newSize:CGSize)->UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        imagechangee = true
        return newImage
      
    }

//Fin du choix de l'image


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

        // on charge les objets avec rien
        
        moto.marque = ""
        moto.model = ""
        moto.cylindree = ""
        moto.kilometrage = ""
        
        
        moto.marque = marquetextfield.text
        moto.model = modeltextfield.text
        moto.cylindree = cylindreetextfield.text
        moto.kilometrage = kilometragetextfield.text
        
        //Si aucune image a été charge on sort
        if imagechangee == true
        {
        let contactImageData:NSData = UIImagePNGRepresentation(Image_view.image)
        
            moto.photo = contactImageData
        println("imagesauvee")
        }
        
        else {
        ""
        }
        
    }
    
   
    
}
