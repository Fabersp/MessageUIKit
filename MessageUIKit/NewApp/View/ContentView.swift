//
//  ContentView.swift
//  MessageUIKit
//
//  Created by Fabricio Padua on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var activeMessageType: MessageType? = nil
    @Environment(\.colorScheme) private var colorScheme
    @EnvironmentObject var appTheme: AppThemeManager

    var body: some View {
        VStack(spacing: 10) {
            Text("Message Examples")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
            
            // Camera Permission Button
            Button(action: {
                activeMessageType = .errorServer
            }) {
                Text("Error - sometheng worng")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            // No Internet Button
            Button(action: {
                activeMessageType = .noInternet
            }) {
                Text("No Internet Connection")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            // Camera Permission Button
            Button(action: {
                activeMessageType = .cameraPermission
            }) {
                Text("Camera Permission")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            // Microphone Permission Button
            Button(action: {
                activeMessageType = .microphonePermission
            }) {
                Text("Microphone Permission")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            // Notification Permission Button
            Button(action: {
                activeMessageType = .notificationPermission
            }) {
                Text("Notification Permission")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            // Ask Question Button
            Button(action: {
                activeMessageType = .askQuestion
            }) {
                Text("Ask Question")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            // completetion Button
            Button(action: {
                activeMessageType = .completetion
            }) {
                Text("completetion")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            // completetion Button
            Button(action: {
                activeMessageType = .qrCode
            }) {
                Text("QR-code")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.cyan)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            // Custom Message Button
            Button(action: {
                activeMessageType = .custom(image: "customImage", title: "Custom Title", description: "This is a custom description.")
            }) {
                Text("Custom Message")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .sheet(item: $activeMessageType) { messageType in
            MessageView(
                type: messageType,
                theme: appTheme, // Pass AppThemeManager
                primaryButton: MessageButton(
                    title: "Allow",
                    style: appTheme.primaryButtonStyle,
                    action: { print("Primary action") }
                ),
                secondaryButton: MessageButton(
                    title: "Later",
                    style: appTheme.secondaryButtonStyle,
                    action: { print("Secondary action") }
                ),
                cancelButton: MessageButton(
                    title: "Cancel",
                    style: appTheme.cancelButtonStyle,
                    action: { print("Cancel action") }
                )
            )
        }
    }
}

#Preview {
    ContentView()
        .environment(\.colorScheme, .dark)
}

extension MessageType: Identifiable {
    public var id: String {
        switch self {
        case .errorServer: return "errorServer"
        case .noInternet: return "noInternet"
        case .cameraPermission: return "cameraPermission"
        case .notificationPermission: return "notificationPermission"
        case .microphonePermission: return "microphonePermission"
        case .askQuestion: return "askQuestion"
        case .completetion: return "completetion"
        case .qrCode: return "qrCode"
        case .custom(let image, _, _): return image
        }
    }
}

