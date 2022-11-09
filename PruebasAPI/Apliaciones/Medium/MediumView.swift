//
//  MediumView.swift
//  PruebasAPI
//
//  Created by Luciano Nicolini on 07/11/2022.
//

import SwiftUI

//https://jsonplaceholder.typicode.com/todos
//https://jsonplaceholder.typicode.com/users/1

struct MediumView: View {
    @State var results = [TaskEntry]()
    
    var body: some View {
        List(results, id: \.id) { item in
                VStack(alignment: .leading) {
                    Text(item.title)
                }
            }.onAppear(perform: loadData)
        }
  
    func loadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            print("Su punto final de la API es inválido")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode([TaskEntry].self, from: data) {
                    DispatchQueue.main.async {
                        self.results = response
                    }
                    return
                }
            }
        }.resume()
    }
}

struct MediumView_Previews: PreviewProvider {
    static var previews: some View {
        MediumView()
    }
}
