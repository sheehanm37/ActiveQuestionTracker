// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Question.swift instead.

import CoreData

public enum QuestionAttributes: String {
    case dateAdded = "dateAdded"
    case dateArchived = "dateArchived"
    case isArchived = "isArchived"
    case question = "question"
}

public enum QuestionRelationships: String {
    case rating = "rating"
}

@objc public
class _Question: NSManagedObject {

    // MARK: - Class methods

    public class func entityName () -> String {
        return "Question"
    }

    public class func entity(managedObjectContext: NSManagedObjectContext!) -> NSEntityDescription! {
        return NSEntityDescription.entityForName(self.entityName(), inManagedObjectContext: managedObjectContext);
    }

    // MARK: - Life cycle methods

    public override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    public convenience init(managedObjectContext: NSManagedObjectContext!) {
        let entity = _Question.entity(managedObjectContext)
        self.init(entity: entity, insertIntoManagedObjectContext: managedObjectContext)
    }

    // MARK: - Properties

    @NSManaged public
    var dateAdded: NSDate?

    // func validateDateAdded(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var dateArchived: NSDate?

    // func validateDateArchived(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var isArchived: NSNumber?

    // func validateIsArchived(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    @NSManaged public
    var question: String?

    // func validateQuestion(value: AutoreleasingUnsafeMutablePointer<AnyObject>, error: NSErrorPointer) -> Bool {}

    // MARK: - Relationships

    @NSManaged public
    var rating: NSSet

}

extension _Question {

    func addRating(objects: NSSet) {
        let mutable = self.rating.mutableCopy() as! NSMutableSet
        mutable.unionSet(objects as! Set<NSObject>)
        self.rating = mutable.copy() as! NSSet
    }

    func removeRating(objects: NSSet) {
        let mutable = self.rating.mutableCopy() as! NSMutableSet
        mutable.minusSet(objects as! Set<NSObject>)
        self.rating = mutable.copy() as! NSSet
    }

    func addRatingObject(value: QuestionRating!) {
        let mutable = self.rating.mutableCopy() as! NSMutableSet
        mutable.addObject(value)
        self.rating = mutable.copy() as! NSSet
    }

    func removeRatingObject(value: QuestionRating!) {
        let mutable = self.rating.mutableCopy() as! NSMutableSet
        mutable.removeObject(value)
        self.rating = mutable.copy() as! NSSet
    }

}

