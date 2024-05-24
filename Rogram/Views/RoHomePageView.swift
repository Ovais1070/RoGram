//
//  ContentView.swift
//  Rogram
//
//  Created by Ovais Khan on 5/23/24.
//

import SwiftUI

struct RoHomePageView: View {
    
    @State private var animateGradient: Bool = false
    @Binding var showSplash: Bool
    @State var openImage: Bool
    
    @StateObject var vm = RoHomeViewModel()
    
    
    var body: some View {
        
            ZStack {
                
                VStack {
                    
                    Text("Ro")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(vm.posts.isEmpty ? {.clear}() : {.black }())
                        .padding(.top, 25)
                    
                    List(vm.posts) { posts in
                        VStack(alignment: .leading) {
                            PostsView(posts: posts) {post in
                                self.vm.selected_post = post
                                openImage.toggle()
                            }
                        }
                    }
                    .listStyle(.plain)
                    
                    
                    Spacer()
                }
                .fullScreenCover(isPresented: $openImage) {
                    ZStack {
                        Color.black.opacity(0.8).edgesIgnoringSafeArea(.all)
                        FullPostView(postDetail: self.vm.selected_post!) {
                            openImage.toggle()
                        }
                    }
                    
                        
                }
                
                
                
                
                if vm.posts.isEmpty {
                    SplashView(colorArray: vm.colorArray, animateGradient: $animateGradient)
                        .onAppear(perform: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                vm.fetchPostsData()
                            }
                        })
                }
                
            }
    }
}

#Preview {
    RoHomePageView(showSplash: .constant(true), openImage: false)
}
