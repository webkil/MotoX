//
//  Moto.swift
//  MotoX
//
//  Created by Macmini_Dagon on 04.05.15.
//  Copyright (c) 2015 Macmini_Dagon. All rights reserved.
//

import Foundation
import CoreData

class Moto: NSManagedObject {

    @NSManaged var cylindree: String
    @NSManaged var kilometrage: String
    @NSManaged var marque: String
    @NSManaged var model: String
    @NSManaged var photo: NSData

}
