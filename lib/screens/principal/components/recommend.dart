import 'package:flutter/material.dart';
import 'package:organic/constants/theme.dart';
import 'package:organic/models/product.dart';
import 'package:organic/models/user.dart';

// ignore: must_be_immutable
class Recomends extends StatelessWidget {
  Recomends(
      {Key? key, this.user, required this.productos, required this.viewDetail})
      : super(key: key);

  final Function viewDetail;
  final UserLogin? user;

  List<Product> productos = <Product>[];

  int count = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: productos.asMap().entries.map((entry) {
          if (entry.key > 0) index = index + 2;

          if (count >= productos.length) return const SizedBox();

          count = count + 2;

          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              RecomendPlantCard(
                  country: "Perú",
                  product: productos[index],
                  press: viewDetail,
                  user: user),
              productos.length > count
                  ? RecomendPlantCard(
                      country: "Perú",
                      product: productos[index + 1],
                      press: viewDetail,
                      user: user)
                  : const SizedBox()
            ],
          );
        }).toList(),
      ),
    );
  }
}

class RecomendPlantCard extends StatelessWidget {
  const RecomendPlantCard(
      {Key? key,
      this.country,
      this.user,
      required this.press,
      required this.product})
      : super(key: key);

  final String? country;
  final Function press;
  final UserLogin? user;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: kDefaultPadding * 0.65,
        left: kDefaultPadding * 0.65,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 0.2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12),
      ),
      width: (MediaQuery.of(context).size.width / 1.8) - 50,
      height: 360,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          product.image != null
              ? Image.network(
                  product.image!,
                  height: 140,
                )
              : Container(
                  width: 150,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0.0),
                    color: kPrimaryColor,
                  ),
                ),
          Chip(
            backgroundColor: Colors.black87,
            labelPadding: const EdgeInsets.symmetric(horizontal: 10),
            label: Text(
              product.getPrice(),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          GestureDetector(
            onTap: () => press(6, product),
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              height: 70,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(0),
                alignment: Alignment.center,
                child: Text(
                  product.getName(),
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                  softWrap: true,
                  maxLines: 2,
                  textWidthBasis: TextWidthBasis.parent,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: Text(
              product.getDescription(),
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                  fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
              softWrap: true,
              maxLines: 2,
              textWidthBasis: TextWidthBasis.parent,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () => press(6, product),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(4),
              child: const Icon(Icons.info_outline, color: Colors.black),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.white60, width: 0.8)),
            ),
          ),
        ],
      ),
    );
  }
}
