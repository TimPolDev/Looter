//
//  OnboardingPageView.swift
//  Looter
//
//  Created by Timote POLICET on 1/24/24.
//

import SwiftUI



struct OnboardingPageView: View {
    let page : Page
    
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            VStack{
                Text(page.title)
                    .foregroundColor(Color.white)
                    
                
                Text(page.image)
                    .foregroundColor(Color.blue)
                    .padding(.all, 50.0)
                    .background(Color.white)
                
                    .cornerRadius(360.0)
                Text(page.description)
                    .foregroundColor(Color.white)
            }
            .frame(width: 400.0)
            Spacer()
            Text("Suivant")
                .foregroundColor(Color.blue)
                .background(Color.white)
                .padding(.all, 32.0)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
                
        }.background(Color.blue)
            
        
        
        
    }
}

#Preview {
    OnboardingPageView(page : Page(title: "test", description: "description", image: "img"))
}
