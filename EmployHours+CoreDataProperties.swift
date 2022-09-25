//
//  EmployHours+CoreDataProperties.swift
//  
//
//  Created by Aarish on 20/09/22.
//
//

import Foundation
import CoreData


extension EmployHours {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmployHours> {
        return NSFetchRequest<EmployHours>(entityName: "EmployHours")
    }

    @NSManaged public var startTime: String?
    @NSManaged public var endTime: String?
    @NSManaged public var entryTime: String?

}
