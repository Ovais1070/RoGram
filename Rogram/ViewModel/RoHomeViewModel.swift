//
//  SplashViewModel.swift
//  Rogram
//
//  Created by Ovais Khan on 5/23/24.
//

import Foundation
import SwiftUI
import Combine

class RoHomeViewModel: ObservableObject {
    
    @Published var posts: [Posts] = []
    private var cancellable: AnyCancellable?
    
    @Published var colorArray: [Color] = [.white, .init(uiColor: UIColor(red: 173/225, green: 216/225, blue: 230/225, alpha: 0.8)), .init(uiColor: UIColor(red: 255/225, green: 182/225, blue: 193/225, alpha: 0.8)), .white]
    
    var selected_post: Posts?
    
    
    func fetchPostsData() {
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/album/1/photos") else {
                print("Invalid URL")
                return
            }

            cancellable = URLSession.shared.dataTaskPublisher(for: url)
                .map { $0.data }
                .decode(type: [Posts].self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Error fetching posts: \(error)")
                    }
                }, receiveValue: { [weak self] posts in
                    self?.posts = posts
                })
        }
    
    
}
