import 'package:flutter/material.dart';
import 'package:netflix_clone_1/dummy_db.dart';
import 'package:netflix_clone_1/utils/constants/color_constants.dart';
import 'package:netflix_clone_1/utils/constants/image_constants.dart';
import 'package:netflix_clone_1/view/home_screen/home_screen.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.Mainblack,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Image.asset(
            ImageConstants.LOGO_PNG,
            height: 37.2,
          ),
          actions: [
            Icon(
              Icons.edit,
              color: ColorConstants.mainwhite,
            )
          ],
        ),
        body: Center(
            child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 90),
                shrinkWrap: true,
                itemCount: DummyDb.userlist.length + 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 100),
                itemBuilder: (context, index) {
                  if (index < DummyDb.userlist.length) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                      },
                      child: Column(children: [
                        Container(
                          child: Column(
                            children: [
                              Image.asset(
                                  DummyDb.userlist[index]["imagePath"]!),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          DummyDb.userlist[index]["name"]!,
                          style: TextStyle(color: Colors.white),
                        ),
                      ]),
                    );
                  } else {
                    return InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text("feauters not available")));
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(ImageConstants.Add_PNG),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Add profile",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                })));
  }
}
