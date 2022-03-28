//
//  MiniListRow.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 3/24/22.
//



import SwiftUI

struct MiniListRow: View {
  //  let id: NSUUID().uuidString
    var body: some View {
        HStack{
           Text("03/23/2022")
                
            Spacer()
            
            Text("Look at you! You are happy! like really happy, not just happy 😀")
            
//           Text("Look at you! \n You're very Happy today!")
//                . multilineTextAlignment(.leading)
        } .padding()
      
    }
}

struct MiniListRow_Previews: PreviewProvider {
    static var previews: some View {
        MiniListRow()
    }
}
