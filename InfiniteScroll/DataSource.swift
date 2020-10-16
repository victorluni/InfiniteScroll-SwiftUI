//
//  DataSource.swift
//  InfiniteScroll
//
//  Created by Victor Luni on 13/10/20.
//

import Foundation

class DataSource: ObservableObject {
    
    @Published var items = CharacterList()
    @Published var isLoadingPage = false
    
    private var currentPage = 1
    private var canLoadMorePages = true
    private var nextURL: String? = "https://rickandmortyapi.com/api/character/"
    
    
    init() {
        loadData()
    }
    
    private func loadData() {
        guard !isLoadingPage && canLoadMorePages else {
            return
        }
        
        isLoadingPage = true
        
        ApiManager<CharacterList>().loadFromApi(endpoint: self.nextURL ?? "") { (data) in
            
            self.nextURL = data.info.next
            if self.nextURL == nil {
                self.canLoadMorePages = false
            }
            DispatchQueue.main.async {
                self.isLoadingPage = false
                self.characterBind(newCharacters: data.characters)
            }
        }
    }
    
    private func characterBind(newCharacters: [Character]) {
        self.items.characters.append(contentsOf: newCharacters)
    }
    
    
    func loadMoreContentIfNeeded(currentItem item: Character?) {
        guard let item = item else {
            loadData()
            return
        }
        let thresholdIndex = items.characters.index(items.characters.endIndex, offsetBy: -5)
        if items.characters.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
            loadData()
        }
    }
    
}
