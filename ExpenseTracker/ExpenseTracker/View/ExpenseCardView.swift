//
//  ExpenseCardView.swift
//  ExpenseTracker
//
//  Created by Evelyn Morado on 1/3/24.
//

import SwiftUI

struct ExpenseCardView: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    var body: some View {
        GeometryReader{ proxy in
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.linearGradient(colors: [Color("Blue"), Color("Green"), Color("Purple"), Color("Pink"), Color("Orange")], startPoint: .topLeading, endPoint: .bottomTrailing))
            VStack(spacing: 15) {
                VStack(spacing: 15) {
                    Text(expenseViewModel.currentDateString())
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text(expenseViewModel.expensesToCurrency(expenseslist: expenseViewModel.expenseslist))
                        .font(.system(size: 45))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(height: 235)
        .padding(.top)
    }
}

