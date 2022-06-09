import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:products/business_logic/models/prd_product.dart';
import 'package:products/business_logic/models/prd_string_extension.dart';
import 'package:products/business_logic/prd_app_colors.dart';
import 'package:products/business_logic/prd_app_screens.dart';
import 'package:products/presentation/screens/prd_base_screen.dart';

import '../models/prd_product_details_view_model.dart';

class PRDProductDetailsScreen extends StatelessWidget {
  const PRDProductDetailsScreen(
      {Key? key, required this.product, this.goBack = false})
      : super(key: key);
  final PRDProduct product;
  final bool goBack;

  @override
  Widget build(BuildContext context) {
    GetIt.I<PRDProductDetailsViewModel>().checkFavorite(product);

    return PRDBaseScreen<PRDProductDetailsViewModel>(
        content: (context, child, model) {
      model.globalContext = context;
      return Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () {
            model.switchFavorite(product);
          },
          child: Container(
            height: 50,
            width: model.isFavorite ? 200 : 150,
            decoration: BoxDecoration(
                color: model.isFavorite
                    ? PRDAppColors.mainBlue.withOpacity(0.3)
                    : PRDAppColors.mainBlue,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
                child: Text(
              model.isFavorite
                  ? "Remove from favourites"
                  : "Mark as favourites",
              style: TextStyle(
                  color:
                      model.isFavorite ? PRDAppColors.mainBlue : Colors.white,
                  fontWeight: FontWeight.w700),
            )),
          ),
        ),
        body: NestedScrollView(
          floatHeaderSlivers: false,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                leading: IconButton(
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    goBack
                        ? Navigator.of(context).pop()
                        : Navigator.of(context)
                            .pushNamed(PRDAppScreens.products);
                  },
                ),
                backgroundColor: PRDAppColors.productBeigeBackground,
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                  color: PRDAppColors.productBeigeBackground,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 100, left: 20, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name.capitalize(),
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: PRDAppColors.deepPurple),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          SvgPicture.asset(
                              'assets/images/backgroundVector.svg'),
                          Image.network(
                            product.image,
                            width: 200,
                            errorBuilder: (context, error, stackTrace) =>
                                Center(
                                    child: Icon(
                              Icons.shopping_bag_outlined,
                              color: PRDAppColors.deepPurple,
                              size: 100,
                            )),
                            fit: BoxFit.fill,
                            alignment: Alignment.bottomRight,
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ),
            ];
          },
          body: Container(
            color: PRDAppColors.beigeBackground,
            child: Column(
              children: [
                Container(
                  height: 70,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 40, top: 8),
                        child: Column(
                          children: [
                            Text('Price'),
                            Text('\$' + product.price.toString())
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 40, top: 8),
                        child: Column(
                          children: [
                            Text('Available'),
                            Text(product.available.toString())
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Text(
                              "Description",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            product.description,
                            maxLines: 3,
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: PRDAppColors.deepPurple),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 20, top: 20),
                            child: Text(
                              "URL",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              model.openWebsite(product.url);
                            },
                            child: Row(
                              children: [
                                Text(
                                  product.url,
                                  maxLines: 3,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.blue),
                                ),
                                const Icon(
                                  Icons.link,
                                  color: Colors.blue,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20, top: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Category:  ",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  product.category,
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      color: PRDAppColors.deepPurple),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
