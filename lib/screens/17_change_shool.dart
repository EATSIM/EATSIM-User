import 'package:flutter/material.dart';
import '../widgets/app_bar_set.dart';
import '../widgets/17_change_school_widgets/school_search_box.dart';
import '../widgets/17_change_school_widgets/school_box.dart';

class ChangeSchoolScreen extends StatefulWidget {
  const ChangeSchoolScreen({Key? key}) : super(key: key);

  @override
  _ChangeSchoolScreenState createState() => _ChangeSchoolScreenState();
}

class _ChangeSchoolScreenState extends State<ChangeSchoolScreen> {
  String searchQuery = '';

  Future<List<String>> fetchSchools() async {
    List<String> allSchools = ['경일대학교', '대구가톨릭대학교', '대구대학교', '영남대학교'];
    return allSchools.where((school) => school.contains(searchQuery)).toList();
  }

  void onSearchChanged(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      appBar: const infoAppBar(title: 'Edit School'),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SchoolSearchBox(
              onSearchChanged: onSearchChanged,
            ),
          ),
          Expanded(
            child: FutureBuilder<List<String>>(
              future: fetchSchools(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('오류가 발생했습니다.'));
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return SchoolBox(schoolName: snapshot.data![index]);
                    },
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
