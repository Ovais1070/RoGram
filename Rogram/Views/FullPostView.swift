//
//  FullPostView.swift
//  Rogram
//
//  Created by Ovais Khan on 5/24/24.
//

import SwiftUI

struct FullPostView: View {
    
    @Environment(\.dismiss) private var dismiss
    var width = UIScreen.main.bounds.width
    var postDetail: Posts
    var onTap: () -> Void
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        onTap()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                        
                    })
                    .buttonStyle(.plain)
                    .padding(.top, 25)
                    .padding(.trailing, 25)
                }
                
                
                Spacer()
            }
            
            
            
            
            VStack(spacing: 0) {
                URLImageView(url: URL(string: postDetail.thumbnailUrl ?? "https://picsum.photos/seed/picsum/200/300")!, width: width, height: width)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(postDetail.title ?? "This is the Image")
                
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2, reservesSpace: false)
                    .padding()
                
            }
        }
        .gesture(
            DragGesture().onEnded { value in
                if value.location.y - value.startLocation.y > 150 {
                    /// Use presentationMode.wrappedValue.dismiss() for iOS 14 and below
                    dismiss()
                }
            }
        )
        
        
    }
}

