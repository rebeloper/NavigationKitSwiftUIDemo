//
//  PresentationContentView.swift
//  NavigationKitSwiftUIDemo (iOS)
//
//  Created by Alex Nagy on 16.02.2021.
//

import SwiftUI
import NavigationKit

//struct PresentationsModeKey: EnvironmentKey {
//    static let defaultValue: [Binding<Bool>] = []
//}
//
//extension EnvironmentValues {
//    var presentationsMode: [Binding<Bool>] {
//        get { return self[PresentationsModeKey] }
//        set { self[PresentationsModeKey] = newValue }
//    }
//}

//public struct NavigationKitSheet<Destination: View, Label: View>: View {
//    
//    @Environment(\.presentationsMode) private var presentationsMode
//    
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
//                .environment(\.presentationsMode, presentationsMode + [$isActive])
//        }
//
//    }
//}
//
//public struct NavigationKitFullScreenCover<Destination: View, Label: View>: View {
//    
//    @Environment(\.presentationsMode) private var presentationsMode
//    
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
//                .environment(\.presentationsMode, presentationsMode + [$isActive])
//        }
//
//    }
//}

struct PresentationContentView: View {
    
    @State private var showSheet = false
    @State private var showContentViewSheet = false
    
    var body: some View {
        VStack {
            NavigationKitSheet(isActive: $showSheet) {
                PresentationContentView2().disableSwipeToDismiss()
            } label: {
                DemoButtonLabel(text: "Present", imageSystemName: "arrow.up.doc.fill", isImageLeading: false)
            }
            
            NavigationKitSheet(isActive: $showContentViewSheet) {
                ContentView()
            } label: {
                DemoButtonLabel(text: "Present Stack Navigation", imageSystemName: "arrow.up.doc.fill", isImageLeading: false)
            }
            
        }
        .padding()
        .inlineNavigationBar(titleView:
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
            NavigationKitSheet(isActive: $showSheet) {
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
        .inlineNavigationBar(titleView:
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
            NavigationKitSheet(isActive: $showSheet) {
                PresentationContentView4()
            } label: {
                DemoButtonLabel(text: "Present", imageSystemName: "arrow.up.doc.fill", isImageLeading: false)
            }
            
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
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
        .inlineNavigationBar(titleView:
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
        .inlineNavigationBar(titleView:
                                Text("Four").bold(),
                             leadingView:
                                EmptyView(),
                             trailingView:
                                EmptyView(),
                             backgroundView:
                                NavigationBarDefaultBackgroundView())
    }
}


//struct NavigationKitManager {
//    static func dismissTwo(with presentationsMode: [Binding<Bool>]) {
//        presentationsMode.forEach {
//            $0.wrappedValue.dismiss()
//        }
//    }
//}
