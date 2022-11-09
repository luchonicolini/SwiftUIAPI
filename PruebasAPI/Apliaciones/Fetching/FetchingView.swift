//
//  FetchingView.swift
//  PruebasAPI
//
//  Created by Luciano Nicolini on 07/11/2022.
//

import SwiftUI

let getURL = "https://jsonplaceholder.typicode.com/todos"

//Model   1)
struct ModelFetching: Decodable {
    let id: Int
    let userId: Int
    let title: String
    let completed: Bool
}

//ViewModel  2)
class ViewModel: ObservableObject{
    @Published var items = [ModelFetching]()
    
    func FetchingloadData() {
        guard let url = URL(string: getURL) else {return}
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            do {
                if let data = data {
                    let result = try JSONDecoder().decode([ModelFetching].self, from: data)
                    DispatchQueue.main.async {
                        self.items = result
                    }
                } else {
                    print("error")
                }
                
            } catch (let error) {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


//View  3)
struct FetchingView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.items, id: \.id) { item in
                    Text(item.title)
                }
                .onAppear {
                    viewModel.FetchingloadData()
                }
                .navigationTitle("Datas")
            }
        }
    }
}

struct FetchingView_Previews: PreviewProvider {
    static var previews: some View {
        FetchingView()
    }
}
