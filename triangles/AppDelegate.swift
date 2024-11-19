//
//  AppDelegate.swift
//  triangles
//
//  Created by Мирлан Каныбеков on 12.11.2024.
//

import UIKit

import SwiftUI

struct ContentView: View {
    @State private var sideA = ""
    @State private var sideB = ""
    @State private var sideC = ""
    @State private var triangleType = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Введите длины сторон треугольника")
                .font(.headline)
            
            TextField("Сторона A", text: $sideA)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            TextField("Сторона B", text: $sideB)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            TextField("Сторона C", text: $sideC)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            Button("Проверить") {
                checkTriangleType()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text(triangleType)
                .font(.title)
                .foregroundColor(.green)
                .padding(.top, 20)
        }
        .padding()
    }

    func checkTriangleType() {
        guard let a = Int(sideA), let b = Int(sideB), let c = Int(sideC) else {
            triangleType = "Пожалуйста, введите все три стороны"
            return
        }

        if a + b > c && a + c > b && b + c > a {
            if a == b && b == c {
                triangleType = "Равносторонний треугольник"
            } else if a == b || a == c || b == c {
                triangleType = "Равнобедренный треугольник"
            } else {
                triangleType = "Разносторонний треугольник"
            }
        } else {
            triangleType = "Треугольник с такими сторонами не существует"
        }
    }
}

@main
struct TriangleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

