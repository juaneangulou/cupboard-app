import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox( height: 80 ),
              // Icon Banner
              const Icon( 
                Icons.production_quantity_limits_rounded, 
                color: Color.fromARGB(255, 20, 20, 20),
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