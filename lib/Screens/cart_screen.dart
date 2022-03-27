import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:store_app_task/provider/models.dart';
import 'package:store_app_task/provider/products_provider.dart';
import 'Components/cart_buttom.dart';
import 'Components/cart_tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);


  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.09,
                  ),
                  Row(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          iconSize: 30),
                      SizedBox(
                        width: size.width * 0.29,
                      ),
                      Text(
                        'Your Cart',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 30)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height * 1,
                    child: ListView.separated(
                        itemCount:
                            Provider.of<CartProvider>(context).cartItems.length,
                        itemBuilder: (context, index) {
                          List<Products> cartItems = Provider.of<CartProvider>(context).cartItems;
                          return CartTile(index: index, cartItems: cartItems,);

                        }, separatorBuilder: (BuildContext context, int index) { return const Divider(); },),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(right: 0, left: 0, bottom: 0, child: CartButtom())
        ],
      ),
    );
  }

}
