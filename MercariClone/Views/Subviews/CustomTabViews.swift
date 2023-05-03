//
//  CustomTabViews.swift
//  MercariClone
//
//  Created by Tomas Sanni on 5/2/23.
//

import SwiftUI

struct CustomTabViews: View {
    let tab1Name: String
    let tab2Name: String
    
    @Binding var showFirstTab: Bool
    @Namespace var underline

    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(tab1Name)
                    .foregroundColor(showFirstTab == true ? nil : .secondary)
                    .padding(.vertical, 10)
                    .onTapGesture {
                        withAnimation {
                            showFirstTab = true
                        }
                    }
                Spacer()
                Text(tab2Name)
                    .foregroundColor(showFirstTab == true ? .secondary : nil)
                    .padding(.vertical, 10)
                    .onTapGesture {
                        withAnimation {
                            showFirstTab = false
                        }
                    }
                Spacer()
            }
//            .padding(.vertical, 5)
            
            ZStack {
                Divider()
                HStack {
                    if showFirstTab {
                        RoundedRectangle(cornerRadius: 1)
                            .matchedGeometryEffect(id: "underline", in: underline)
                            .frame(width: UIScreen.main.bounds.width / 2, height: 1)
                        Spacer()
                    } else {
                        Spacer()
                        RoundedRectangle(cornerRadius: 1)
                            .matchedGeometryEffect(id: "underline", in: underline)
                            .frame(width: UIScreen.main.bounds.width / 2, height: 1)
                    }
                }
            }

        }
    }
}

struct CustomTabViews_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabViews(tab1Name: "Tab1 Name", tab2Name: "Tab2 Name", showFirstTab: .constant(true))
    }
}
