import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/profile_page_controller.dart';
import '../../widgets/home/custom_title.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePageControllerImpl>(
        builder: (controller) => FutureBuilder(
              future: controller.fetchUserProfile(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CustomTitle(
                        titleText: "Profile",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      controller.userModel?.image == null
                          ? Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                              ),
                            )
                          : SizedBox(
                              width: 150,
                              height: 150,
                              child: Image.network(
                                "https://th.bing.com/th/id/R.f48ceff9ab3322d4e84ed12a44c484d1?rik=0KQ6OgL4T%2b9uCA&riu=http%3a%2f%2fwww.photo-paysage.com%2falbums%2fuserpics%2f10001%2fCascade_-15.JPG&ehk=kx1JjE9ugj%2bZvUIrjzSmcnslPc7NE1cOnZdra%2f3pJEM%3d&risl=1&pid=ImgRaw&r=0",
                                fit: BoxFit.cover,
                              )),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Username"),
                          Text("${controller.userModel?.username}"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Email"),
                          Text("${controller.userModel!.email}"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Phone"),
                          Text("${controller.userModel?.phone}"),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ));
  }
}
