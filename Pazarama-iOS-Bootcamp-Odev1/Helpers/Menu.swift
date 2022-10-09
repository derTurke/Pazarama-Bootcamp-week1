//
//  Welcome.swift
//  Pazarama-iOS-Bootcamp-Odev1
//
//  Created by GÜRHAN YUVARLAK on 24.09.2022.
//

import Foundation

final class Menu {
    var user = [User]()
    var favourites = [Favourites]()
    var cart = [Cart]()
    var products = [
        Product(id: UUID().uuidString, name: "Çekiç", categories: ["Boyacı","Marangoz","Duvar Ustası"], seller: "Gürhan Yuvarlak", point: 9.1, price: 100.0, comment: ["Çok güzel bir ürün.","Mükemmel Bir ürün"]),
        Product(id: UUID().uuidString, name: "3.5kg boya", categories: ["Boyacı"], seller: "Gürhan Yuvarlak", point: 9.1, price: 200.0, comment: ["Çok güzel bir ürün.","Mükemmel Bir ürün"]),
        Product(id: UUID().uuidString, name: "10kg boya", categories: ["Boyacı"], seller: "Gürhan Yuvarlak", point: 9.1, price: 550.0, comment: ["Çok güzel bir ürün.","Mükemmel Bir ürün"]),
        Product(id: UUID().uuidString, name: "20kg boya", categories: ["Boyacı"], seller: "Gürhan Yuvarlak", point: 9.1, price: 900.0, comment: ["Çok güzel bir ürün.","Mükemmel Bir ürün"]),
        Product(id: UUID().uuidString, name: "Çivi", categories: ["Duvar Ustası","Marangoz"], seller: "Gürhan Yuvarlak", point: 9.1, price: 27.5, comment: ["Çok güzel bir ürün.","Mükemmel Bir ürün"]),
        Product(id: UUID().uuidString, name: "Testere", categories: ["Marangoz"], seller: "Gürhan Yuvarlak", point: 9.1, price: 75.0, comment: ["Çok güzel bir ürün.","Mükemmel Bir ürün"]),
        Product(id: UUID().uuidString, name: "Çimento", categories: ["Duvar Ustası"], seller: "Gürhan Yuvarlak", point: 9.1, price: 50.0, comment: ["Çok güzel bir ürün.","Mükemmel Bir ürün"]),
        Product(id: UUID().uuidString, name: "Şamandıra", categories: ["Su Ustası"], seller: "Gürhan Yuvarlak", point: 9.1, price: 125.0, comment: ["Çok güzel bir ürün.","Mükemmel Bir ürün"]),
        Product(id: UUID().uuidString, name: "Kablin boru", categories: ["Su Ustası"], seller: "Gürhan Yuvarlak", point: 9.1, price: 15.0, comment: ["Çok güzel bir ürün.","Mükemmel Bir ürün"]),
        Product(id: UUID().uuidString, name: "Metre", categories: ["Boyacı","Marangoz","Duvar Ustası","Su Ustası"], seller: "Gürhan Yuvarlak", point: 9.1, price: 65.0, comment: ["Çok güzel bir ürün.","Mükemmel Bir ürün"])
    ]
    var pay = [PayInformation]()
    
    public func menu(user: User){
        print("Please choose:")
        print("1- Products")
        print("2- My Cart")
        print("3- My Profile")
        print("4- Logout")
        let selected = readLine()!
        if selected == "1" {
            productsPage(user: user, products: self.products)
        } else if selected == "2" {
            cartPage(user: user, cart: self.cart)
        } else if selected == "3" {
            profilePage(user: user, favourites: self.favourites)
        } else if selected == "4" {
        } else {
            menu(user: user)
        }
            
    }
    
    private func productsPage(user: User, products: [Product]){
        var jobProducts = [Product]()
        for item in products {
            for item2 in item.categories {
                if item2 == user.job {
                    jobProducts.append(item)
                }
            }
        }
        var counter = 1
        for item in jobProducts {
            print("\(counter) - \(item.name)")
            counter += 1
        }
        print("Select product or press '0' to return to the main page: ")
        let selectedProduct = readLine()!
        counter -= 1
        if selectedProduct == "0" {
            menu(user: user)
        } else if 0 < Int(selectedProduct) ?? 0, Int(selectedProduct) ?? 0 <= counter {
            var selected = Int(selectedProduct) ?? 0
            selected -= 1
            let product = products[selected]
            productDetail(user: user, products: products, product: product)
        }
        else if Int(selectedProduct) ?? 0 > counter {
            productsPage(user: user, products: products)
        } else {
            productsPage(user: user, products: products)
        }
    }
    
    private func profilePage(user: User, favourites: [Favourites]){
        var counter = 1
        print("Name: \(user.name)")
        print("Gender: \(user.gender)")
        print("Age: \(user.age)")
        print("Job: \(user.job)")
        print("Your favourites: ")
        for item in favourites {
            if item.userId == user.id {
                print("\(counter) - \(item.productName)")
                counter += 1
            }
        }
        print("Select the product you want to delete or press '0' to return to the main page: ")
        let selectedProfile = readLine()!
        counter -= 1
        if selectedProfile == "0" {
            menu(user: user)
        } else if 0 < Int(selectedProfile) ?? 0, Int(selectedProfile) ?? 0 <= counter {
            var selected = Int(selectedProfile) ?? 0
            selected -= 1
            self.favourites.remove(at: selected)
            profilePage(user: user, favourites: self.favourites)
            
        } else {
            profilePage(user: user, favourites: favourites)
        }
    }
    
    private func productDetail(user: User, products: [Product], product: Product) {
        print("Id: \(product.id)")
        print("Name: \(product.name)")
        print("Seller: \(product.seller)")
        print("Point: \(product.point)")
        print("Price: \(product.price)")
        print("Commnets:")
        for item in product.comment {
            print(item)
        }
        print("1- Add your cart")
        print("2- Add your favourites")
        print("0- Go back")
        print("Please choose: ")
        let selected = readLine()!
        if selected == "1" {
            self.cart.append(Cart(id: product.id, userId: user.id, productName: product.name, price: product.price))
            print("The product has been added to your cart.")
            productDetail(user: user, products: products, product: product)
        } else if selected == "2" {
            self.favourites.append(Favourites(userId: user.id, productId: product.id, productName: product.name))
            print("The product has been added to your favourites.")
            productDetail(user: user, products: products, product: product)
        } else if selected == "0" {
            productsPage(user: user, products: products)
        } else {
            productDetail(user: user, products: products, product: product)
        }
    }
    
    private func cartPage(user: User, cart: [Cart]) {
        print("Your cart:")
        var counter = 1
        var cartSum = 0.0
        for item in cart {
            if(item.userId == user.id) {
                print("\(counter) - \(item.productName) - \(item.price)")
                cartSum += item.price
                counter += 1
            }
        }
        print("Enter the number of the product you want to remove from the basket, if any, or press -1 to purchase. Press 0 to return to the main page: ")
        let selected = readLine()!
        counter -= 1
        
        if selected == "-1" {
            payInformation(user: user, sum: cartSum)
        } else if selected == "0" {
            menu(user: user)
        } else if 0 < Int(selected) ?? 0, Int(selected) ?? 0 <= counter {
            var removeSelected = Int(selected) ?? 0
            removeSelected -= 1
            self.cart.remove(at: removeSelected)
            cartPage(user: user, cart: self.cart)
        } else {
            cartPage(user: user, cart: cart)
        }
    }
    
    private func payInformation(user: User, sum: Double) {
        if self.pay.isEmpty {
            print("Add a payment method")
            print("Enter the your card name:")
            let cardName = readLine()!
            print("Enter the your card balance: ")
            let cardBalance = readLine()!
            self.pay.append(PayInformation(id: UUID().uuidString, userId: user.id, name: cardName, balance: Double(cardBalance) ?? 0))
            payInformation(user: user, sum: sum)
        }
        else {

            print("Your payment information: ")
            print("(-1)- Pay at the door.")
            var counter = 1
            for item in self.pay {
                if item.userId == user.id {
                    print("\(counter) - \(item.name)")
                    counter += 1
                }
            }
            
            print("Please select the card you will pay with or press 0 to return: ")
            let selectedPay = readLine()
            if selectedPay == "0" {
                cartPage(user: user, cart: self.cart)
            } else if selectedPay == "-1" {
                promotionCodePage(user: user, sum: sum, selected: 2)
            } else if selectedPay == "1" {
                promotionCodePage(user: user, sum: sum, selected: 1)
            } else {
                payInformation(user: user, sum: sum)
            }
            
        }
    }
    
    private func promotionCodePage(user: User, sum: Double, selected: Int) {
        if selected == 1 {
            print("Promotion Code: 'Cilekes'")
            let promotionCode = readLine()!
            if promotionCode == "Cilekes" {
                var balance = 0.0
                for item in self.pay {
                    if item.userId == user.id {
                        balance += item.balance
                    }
                }
                let promotionSum = sum - ((sum / 25))
                if balance > promotionSum {
                    print("Payment Successful!")
                    for item in self.pay {
                        if item.userId == user.id {
                            balance -= promotionSum
                        }
                    }
                    self.cart.removeAll()
                    cartPage(user: user, cart: self.cart)
                } else {
                    print("Payment failed! Check your balance.")
                    promotionCodePage(user: user, sum: sum, selected: 1)
                }
            } else {
                payInformation(user: user, sum: sum)
            }
        } else {
            print("Promotion Code: 'Cilekes'")
            let promotionCode = readLine()!
            if promotionCode == "Cilekes" {
                print("Payment Successful!")
                let promotionSum = sum - ((sum / 25))
                print("The amount you will pay at the door: \(promotionSum)")
                self.cart.removeAll()
                cartPage(user: user, cart: self.cart)
            } else {
                payInformation(user: user, sum: sum)
            }
        }
    }
    
}
