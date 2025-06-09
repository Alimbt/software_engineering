import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:my_website/screens/home_screen/widgets/about_me_body_widgets.dart';
import 'package:my_website/screens/home_screen/widgets/services_body_widgets.dart';
import 'package:my_website/screens/home_screen/widgets/welcome_body_widgets.dart';
import 'package:my_website/screens/home_screen/widgets/work_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userName;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserName();
  }

  Future<void> _fetchUserName() async {
    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        setState(() {
          userName = 'MBT.CODE';
          _isLoading = false;
        });
        return;
      }

      final response = await Supabase.instance.client
          .from('customer_information')
          .select('name')
          .eq('user_id', user.id)
          .maybeSingle();

      if (response != null && response['name'] != null) {
        setState(() {
          userName = response['name'];
          _isLoading = false;
        });
      } else {
        setState(() {
          userName = 'MBT.CODE';
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching user name: $e');
      setState(() {
        userName = 'MBT.CODE';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        title: _isLoading
            ? const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        )
            :  Row(
              children: [
                Text(
                            userName ?? 'MBT.CODE',
                            style: const TextStyle(fontFamily: 'Vazir'),
                          ),

              ],
            ),

        actions: [
       Row(
         children: [
           TextButton(
             child: const Text(
               'My Projects',
               style: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.bold,
                   fontSize: 18),
             ),
             onPressed: () {
               Navigator.pushNamed(context, '/projects');
             },
           ),
           SizedBox(
             width: MediaQuery.of(context).size.width * 0.05,
           ),
           TextButton(
             onPressed: () {
               Navigator.pushNamed(context, '/contact');
             },
             child: const Text(
               'Contact me',
               style: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.bold,
                   fontSize: 18),
             ),
           ),
           SizedBox(
             width: MediaQuery.of(context).size.width * 0.05,
           ),
           TextButton(
             child: const Text(
               'Register',
               style: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.bold,
                   fontSize: 18),
             ),
             onPressed: () {
               Navigator.pushNamed(context, '/login');
             },
           ),
         ],
       )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            welcomeBodyWidget().WelcomeBody(context),
            servicesBodyWidgets().ServicesBody(context),
            aboutMeWidgets().AboutMeBody(context),
            letsWorkWidgets().letsWorkBody(context),
          ],
        ),
      ),
    );
  }
}