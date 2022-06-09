import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:get_it/get_it.dart';
import 'package:products/business_logic/prd_app_colors.dart';
import 'package:products/presentation/screens/prd_base_screen.dart';
import 'package:products/presentation/widgets/prd_product_card.dart';
import '../models/prd_search_view_model.dart';

class PRDSearchcreen extends StatefulWidget {
  PRDSearchcreen({Key? key}) : super(key: key);

  @override
  State<PRDSearchcreen> createState() => _PRDSearchcreenState();
}

class _PRDSearchcreenState extends State<PRDSearchcreen> {
  @override
  void initState() {
    final model = GetIt.I<PRDSearchViewModel>();
    model.globalContext = context;
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      model.getAllProducts();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PRDBaseScreen<PRDSearchViewModel>(content: ((context, child, model) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: PRDAppColors.beigeBackground,
          title: SearchAppBar(
            model: model,
          ),
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          children: [
            for (var product in model.currentProducts)
              PRDProductCard(
                product: product,
                fromSearch: true,
              )
          ],
        ),
      );
    }));
  }
}

class SearchAppBar extends StatelessWidget {
  SearchAppBar({Key? key, required this.model}) : super(key: key);
  PRDSearchViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextField(
          style: TextStyle(color: PRDAppColors.deepPurple),
          onChanged: (value) {
            model.searchProducts(value);
          },
          decoration: const InputDecoration(
            hintText: "Search for products...",
            contentPadding: EdgeInsets.only(top: 40, left: 10),
            focusColor: Colors.white,
            suffixIconColor: Colors.grey,
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
