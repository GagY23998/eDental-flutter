import 'package:flutter/material.dart';

class AboutTile extends StatelessWidget {
  const AboutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: ListView(
        children: [
          // Company Overview Section
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/aboutus-background1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Company Overview',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'eDental is a modern and innovative dental clinic that is committed to providing the highest quality dental care to our patients. Our team of experienced and skilled dentists, hygienists, and support staff are dedicated to creating a comfortable and welcoming environment for all of our patients.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // Our Mission Section
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/aboutus-background2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Our Mission',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Our mission is to help our patients achieve optimal oral health through personalized and comprehensive dental care. We strive to make every patient feel comfortable and well-cared for, and to build long-term relationships based on trust, respect, and quality care.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // Meet Our Team Section
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/aboutus-background3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Meet Our Team',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Our team of dentists, hygienists, and support staff is made up of highly skilled and compassionate professionals who are dedicated to providing exceptional care to our patients. We are committed to staying up-to-date with the latest advances in dental technology and techniques, and to providing a comfortable and welcoming environment for everyone who visits our clinic.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
