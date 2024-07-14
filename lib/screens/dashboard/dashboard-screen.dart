import 'package:finance_flow_app/screens/home/home-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const Center(child: Text('Search Page')),
    const Center(child: Text('Profile Page')),
    const Center(child: Text('Profile Page')),
    const Center(child: Text('Profile Page')),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 25,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onTabTapped,
            backgroundColor: Color.fromARGB(255, 2, 82, 92),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/Home.svg'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/Analysis.svg'),
                label: 'Analysis',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/Transactions.svg'),
                label: 'Transactions',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/Category.svg'),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/Profile.svg'),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
