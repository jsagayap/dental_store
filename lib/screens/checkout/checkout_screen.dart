import 'package:flutter/material.dart';
import 'package:dental_store/widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';
  const CheckoutScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController zipCodeController = TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Checkout'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Customer Information',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              _buildTextFormField(emailController, context, 'Email'),
              _buildTextFormField(nameController, context, 'Full name'),
              const SizedBox(height: 16),
              Text(
                'Delivery Information',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              _buildTextFormField(addressController, context, 'Address'),
              _buildTextFormField(cityController, context, 'City'),
              _buildTextFormField(countryController, context, 'Country'),
              _buildTextFormField(zipCodeController, context, 'ZIP Code'),
              const SizedBox(height: 16),
              const OrderSummary(),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTextFormField(
    TextEditingController controller,
    BuildContext context,
    String labelText,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(
            labelText,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              isDense: true,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}