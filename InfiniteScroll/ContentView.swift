//
//  ContentView.swift
//  InfiniteScroll
//
//  Created by Victor Luni on 10/10/20.
//

import SwiftUI
import Nuke

struct ContentView: View {
    @StateObject var data = DataSource()
    @ObservedObject var image: FetchImage
    
    var body: some View {
        ScrollView {
            
            LazyVStack(alignment: .leading) {
                ForEach(data.items.characters) { char in
                    CellView(char: char, image: FetchImage(url: URL(string: char.image)!)).onAppear {
                        data.loadMoreContentIfNeeded(currentItem: char)
                    }.padding([.leading], 10)
                }
            }
        }
        
    }
}



struct CellView: View {
    var char: Character
    @ObservedObject var image: FetchImage
    
    var body: some View {
        
        ZStack {
            HStack {
                image.view?.resizable().aspectRatio(contentMode: .fill).clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 4)).shadow(radius: 10).frame(width: 100, height: 100)
                    Text(char.name)
                    
                
            }.onAppear(perform: image.fetch)
        }
        
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://cloud.githubusercontent.com/assets/1567433/9781817/ecb16e82-57a0-11e5-9b43-6b4f52659997.jpg")!
        
        ContentView(image: FetchImage(url:url))
    }
}


