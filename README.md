# swift_oop

Exercise 1
This exercise focuses on defining a class Post to model a social media post. It demonstrates creating properties for the post’s data and a method display() to format and print the information. This reinforces the concept of classes encapsulating data and functionality.

Requirements
Create a program that models a social media post.

Define a class named Post with properties for:
author (String)
content (String)
likes (Int)
Implement a method display() that prints a formatted string representing the post, including author, content, and number of likes.
In your main function, create two Post objects with different content and authors. Call the display() method on each object to see the formatted post information.
Exercise 2
This exercise focuses on applying composition and the Singleton design pattern to create a more flexible shopping cart system.

This exercise incorporates the Singleton design pattern. The DiscountStrategy protocol defines a common interface for calculating discounts. Concrete strategies like NoDiscountStrategy and PercentageDiscountStrategy provide specific implementations. The ShoppingCart class holds a reference to a DiscountStrategy object, allowing you to dynamically change the discount behavior applied.

Requirements
Define Classes:
Create a class named Product with properties like name (String), price (Double), and quantity (Int).
Implement the Singleton design pattern to create a class named ShoppingCartSingleton. This class will hold a collection of Product objects and manage the shopping cart functionality.
Composition:
The ShoppingCartSingleton class should have an internal array or set to store Product objects. This demonstrates composition, where a ShoppingCart object is composed of multiple Product objects.
Singleton Design Pattern:
Implement the Singleton design pattern for the ShoppingCartSingleton class. This ensures only one instance of the shopping cart exists throughout the application.
Functionality:
Implement methods in ShoppingCartSingleton to:
sharedInstance: This static method should return the single instance of ShoppingCartSingleton, following the Singleton pattern.
addProduct(product:product, quantity:quantity): This method allows users to add a product to the cart along with the desired quantity. It should update the internal product collection within the singleton instance.
removeProduct(product:product): This method allows users to remove a product from the cart.
clearCart(): This method empties the shopping cart by clearing the internal product collection.
getTotalPrice(): This method calculates the total price of all items in the cart considering their quantity and price.
Exercise 3
This exercise defines a protocol PaymentProcessor with a method processPayment that throws an error. Concrete classes CreditCardProcessor and CashProcessor conform to the protocol, showcasing the use of protocols for defining common functionality across different payment methods. The assignment emphasizes error handling using try-catch blocks to catch potential PaymentError throws from the processors, demonstrating how to handle errors gracefully in protocol-oriented programming.

Requirements
Create a program that models a payment system with different payment methods.

Define a protocol named PaymentProcessor with a method processPayment(amount: Double) that throws a PaymentError (custom error type).
Create concrete classes like CreditCardProcessor and CashProcessor that conform to the PaymentProcessor protocol. Implement processPayment with logic specific to each method (e.g., simulating card validation for CreditCardProcessor). Throw PaymentError with appropriate messages for scenarios like insufficient funds.
In your main function, try processing payments with different processors and handle potential errors using try-catch blocks. Print success messages or error details depending on the outcome.