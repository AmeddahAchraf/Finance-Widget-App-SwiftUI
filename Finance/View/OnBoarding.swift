//
//  OnBoarding.swift
//  Finance
//
//  Created by BqNqNNN on 7/25/20.
//

import SwiftUI

struct OnBoarding: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Image("onBoarding")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 30)
                
                Text("We Keep Track")
                    .fontWeight(.bold)
                    .font(.title)
                    .font(.system(size: 38))
                    .bold()
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 20)
                Text("Carrying out all financial in one simple place \n with the most secure way.")
                    .multilineTextAlignment(.center)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                
                NavigationLink(
                    destination: Main().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                    label: {
                        Text("Start")
                            .font(.headline)
                            .frame(width: 250, height: 40, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                            .cornerRadius(10)
                            .padding(.top, 50)
                    })
                
            }.edgesIgnoringSafeArea(.all)
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: Main().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                                        label: {
                                            Image(systemName: "arrow.right")
                                                .font(Font.system(.title3))
                                                .foregroundColor(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
                                        })
            )
        }.navigationBarHidden(true)
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
