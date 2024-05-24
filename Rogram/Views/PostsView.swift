//
//  PostsView.swift
//  Rogram
//
//  Created by Ovais Khan on 5/24/24.
//

import SwiftUI

struct PostsView: View {
    
    var posts: Posts
    @State var liked: Bool = false
    var onTap: (Posts) -> Void
    var width = UIScreen.main.bounds.width - 40
    
    var body: some View {
        
        VStack(spacing: 0) {
            URLImageView(url: URL(string: posts.thumbnailUrl ?? "https://picsum.photos/seed/picsum/200/300")!, width: width, height: width / 1.5)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onTapGesture {
                    self.onTap(self.posts)
                }
            
            HStack {
                Text(posts.title ?? "This is the Image")
                
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2, reservesSpace: false)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    
                    liked.toggle()
                }, label: {
                    Image(systemName: liked ? "heart.fill": "heart")
                        .resizable()
                        .renderingMode(.original)
                        .tint(.red)
                    
                    
                })
                .frame(width: 20, height: 20)
                .buttonStyle(.plain)
                .padding(.top, 10)
                .padding(.trailing, 20)
                
                
                
            }
            .frame(maxWidth: UIScreen.main.bounds.width)
            .background(.white)
            .onTapGesture {
                self.onTap(self.posts)
            }
            
        }
    }
}

