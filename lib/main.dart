import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(
      title: 'PaypalPaymentDemp',
      debugShowCheckedModeBanner: false,
      home: PaypalPaymentDemo()));
}

class PaypalPaymentDemo extends StatelessWidget {
  PaypalPaymentDemo({super.key});

  var _sandboxClientId = dotenv.env['SANDBOX_CLIENDID'];
  var _sandboxSecretKey = dotenv.env['SANDBOX_SECRETKEY'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice'),
        actions: [Image.asset("assets/paypallogo.png")],
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PaypalCheckoutView(
                sandboxMode: true,
                clientId: _sandboxClientId,
                secretKey: _sandboxSecretKey,
                transactions: const [
                  {
                    "amount": {
                      "total": '100',
                      "currency": "USD",
                      "details": {
                        //   "subtotal": '100',
                        // "shipping": '0',
                        // "shipping_discount": 0
                      }
                    },
                    "description": "The payment transaction description.",
                    // "payment_options": {
                    //   "allowed_payment_method":
                    //       "INSTANT_FUNDING_SOURCE"
                    // },
                    "item_list": {
                      "items": [
                        {
                          "name": "Video Editing Service ",
                          "quantity": 1,
                          "price": '100',
                          "currency": "USD"
                        },
                        // {
                        //   "name": "Pineapple",
                        //   "quantity": 5,
                        //   "price": '12',
                        //   "currency": "USD"
                        // }
                      ],

                      // Optional
                      //   "shipping_address": {
                      //     "recipient_name": "Tharwat samy",
                      //     "line1": "tharwat",
                      //     "line2": "",
                      //     "city": "tharwat",
                      //     "country_code": "EG",
                      //     "postal_code": "25025",
                      //     "phone": "+00000000",
                      //     "state": "ALex"
                      //  },
                    }
                  }
                ],
                note: "Contact us for any questions on your order.",
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
                onSuccess: (Map params) async {
                  print("onSuccess: $params");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InvoiceScreen(params: params),
                    ),
                  );
                },
                onError: (error) {
                  log("onError: $error");
                  Navigator.pop(context);
                },
                onCancel: () {
                  print('cancelled:');
                  Navigator.pop(context);
                },
              ),
            ));
          },
          child: const Text('Pay with paypal', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}

class InvoiceScreen extends StatelessWidget {
  final Map<dynamic, dynamic> params;
  const InvoiceScreen({super.key, required this.params});

  Widget getAllKeys(BuildContext context, dynamic data, {double indent = 0}) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    if (data is Map) {
      final keys = data.keys.toList();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(keys.length, (index) {
          final key = keys[index];
          final value = data[key];

          if (value is Map || value is List) {
            return Padding(
              padding: EdgeInsets.only(left: indent, top: 4, bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$key:', style: TextStyle(fontWeight: FontWeight.bold)),
                  getAllKeys(context, value, indent: indent + 16),
                ],
              ),
            );
          }

          if (isPortrait) {
            // Vertical layout for portrait mode
            return Padding(
              padding: EdgeInsets.only(left: indent, top: 4, bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$key', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('$value'),
                ],
              ),
            );
          } else {
            // Horizontal layout for landscape mode
            return Padding(
              padding: EdgeInsets.only(left: indent, top: 4, bottom: 4),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Text('$key',
                        softWrap: true, overflow: TextOverflow.visible),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text('$value',
                        softWrap: true, overflow: TextOverflow.visible),
                  ),
                ],
              ),
            );
          }
        }),
      );
    } else if (data is List) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(data.length, (index) {
          final value = data[index];
          if (value is Map || value is List) {
            return Padding(
              padding: EdgeInsets.only(left: indent, top: 4, bottom: 4),
              child: getAllKeys(context, value, indent: indent + 16),
            );
          }
          return Padding(
            padding: EdgeInsets.only(left: indent, top: 4, bottom: 4),
            child: Text(value.toString()),
          );
        }),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(left: indent, top: 4, bottom: 4),
        child: Text(data.toString()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Recipt'),
        actions: [Image.asset("assets/paypallogo.png")],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: getAllKeys(context, params),
        ),
      ),
    );
  }
}
