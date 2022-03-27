import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/Components/bottom_button.dart';
import 'Screens/cart_screen.dart';
import 'constants.dart';


int _page = 0;



Container buildButtom(Size size, BuildContext context) {
  return Container(
    height: size.height * 0.1,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: size.width * 0.05,
        ),
        BottomButton(
          icon: Icons.home_filled,
          text: _page == 0 ? 'Home' : '',
          onTap: () {},
          color: _page == 0 ? kActiveTile : Colors.white,
          textColor: _page == 0 ? Colors.black : Colors.black12,
          iconColor: _page == 0 ? Colors.black : Colors.black54,
        ),
        SizedBox(
          width: size.width * 0.1,
        ),
        BottomButton(
          icon: CupertinoIcons.bag,
          text: _page == 1 ? 'cart' : '',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ),
            );
          },
          color: _page == 1 ? kActiveTile : Colors.white,
          textColor: _page == 1 ? Colors.black : Colors.black12,
          iconColor: _page == 1 ? Colors.black : Colors.black12,
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
      ],
    ),
  );
}
