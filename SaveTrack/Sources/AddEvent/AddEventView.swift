//
//  AddEventView.swift
//  SaveTrack
//
//  Created by SUN on 9/13/24.
//

import SwiftUI

struct AddEventView: View {
    @StateObject var viewModel: AddEventViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 0.0) {
            TopBar(title: "이벤트 추가하기")
            ScrollView {
                textFieldsView
                daySelectView
                categorySelectView
            }
            bottomBar
        }
        .frame(maxWidth: .infinity)
        .gradientBackground()
        .onChange(of: viewModel.state.dismiss, perform: { value in
            if value {
                dismiss()
            }
        })
    }
}

extension AddEventView {
    private var textFieldsView: some View {
        VStack(spacing: 0.0, content: {
            VStack(spacing: 16.0) {
                TextField(text: .constant("")) {
                    Text("절약 이벤트 제목을 입력해주세요.")
                }
                .frame(height: 40.0)
                .background(.white)
                .cornerRadius(4.0)
                
                TextField(text: .constant("")) {
                    Text("절약 목적을 입력해주세요.")
                }
                .frame(height: 40.0)
                .background(.white)
                .cornerRadius(4.0)
                
                TextField(text: .constant("")) {
                    Text("오전에 받을 메시지를 입력해주세요.")
                }
                .frame(height: 40.0)
                .background(.white)
                .cornerRadius(4.0)
                
                TextField(text: .constant("")) {
                    Text("오후에 받을 메시지를 입력해주세요.")
                }
                .frame(height: 40.0)
                .background(.white)
                .cornerRadius(4.0)
                
                TextField(text: .constant("")) {
                    Text("저녁에 받을 메시지를 입력해주세요.")
                }
                .frame(height: 40.0)
                .background(.white)
                .cornerRadius(4.0)
            }
        })
        .padding(.horizontal, 16.0)
        .padding(.top, 20.0)
      
    }
    
    private var daySelectView: some View {
        VStack(spacing: 0.0) {
            Text("요일 선택")
                .font(.SaveTrack.title)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16.0)
            HStack(alignment: .top, spacing: 3.0) {
                ForEach(Week.allCases) { day in
                    VStack(spacing: 5.0) {
                        Text(day.title)
                            .font(.SaveTrack.content)
                            .foregroundStyle(.purple)
                            .frame(width: 40.0, height: 40.0)
                            .background(.white)
                            .cornerRadius(20.0)
                            .onTapGesture {
                                viewModel.trigger(.selectDay(day))
                            }
                        if viewModel.state.selectedDay.contains(day) {
                            Circle()
                                .frame(width: 10.0)
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16.0)
        }
        
    }
    
    private var categorySelectView: some View {
        VStack(spacing: 0.0) {
            Text("카테고리 선택")
                .font(.SaveTrack.title)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16.0)
            HStack(alignment: .top, spacing: 8.0) {
                ForEach(CategoryCase.allCases) { category in
                    VStack(spacing: 5.0) {
                        Text(category.title)
                            .font(.SaveTrack.content)
                            .foregroundStyle(.purple)
                            .frame(height: 40.0)
                            .padding(.horizontal, 12.0)
                            .background(.white)
                            .cornerRadius(20.0)
                            .onTapGesture {
                                viewModel.trigger(.selectCategory(category))
                            }
                        if viewModel.state.selectedCategory?.id == category.id {
                            Circle()
                                .frame(width: 10.0)
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16.0)
        }
    }
    
    private var bottomBar: some View {
        Button(action: {
            
        }, label: {
            Text("추가하기")
                .foregroundStyle(.purple)
                .font(.SaveTrack.title)
                .frame(maxWidth: .infinity)
                .frame(height: 56.0)
                .background(.white)
                .cornerRadius(16.0)
                .padding(16.0)
        })
    }
}

#Preview {
    AddEventView(viewModel: .init(state: .init()))
}
