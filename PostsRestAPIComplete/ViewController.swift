//
//  ViewController.swift
//  PostsRestAPIComplete
//
//  Created by Gedcoin on 2021/04/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
    }
    
    @IBAction private func ViewPostsTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "PostsScreenSegue", sender: self)
    }
}

