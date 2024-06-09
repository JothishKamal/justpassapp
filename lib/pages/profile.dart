import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF102032),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.logout,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit_outlined,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://media.newyorker.com/photos/5aeb586479f6430aaa0f9d19/16:9/w_1280,c_limit/Wright-Kim-Jong-Un-Profile.jpg',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'KimmyBae Saathya',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      const Text(
                        '@KimmyBaesaathya',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Personal Goals',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 10),
                ..._buildPersonalGoals(),
                const SizedBox(height: 20),
                const Text(
                  'Personal Information',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 10),
                _buildPersonalInfo(
                    Icons.email_outlined, 'KimmyBaesaathya@gmail.com'),
                const SizedBox(height: 10),
                _buildPersonalInfo(Icons.phone_outlined, '+91 6969696969'),
                const SizedBox(height: 10),
                _buildPersonalInfo(Icons.cake_outlined, 'June 28, 2004'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPersonalGoals() {
    List<Map<String, dynamic>> goals = [
      {
        "text": "Make sure new haircut is perfectly symm",
        "isCompleted": true,
      },
      {
        "text": "Kimflix & chill with the squad",
        "isCompleted": false,
      },
      {
        "text": "Launch rocket: fireworks with neighbors",
        "isCompleted": false,
      },
      {
        "text": "Improve my interview skills for Tech. Eng.",
        "isCompleted": false,
      },
    ];

    return goals
        .map(
          (goal) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 0.46),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          goal['isCompleted']
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: goal['isCompleted']
                              ? Color(0xFF04DF00)
                              : Colors.white,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          goal['text'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFCECFD1),
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }

  Widget _buildPersonalInfo(IconData icon, String info) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          Text(
            info,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
