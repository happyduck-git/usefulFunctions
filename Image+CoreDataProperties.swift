//
//  Image+CoreDataProperties.swift
//  CoreDataImageTest
//
//  Created by HappyDuck on 2022/01/20.
//
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image")
    }

    @NSManaged public var storedImage: Data?

}

extension Image : Identifiable {

}
