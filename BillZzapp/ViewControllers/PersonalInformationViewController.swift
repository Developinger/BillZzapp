//
//  PersonalInformationViewController.swift
//  BillZzapp
//
//  Created by 7g on 5/17/23.
//

import UIKit
import MapKit


class PersonalInformationViewController: UIViewController, MKLocalSearchCompleterDelegate, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var countryPicker: UIPickerView!
    let completer = MKLocalSearchCompleter()
        var completerResults = [MKLocalSearchCompletion]()
        
        let countries = Locale.isoRegionCodes.compactMap { (code) -> String? in
            Locale.current.localizedString(forRegionCode: code)
        }.sorted()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            completer.delegate = self
            completer.resultTypes = .address
            addressTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            countryPicker.dataSource = self
            countryPicker.delegate = self
            tableView.delegate = self
            tableView.dataSource = self
            tableView.isHidden = true
        }
        
        @objc func textFieldDidChange(_ textField: UITextField) {
            completer.queryFragment = textField.text ?? ""
        }
        
        // MARK: - MKLocalSearchCompleterDelegate methods
        
        func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
            completerResults = completer.results
            tableView.reloadData()
            tableView.isHidden = false
        }
        
        // MARK: - TableView methods
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return completerResults.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = completerResults[indexPath.row].title
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            
            let result = completerResults[indexPath.row]
            let searchRequest = MKLocalSearch.Request(completion: result)
            let search = MKLocalSearch(request: searchRequest)
            search.start { (response, error) in
//                let placemark = response?.mapItems[0].placemark
//                let fullAddress = "\(placemark?.subThoroughfare ?? ""), \(placemark?.thoroughfare ?? ""), \(placemark?.locality ?? ""), \(placemark?.administrativeArea ?? ""), \(placemark?.postalCode ?? ""), \(placemark?.country ?? "")"
//                self.addressTextField.text = fullAddress
                let coordinate = response?.mapItems[0].placemark.coordinate
           
                //self.addressTextField.text = response?.mapItems[0].placemark.name
                self.zipTextField.text = response?.mapItems[0].placemark.postalCode
                self.stateTextField.text = response?.mapItems[0].placemark.administrativeArea
                self.cityTextField.text = response?.mapItems[0].placemark.locality
                let country = response?.mapItems[0].placemark.country
                if let index = self.countries.firstIndex(of: country ?? "") {
                    self.countryPicker.selectRow(index, inComponent: 0, animated: true)
                }
                self.tableView.isHidden = true
            }
        }
        
        // MARK: - UIPickerViewDelegate and DataSource methods
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return countries.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return countries[row]
        }
    }
