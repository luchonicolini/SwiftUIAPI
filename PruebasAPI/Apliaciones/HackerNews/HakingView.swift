//
//  HakingView.swift
//  PruebasAPI
//
//  Created by Luciano Nicolini on 04/11/2022.
//

import SwiftUI

struct HakingView: View {
    @ObservedObject var networkManager = HackerNetworkManager()
    
    var body: some View {
        NavigationStack {
            List(networkManager.PostHaking) { post in
                NavigationLink(destination: HakingDetail(url: post.url)) {
                    
                    HStack {
                        Text(String(post.points))
                            .fontWeight(.medium)
                        Text(post.title)
                
                    }
                }
                
            }
            .navigationTitle("hacker news")
            .onAppear {
                networkManager.fetchData()
            }
        }
    }
}

struct HakingView_Previews: PreviewProvider {
    static var previews: some View {
        HakingView()
    }
}
