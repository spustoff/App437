//
//  HomeViewModel.swift
//  App437
//
//  Created by IGOR on 05/04/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @Published var currencies: [String] = ["EUR/USD", "GBP/USD", "AUD/USD", "USD/CAD", "USD/CHF", "NZD/USD"]
    @Published var currCur = "EUR/USD"
    @AppStorage("currentCurrency") var currentCurrency = ""
    
    @Published var types: [String] = ["Active", "Not active"]
    @Published var currentType = "Active"
    
    @AppStorage("expenses") var expenses: Int = 0
    @AppStorage("balance") var balance: Int = 0
    
    @Published var calcBalance: Int = 0
    @Published var calcBalanceString: String = ""
    
    @Published var subTitle: String = ""
    @Published var subDate: String = ""
    @Published var subAmount: String = ""
    @Published var subActive: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isCurr: Bool = false
    @Published var isDetail: Bool = false
    @Published var isChart: Bool = false
    @Published var isDelete: Bool = false
    @Published var isEdit: Bool = false
    @Published var isCalculator: Bool = false

    @Published var isOn: Bool = false

    
    @Published var subscriptions: [SubModel] = []
    @Published var selectedSubscription: SubModel?
    
    func addsubScription() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "SubModel", into: context) as! SubModel
        
        loan.subTitle = subTitle
        loan.subDate = subDate
        loan.subAmount = subAmount
        loan.subActive = isOn == true ? "Active" : "Not active"
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchSubscriptions() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<SubModel>(entityName: "SubModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.subscriptions = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.subscriptions = []
        }
    }
    
    func calculatePercentage() -> Double {
        
        let value = expenses
        let maxValue = balance
        
        let percentCircle = Double(value) / Double(maxValue) * 100
        
        return percentCircle
    }
    
}
