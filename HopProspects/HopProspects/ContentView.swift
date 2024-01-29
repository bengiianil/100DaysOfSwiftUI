//
//  ContentView.swift
//  HopProspects
//
//  Created by Bengi Anıl on 30.10.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var prospects = Prospects()

    var body: some View {
        VStack {
            TabView() {
                ProspectsView(filter: .none)
                    .tabItem {
                        Label("Everyone", systemImage: "person.3")
                    }

                ProspectsView(filter: .contacted)
                    .tabItem {
                        Label("Contacted", systemImage: "checkmark.circle")
                    }

                ProspectsView(filter: .uncontacted)
                    .tabItem {
                        Label("Uncontacted", systemImage: "questionmark.diamond")
                    }
                
                MeView()
                    .tabItem {
                        Label("Me", systemImage: "person.crop.square")
                    }
            }
            .environmentObject(prospects)
        }
    }
}

#Preview {
    ContentView()
}

//    @State var output = ""
//        Text(output)
//            .task {
//                await fetchReadings()
//            }
    
//    func fetchReadings() async {
//        let fetchTask = Task { () -> String in
//            let url = URL(string: "https://hws.dev/readings.json")!
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let readings = try JSONDecoder().decode([Double].self, from: data)
//            return "Found \(readings.count) readings"
//        }
//
//        let result = await fetchTask.result
//
//        switch result {
//        case .success(let success):
//            output = success
//        case .failure(let failure):
//            output = "Download Error: \n\(failure.localizedDescription)"
//        }
        
//        do {
//            output = try result.get()
//        } catch {
//            print("Download Error")
//        }
//    }
