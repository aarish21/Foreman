//
//  UnitCellData+CoreDataProperties.swift
//  
//
//  Created by Aarish on 25/09/22.
//
//

import Foundation
import CoreData


extension UnitCellData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UnitCellData> {
        return NSFetchRequest<UnitCellData>(entityName: "UnitCellData")
    }

    @NSManaged public var unit: String?
    @NSManaged public var unitCellId: Int32
    @NSManaged public var employHours: [EmployHours]?

}
