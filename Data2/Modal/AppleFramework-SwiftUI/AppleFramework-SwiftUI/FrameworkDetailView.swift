//
//  FrameworkDetailView.swift
//  AppleFramework-SwiftUI
//
//  Created by 우상현 on 10/10/23.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @StateObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Image(viewModel.framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(viewModel.framework.name)
                .font(.system(size: 24, weight: .bold))
            Text(viewModel.framework.description)
                .font(.system(size: 16, weight: .regular))
            
            Spacer()
            
            Button {
                viewModel.isSafariPressed = true
            } label: {
                Text("Learn More")
                    .font(.system(size: 20,weight: .bold,design: .default))
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 80)
            .background(.pink)
            .cornerRadius(40)
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
        .sheet(isPresented: $viewModel.isSafariPressed, content: {
            let url = URL(string: viewModel.framework.urlString)!
            SafariView(url: url)
        })
    }
}
struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = FrameworkDetailViewModel(framework: AppleFramework.list[0])
        FrameworkDetailView(viewModel: vm)
    }
}
