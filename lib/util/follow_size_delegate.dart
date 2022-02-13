import 'package:flutter/material.dart';

enum FollowSizeId { leader, follower }

class FollowSize extends MultiChildLayoutDelegate {
  final bool followHeight;
  final bool followWidth;

  FollowSize({
    this.followHeight = true,
    this.followWidth = true,
  });

  @override
  void performLayout(Size size) {
    Size leaderSize = Size.zero;
    if (hasChild(FollowSizeId.leader)) {
      leaderSize = layoutChild(FollowSizeId.leader, BoxConstraints.loose(size));
      positionChild(FollowSizeId.leader, Offset.zero);
    }

    if (hasChild(FollowSizeId.follower)) {
      Size followerSize =
          layoutChild(FollowSizeId.follower, BoxConstraints.loose(size));
      positionChild(
          FollowSizeId.follower,
          Offset(size.width - followerSize.width,
              size.height - followerSize.height));
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}
