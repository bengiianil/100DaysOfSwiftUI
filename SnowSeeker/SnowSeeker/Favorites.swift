//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Bengi Anıl on 10.11.2023.
//

import Foundation

class Favorites: ObservableObject {
    private var resorts: Set<String>
    private let saveKey = "Favorites"
    
    init() {
        self.resorts = []
        load()
    }
    
    func contains(resort: Resort) -> Bool {
        return resorts.contains(resort.id)
    }
    
    func add(resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func load() {
        // load our saved data
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedData = try? JSONDecoder().decode(Set<String>.self, from: data) {
                resorts = decodedData
            }
        }
    }
    
    func save() {
        // write out our data
        if let encodedData = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }
}
