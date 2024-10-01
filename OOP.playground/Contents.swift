// Exercise 1: Create a class for Posts
class Post{
    var author: String
    var content: String
    var likes: Int
    
    init(author: String, content: String, likes: Int) {
        self.author = author
        self.content = content
        self.likes = likes
    }
    
    // Exercise 1: Add a display method
    func display(){
        print("Post(Author: \(self.author), Content: \(self.content), Likes: \(self.likes)")
    }
}

class Product{
    private static var currentId: Int = 0
    
    var id: Int // Adding Id for convenience
    var name: String
    var price: Double
    var quantity: Int
    
    init(name: String, price: Double, quantity: Int) {
        self.id = Product.setId()
        self.name = name
        self.price = price
        self.quantity = quantity
    }
    
    private static func setId() -> Int{
        Product.currentId += 1
        return Product.currentId
    }
}

class ShoppingCartSingleton{
    
    // Private initializer to prevent instantiation
    private init(){}
    
    static let sharedInstance = ShoppingCartSingleton()
    
    /* We make this private for encapsulation
     We don't want the product to be accessed from the outside
     of this class directly but only through the provided methods */
    private var products: [Product] = []
    
    func addProduct(_ product: Product){
        products.append(product)
        print("\(product.name) added to the card.")
    }
    
    func removeProduct(withId id: Int){
        if let index = products.firstIndex(where: {$0.id == id}){
            let removedProduct = products.remove(at: index)
            print("\(removedProduct.name) removed from to the card.")
        }else{
            print("Product not found in the card.")
        }
    }
    
    func clearCart(){
        products.removeAll()
        print("Shopping cart cleared.")
    }
    
    func getTotalPrice() -> Double{
        var totalPrice: Double = 0
        for product in self.products{
            totalPrice += product.price
        }
        return totalPrice
    }
    
    func getProducts() -> [Product]{
        return products
    }
}

protocol PaymentProcessor{
    func processPayment(amount: Double) throws
}

// Define a custom error for payment processing
enum PaymentError: Error {
    case insufficientFunds
    case invalidCard
    case networkError
    case cashNotAccepted
}

class CreditCardProcessor: PaymentProcessor{
    func processPayment(amount: Double) throws {
        // Example implementation
        guard amount > 0 else {
            throw PaymentError.insufficientFunds
        }
        
        // Simulate a processing error
        if amount > 1000 {
            throw PaymentError.invalidCard
        }
        
        // Process payment logic here
        print("Payment of $\(amount) processed successfully.")
    }
    
}

class CashProcessor: PaymentProcessor{
    func processPayment(amount: Double) throws {
        guard amount > 0 else {
            throw PaymentError.insufficientFunds
        }
        
        // Cash payments can be restricted (e.g., cash not accepted for large amounts)
        if amount > 500 {
            throw PaymentError.cashNotAccepted
        }
        
        // Process payment logic here
        print("Cash payment of $\(amount) processed successfully.")
    }
}


func main(){
    // Exercise 1: Add two Post objects
    var swift_is_great = Post(author: "Emmanuel Edorh", content: "Swift is great, you shoud learn it", likes: 10)
    var python_is_popular = Post(author: "John Doe", content: "Python is popular, you shoud learn it", likes: 100)
    
    swift_is_great.display()
    python_is_popular.display()
    
    // Example usage
    let creditCardProcessor = CreditCardProcessor()
    let cashProcessor = CashProcessor()

    do {
        try creditCardProcessor.processPayment(amount: 1500)
    } catch {
        print("Credit Card Payment failed with error: \(error)")
    }

    do {
        try cashProcessor.processPayment(amount: 600)
    } catch {
        print("Cash Payment failed with error: \(error)")
    }

    do {
        try cashProcessor.processPayment(amount: 300)
    } catch {
        print("Cash Payment failed with error: \(error)")
    }
}

main()



