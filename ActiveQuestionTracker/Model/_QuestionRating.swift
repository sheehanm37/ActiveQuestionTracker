// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to QuestionRating.swift instead.

import CoreData

public enum QuestionRatingAttributes: String {
    case dataPointValue = "dataPointValue"
    case dateAdded = "dateAdded"
}

public enum QuestionRatingRelationships: String {
    case ratingForQuestion = "ratingForQuestion"
}

@objc public
class _QuestionRating: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "QuestionRating"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _QuestionRating.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var dataPointValue: NSNumber?

    // func validateDataPointValue(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var dateAdded: NSDate?

    // func validateDateAdded(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var ratingForQuestion: Question?

    // func validateRatingForQuestion(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

}

