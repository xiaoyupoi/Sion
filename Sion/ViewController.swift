//
//  ViewController.swift
//  Sion
//
//  Created by leimo on 2018/3/23.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    var contect = Contact()
    contect.firstName = "s"
    
  }
    
    func getLibrary() -> MyLibrary {
        let map = ["route": "66"]
        
        var bookInfo = BookInfo()
        bookInfo.id = 10
        bookInfo.title = "Welcome to Swift"
        bookInfo.author = "Apple Inc."
        
        var library = MyLibrary()
        library.id = 20
        library.name = "Swift"
        library.books = [bookInfo]
        library.keys = map
        
        return library
    }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

