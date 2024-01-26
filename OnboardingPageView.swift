//
//  OnboardingPageView.swift
//  Looter
//
//  Created by Timote POLICET on 1/24/24.
//

import SwiftUI




struct OnboardingPageView: View {
    var id : UUID = UUID()
    var title : String
    var description : String
    var image : String
    var finish : Bool?
    
    @AppStorage("isOnboarding") var isOnboarding:Bool?
    
    @State private var scale: CGFloat = 0.1 // Pour l'animation de l'image

    
    func start(){
        isOnboarding = false
    }
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            VStack{
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 25.0)
                    
                    
                    
                
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding(.all, 50.0)
                    .cornerRadius(20)
                    .scaleEffect(scale) // Appliquer l'effet de mise à l'échelle
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.3)) {
                            self.scale = 1.0 // Animer l'image lors de l'apparition
                        }
                    }
                
                    
                
                if finish != true {
                    Text(description)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 30.0)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20.0)
                }else{
                    Text(description)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 30.0)
                        .padding(.horizontal, 20)
                }
            }
            .frame(width: 400.0)
            
            Spacer()
            
            if finish == true {
                Button("Commencer", action: start)
                    .padding(.bottom, 80.0)
                    .frame(height: 20)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            
                
        }
        
            
            
        
        
        
    }
}

#Preview {
    OnboardingPageView(title: "Gérer ses loots", description: "Créez une liste de souhaits pour garder une trace des achats que vous souhaitez acquérir", image: "epees-croisees")
}
