import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app_task/provider/models.dart';

import '../../constants.dart';

class CartTile extends StatefulWidget {
  const CartTile({Key? key, required this.cartItems, required this.index}) : super(key: key);

  final List<Products> cartItems;
  final int index;
  @override
  _CartTileState createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {

  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: size.width,
        height: size.height * 0.1,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: size.height * 0.082,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.network(
                      widget.cartItems[widget.index].image,
                      height: size.height * 0.10,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.4,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.cartItems[widget.index].title,
                        style: GoogleFonts.muli(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: kComponents),
                        ),
                        maxLines: 2,

                      ),
                      SizedBox(height: size.height * 0.03,),
                      Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Size:',
                                style: GoogleFonts.muli(
                                  textStyle: const TextStyle(
                                      fontWeight:
                                      FontWeight.w700,
                                      fontSize: 15,
                                      color: Colors.black12),
                                ),
                              ),
                              Text(
                                'S',
                                style: GoogleFonts.muli(
                                  textStyle: const TextStyle(
                                      fontWeight:
                                      FontWeight.w700,
                                      fontSize: 15,
                                      color: kComponents),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: size.width * 0.15,),
                          Row(
                            children: [
                              Text(
                                'Color',
                                style: GoogleFonts.muli(
                                  textStyle: const TextStyle(
                                      fontWeight:
                                      FontWeight.w700,
                                      fontSize: 15,
                                      color: Colors.black12),
                                ),
                              ),
                              SizedBox(width: size.width * 0.03,),
                              Container(
                                decoration: BoxDecoration(
                                    color: kComponents,
                                    borderRadius: BorderRadius.circular(4)
                                ),
                                height: size.height * 0.015,
                                width: size.width * 0.03,
                              ),
                            ],
                          ),

                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  // width: size.width * 0.09,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('\$${widget.cartItems[widget.index].price}',
                        style: GoogleFonts.muli(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 17,
                              color: kComponents),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Container(
                              height: size.height * 0.03,
                              width: size.width * 0.04,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12)
                              ),
                              child: Center(
                                child: Text('-',
                                  style: GoogleFonts.muli(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: kComponents),
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                if(itemCount > 1)
                                {
                                  itemCount --;
                                }
                              });
                            },
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text('$itemCount'),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          GestureDetector(
                            child: Container(
                              height: size.height * 0.03,
                              width: size.width * 0.04,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12)
                              ),
                              child: Center(
                                child: Text('+',
                                  style: GoogleFonts.muli(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: kComponents),
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                itemCount ++;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: size.width*0.01,)

              ],
            ),
          ],
        ));
  }
}
