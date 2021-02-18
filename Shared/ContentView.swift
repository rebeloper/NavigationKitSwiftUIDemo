//
//  ContentView.swift
//  Shared
//
//  Created by Alex Nagy on 13.02.2021.
//

import SwiftUI
import NavigationKit

struct ContentView: View {
    @State private var isPushedViewActive: Bool = false
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationKitView(isActive: $isPushedViewActive) {
            VStack(spacing: 12) {
                PushView(isActive: $isPushedViewActive) {
                    ContentView2()
                } label: {
                    DemoButtonLabel(text: "Push", imageSystemName: "chevron.forward", isImageLeading: false)
                }
                .padding(.bottom, 24)
                
                Text("Dismiss works only when this view is presented in a sheet.")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.top, 12)

                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
//            .nkCustomNavigationBar(titleView:
//                                    Text("Root").bold(),
//                                 backgroundView:
//                                    Color(.systemOrange).ignoresSafeArea())
//            .nkInlineNavigationBar(titleView:
//                                    Text("Root").bold(),
//                                 leadingView:
//                                    EmptyView(),
//                                 trailingView:
//                                    Button(action: {
//
//                                    }, label: {
//                                        Text("Next")
//                                    }),
//                                 backgroundView:
//                                    NavigationBarDefaultBackgroundView())
            .nkLargeNavigationBar(titleView:
                                    Text("Root").bold(),
                                leadingView:
                                    Button(action: {
//                                        presentationMode.wrappedValue.dismiss()
                                        NavigationKitManager.dismiss(with: presentationMode)
                                    }, label: {
                                        Image(systemName: "arrow.down.doc.fill")
                                        Text("Dismiss")
                                    }),
                                trailingView:
                                    SystemImageButton(action: {
                                        isPushedViewActive.present()
                                    }, name: "chevron.forward", font: .system(size: 18, weight: .bold)),
                                backgroundView:
                                    NavigationBarDefaultBackgroundView())
        }
    }
}

// MARK: -

struct ContentView2: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.rootPresentationMode) private var rootPresentationMode

    var body: some View {
        VStack(spacing: 12) {
//            NKPush(isActive: $isPushedViewActive) {
//                ContentView3()
//            } label: {
//                DemoButtonLabel(text: "Push", imageSystemName: "chevron.forward", isImageLeading: false)
//            }

            PushView {
                ContentView3()
            } label: {
                DemoButtonLabel(text: "Push", imageSystemName: "chevron.forward", isImageLeading: false)
            }

            Button {
//                presentationMode.wrappedValue.dismiss()
                NavigationKitManager.dismiss(with: presentationMode)
            } label: {
                DemoButtonLabel(text: "Pop", imageSystemName: "chevron.backward", isImageLeading: true)
            }

            Button {
//                rootPresentationMode.wrappedValue.dismiss()
                NavigationKitManager.popToRoot(with: rootPresentationMode)
            } label: {
                DemoButtonLabel(text: "Pop to Root", imageSystemName: "chevron.backward.2", isImageLeading: true)
            }
            
            Spacer()
        }
        .padding()
        .navigationBarHidden(true)
        .nkInlineNavigationBar(titleView:
                                Text("Two").bold(),
                             leadingView:
                                Button(action: {
//                                    presentationMode.wrappedValue.dismiss()
                                    NavigationKitManager.dismiss(with: presentationMode)
                                }, label: {
                                    Image(systemName: "chevron.backward")
                                    Text("Go Back")
                                }),
                             trailingView:
                                ImageButton(action: {

                                }, name: "logo"),
                             backgroundView:
                                NavigationBarDefaultBackgroundView())
    }
}

// MARK: -

struct ContentView3: View {
    @State private var isPushedViewActive : Bool = false
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.rootPresentationMode) private var rootPresentationMode
    
    var body: some View {
        VStack(spacing: 12) {
            PushView(isActive: $isPushedViewActive) {
                ContentView4()
            } label: {
                EmptyView()
            }
            
            Button {
                // do some work before you push the view
                isPushedViewActive = true
            } label: {
                DemoButtonLabel(text: "Push", imageSystemName: "chevron.forward", isImageLeading: false)
            }
            
            Button {
//                presentationMode.wrappedValue.dismiss()
                NavigationKitManager.dismiss(with: presentationMode)
            } label: {
                DemoButtonLabel(text: "Pop", imageSystemName: "chevron.backward", isImageLeading: true)
            }
            
            Button {
//                rootPresentationMode.wrappedValue.dismiss()
                NavigationKitManager.popToRoot(with: rootPresentationMode)
            } label: {
                DemoButtonLabel(text: "Pop to Root", imageSystemName: "chevron.backward.2", isImageLeading: true)
            }
            
            Text("Optionally please wait for a 5 seconds long dummy network request that will Push the next view automatically")
                .foregroundColor(.gray)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.top, 12)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Three")
        .onAppear {
            // simulating network request
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                isPushedViewActive = true
            }
        }
    }
}

// MARK: -

struct ContentView4: View {
    @State private var isPushedViewActive : Bool = false
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.rootPresentationMode) private var rootPresentationMode
    
    var body: some View {
        VStack(spacing: 12) {
//            NKPush(isActive: $isPushedViewActive) {
//                ContentView5()
//            } label: {
//                EmptyView()
//            }
            PushViewLink(isActive: $isPushedViewActive) {
                ContentView5()
            }
            
            Button {
                // do some work before you push the view
                isPushedViewActive = true
            } label: {
                DemoButtonLabel(text: "Push", imageSystemName: "chevron.forward", isImageLeading: false)
            }
            
            Button {
//                presentationMode.wrappedValue.dismiss()
                NavigationKitManager.dismiss(with: presentationMode)
            } label: {
                DemoButtonLabel(text: "Pop", imageSystemName: "chevron.backward", isImageLeading: true)
            }
            
            Button {
//                rootPresentationMode.wrappedValue.dismiss()
                NavigationKitManager.popToRoot(with: rootPresentationMode)
            } label: {
                DemoButtonLabel(text: "Pop to Root", imageSystemName: "chevron.backward.2", isImageLeading: true)
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Four")
    }
}


// MARK: -

struct ContentView5: View {
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.rootPresentationMode) private var rootPresentationMode
    
    var body: some View {
        VStack(spacing: 12) {
            
            Button {
//                presentationMode.wrappedValue.dismiss()
                NavigationKitManager.dismiss(with: presentationMode)
            } label: {
                DemoButtonLabel(text: "Pop", imageSystemName: "chevron.backward", isImageLeading: true)
            }
            
            Button {
//                rootPresentationMode.wrappedValue.dismiss()
                NavigationKitManager.popToRoot(with: rootPresentationMode)
            } label: {
                DemoButtonLabel(text: "Pop to Root", imageSystemName: "chevron.backward.2", isImageLeading: true)
            }
            
            Spacer()
        }
        .padding()
        .navigationBarHidden(true)
    }
}

// MARK: -

struct DemoButtonLabel: View {
    
    var text: String
    var imageSystemName: String
    var isImageLeading: Bool
    
    var body: some View {
        HStack {
            if isImageLeading {
                Image(systemName: imageSystemName)
                Text(text)
            } else {
                Text(text)
                Image(systemName: imageSystemName)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 9)
        .foregroundColor(.white)
        .background(Color.accentColor)
        .cornerRadius(8)
    }
}
