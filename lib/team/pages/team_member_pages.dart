import 'package:flutter/material.dart';
import 'package:smp_app/team/model/member.dart';
import 'package:smp_app/team/resources/sizes.dart';
import 'package:smp_app/team/resources/text_styles.dart';
import 'package:smp_app/team/widgets/member_widget.dart';
import 'package:smp_app/ui/colors.dart';
class TeamMembersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(173, 216, 230, 1.0),
      appBar: AppBar(
        backgroundColor: Bgcolor,
        elevation: 0,
        title: Text(
          "Our Team".toUpperCase(),
          style: appBarTextStyle,
        ),
        centerTitle: true,
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(),
          ),
          Expanded(
            flex: 10,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: size_20,
                  );
                },
                itemBuilder: (context, index) {
                  return MemberWidget(
                    member: members[index],
                    compactMode: false,
                  );
                },
                itemCount: members.length),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
    );
  }
}
