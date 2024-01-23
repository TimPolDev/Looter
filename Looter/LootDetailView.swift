//
//  LootDetailView.swift
//  Looter
//
//  Created by Timote POLICET on 1/19/24.
//

import SwiftUI


struct LootDetailView: View {
    @State private var animate = false
    var item:LootItem
    var body: some View {
        
        Section{
            VStack(){
                if(item.rarity != .unique){
                    Spacer()
                }
                Text("\(item.type.rawValue)")
                            .font(.system(size: 58))
                            .padding(.all, 15.0)
                            .background(rarityColor(rarity: item.rarity))
                            .cornerRadius(25.0)
                            .shadow(color: rarityColor(rarity: item.rarity), radius: animate ? 50 : 0)
                            .animation( .bouncy(duration: 1) .delay(1) , value: animate)
                            .rotation3DEffect(.degrees(animate ? 360 : 0), axis: (x: 1, y: animate ? 0.5 : 0, z: 0))
                            .animation(.spring(duration: 0.8) , value: animate)
                            
                            
                            .task{
                                try? await Task.sleep(nanoseconds: 400000000)
                                    animate = true
                            }
                
                            
                    
                Text(item.name)
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .foregroundColor(rarityColor(rarity: item.rarity))
                    .padding(.top, 10.0)
                
                Spacer()
                    
                    
                if(item.rarity == .unique){
                    Text("Item Unique 🏆")
                    
                        .font(.system(size: 18))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.vertical, 12.0)
                        .frame(width: 360)
                        .background(rarityColor(rarity: item.rarity))
                        .foregroundColor(.white)
                        .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
                }
                
            }
        }
       
            List{
                Section(header: Text("Informations")){
                    HStack{
                        
                        if let coverName = item.game.coverName {
                            Image(coverName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame( height: 58)
                                .cornerRadius(/*@START_MENU_TOKEN@*/4.0/*@END_MENU_TOKEN@*/)
                                
                            Text(item.game.name)
                                
                               } else {
                                   
                        Image(systemName: "rectangle.slash")
                            .padding(.horizontal, 7.0)
                                        .frame(height: 58)
                                        .background(Color.gray)
                                        .cornerRadius(4.0)
                                        .opacity(/*@START_MENU_TOKEN@*/0.4/*@END_MENU_TOKEN@*/)
                                       
                                        
                                       
                                    

                                   Text(item.game.name)
                                       
                               }
                        
                        
                        
                        
                    }
                    Text("In-game : \(item.name)")
                    if let attackStrength = item.attackStrength {
                                Text("Puissance (ATQ) : \(attackStrength)")
                            }
                    else{
                        Text("Puissance (ATQ) : Aucune")
                    }
                    
                    Text("Possédé(s) : \(item.quantity)")
                    Text("Rareté : \(rarityName(rarity: item.rarity))")
                }
                
            
            
            }
            
        }
        
        
        
        
        
        
    }


#Preview {
    LootDetailView(item: testData[0])
}
