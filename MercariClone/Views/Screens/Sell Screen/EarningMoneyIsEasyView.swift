//
//  EarningMoneyIsEasyView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 4/26/23.
//

import SwiftUI

struct EarningMoneyIsEasyView: View {
    var body: some View {
        VStack {
            Text("Earning money is easy")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack {
                ZStack {
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .frame(height: 1)
                    
                    HStack {
                        Circle()
                            .fill(Color.mercariPurple)
                            .overlay {
                                Text("1")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                            }
                            .frame(width: 40, height: 40)
                        Spacer()
                        ZStack {
                            Circle()
                                .fill(Color.mercariPurple.opacity(0.3))
                                .frame(width: 60, height: 60)
                            
                            Circle()
                                .fill(Color.mercariPurple.opacity(0.4))
                                .frame(width: 50, height: 50)
                            
                            Circle()
                                .strokeBorder(Color.mercariPurple,lineWidth: 3)
                                .background(Circle().foregroundColor(Color.white).overlay {
                                    Text("2")
                                        .foregroundColor(.mercariPurple)
                                        .fontWeight(.semibold)
                                })
                                .frame(width: 40, height: 40)
                        }
                        Spacer()
                        Circle()
                            .fill(Color.mercariGray)
                            .overlay {
                                Text("3")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                            }
                            .frame(width: 40, height: 40)
                        Spacer()
                        Circle()
                            .fill(Color.mercariGray)
                            .overlay {
                                Text("4")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                            }
                            .frame(width: 40, height: 40)
                        Spacer()
                        Circle()
                            .fill(Color.mercariGray)
                            .overlay {
                                Text("5")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                            }
                            .frame(width: 40, height: 40)
                    }
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 0) {
                    Triangle()
                        .fill(Color.mercariGray)
                        .frame(width: 25, height: 25) //25, 110, 195, 275, 350
                        .offset(x: 25)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.mercariGray)
                        .frame(height: 90)
                        .overlay(alignment: .leading) {
                            VStack(alignment: .leading) {
                                Text("Sign up for Mercari.")
                                    .foregroundColor(.black)
                                    .font(.headline)
                                
                                Text("Get started")
                                    .underline()
                            }
                            .padding(.horizontal)
                        }
                }
                
            }

        }
        .frame(maxWidth: .infinity)
        .padding()

    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct EarningMoneyIsEasyView_Previews: PreviewProvider {
    static var previews: some View {
        EarningMoneyIsEasyView()
        EarningMoneyIsEasyView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
