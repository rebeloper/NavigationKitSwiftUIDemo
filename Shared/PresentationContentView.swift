//
//  PresentationContentView.swift
//  NavigationKitSwiftUIDemo (iOS)
//
//  Created by Alex Nagy on 16.02.2021.
//

import SwiftUI
import NavigationKit

struct PresentationContentView: View {
    
    @State private var showSheet = false
    @State private var showContentViewSheet = false
    
    var body: some View {
        VStack {
            SheetView(isActive: $showSheet) {
                PresentationContentView2().disableSwipeToDismiss()
            } label: {
                DemoButtonLabel(text: "Present", imageSystemName: "arrow.up.doc.fill", isImageLeading: false)
            }
            
            SheetView(isActive: $showContentViewSheet) {
                ContentView()
            } label: {
                DemoButtonLabel(text: "Present Stack Navigation", imageSystemName: "arrow.up.doc.fill", isImageLeading: false)
            }
            
        }
        .padding()
        .nkInlineNavigationBar(titleView:
                                Text("One").bold(),
                             leadingView:
                                EmptyView(),
                             trailingView:
                                EmptyView(),
                             backgroundView:
                                NavigationBarDefaultBackgroundView())
    }
}

struct PresentationContentView2: View {
    
    @State private var showSheet = false
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack {
            SheetView(isActive: $showSheet) {
                PresentationContentView3()
            } label: {
                DemoButtonLabel(text: "Present", imageSystemName: "arrow.up.doc.fill", isImageLeading: false)
            }
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                DemoButtonLabel(text: "Dismiss", imageSystemName: "arrow.down.doc.fill", isImageLeading: false)
            }
        }
        .padding()
        .nkInlineNavigationBar(titleView:
                                Text("Two").bold(),
                             leadingView:
                                EmptyView(),
                             trailingView:
                                EmptyView(),
                             backgroundView:
                                NavigationBarDefaultBackgroundView())
    }
}

struct PresentationContentView3: View {
    
    @State private var showSheet = false
    
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.presentationsMode) private var presentationsMode
    
    var body: some View {
        VStack {
            SheetView(isActive: $showSheet) {
                PresentationContentView4()
            } label: {
                DemoButtonLabel(text: "Present", imageSystemName: "arrow.up.doc.fill", isImageLeading: false)
            }
            
            HStack {
                Button {
//                    presentationMode.wrappedValue.dismiss()
                    NavigationKitManager.dismiss(with: presentationMode)
                } label: {
                    DemoButtonLabel(text: "Dismiss", imageSystemName: "arrow.down.doc.fill", isImageLeading: false)
                }
                
                Button {
                    NavigationKitManager.dismissTwo(with: presentationsMode)
                } label: {
                    DemoButtonLabel(text: "Dismiss Two", imageSystemName: "arrow.down.doc.fill", isImageLeading: false)
                }
            }
            
            Text("'NavigationKitSheet' and 'NavigationKitFullScreenCover' has the ability to only 'Dismiss Two Sheets'")
                .foregroundColor(.gray)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.top, 12)
        }
        .padding()
        .nkInlineNavigationBar(titleView:
                                Text("Three").bold(),
                             leadingView:
                                EmptyView(),
                             trailingView:
                                EmptyView(),
                             backgroundView:
                                NavigationBarDefaultBackgroundView())
    }
}

struct PresentationContentView4: View {
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.presentationsMode) private var presentationsMode
    
    var body: some View {
        VStack {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                DemoButtonLabel(text: "Dismiss", imageSystemName: "arrow.down.doc.fill", isImageLeading: false)
            }
            
            Text("'NavigationKitSheet' and 'NavigationKitFullScreenCover' has the ability to only 'Dismiss Two Sheets'")
                .foregroundColor(.gray)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.top, 12)
        }
        .padding()
        .nkInlineNavigationBar(titleView:
                                Text("Four").bold(),
                             leadingView:
                                EmptyView(),
                             trailingView:
                                EmptyView(),
                             backgroundView:
                                NavigationBarDefaultBackgroundView())
    }
}
