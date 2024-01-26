//
//  LootDetailView.swift
//  Looter
//
//  Created by Timote POLICET on 1/19/24.
//

import SwiftUI


struct LootDetailView: View {
    @State private var scaleUnique:Int = 0
    @State private var animate1 = false
    @State private var animate2 = false
    @State var showAddItemView = false
    @StateObject var inventory = Inventory()
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
                            .shadow(color: rarityColor(rarity: item.rarity), radius: animate1 ? 50 : 0)
                            .animation( .bouncy(duration: 1) .delay(1) , value: animate1)
                            .rotation3DEffect(.degrees(animate1 ? 360 : 0), axis: (x: 1, y: animate1 ? 0.5 : 0, z: 0))
                            .animation(.spring(duration: 0.8) , value: animate1)
                            
                            
                            .task{
                                try? await Task.sleep(nanoseconds: 400000000)
                                    animate1 = true
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
                                .fontWeight(.bold)
                                .padding(.vertical, 12.0)
                                .frame(width: 360.0)
                                .background(rarityColor(rarity: item.rarity))
                                .foregroundColor(.white)
                                .cornerRadius(12.0)
                                .scaleEffect(CGFloat(scaleUnique))
                                
                                .onAppear {
                                    Task{
                                        try? await Task.sleep(nanoseconds: 400000000)
                                        withAnimation(.easeIn(duration: 0.3)){
                                            self.scaleUnique = 1
                                        }
                                    }
                                }
                    
                }
                
            }
        }.sheet(isPresented: $showAddItemView, content: {
            AddItemView(item: item)
            .environmentObject(inventory)
        })
    .navigationBarTitle("Loot") // Notre titre de page, choisissez le titre que vous voulez
        .toolbar(content: { // La barre d'outil de notre page
            ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                Button(action: {
                    showAddItemView.toggle() // L'action de notre bouton
                }, label: {
                    Image(systemName: "plus.circle.fill")
                })
            }
        })
       
            List{
                LootInformation(item:item)
                
            
            
            }
            
        }
        
        
        
        
        
        
    }


#Preview {
    LootDetailView(item: testData[0])
}


