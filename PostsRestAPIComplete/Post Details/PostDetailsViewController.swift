//
//  PostDetailsViewController.swift
//  PostsRestAPIComplete
//
//  Created by Gedcoin on 2021/04/11.
//

import Foundation
import UIKit

class PostDetailsViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var body: UILabel!
    var nameLabel = ""
    var emailLabel = ""
    var bodyLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Post details"
        
        name.text = nameLabel
        email.text = emailLabel
        body.text = bodyLabel
    }
}
