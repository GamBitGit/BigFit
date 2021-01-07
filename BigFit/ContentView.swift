//
//  ContentView.swift
//  BigFit
//
//  Created by Владислав on 04.01.2021.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    
    var weeksCount = ["4 недели", "8 недель", "12 недель", "16 недель"]
    @State private var weeksSelected = 0
    
    var workoutsPerWeek = ["2 тренировки", "3 тренировки", "4 тренировки"]
    @State private var workoutsPerWeekSelected = 0
    
    var workoutStyle = ["легкая", "средняя", "тяжелая"]
    @State private var workout1StyleSelected = 0
    @State private var workout2StyleSelected = 0
    @State private var workout3StyleSelected = 0
    @State private var workout4StyleSelected = 0
    
    var trainingMode = ["Силовой 2-6", "Средний 6-10", "Многоповтор 8-15"]
    @State private var trainingModeSelected = 0
    
    @State private var progression = 0.5
    
    @State private var tonnageMin = "7000"
    @State private var tonnageMax = "10000"
    @State private var kpshMin = "80"
    @State private var kpshMax = "100"
    @State private var intensityMin = "65"
    @State private var intensityMax = "80"
    
    @State private var pm = "100"
    
    var body: some View {
        VStack{
            List {
                HStack {
                    Picker(selection: $weeksSelected, label: Text("Количество недель")) {
                        ForEach(0 ..< weeksCount.count) {
                            Text(self.weeksCount[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                HStack {
                    Picker(selection: $workoutsPerWeekSelected, label: Text("Количество жимов в неделю")) {
                        ForEach(0 ..< workoutsPerWeek.count) {
                            Text(self.workoutsPerWeek[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Group {
                    HStack {
                        Text("Первая")
                        Spacer()
                        Picker(selection: $workout1StyleSelected, label: Text("Первая")) {
                            ForEach(0 ..< workoutStyle.count) {
                                Text(self.workoutStyle[$0])
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .fixedSize()
                    }
                    HStack {
                        Text("Вторая")
                        Spacer()
                        Picker(selection: $workout2StyleSelected, label: Text("Вторая")) {
                            ForEach(0 ..< workoutStyle.count) {
                                Text(self.workoutStyle[$0])
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .fixedSize()
                    }
                    HStack {
                        Text("Третья")
                        Spacer()
                        Picker(selection: $workout3StyleSelected, label: Text("Третья")) {
                            ForEach(0 ..< workoutStyle.count) {
                                Text(self.workoutStyle[$0])
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .fixedSize()
                        .disabled(workoutsPerWeekSelected<1)
                    }
                    HStack {
                        Text("Четвертая")
                        Spacer()
                        Picker(selection: $workout4StyleSelected, label: Text("Четвертая")) {
                            ForEach(0 ..< workoutStyle.count) {
                                Text(self.workoutStyle[$0])
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .fixedSize()
                        .disabled(workoutsPerWeekSelected<2)
                    }
                }
                HStack {
                    Text("Режим")
                    Spacer()
                    Picker(selection: $trainingModeSelected, label: Text(self.trainingMode[trainingModeSelected])) {
                        ForEach(0 ..< trainingMode.count) {
                            Text(self.trainingMode[$0])
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .fixedSize()
                }
                HStack {
                    Text("Прогрессия")
                    Spacer()
                    Stepper(value: $progression, in: 0...1, step: 0.1) {
                        Text("\(progression, specifier: "%.1f")      ")
                    }.fixedSize()
                }
                HStack {
                    Text("Тоннаж")
                    Spacer()
                    TextField("Min", text: $tonnageMin)
                        .frame(width: 80)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("-")
                    TextField("Max", text: $tonnageMax)
                        .frame(width: 80)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("КПШ")
                    Spacer()
                    TextField("Min", text: $kpshMin)
                        .frame(width: 80)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("-")
                    TextField("Max", text: $kpshMax)
                        .frame(width: 80)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("Интенсивность")
                    Spacer()
                    TextField("Min", text: $intensityMin)
                        .frame(width: 80)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("-")
                    TextField("Max", text: $intensityMax)
                        .frame(width: 80)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("Разовый максимум")
                    Spacer()
                    TextField("ПМ", text: $pm)
                        .frame(width: 80)
                        .multilineTextAlignment(.center)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            HStack {
                Spacer()
                Button("Рассчитать") {
                    
                }
                .buttonStyle(BorderlessButtonStyle())
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
