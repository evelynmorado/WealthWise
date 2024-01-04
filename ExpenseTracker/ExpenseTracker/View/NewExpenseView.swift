//
//  NewExpenseView.swift
//  ExpenseTracker
//
//  Created by Evelyn Morado on 1/3/24.
//

import SwiftUI

struct NewExpenseView: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @Environment(\.self) var env
    var body: some View {
        VStack {
            VStack (spacing: 15) {
                Text("Add Expenses")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.green)
                    .opacity(0.7)
                if let symbol = expenseViewModel.numberToPrice(value: 0).first {
                    TextField("0", text: $expenseViewModel.amount)
                        .font(.system(size: 35))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .background {
                            Text(expenseViewModel.amount == "" ? "0" : expenseViewModel.amount)
                                .font(.system(size: 35))
                                .opacity(0)
                                .overlay(alignment: .leading) {
                                    Text(String(symbol))
                                        .opacity(0.5)
                                        .offset(x: -15, y: 0)
                                }
                        }
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background {
                            Capsule()
                                .fill(.green)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top)
                }
                Label {
                    TextField("Name", text: $expenseViewModel.name)
                        .padding(.leading, 10)
                        .foregroundColor(.white)
                } icon: {
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                        .font(.title2)
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 20)
                .background {
                    Capsule()
                        .fill(.green)
                        
                }
                .padding(.top, 25)
                
                Label {
                    DatePicker.init("", selection: $expenseViewModel.date,in: Date.distantPast...Date(), displayedComponents: [.date])
                        .datePickerStyle(.compact)
                        .labelsHidden()
                } icon: {
                    Image(systemName: "calendar")
                        .font(.title2)
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 20)
                .background {
                    Capsule()
                        .fill(.green)
                        
                }
                .padding(.top, 25)
            }
            .frame(maxHeight: .infinity, alignment: .center)
            
            Button(action: {expenseViewModel.save(env: env)}) {
                Text("Save")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(.linearGradient(colors: [Color("Blue"), Color("Green"), Color("Purple"), Color("Pink"), Color("Orange")], startPoint: .topLeading, endPoint: .bottomTrailing))
                    }
                    .padding(.bottom, 10)
            }
            .disabled(expenseViewModel.name == "" || expenseViewModel.amount == "")
            .opacity(expenseViewModel.name == "" || expenseViewModel.amount == "" ? 0.6 : 1)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .topTrailing) {
            Button {
                env.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.green)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                
            }
            .padding()
        }
    }
}

#Preview {
    NewExpenseView()
        .environmentObject(ExpenseViewModel())
}
