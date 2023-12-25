import 'package:apple/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class FoodDetailsScreen extends StatelessWidget {
  FoodDetailsScreen(
      {super.key,
      required this.foodColor,
      required this.description,
      required this.imageUrl,
      required this.foodName,
      required this.price,
      required this.rate,
      required this.itsType,
      required this.weight,
      required this.quantity,
      required this.favorite});
  final String foodColor;
  final String description;
  final String imageUrl;
  final String foodName;
  final double price;
  final String rate;
  final String itsType;
  final String weight;
  int quantity;
  bool favorite;
  ValueNotifier<int> amount = ValueNotifier(0);
  ValueNotifier<bool> isFavorite = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: .4.sh,
          child: Stack(
            children: [
              Container(
                height: 270,
                decoration: BoxDecoration(
                    color: Color(
                      int.parse("0xFF$foodColor"),
                    ).withOpacity(.2),
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(490))),
              ),
              Positioned(
                left: 70,
                top: 60,
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/aocado.png",
                  image: imageUrl,
                  imageErrorBuilder: (context, error, stackTrace) =>
                      Image.asset("assets/aocado.png"),
                  width: 270,
                ),
              ),
              Positioned(
                top: 30,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 30,
                    )),
              ),
            ],
          ),
        ),
        Container(
          height: .6.sh,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
          decoration: const BoxDecoration(
              color: Color(0xffF4F5F9),
              borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${price.toStringAsFixed(2)}",
                  style: const TextStyle(
                      color: Color(0xff28B446),
                      fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () {
                    isFavorite.value = !isFavorite.value;
                  },
                  child: ValueListenableBuilder(
                    valueListenable: isFavorite,
                    builder: (context, value, child) {
                      return SvgPicture.asset(
                          value ? "assets/heartFill.svg" : "assets/heart.svg");
                    },
                  ),
                ),
              ],
            ),
            Text(
              foodName,
              style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              weight,
              style: const TextStyle(
                  color: Color(0xff868889),
                  fontFamily: "Poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            10.verticalSpace,
            Row(
              children: [
                Text(
                  rate,
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                const Icon(
                  Icons.star_rate_rounded,
                  color: Color(0xffFFC107),
                ),
                const Icon(
                  Icons.star_rate_rounded,
                  color: Color(0xffFFC107),
                ),
                const Icon(
                  Icons.star_rate_rounded,
                  color: Color(0xffFFC107),
                ),
                const Icon(
                  Icons.star_rate_rounded,
                  color: Color(0xffFFC107),
                ),
                const Icon(
                  Icons.star_half_rounded,
                  color: Color(0xffFFC107),
                ),
                const Text(
                  "(89 reviews)",
                  style: TextStyle(
                      color: Color(0xff868889),
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            20.verticalSpace,
            Text(
              description,
              style: const TextStyle(
                  color: Color(0xff868889),
                  fontFamily: "Poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  height: 2),
            ),
            15.verticalSpace,
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Quantity",
                    style: TextStyle(
                        color: Color(0xff868889),
                        fontFamily: "Poppins",
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (amount.value > 0) {
                            amount.value--;
                          }
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Color(0xff6CC51D),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: amount,
                        builder: (context, value, child) => Container(
                          width: 60,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: const BoxDecoration(
                              border: Border.symmetric(
                                  vertical: BorderSide(
                                      color: Color(0xffEBEBEB), width: 1))),
                          child: Center(
                              child: Text(
                            "$value",
                            style: const TextStyle(
                                fontFamily: "Poppins", fontSize: 18),
                          )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          amount.value++;
                        },
                        child: const Icon(
                          Icons.add,
                          color: Color(0xff6CC51D),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            20.verticalSpace,
            MyButton(
              name: "Add to cart",
              onTap: () {},
            ),
          ]),
        )
      ]),
    );
  }
}
