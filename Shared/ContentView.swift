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
    @Environment(\.rootPresentationMode) private var rootPresentationMode
    
    var body: some View {
        NavigationKitView(isActive: $isPushedViewActive) {
            VStack(spacing: 12) {
                NavigationKitLink(isActive: $isPushedViewActive) {
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
//            .customNavigationBar(titleView:
//                                    Text("Root").bold(),
//                                 backgroundView:
//                                    Color(.systemOrange).ignoresSafeArea())
//            .inlineNavigationBar(titleView:
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
            .largeNavigationBar(titleView:
                                    Text("Root").bold(),
                                leadingView:
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
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
    @State private var isPushedViewActive: Bool = false
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.rootPresentationMode) private var rootPresentationMode

    var body: some View {
        VStack(spacing: 12) {
            NavigationKitLink(isActive: $isPushedViewActive) {
                ContentView3()
            } label: {
                DemoButtonLabel(text: "Push", imageSystemName: "chevron.forward", isImageLeading: false)
            }

            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                DemoButtonLabel(text: "Pop", imageSystemName: "chevron.backward", isImageLeading: true)
            }

            Button {
                rootPresentationMode.wrappedValue.dismiss()
            } label: {
                DemoButtonLabel(text: "Pop to Root", imageSystemName: "chevron.backward.2", isImageLeading: true)
            }
            
            Spacer()
        }
        .padding()
        .navigationBarHidden(true)
        .inlineNavigationBar(titleView:
                                Text("Two").bold(),
                             leadingView:
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
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
            NavigationKitLink(isActive: $isPushedViewActive) {
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
                presentationMode.wrappedValue.dismiss()
            } label: {
                DemoButtonLabel(text: "Pop", imageSystemName: "chevron.backward", isImageLeading: true)
            }
            
            Button {
                rootPresentationMode.wrappedValue.dismiss()
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
            NavigationKitLink(isActive: $isPushedViewActive) {
                ContentView5()
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
                presentationMode.wrappedValue.dismiss()
            } label: {
                DemoButtonLabel(text: "Pop", imageSystemName: "chevron.backward", isImageLeading: true)
            }
            
            Button {
                rootPresentationMode.wrappedValue.dismiss()
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
                presentationMode.wrappedValue.dismiss()
            } label: {
                DemoButtonLabel(text: "Pop", imageSystemName: "chevron.backward", isImageLeading: true)
            }
            
            Button {
                rootPresentationMode.wrappedValue.dismiss()
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




//public struct NavigationKitSheetView<Content: View>: View {
//    @Binding private var isActive : Bool
//    private let content: () -> Content
//
//    public init(isActive: Binding<Bool>, content: @escaping () -> Content) {
//        self._isActive = isActive
//        self.content = content
//    }
//
//    public var body: some View {
//        content()
//            .environment(\.rootPresentationMode, $isActive)
//    }
//}

//public struct NavigationKitSheet<Destination: View, Label: View>: View {
//    @Binding private var isActive: Bool
//    private let destination: () -> Destination
//    private let onDismiss: (() -> Void)?
//    private let label: () -> Label
//    
//    public init(isActive: Binding<Bool>, destination: @escaping () -> Destination, onDismiss: (() -> Void)? = nil, label: @escaping () -> Label) {
//        self._isActive = isActive
//        self.destination = destination
//        self.onDismiss = onDismiss
//        self.label = label
//    }
//    
//    public var body: some View {
//        Button {
//            isActive.present()
//        } label: {
//            label()
//        }
//        .sheet(isPresented: $isActive, onDismiss: onDismiss) {
//            destination()
//        }
//
//    }
//}

//public struct NavigationKitFullScreenCover<Destination: View, Label: View>: View {
//    @Binding private var isActive: Bool
//    private let destination: () -> Destination
//    private let onDismiss: (() -> Void)?
//    private let label: () -> Label
//    
//    public init(isActive: Binding<Bool>, destination: @escaping () -> Destination, onDismiss: (() -> Void)? = nil, label: @escaping () -> Label) {
//        self._isActive = isActive
//        self.destination = destination
//        self.onDismiss = onDismiss
//        self.label = label
//    }
//    
//    public var body: some View {
//        Button {
//            isActive.present()
//        } label: {
//            label()
//        }
//        .fullScreenCover(isPresented: $isActive, onDismiss: onDismiss) {
//            destination()
//        }
//
//    }
//}

// https://stackoverflow.com/a/65646180/4514671
