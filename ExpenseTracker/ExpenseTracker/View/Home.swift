//
//  Home.swift
//  ExpenseTracker
//
//  Created by Evelyn Morado on 1/3/24.
//

import SwiftUI

struct Home: View {
    @StateObject var expenseViewModel: ExpenseViewModel = .init()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                HStack(spacing: 15) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Welcome to WiseWealth, Evelyn")
                            .font(.system(size: 15))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.green)
                    }
                    Spacer()
                    AddButton()
                }
                ExpenseCardView()
                    .environmentObject(expenseViewModel)
                TransactionsList()
            }
            .padding()
        }
        .background {
            Color("White")
                .ignoresSafeArea()
        }
        .fullScreenCover(isPresented: $expenseViewModel.newExpense) {
            expenseViewModel.clear()
        } content: {
            NewExpenseView()
                .environmentObject(expenseViewModel)
        }
    }
    @ViewBuilder
    func AddButton()-> some View {
        Button {
            expenseViewModel.newExpense.toggle()
        } label: {
            Image(systemName: "plus")
                .frame(width: 10, height: 10)
                .foregroundColor(.green)
                .padding()
                .background(Color.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .shadow(color: .black, radius: 3)
        }
    }
    
    @ViewBuilder
    func TransactionsList()-> some View {
        VStack() {
            Text("Transactions")
                .foregroundColor(.green)
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            
            ForEach(expenseViewModel.expenseslist){expense in
                TransactionCardView(expense: expense)
                    .environmentObject(expenseViewModel)
            }
        }
        .padding(.top)
    }
    

}

#Preview {
    ContentView()
}
