//
//  URLImageView.swift
//  Rogram
//
//  Created by Ovais Khan on 5/24/24.
//

import SwiftUI



struct URLImageView: View {
    @StateObject private var loader = ImageLoader()
    let url: URL
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(2, contentMode: .fill)
                    .frame(width: width, height: height)
            } else {
                ProgressView()
                    .frame(width: width, height: height)
            }
        }
        .onAppear {
            loader.loadImage(from: url)
        }
    }
}


