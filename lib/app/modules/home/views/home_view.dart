import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_x_template/app/core/utils/translation_controller.dart';
import 'package:get_x_template/app/core/values/strings.dart';
import 'package:get_x_template/app/data/model/user.dart';
import 'package:get_x_template/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hello.tr),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
              Get.find<TranslationController>().updateLocale();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                  child: Text("Toggle Language"),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Obx((){
                return controller.isLoaded.isFalse
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                    itemCount: controller.users?.length,
                    itemBuilder: (context, index) {
                      return _buildItem(user: controller.users[index],);
                    });
              }))
        ],
      ),
    );
  }
}

class _buildItem extends StatelessWidget {
  const _buildItem({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(Routes.DETAIL, arguments: user);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        width: double.infinity,
        child: Row(
          children: [
            RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${user.username}\n",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                TextSpan(
                    text: user.email,
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.5
                    ),
                )
                  ]
                )),
            Spacer(),
            Text(
               user.phone,
              style: TextStyle(
                  fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
