//
//  Todo+CoreDataProperties.swift
//  
//
//  Created by hakuchan on 2019/07/17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var title: String?

}
