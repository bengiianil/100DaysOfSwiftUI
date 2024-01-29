//
//  EditCards.swift
//  Flashzilla
//
//  Created by Bengi Anıl on 8.11.2023.
//

import SwiftUI

struct EditCards: View {
    
    @Environment (\.dismiss) var dismiss
    @State var cards = [Card]()
    @State var newPrompt = ""
    @State var newAnswer = ""

    
    var body: some View {
        NavigationStack {
            List {
                Section("Add New Card") {
                    TextField("Enter new prompt", text: $newPrompt)
                    TextField("Enter new answer", text: $newAnswer)
                    Button("Add Card", action: addCard)
                }

                Section{
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)

                            Text(cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
            .listStyle(.grouped)
            .onAppear(perform: loadData)
        }
    }
    
    func done() {
        dismiss()
    }
    
    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }

        let newCard = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(newCard, at: 0)
        saveData()
    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "CardData") {
            if let decodedData = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decodedData
            }
        }
    }
    
    func saveData() {
        if let encodedData = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(encodedData, forKey: "CardData")
        }
    }
}

#Preview {
    EditCards()
}
