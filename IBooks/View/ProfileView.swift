//
//  ProfileView.swift
//  IBooks
//
//  Created by MAC37 on 2/12/22.
//

import SwiftUI

struct ProfileView: View {
//    CREAR ESTADO usando State = *Reactividad*
//    Reactivo
    @State var name = "Youlserf"
    @StateObject var profileViewModel = ProfileViewModel()
    
    var body: some View {
        VStack{
            Text(name).font(.title)
            Button{
                name = "Youlserf Cardenas"
                profileViewModel.saludar(name: name)
            } label: {
                Text("Cambiar Nombre")
            }.padding(.top)
        }
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
