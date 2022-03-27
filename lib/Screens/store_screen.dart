import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app_task/Screens/home_screen.dart';
import 'package:store_app_task/constants.dart';
import 'package:store_app_task/provider/api.dart';
import '../provider/models.dart';
import '../widgets.dart';
import 'Components/new_arrival.dart';
import 'cart_screen.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  late PageController pageController;

  @override
  void initState() {
    // TODO: implement initState

    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }


  List<Widget> screens = [
    const HomeScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Container(
                     margin: const EdgeInsets.symmetric(horizontal: 25),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         SizedBox(
                           height: size.height * 0.08,
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: const [
                             Icon(
                               CupertinoIcons.list_bullet_indent,
                               size: 40,
                               color: kComponents,
                             ),
                             Icon(
                               CupertinoIcons.search,
                               size: 40,
                               color: kComponents,
                             )
                           ],
                         ),
                         SizedBox(
                           height: size.height * 0.04,
                         ),
                         Text(
                           'New Arrivals',
                           style: GoogleFonts.muli(
                             textStyle: const TextStyle(
                                 fontWeight: FontWeight.w700,
                                 fontSize: 30,
                                 color: kComponents),
                           ),
                         ),
                         SizedBox(
                           height: size.height * 0.02,
                         ),
                       ],
                     ),
                   ),
                    Column(
                      children: [
                        SizedBox(
                          width: size.width,
                          height: size.height * 2,
                          child: FutureBuilder<List<Products>>(
                            future: StoreAPI().getProducts(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      // A grid view with 3 items per row
                                      crossAxisCount: 2,
                                    ),
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      final product = snapshot.data![index];
                                      return NewArrival(
                                        size: size,
                                        product: product,
                                        snapshot: snapshot,
                                        index: index,
                                      );
                                    });
                              } else {
                                return Column(
                                  children: [
                                    SizedBox(height: size.height * 0.3,),
                                    const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(right: 0, left: 0, bottom: 0, child: buildButtom(size,context )),
          ],
        ),
      ),
    );
  }

}

