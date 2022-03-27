import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:store_app_task/provider/products_provider.dart';

class CartButtom extends StatefulWidget {
  const CartButtom({Key? key}) : super(key: key);

  @override
  _CartButtomState createState() => _CartButtomState();
}

class _CartButtomState extends State<CartButtom> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: size.width * 0.7,
            margin: const EdgeInsets.only(left: 40, bottom: 20, right: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 28)),
                ),
                Text(
                  '\$${Provider.of<CartProvider>(context).totalPrice.toInt()}',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 40)),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FlatButton(
              color: Colors.black,
              onPressed: () {},
              child: SizedBox(
                width: size.width * 0.7,
                height: size.height * 0.08,
                child: Center(
                  child: Text(
                    'Payment',
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: Colors.white)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
