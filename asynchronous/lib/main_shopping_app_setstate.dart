import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'setState Problems Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ProductListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Problem 1: State Sharing Across Widgets
// Each screen maintains its own cart state, leading to inconsistencies
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<String> products = ['Laptop', 'Phone', 'Tablet', 'Watch'];
  final List<double> prices = [999.99, 699.99, 499.99, 299.99];
  List<int> cartQuantities = [0, 0, 0, 0];
  double totalAmount = 0;

  void _updateQuantity(int index, int change) {
    setState(() {
      cartQuantities[index] += change;
      _recalculateTotal();
    });
  }

  void _recalculateTotal() {
    totalAmount = 0;
    for (int i = 0; i < products.length; i++) {
      totalAmount += cartQuantities[i] * prices[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    // Problem 2: Unnecessary Rebuilds
    // The entire screen rebuilds when any quantity changes
    print('Rebuilding entire ProductListScreen');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // Problem 3: Passing State Through Constructor
                  // Need to pass all state through constructor
                  builder: (context) => CartScreen(
                    products: products,
                    prices: prices,
                    quantities: cartQuantities,
                    onQuantityChanged: _updateQuantity,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductListItem(
                  name: products[index],
                  price: prices[index],
                  quantity: cartQuantities[index],
                  onQuantityChanged: (change) => _updateQuantity(index, change),
                );
              },
            ),
          ),
          // Problem 4: Deep State Updates
          // Total amount needs to update everywhere
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Total: \$${totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// Problem 5: Duplicate State Logic
// CartScreen needs to maintain same state logic
class CartScreen extends StatefulWidget {
  final List<String> products;
  final List<double> prices;
  final List<int> quantities;
  final Function(int, int) onQuantityChanged;

  const CartScreen({
    super.key,
    required this.products,
    required this.prices,
    required this.quantities,
    required this.onQuantityChanged,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalAmount = 0;

  @override
  void initState() {
    super.initState();
    _calculateTotal();
  }

  void _calculateTotal() {
    totalAmount = 0;
    for (int i = 0; i < widget.products.length; i++) {
      totalAmount += widget.quantities[i] * widget.prices[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.products.length,
              itemBuilder: (context, index) {
                if (widget.quantities[index] > 0) {
                  return ProductListItem(
                    name: widget.products[index],
                    price: widget.prices[index],
                    quantity: widget.quantities[index],
                    onQuantityChanged: (change) {
                      widget.onQuantityChanged(index, change);
                      setState(() {
                        _calculateTotal();
                      });
                    },
                  );
                }
                return Container();
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Total: \$${totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductListItem extends StatelessWidget {
  final String name;
  final double price;
  final int quantity;
  final Function(int) onQuantityChanged;

  const ProductListItem({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Problem 6: Widget Rebuild Cascade
    // Even static content rebuilds when quantity changes
    print('Rebuilding ProductListItem for $name');
    return ListTile(
      title: Text(name, style: TextStyle(fontSize: 22)),
      subtitle: Text(
        '\$${price.toStringAsFixed(2)}',
        style: TextStyle(fontSize: 18),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: quantity > 0 ? () => onQuantityChanged(-1) : null,
          ),
          Text('$quantity', style: TextStyle(fontSize: 22)),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => onQuantityChanged(1),
          ),
        ],
      ),
    );
  }
}
