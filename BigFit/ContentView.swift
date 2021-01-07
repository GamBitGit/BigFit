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
    
    @State private var workout1ModeSelected: WorkoutMode = .easy
    @State private var workout2ModeSelected: WorkoutMode = .easy
    @State private var workout3ModeSelected: WorkoutMode = .easy
    @State private var workout4ModeSelected: WorkoutMode = .easy
    
    @State private var cycleModeSelected: CycleMode = .low
    
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
                        Picker(selection: $workout1ModeSelected, label: Text(workout1ModeSelected.rawValue)) {
                            ForEach(WorkoutMode.allCases, id:\.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .fixedSize()
                    }
                    HStack {
                        Text("Вторая")
                        Spacer()
                        Picker(selection: $workout2ModeSelected, label: Text(workout2ModeSelected.rawValue)) {
                            ForEach(WorkoutMode.allCases, id:\.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .fixedSize()
                    }
                    HStack {
                        Text("Третья")
                        Spacer()
                        Picker(selection: $workout3ModeSelected, label: Text(workout3ModeSelected.rawValue)) {
                            ForEach(WorkoutMode.allCases, id:\.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .fixedSize()
                        .disabled(workoutsPerWeekSelected<1)
                    }
                    HStack {
                        Text("Четвертая")
                        Spacer()
                        Picker(selection: $workout4ModeSelected, label: Text(workout4ModeSelected.rawValue)) {
                            ForEach(WorkoutMode.allCases, id:\.self) {
                                Text($0.rawValue)
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
                    Picker(selection: $cycleModeSelected, label: Text(cycleModeSelected.rawValue)) {
                        ForEach(CycleMode.allCases, id:\.self) {
                            Text($0.rawValue)
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
