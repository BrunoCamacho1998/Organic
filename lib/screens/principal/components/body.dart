import 'package:flutter/material.dart';
import 'package:organic/constants/theme.dart';
import 'package:organic/models/product.dart';
import 'package:organic/models/user.dart';
import 'package:organic/screens/principal/components/recommend.dart';
import 'package:organic/util/queries/product/product_query.dart';

class Body extends StatefulWidget {
  final Function viewDetail;
  final UserLogin? user;

  const Body({Key? key, required this.viewDetail, this.user}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _BodyState createState() => _BodyState(viewDetail: viewDetail, user: user);
}

class _BodyState extends State<Body> {
  _BodyState({required this.viewDetail, this.user});

  final ProductQuery productQuery = ProductQuery();
  final Function viewDetail;
  UserLogin? user;

  List<Product> productos = <Product>[];

  bool loadingScreen = true;

  @override
  void initState() {
    setState(() {
      productQuery.getProducts().then((productos) {
        setState(() {
          this.productos.addAll(productos);
        });
      });

      // ignore: unnecessary_this
      this.loadingScreen = false;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Provee el tamaño total (height y width) de la pantalla
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 4,
                  offset: const Offset(1, 2),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Ingrese el nombre del producto',
                fillColor: Colors.white,
                filled: true,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
                suffixIcon: const Icon(Icons.search),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(color: Colors.grey.shade300)),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text(
                      'prueba',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w100),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'prueba',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'prueba',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'prueba',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'prueba',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'prueba',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Recomends(user: user, productos: productos, viewDetail: viewDetail),
          const SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
