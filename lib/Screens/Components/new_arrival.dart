import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../provider/models.dart';
import '../../provider/products_provider.dart';

class NewArrival extends StatefulWidget {
  NewArrival(
      {Key? key,
      required this.size,
      required this.product,
      required this.snapshot,
      this.isLiked = false,
      required this.index})
      : super(key: key);

  final Size size;
  final Products product;
  final AsyncSnapshot snapshot;
  final int index;
  bool isLiked;

  @override
  State<NewArrival> createState() => _NewArrivalState();
}

class _NewArrivalState extends State<NewArrival> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      width: widget.size.width * 0.02,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: widget.size.height * 0.11,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network(
                widget.product.image,
                height: widget.size.height * 0.15,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: widget.size.height * 0.01,
                ),
                Text(
                  widget.product.category,
                  style: GoogleFonts.muli(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: kProductDesc),
                  ),
                ),
                SizedBox(
                  height: widget.size.height * 0.002,
                ),
                Text(
                  widget.product.title,
                  style: GoogleFonts.muli(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                        color: kComponents),
                  ),
                  maxLines: 2,
                ),
                SizedBox(
                  height: widget.size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$ ${widget.product.price.toString()}',
                      style: GoogleFonts.muli(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: kComponents),
                      ),
                    ),
                    widget.isLiked
                        ? GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.isLiked = !widget.isLiked;
                        });
                        Provider.of<CartProvider>(context, listen: false)
                            .unLiked(widget.snapshot.data![widget.index]);
                        Provider.of<CartProvider>(context, listen: false)
                            .subPrice(widget.snapshot.data![widget.index]);
                      },
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    )
                        : GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.isLiked = !widget.isLiked;
                        });
                        Provider.of<CartProvider>(context, listen: false)
                            .liked(widget.snapshot.data![widget.index]);
                        Provider.of<CartProvider>(context, listen: false)
                            .sumPrices(widget.snapshot.data![widget.index]);
                      },
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.black12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
