//
//  ContentView.swift
//  Time Converter
//
//  Created by Antonio Vega on 4/9/21.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 0
    @State private var output = 0
    @State private var value = ""
    
    let timeUnits = ["seconds", "minutes", "hours", "days"]
    
    private var result: Double {
        let inputUnit = timeUnits[input]
        let outputUnit = timeUnits[output]
        var inputValue = Double(value) ?? 0
        var outputValue = 0.0
        
        switch inputUnit {
        case "minutes":
            inputValue *= 60
        case "hours":
            inputValue *= 3600
        case "days":
            inputValue *= 86400
        default:
            inputValue *= 1
        }
        
        switch outputUnit {
        case "minutes":
            outputValue = inputValue / 60
        case "hours":
            outputValue = inputValue / 3600
        case "days":
            outputValue = inputValue / 86400
        default:
            outputValue = inputValue
        }
        
        return outputValue
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input")) {
                    Picker("Time Inputs", selection: $input) {
                        ForEach(0 ..< timeUnits.count) {
                            Text("\(self.timeUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output")) {
                    Picker("Time Outputs", selection: $output) {
                        ForEach(0 ..< timeUnits.count) {
                            Text("\(self.timeUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text(timeUnits[input])) {
                    TextField("Enter the number of \(timeUnits[input])", text: $value)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Result")) {
                    Text("\(result, specifier: "%.2f") \(timeUnits[output])")
                }
            }
            .navigationBarTitle("Time Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
