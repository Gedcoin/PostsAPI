//
//  PostsViewModel.swift
//  PostsRestAPIComplete
//
//  Created by Gedcoin on 2021/04/11.
//

import Foundation

class PostsViewModel {
    
    var postModel: [PostsDataModel]!
    
    func callPostsAPI(urlString: String, completed: @escaping (Bool, String?) -> Void) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    do {
                        self.postModel = try JSONDecoder().decode([PostsDataModel].self, from: data)
                        DispatchQueue.main.async {
                            completed(true, nil)
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }
}

struct PostsDataModel: Codable {
    
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
