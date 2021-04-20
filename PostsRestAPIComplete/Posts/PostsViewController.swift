//
//  PostsViewController.swift
//  PostsRestAPIComplete
//
//  Created by Gedcoin on 2021/04/11.
//

import Foundation
import UIKit

class PostsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    private lazy var viewModel = PostsViewModel()
    private let apiUrl = "https://jsonplaceholder.typicode.com/comments"
    private var myIndex = 0
    private var loadingIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        callAPI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: self)
        if segue.identifier == "PostDetailsScreenSegue" {
            let postDetailsViewController = segue.destination as! PostDetailsViewController
            if let postModel = self.viewModel.postModel {
                postDetailsViewController.nameLabel = postModel[myIndex].name
                postDetailsViewController.emailLabel = postModel[myIndex].email
                postDetailsViewController.bodyLabel = postModel[myIndex].body
            }
        }
    }
    
    private func setupView() {
        title = "Posts"
        loadingIndicator.center = view.center
        view.addSubview(loadingIndicator)
        loadingIndicator.startAnimating()
    }
    
    private func callAPI() {
        viewModel.callPostsAPI(urlString: apiUrl) { (result, errorString) in
            if result {
                self.tableView.reloadData()
                self.loadingIndicator.stopAnimating()
            }
        }
    }
}

extension PostsViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostsTableViewCell
        if let postModel = self.viewModel.postModel {
            postCell.name.text = postModel[indexPath.row].name
            postCell.email.text = postModel[indexPath.row].email
            postCell.body.text = postModel[indexPath.row].body
        }
        return postCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "PostDetailsScreenSegue", sender: self)
    }
}
