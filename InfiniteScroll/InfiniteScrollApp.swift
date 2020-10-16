//
//  InfiniteScrollApp.swift
//  InfiniteScroll
//
//  Created by Victor Luni on 10/10/20.
//

import SwiftUI

@main
struct InfiniteScrollApp: App {
    var body: some Scene {
        WindowGroup {
            let url = URL(string: "https://cloud.githubusercontent.com/assets/1567433/9781817/ecb16e82-57a0-11e5-9b43-6b4f52659997.jpg")!

            ContentView(image: FetchImage(url: url))
        }
    }
}
