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

    var completer: MKLocalSearchCompleter = MKLocalSearchCompleter()
    var searchResults: [MKLocalSearchCompletion] = []
    var searchTimer: Timer?

    var countries: [String] = {
        let countryCodes = NSLocale.isoCountryCodes
        var names: [String] = []
        for countryCode in countryCodes {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: countryCode])
            let name = Locale(identifier: "en_US").localizedString(forRegionCode: id) ?? ""
            names.append(name)
        }
        names.sort() // Sort the countries alphabetically
        return names
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        completer.delegate = self
        completer.resultTypes = .address

        countryPicker.delegate = self
        countryPicker.dataSource = self

        addressTextField.delegate = self

        hideTableView()
    }

    @IBAction func textFieldChanged(_ sender: UITextField) {
        searchTimer?.invalidate()

            guard let query = sender.text else {
                hideTableView()
                return
            }

            if query.isEmpty {
                hideTableView()
            } else {
                showTableView()
            }

            searchTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                self.completer.queryFragment = query
            }
        }

    @objc func search() {
        completer.queryFragment = addressTextField.text ?? ""
    }

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        print("completerDidUpdateResults called")
        searchResults = completer.results
            if searchResults.isEmpty {
                hideTableView()
            } else {
                showTableView()
            }
            tableView.reloadData()
        }

    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        // handle error
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let searchResult = searchResults[indexPath.row]
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.subtitle

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchResult = searchResults[indexPath.row]
        let searchRequest = MKLocalSearch.Request(completion: searchResult)
        let search = MKLocalSearch(request: searchRequest)
        search.start { [weak self] (response, error) in
            guard let response = response else { return }

            let mapItem = response.mapItems[0]
            let placemark = mapItem.placemark

            var addressString = ""
            if let subThoroughfare = placemark.subThoroughfare {
                addressString += subThoroughfare + " "
            }
            if let thoroughfare = placemark.thoroughfare {
                addressString += thoroughfare
            }
            self?.addressTextField.text = addressString
            self?.zipTextField.text = placemark.postalCode
            self?.stateTextField.text = placemark.administrativeArea // state
            self?.cityTextField.text = placemark.locality // city

            if let country = placemark.country {
                if let index = self?.findCountryIndex(country) {
                    self?.countryPicker.selectRow(index, inComponent: 0, animated: true)
                }
            }

            self?.hideTableView()
        }
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }

    func findCountryIndex(_ country: String) -> Int? {
        return countries.firstIndex(where: { $0 == country })
    }

    func showTableView() {
        self.tableView.isHidden = false
    }

    func hideTableView() {
        self.tableView.isHidden = true
    }
}
