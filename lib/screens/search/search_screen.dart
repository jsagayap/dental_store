import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_store/widgets/widgets.dart';
import 'package:dental_store/services/firebase_services.dart';

class SearchScreen extends StatelessWidget {
  final String? title;
  const SearchScreen({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title.toString(), backButton: true),
      body: FutureBuilder(
        future: FirestoreServices.searchProducts(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (snapshot.data!.docs.isEmpty) {
            return Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    IconlyBroken.search,
                    size: 48.0,
                  ),
                  SizedBox(height: 16),
                  Text('No products found'),
                ],
              ),
            );
          }
          else {
            var data = snapshot.data!.docs;
            var filteredData = data.where((element) => element['name'].toString().toLowerCase().contains(title!.toLowerCase())).toList();
      
            if (filteredData.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  itemCount: filteredData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductCard(product: filteredData[index], widthFactor: 2,),
                    );
                  },
                ),
              );
            }
            else {
              return Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      IconlyBroken.search,
                      size: 48.0,
                    ),
                    SizedBox(height: 16),
                    Text('No products found'),
                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}