import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<Map<String, String?>> _fetchUserNameImage() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return {'username': null, 'image_url': null};

    ///ACCESS DATA FROM CURRENT USER
    final currentUserData = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get();

    return {
      'username': currentUserData.data()?['username'],
      'image_url': currentUserData.data()?['image_url']
    };
  }

  ///VAR FOR URL IMG
  void _getUsername() async {}

  void _loadPhotoProfile() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Map<String, String?>>(
          future: _fetchUserNameImage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Text('Data not found');
            }

            final data = snapshot.data!;
            final String? username = data['username'];
            final String? imageUrl = data['image_url'];

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.blueGrey,
                  foregroundImage:
                      imageUrl != null ? NetworkImage(imageUrl) : null,
                  child: imageUrl == null
                      ? Icon(Icons.person, size: 60, color: Colors.white)
                      : null,
                ),
                SizedBox(height: 20),
                Text('Hellooo!', style: TextStyle(fontSize: 18)),
                Text(username ?? 'Unknown User',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                TextButton.icon(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  icon: Icon(Icons.logout),
                  label: Text('Sign Out'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
