//
//  ViewController.swift
//  iOS Example
//
//  Created by Christopher de Haan on 11/06/2016.
//
//  Copyright (c) 2016-2017 Christopher de Haan <contact@christopherdehaan.me>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Button Methods
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        CDYelpFusionKitManager.shared.yelpAPIClient.cancelAllPendingAPIRequests()
        CDYelpFusionKitManager.shared.yelpAPIClient.searchBusinesses(byTerm: "Food",
                                                                     location: "San Francisco",
                                                                     latitude: nil,
                                                                     longitude: nil,
                                                                     radius: 10000,
                                                                     categories: nil,
                                                                     locale: .english_unitedStates,
                                                                     limit: 5,
                                                                     offset: 0,
                                                                     sortBy: .rating,
                                                                     price: nil,
                                                                     openNow: true,
                                                                     openAt: nil,
                                                                     attributes: nil) { (response, error) in
            
            if let response = response,
                let businesses = response.businesses,
                businesses.count > 0 {
                print(businesses)
            }
        }
        
        CDYelpFusionKitManager.shared.yelpAPIClient.searchBusinesses(byPhoneNumber: "+14157492060") { (response, error) in
            
            if let response = response,
                let businesses = response.businesses,
                businesses.count > 0 {
                print(businesses)
            }
        }
        
        CDYelpFusionKitManager.shared.yelpAPIClient.searchTransactions(byType: .foodDelivery,
                                                                       location: "San Francisco",
                                                                       latitude: nil,
                                                                       longitude: nil) { (response, error) in
            
            if let response = response,
                let businesses = response.businesses,
                businesses.count > 0 {
                print(businesses)
            }
        }
        
        CDYelpFusionKitManager.shared.yelpAPIClient.fetchBusiness(byId: "north-india-restaurant-san-francisco") { (business, error) in
            
            if let business = business {
                print(business)
            }
        }
        
        CDYelpFusionKitManager.shared.yelpAPIClient.fetchReviews(forBusinessId: "north-india-restaurant-san-francisco",
                                                                 locale: nil) { (response, error) in
            
            if let response = response,
                let reviews = response.reviews,
                reviews.count > 0 {
                print(reviews)
            }
        }
        
        CDYelpFusionKitManager.shared.yelpAPIClient.autocompleteBusinesses(byText: "Pizza Hut",
                                                                           latitude: 37.786572,
                                                                           longitude: -122.415192,
                                                                           locale: nil) { (response, error) in
            
            if let response = response,
                let businesses = response.businesses,
                businesses.count > 0 {
                print(businesses)
            }
        }
    }
}

