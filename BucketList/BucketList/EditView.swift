//
//  EditView.swift
//  BucketList
//
//  Created by Bengi Anıl on 28.10.2023.
//

import SwiftUI

enum LoadingState {
    case loading
    case loaded
    case failed
}

struct EditView: View {
    var location: Location
    var onSave: (Location) -> Void
    
    @Environment(\.dismiss) var dismiss
    @State private var name: String
    @State private var description: String
    @State private var loadingState = LoadingState.loading
    @State private var pages = [Page]()

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place Name", text: $name)
                    TextField("Description", text: $description)
                }
                
                Section("Nearby...") {
                    switch loadingState {
                    case .loading:
                        Text("Loading…")
                     case .loaded:
                        ForEach(pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(":")
                            + Text(page.description)
                                .italic()
                        }
                     case .failed:
                         Text("Please try again later.")
                     }
                }
            }
            .navigationTitle("Place Details")
            .toolbar {
                Button("Save") {
                    var newLocation = location
                    newLocation.id = UUID()
                    newLocation.name = name
                    newLocation.description = description
                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await fetchNearbyPlaces()
            }
        }
    }
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
    
    func fetchNearbyPlaces() async {
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.coordinate.latitude)%7C\(location.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"

        guard let url = URL(string: urlString) else {
            print("Bad Url: \(urlString)")
            return
        }
    
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
//            pages = items.query.pages.values.sorted { $0.title < $1.title }
            pages = items.query.pages.values.sorted() // static func <(lhs: Page, rhs: Page) ile sort edildi
            loadingState = .loaded
        } catch {
            print(error.localizedDescription)
            loadingState = .failed
        }
    }
}

#Preview {
    EditView(location: Location.example) { _ in }
}
