import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

void main() {
  var __parm =
      "{error: false, message: Success, data: {id: PAYID-NCYDYGA93E909834R396983J, intent: sale, state: approved, cart: 6LR649446N962453K, payer: {payment_method: paypal, status: VERIFIED, payer_info: {email: sb-et6wh45596470@business.example.com, first_name: John, last_name: Doe, payer_id: 976NAXKQ5H9SN, shipping_address: {recipient_name: John Doe, line1: 1 Main St, city: San Jose, state: CA, postal_code: 95131, country_code: US}, country_code: US, business_name: Test Store}}, transactions: [{amount: {total: 100.00, currency: USD, details: {subtotal: 100.00, shipping: 0.00, insurance: 0.00, handling_fee: 0.00, shipping_discount: 0.00, discount: 0.00}}, payee: {merchant_id: Z5GWKGABP5V32, email: sb-s91ws36852122@business.example.com}, description: The payment transaction description., item_list: {items: [{name: Apple, price: 10.00, currency: USD, tax: 0.00, quantity: 4}, {name: Pineapple, price: 12.00, currency: USD, tax: 0.00, quantity: 5}], shipping_address: {recipient_name: John Doe, line1: 1 Main St, city: San Jose, state: CA, postal_code: 95131, country_code: US}}, related_resources: [{sale: {id: 0AW7006686470561V, state: completed, amount: {total: 100.00, currency: USD, details: {subtotal: 100.00, shipping: 0.00, insurance: 0.00, handling_fee: 0.00, shipping_discount: 0.00, discount: 0.00}}, payment_mode: INSTANT_TRANSFER, protection_eligibility: ELIGIBLE, protection_eligibility_type: ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE, transaction_fee: {value: 3.98, currency: USD}, parent_payment: PAYID-NCYDYGA93E909834R396983J, create_time: 2025-08-28T11:24:08Z, update_time: 2025-08-28T11:24:08Z, links: [{href: https://api.sandbox.paypal.com/v1/payments/sale/0AW7006686470561V, rel: self, method: GET}, {href: https://api.sandbox.paypal.com/v1/payments/sale/0AW7006686470561V/refund, rel: refund, method: POST}, {href: https://api.sandbox.paypal.com/v1/payments/payment/PAYID-NCYDYGA93E909834R396983J, rel: parent_payment, method: GET}]}}]}], failed_transactions: [], create_time: 2025-08-28T11:23:04Z, update_time: 2025-08-28T11:24:08Z, links: [{href: https://api.sandbox.paypal.com/v1/payments/payment/PAYID-NCYDYGA93E909834R396983J, rel: self, method: GET}]}}";
  var _params =
      """{error: false, message: Success, data: {id: PAYID-NCYDYGA93E909834R396983J, intent: sale, state: approved, cart: 6LR649446N962453K, payer: {payment_method: paypal, status: VERIFIED, payer_info: {email: sb-et6wh45596470@business.example.com, first_name: John, last_name: Doe, payer_id: 976NAXKQ5H9SN, shipping_address: {recipient_name: John Doe, line1: 1 Main St, city: San Jose, state: CA, postal_code: 95131, country_code: US}, country_code: US, business_name: Test Store}}, transactions: [{amount: {total: 100.00, currency: USD, details: {subtotal: 100.00, shipping: 0.00, insurance: 0.00, handling_fee: 0.00, shipping_discount: 0.00, discount: 0.00}}, payee: {merchant_id: Z5GWKGABP5V32, email: sb-s91ws36852122@business.example.com}, description: The payment transaction description., item_list: {items: [{name: Apple, price: 10.00, currency: USD, tax: 0.00, quantity: 4}, {name: Pineapple, price: 12.00, currency: USD, tax: 0.00, quantity: 5}], shipping_address: {recipient_name: John Doe, line1: 1 Main St, city: San Jose, state: CA, postal_code: 95131, country_code: US}}, related_resources: [{sale: {id: 0AW7006686470561V, state: completed, amount: {total: 100.00, currency: USD, details: {subtotal: 100.00, shipping: 0.00, insurance: 0.00, handling_fee: 0.00, shipping_discount: 0.00, discount: 0.00}}, payment_mode: INSTANT_TRANSFER, protection_eligibility: ELIGIBLE, protection_eligibility_type: ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE, transaction_fee: {value: 3.98, currency: USD}, parent_payment: PAYID-NCYDYGA93E909834R396983J, create_time: 2025-08-28T11:24:08Z, update_time: 2025-08-28T11:24:08Z, links: [{href: https://api.sandbox.paypal.com/v1/payments/sale/0AW7006686470561V, rel: self, method: GET}, {href: https://api.sandbox.paypal.com/v1/payments/sale/0AW7006686470561V/refund, rel: refund, method: POST}, {href: https://api.sandbox.paypal.com/v1/payments/payment/PAYID-NCYDYGA93E909834R396983J, rel: parent_payment, method: GET}]}}]}], failed_transactions: [], create_time: 2025-08-28T11:23:04Z, update_time: 2025-08-28T11:24:08Z, links: [{href: https://api.sandbox.paypal.com/v1/payments/payment/PAYID-NCYDYGA93E909834R396983J, rel: self, method: GET}]}}""";
  runApp(MaterialApp(
      title: 'PaypalPaymentDemp',
      debugShowCheckedModeBanner: false,
      home: PaypalPaymentDemo()));
}

class PaypalPaymentDemo extends StatelessWidget {
  const PaypalPaymentDemo({super.key});

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
                clientId:
                    "AQTICTxUcxlrqAs9jmaaKjb69sM_ZcFPcIpye8vtoojLbMC6Iz_1uTjvAi6-7qqSDuB65rRC6nqKnPlM",
                secretKey:
                    "EKTD_xwT3Cjwm0csinf-eJajQMeoRSLJU0zSzm_vFfNLVz-Fw6TsiGIjToJusONLFNNEL41MTonfA2Ie",
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
          child: const Text('Pay with paypal'),
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
        title: const Text('Invoice'),
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
