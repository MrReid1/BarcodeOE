//
//  ContentView.swift
//  BarcodeOE
//
//  Created by Anastasios Rigatos on 21/1/2024.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan QR"
    var scannerSheet: some View {
        CodeScannerView(
            
            codeTypes: [.qr,.upce,.aztec,.catBody,.gs1DataBar,.microQR,.upce,.codabar],scanMode: .once,
            completion: {result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
            }
        )
    }
    
    var body: some View {
        VStack(spacing:10){
           Text(scannedCode)
            
            Button("Scan QR Code"){
                self.isPresentingScanner = true
            }
            
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

