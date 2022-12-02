//
//  HomeView.swift
//  IBooks
//
//  Created by MAC37 on 2/12/22.
//

import SwiftUI

struct HomeView: View {
    @State var searchText: String = ""
    @StateObject var homeViewModel = HomeViewModel()
    var body: some View {
        NavigationView{
            VStack{
                TextField("Busca un Libro", text: $searchText)
                    .padding(12)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.green, lineWidth: 1))
                    .padding()
                    .keyboardType(.webSearch)
                    .onSubmit {
                        if searchText.isEmpty {
                            return
                        }
                        Task {
                            await homeViewModel.getBooks(search: searchText)
                        }
                    }
                    
                
                List(homeViewModel.items, id: \.volumeInfo.title){ book in
                    BookRowView(book: book)
                    
                }
                .listStyle(.inset)
            }
            .navigationTitle("IBooks")
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
