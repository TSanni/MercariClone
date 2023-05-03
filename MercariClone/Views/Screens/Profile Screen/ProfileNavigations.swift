//
//  ProfileNavigations.swift
//  MercariClone
//
//  Created by Tomas Sanni on 4/23/23.
//

import SwiftUI

//MARK: - Profile Screen Navigation Subview
struct ProfileNavigations: View {
    let image: String
    let name: String
    let rotation: Double
    let chosenNavigation: ProfileScreenNavigations
    
    var body: some View {
        
        NavigationLink {
            switch chosenNavigation {
                case .toListings:
                    Text("Listings")
                case .toPurchases:
                    Text("Purchases")
                case .toSettings:
                    SettingsView()
                case .toHelpCenter:
                    Text("Help Center")
            }
        } label: {
            VStack {
                HStack {
                    Image(systemName: image)
                        .rotationEffect(Angle.degrees(rotation))
                    
                    Text(name)
                }
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
                
                Divider()

            }
        }

        

        
    }
}

struct ProfileNavigations_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileNavigations(image: "gear", name: "Settings", rotation: 0, chosenNavigation: .toSettings)
        }
        .tint(.black)
    }
}
