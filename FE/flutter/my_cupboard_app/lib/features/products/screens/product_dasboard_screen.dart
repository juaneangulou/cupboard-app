import 'package:flutter/material.dart';
import 'package:my_cupboard_app/features/shared/widgets/side_menu.dart';

class ProductDashboardScreen extends StatelessWidget {
  const ProductDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: SideMenu( scaffoldKey: scaffoldKey ),
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon( Icons.search_rounded)
          )
        ],
      ),
      body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox( height: 80 ),
              // Icon Banner
              const Icon( 
                Icons.production_quantity_limits_rounded, 
                color: Colors.white,
                size: 100,
              ),
              const SizedBox( height: 80 ),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(100)),
                ),
              )
            ],
          ),
        )
      );
  }
}