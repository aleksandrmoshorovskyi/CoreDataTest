//
//  MyAppData+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by Aleksandr Moroshovskyi on 04.05.2024.
//
//

import Foundation
import CoreData


extension MyAppData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyAppData> {
        return NSFetchRequest<MyAppData>(entityName: "MyAppData")
    }

    @NSManaged public var name: String?
    @NSManaged public var image: URL?

}

extension MyAppData : Identifiable {

}
