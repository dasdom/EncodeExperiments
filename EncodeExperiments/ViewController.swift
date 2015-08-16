//
//  ViewController.swift
//  EncodeExperiments
//
//  Created by dasdom on 16.08.15.
//  Copyright © 2015 Dominik Hauser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var firstNameLabel: UILabel!
  @IBOutlet weak var lastNameLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let me = Person(firstName: "Dominik", lastName: "Hauser")
    
    Person.encode(me)
    
    let myClone = Person.decode()
    
    firstNameLabel.text = myClone?.firstName
    lastNameLabel.text = myClone?.lastName
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

