//
//  MenuView.swift
//  ExpenseTracker
//
//  Created by Evelyn Morado on 1/3/24.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @Environment(\.self) var env
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                HStack(spacing: 15) {
                    Button {
                        env.dismiss
                    } label: {
                        Image(systemName: "arrow.backward.circle.fill")
                            .frame(width: 10, height: 10)
                            .foregroundColor(.green)
                            .padding()
                            .background(Color.white)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .shadow(color: .black, radius: 3)
                    }
                        Text("Transactions")
                            .font(.system(size: 25))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.green)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .frame(width: 10, height: 10)
                            .foregroundColor(.green)
                            .padding()
                            .background(Color.white)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .shadow(color: .black, radius: 3)
                    }
                    
                }
                ExpenseCardView()
                    .environmentObject(expenseViewModel)
            }
            .padding()
        }
        .navigationBarHidden(true)
        .background {
            Color("White")
                .ignoresSafeArea()
        }
    }
}

#Preview {
    MenuView()
        .environmentObject(ExpenseViewModel())
}
