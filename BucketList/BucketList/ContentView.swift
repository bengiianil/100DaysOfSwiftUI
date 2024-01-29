//
//  ContentView.swift
//  BucketList
//
//  Created by Bengi Anıl on 26.10.2023.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        if viewModel.isUnlocked {
            ZStack {
                Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
    //                MapMarker(coordinate: location.coordinate)
                    
                    MapAnnotation(coordinate: location.coordinate) {
                        VStack {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundColor(.red)
                                .frame(width: 44, height: 44)
                                .background(.white)
                                .clipShape(Circle())
                            
                            Text(location.name)
                                .fixedSize()
                        }
                        .onTapGesture {
                            viewModel.selectedPlace = location
                        }
                    }
                }
                .ignoresSafeArea()

                Circle()
                    .fill(.blue)
                    .opacity(0.3)
                    .frame(width: 44, height: 44)
                            
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button {
                            viewModel.addLocation()
                        } label: {
                            Image(systemName: "plus")
                        }
                        .padding()
                        .background(.black
                                    .opacity(0.75))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .padding(.trailing)
                    }
                }
            }
            .sheet(item: $viewModel.selectedPlace) { place in
                EditView(location: place) { newLocation in
                    viewModel.updateLocation(newLocation: newLocation)
                }
            }
        } else {
            Button("Unlock Places") {
                 viewModel.authenticate()
             }
             .padding()
             .background(.blue)
             .foregroundColor(.white)
             .clipShape(Capsule())
        }
    }
}

#Preview {
    ContentView()
}
