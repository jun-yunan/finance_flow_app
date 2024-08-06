import 'package:finance_flow_app/components/transaction/dialog-add-transaction.dart';
import 'package:finance_flow_app/controllers/ProfileController.dart';
import 'package:finance_flow_app/screens/home/home-screen.dart';
import 'package:finance_flow_app/screens/profile/profile-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
    const ProfileScreen(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const DialogAddTransaction();
            },
          );
        },
        backgroundColor: const Color(0xff00D09E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        tooltip: "Add Transaction",
        child: const Icon(Icons.add),
      ),
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
            showSelectedLabels: false,
            backgroundColor: const Color(0xffDFF7E2),
            items: [
              BottomNavigationBarItem(
                backgroundColor: const Color(0xffDFF7E2),
                activeIcon: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xff00D09E),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: SvgPicture.asset('assets/icons/Home.svg'),
                ),
                icon: SvgPicture.asset('assets/icons/Home.svg'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: const Color(0xffDFF7E2),
                activeIcon: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xff00D09E),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: SvgPicture.asset('assets/icons/Analysis.svg'),
                ),
                icon: SvgPicture.asset('assets/icons/Analysis.svg'),
                label: 'Analysis',
              ),
              BottomNavigationBarItem(
                backgroundColor: const Color(0xffDFF7E2),
                activeIcon: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xff00D09E),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: SvgPicture.asset('assets/icons/Transactions.svg'),
                ),
                icon: SvgPicture.asset('assets/icons/Transactions.svg'),
                label: 'Transactions',
              ),
              BottomNavigationBarItem(
                backgroundColor: const Color(0xffDFF7E2),
                activeIcon: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xff00D09E),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: SvgPicture.asset('assets/icons/Category.svg'),
                ),
                icon: SvgPicture.asset('assets/icons/Category.svg'),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                backgroundColor: const Color(0xffDFF7E2),
                activeIcon: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xff00D09E),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: SvgPicture.asset('assets/icons/Profile.svg'),
                ),
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
