//
//  ProfileView.swift
//  MercariClone
//
//  Created by Tomas Sanni on 1/25/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var vm: AppStateManager
    @State private var showFullCover = false
    
    
    var body: some View {
        
        ScrollView {
            userInfo
            
            followBalanceAndCoupon
            
            verificationCheck
            
            promoProfileNavigations
            
            profileNavigations
            
            sellerBadgesSection
        }
        .toolbar {
            
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {

                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.black)
                }

                Button {

                } label: {
                    Image(systemName: "questionmark.bubble")
                        .foregroundColor(.black)

                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
                .environmentObject(AppStateManager())
        }
    }
}



extension ProfileView {
    private var userInfo: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color.mercariGray)
                    .frame(width: 80, height: 80)
                
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 55)
                    .foregroundColor(.gray)
                
                
                
                
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("Tomas1096")
                    .font(.headline)
                Text("User ID: 1234567")
                    .font(.subheadline)
                NavigationLink {
                    
                } label: {
                    Text("View public profile")
                        .font(.headline)
                        .foregroundColor(.mercariPurple)
                }

            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
    
    private var followBalanceAndCoupon: some View {
        HStack {
            VStack {
                Text("0")
                Text("Following")
            }
            Spacer()
            VStack {
                Text("0")
                Text("Followers")
            }
            Spacer()
            VStack {
                Text("$0")
                Text("Balance")
            }
            Spacer()
            VStack {
                Text("0")
                Text("Coupons")
            }
        }
        .frame(maxWidth: .infinity)
        .padding()

    }
    
    private var verificationCheck: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.white)
                .shadow(radius: 7)
                .frame(maxWidth: .infinity)
                .frame(height: 170)
            
            VStack {
                HStack {
                    Text("Verification")
                    Image(systemName: "questionmark.circle")
                    Spacer()
                    Image(systemName: "xmark")
                }
                .font(.title3)
                .padding()
                
                HStack(spacing: 2) {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(.mercariPurple)
                        .frame(height: 20)
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(.mercariPurple)
                        .frame(height: 20)
                    ZStack(alignment: .trailing) {
                        RoundedRectangle(cornerRadius: 0)
                            .foregroundColor(.mercariPurple)
                            .frame(height: 20)
                        
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                                .frame(width: 40, height: 40)
                            
                            Image(systemName: "checkmark.shield.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(.white, Color.mercariPurple)
                        }
                        .offset(x: 10)
                    }
                }
                .padding([.horizontal])
                
                Text("So others know it's really you.")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            
        }
        .padding()

    }
    
    private var promoProfileNavigations: some View {
        HStack {
            Text("")
            Image(systemName: "gift")
            Text("Get $50. Give $30.")
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .font(.title3)
        .foregroundColor(.mercariPurple)
        .fontWeight(.bold)
        .padding(.vertical, 15)
        .padding(.trailing)
        .background(Color.mercariPurple.opacity(0.15))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var profileNavigations: some View {
        Group {
            ProfileNavigations(image: "tag", name: "My listings", rotation: 270)
            ProfileNavigations(image: "bag", name: "My purchases", rotation: 0)
            ProfileNavigations(image: "gear", name: "Settings", rotation: 0)
            ProfileNavigations(image: "questionmark.circle", name: "Help Center", rotation: 0)
            
        }
    }
    
    private var sellerBadgesSection: some View {
        VStack {
            HStack {
                Text("Seller Badges")
                    .fontWeight(.bold)
                Image(systemName: "questionmark.circle")
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            
            HStack(spacing: 15) {
                SellerBadgeItems(image: "message.and.waveform", nameFirst: "First", nameSecond: "responder")
                SellerBadgeItems(image: "box.truck", nameFirst: "Quick", nameSecond: "shipper")
                SellerBadgeItems(image: "checkmark.shield", nameFirst: "Reliable", nameSecond: " ")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()

    }
}

struct ProfileNavigations: View {
    let image: String
    let name: String
    let rotation: Double
    
    var body: some View {
        VStack {
            HStack {
                
                Image(systemName: image)
                    .rotationEffect(Angle.degrees(rotation))
                
                Text(name)
            }
            .font(.title3)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
            
            Divider()

        }
        
    }
}

struct SellerBadgeItems: View {
    let image: String
    let nameFirst: String
    let nameSecond: String
    var body: some View {

        VStack {
            ZStack {
                
                Circle()
                    .stroke(lineWidth: 1)
                    .fill(Color.gray)
                    .frame(width: 50, height: 50)
                
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            
            Text(nameFirst)
            Text(nameSecond)
        }
        .foregroundColor(.black.opacity(0.4))
    }
}
