import 'package:flutter/material.dart';
import 'package:assign/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: turjo(),
    debugShowCheckedModeBanner: false,
  ));
}


class turjo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Productdetails(),
      debugShowCheckedModeBanner: false,
    );
  }

}


class Productdetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              ProductCard(
                name: 'iPhone 11 128GB ',
                image: 'https://www.startech.com.bd/image/cache/catalog/mobile/apple/iphone-11/iphone-11-black-500x500.webp',
                price: '৳68,500',
                features: [
                  'Model: iPhone 11',
                  'Display: 6.1" Liquid Retina HD display',
                  'Processor: A13 Bionic Chip, Storage: 128GB',
                  'Camera: 12MP + 12MP Rear, 12MP Front'
                ],
              ),
              SizedBox(height: 14),
              ProductCard(
                name: 'Vivo Y27e Smartphone (8/256GB)',
                image: 'https://www.startech.com.bd/image/cache/catalog/mobile/vivo/y27e/y27e-02-500x500.webp',
                price: '৳34,000',
                features: [
                  'Model: Y27e',
                  'Display: 6.62" FHD+120Hz Colour-Rich Display',
                  'Processor: MediaTek Helio G99 (6 nm)',
                ],
              ),

            ],
          ),
        ),
      ),
  backgroundColor: Colors.yellow,  );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final List<String> features;

  ProductCard({
    required this.name,
    required this.image,
    required this.price,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          color: Colors.red.shade400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Image.network(
                image,
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 8),
              Text(
                'Price: $price',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Key Features:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: features.map((feature) => Text('- $feature')).toList(),
              ),
              SizedBox(height: 16),
              Container(
                child: ElevatedButton(

                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Home()));
                    // Implement your Buy Now action
                  },
                  child: Container(
                    color: Colors.amber,
                      child: Text('Buy Now',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BuyNowPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BuyNowPage extends StatefulWidget {
  @override
  _BuyNowPageState createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  String selectedPaymentMethod = 'BKash'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Now'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose Payment Method',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,

              ),
            ),





            SizedBox(height: 16),
             Container(
               color: Colors.grey,
               child: Padding(
                 padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: BkashPaymentMethodButton(
                          method: 'BKash',
                          onPressed: () => selectPaymentMethod('BKash'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: rocketPaymentMethodButton(
                          method: 'Rocket',
                          onPressed: () => selectPaymentMethod('Rocket'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: visaPaymentMethodButton(
                          method: 'Visa',
                          onPressed: () => selectPaymentMethod('Visa'),
                        ),
                      ),
                    ],
                  ),

               ),
             ),

            Container(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                          Padding(
                            padding: const EdgeInsets.only(left:1.0),
                            child: mcPaymentMethodButton(
                              method: 'Mastercard',
                              onPressed: () => selectPaymentMethod('Mastercard'),
                            ),
                          ),

                      Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: amexPaymentMethodButton(
                          method: 'AmEx',
                          onPressed: () => selectPaymentMethod('AmEx'),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),



            SizedBox(height: 100),
            Center(
              child: DropdownButton<String>(
                value: selectedPaymentMethod,
                items: ['BKash', 'Rocket', 'Visa', 'Mastercard', 'AmEx']
                    .map((method) => DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: SingleChildScrollView(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => turjo()));
                  },
                  child: Container(
                      child: Text('Go Back',style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold),)),
                ),
              ),
            ),

          ],
        ),
      ),
    backgroundColor: Colors.cyan,);
  }

  void selectPaymentMethod(String method) {
    setState(() {
      selectedPaymentMethod = method;
    });
  }
}

class BkashPaymentMethodButton extends StatelessWidget {
  final String method;
  final VoidCallback onPressed;

  BkashPaymentMethodButton({required this.method, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Image.asset(
        'lib/assets/Bkash.png',

        height: 70,
        width: 70,
      ),
    );
  }
}

class rocketPaymentMethodButton extends StatelessWidget {
  final String method;
  final VoidCallback onPressed;

  rocketPaymentMethodButton({required this.method, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Image.asset(
        'lib/assets/rocket.png',

        height: 70,
        width: 70,
      ),
    );
  }
}
class visaPaymentMethodButton extends StatelessWidget {
  final String method;
  final VoidCallback onPressed;

  visaPaymentMethodButton({required this.method, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Image.asset(
        'lib/assets/visa.png',

        height: 70,
        width: 70,
      ),
    );
  }
}


class mcPaymentMethodButton extends StatelessWidget {
  final String method;
  final VoidCallback onPressed;

  mcPaymentMethodButton({required this.method, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Image.asset(
        'lib/assets/mastercard.png',

        height: 70,
        width: 70,
      ),
    );
  }
}



class amexPaymentMethodButton extends StatelessWidget {
  final String method;
  final VoidCallback onPressed;

  amexPaymentMethodButton({required this.method, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Image.asset(
        'lib/assets/amex.png',

        height: 70,
        width: 70,
      ),
    );
  }
}