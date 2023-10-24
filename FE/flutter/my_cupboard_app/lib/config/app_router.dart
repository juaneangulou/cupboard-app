import 'package:go_router/go_router.dart';
import 'package:my_cupboard_app/features/auth/presentation/screens/login_screens.dart';
import 'package:my_cupboard_app/features/auth/presentation/screens/register_screen.dart';
import 'package:my_cupboard_app/features/products/screens/product_dasboard_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [

    ///* Auth Routes
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

    ///* Product Routes
    GoRoute(
      path: '/',
      builder: (context, state) => const ProductDashboardScreen(),
    ),
  ],
  ///! TODO: Bloquear si no se está autenticado de alguna manera
);