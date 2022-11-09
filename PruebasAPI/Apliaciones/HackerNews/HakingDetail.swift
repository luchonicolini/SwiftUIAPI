//
//  HakingDetail.swift
//  PruebasAPI
//
//  Created by Luciano Nicolini on 04/11/2022.
//

import SwiftUI

struct HakingDetail: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
        
    }
}

struct HakingDetail_Previews: PreviewProvider {
    static var previews: some View {
        HakingDetail(url: "www.apple.com")
    }
}
