//
//  ForYouShopLocalTabsView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/24/23.
//

import SwiftUI

struct ForYouShopLocalTabsView: View {
    @Binding var tagGeometryEffect: Int
    @Namespace private var animationNamespace

    
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("For you")
                    .foregroundColor(tagGeometryEffect == 1 ? nil : .secondary)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            tagGeometryEffect = 1
                        }
                    }
                ZStack {
                    Rectangle()
                        .fill(.clear)
                        .frame(maxWidth: .infinity)
                        .frame(height: 2)
                    if tagGeometryEffect == 1 {
                        Rectangle()
                            .matchedGeometryEffect(id: "forYou", in: animationNamespace)
                            .frame(width: UIScreen.main.bounds.width * 0.40, height: 2)
                    }
                }
                
            }
            Spacer()
            Spacer()
            VStack {
                Text("Shop Local")
                    .foregroundColor(tagGeometryEffect == 2 ? nil : .secondary)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            tagGeometryEffect = 2
                        }
                    }
                ZStack {
                    Rectangle()
                        .fill(.clear)
                        .frame(maxWidth: .infinity)
                        .frame(height: 2)
                    if tagGeometryEffect == 2 {
                        Rectangle()
                            .matchedGeometryEffect(id: "forYou", in: animationNamespace)
                            .frame(width: UIScreen.main.bounds.width * 0.40, height: 2)
                    }
                    
                }
            }
            Spacer()
        }
        .padding()

    }
}

struct ForYouShopLocalTabsView_Previews: PreviewProvider {
    static var previews: some View {
        ForYouShopLocalTabsView(tagGeometryEffect: .constant(1))
    }
}
