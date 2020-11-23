//
//  ContentView.swift
//  ConvChallenge
//
//  Created by Alex Oliveira on 23/11/20.
//

import SwiftUI

struct ContentView: View {
	@State private var length = ""
	
	let units: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
	let unitsNames = ["meters", "kmeters", "feet", "yards", "miles"]
	@State private var inputUnit = UnitLength.meters
	@State private var outputUnit = UnitLength.meters
	
	var convertedLength: Double {
		let inputLength = Double(length.replacingOccurrences(of: ",", with: ".")) ?? 0
		let inputLengthMeasurement = Measurement(value: inputLength, unit: inputUnit)
		
		return inputLengthMeasurement.converted(to: outputUnit).value
	}
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Length", text: $length)
						.keyboardType(.decimalPad)
				}
				
				Section(header: Text("Input Unit")) {
					Picker("Input Unit", selection: $inputUnit) {
						ForEach(0 ..< units.count) {
							Text(self.unitsNames[$0]).tag(self.units[$0])
						}
					}
					.pickerStyle(SegmentedPickerStyle())
				}
				
				Section(header: Text("Output Unit")) {
					Picker("Input Unit", selection: $outputUnit) {
						ForEach(0 ..< units.count) {
							Text(self.unitsNames[$0]).tag(self.units[$0])
						}
					}
					.pickerStyle(SegmentedPickerStyle())
				}
				
				Section {
					Text("Converted length: \(convertedLength, specifier: "%.2f")")
				}
			}
			.navigationBarTitle("Unit Converter")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
