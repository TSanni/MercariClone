//
//  CustomTextView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/19/23.
//

import SwiftUI

struct CustomTextView: View {
    var textString: String

    var body: some View {
        let text = breakStringIntoArray(text: textString)
        
        HStack(spacing: 5) {
            ForEach(0..<text.count, id: \.self) { letter in
                
                Text("\(text[letter])")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.mercariPurple)
                    .offset(y: letter % 2 == 0 ? -4 : 0)
            }
            
            
        }
    }
    
    
    
    
    func breakStringIntoArray(text: String) -> [String] {
        
        let newText = text.map { letter in
            String(letter)
        }
        return newText
    }
}

struct CustomTextView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextView(textString: "Mercari")
    }
}
