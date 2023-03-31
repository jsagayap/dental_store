import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_store/widgets/widgets.dart';
import 'package:dental_store/screens/screens.dart';
import 'package:dental_store/services/firebase_services.dart';
import 'package:dental_store/controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());

    return StreamBuilder(
      // TODO: Change 1 to the logged user's ID
      stream: FirestoreServices.getCart(1),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            appBar: CustomAppBar(title: 'Cart', backButton: true),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        else if (snapshot.data!.docs.isEmpty) {
          return Scaffold(
            appBar: const CustomAppBar(title: 'Cart', backButton: true),
            body: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    IconlyBroken.buy,
                    size: 48.0,
                  ),
                  SizedBox(height: 16),
                  Text('Cart is empty'),
                ],
              ),
            ),
          );
        }
        else {
          var data = snapshot.data!.docs;
          controller.calculate(data);
          controller.productSnapshot = data;

          return Scaffold(
            appBar: const CustomAppBar(title: 'Cart', backButton: true),
            bottomNavigationBar: CustomNavBar(
              title: 'Proceed to Shipping',
              icon: const Icon(IconlyBroken.paper),
              action: () {
                Get.to(() => const ShippingScreen());
              },
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, int index) {
                        return CartProductCard(
                          id: data[index].id,
                          name: data[index]['name'],
                          category: data[index]['category'],
                          imageUrl: data[index]['imageUrl'],
                          price: data[index]['price'],
                          quantity: data[index]['quantity'],
                        );
                      }
                    ),
                  ),
                  const SizedBox(height: 16),
                  const OrderSummary(),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
