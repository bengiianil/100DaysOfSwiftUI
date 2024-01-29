//
//  Prospect.swift
//  HopProspects
//
//  Created by Bengi Anıl on 6.11.2023.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    let saveKey = "SavedData"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedData = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decodedData
                return
            }
        }
        
        // no saved data
        self.people = []
    }
    
    private func save() {
        if let encodedData = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }
    
    func add(prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
}
