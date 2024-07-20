import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/models/shop.dart';
import 'package:sushi/theme/colors.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, shop, child) {
        double totalPrice =
            shop.cart.fold(0, (sum, item) => sum + double.parse(item.price));

        return Scaffold(
          appBar: AppBar(
            backgroundColor: primarycolor,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "Order Summary",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: shop.cart.length,
                  itemBuilder: (context, index) {
                    final food = shop.cart[index];

                    return Container(
                      decoration: BoxDecoration(
                        color: primarycolor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin:
                          const EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: ListTile(
                        title: Text(
                          food.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '\$${food.price}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
