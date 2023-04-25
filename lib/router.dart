import 'package:go_router/go_router.dart';
import 'package:imagine_works/onboarding_screen.dart';
import 'package:imagine_works/responsive/desktop_layout.dart';
import 'package:imagine_works/responsive/mobile_layout.dart';
import 'package:imagine_works/responsive/responsive_layout.dart';
import 'package:imagine_works/responsive/tablet_layout.dart';

final GoRouter router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: "/",
      builder: (context, state) {
        return const ResponsiveLayout(
          tabletBody: TabletLayout(),
          mobileBody: MobileLayout(),
          desktopBody: DesktopLayout(),
        );
      }),
  GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const OnBoardingScreen())
]);
