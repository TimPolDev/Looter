//
//  OnboardingView.swift
//  Looter
//
//  Created by Timote POLICET on 1/24/24.
//

import SwiftUI

struct Page:Identifiable{
    var id : UUID = UUID()
    var title : String
    var description : String
    var image : String
}
let pages : [Page] = [
    Page(title : "Titre 1", description: "desc 1", image:"img1"),
    Page(title : "Titre 2", description: "desc 2", image:"img2"),
    Page(title : "Titre 3", description: "desc 3", image:"img3")
]

struct OnboardingView: View {
    var body: some View {
        OnboardingPageView(page : pages[0])
    }
}

#Preview {
    OnboardingView()
}
