import 'package:flutter/cupertino.dart';
import 'package:skeletons/skeletons.dart';

class home_page_loader extends StatelessWidget {
  const home_page_loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SkeletonAvatar(
            style: SkeletonAvatarStyle(
                shape: BoxShape.rectangle, width: 160, height : 300),
          ),
        ),
        SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),
        SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),
        SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),
        SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),
        SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),
        SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),
        SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),
        SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),
        SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),
        SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),
        SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),
        SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),
        SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),
        SizedBox(width: 18,),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle, width: 160, height : 300),
        ),
        SizedBox(width: 18,)
      ],
    );
  }
}
