//
//  TransactionCardView.swift
//  ExpenseTracker
//
//  Created by Evelyn Morado on 1/3/24.
//

import SwiftUI

struct TransactionCardView: View {
    var expense: Expenses
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    var body: some View {
        HStack(spacing: 20){
            if let first = expense.name.first{
                Text(String(first))
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background{
                        Circle()
                            .fill(Color(expense.color))
                    }
            }
            Text(expense.name)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(alignment: .trailing, spacing: 5) {
                let price = expenseViewModel.numberToPrice(value: expense.amount)
                Text(price)
                    .font(.title3)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                Text(expense.date.formatted(date: .numeric, time: .omitted))
                    .font(.callout)
                    .opacity(0.7)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.linearGradient(colors: [Color("Blue"), Color("Green"), Color("Purple"), Color("Pink"), Color("Orange")], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
    }
}

#Preview {
    ContentView()
}
