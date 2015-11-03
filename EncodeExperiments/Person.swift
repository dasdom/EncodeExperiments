//
//  Person.swift
//  EncodeExperiments
//
//  Created by dasdom on 16.08.15.
//  Copyright © 2015 Dominik Hauser. All rights reserved.
//

import Foundation

struct Person {
  let firstName: String
  let lastName: String
  
  static func encode(person: Person) {
    let personClassObject = HelperClass(person: person)
    
    NSKeyedArchiver.archiveRootObject(personClassObject, toFile: HelperClass.path())
  }
  
  static func decode() -> Person? {
    let personClassObject = NSKeyedUnarchiver.unarchiveObjectWithFile(HelperClass.path()) as? HelperClass

    return personClassObject?.person
  }
}

extension Person {
  class HelperClass: NSObject, NSCoding {
    
    var person: Person?
    
    init(person: Person) {
      self.person = person
      super.init()
    }
    
    class func path() -> String {
      let documentsPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first
      let path = documentsPath?.stringByAppendingString("/Person")
      return path!
    }
    
    required init?(coder aDecoder: NSCoder) {
      guard let firstName = aDecoder.decodeObjectForKey("firstName") as? String else { person = nil; super.init(); return nil }
      guard let lastName = aDecoder.decodeObjectForKey("lastName") as? String else { person = nil; super.init(); return nil }
      
      person = Person(firstName: firstName, lastName: lastName)
      
      super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
      aCoder.encodeObject(person!.firstName, forKey: "firstName")
      aCoder.encodeObject(person!.lastName, forKey: "lastName")
    }
  }
}
