//
//  ContentView.swift
//  H4X0R News
//
//  Created by Рамазан  on 8/2/20.
//  Copyright © 2020 Ramazan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts, rowContent: { post in
                NavigationLink(destination: DetailView(url: post.url), label: {
                    HStack{
                        Text(String(post.points))
                        Text(post.title)
                    }
                })
            })
                .navigationBarTitle("H4X0R NEWS")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}


//let posts = [
//    Post(id: "1", title: "Hi"),
//    Post(id: "2", title: "Salem"),
//    Post(id: "3", title: "Privet")
//]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
