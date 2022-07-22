
import 'package:firebaseapp/screens/Profile.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class HomeBlog extends StatefulWidget {
  @override
  State<HomeBlog> createState() => _HomeBlogState();
}

class _HomeBlogState extends State<HomeBlog> {
  bool isLiked = false;
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Xứ Đoàn'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: const CircleAvatar(
              minRadius: 20.0,
              backgroundColor: Colors.red,
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://scontent.fhan5-9.fna.fbcdn.net/v/t1.6435-9/120030859_713751182560106_6892642878029460142_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=0debeb&_nc_ohc=eHsNMYJf2V8AX8rtWak&tn=xd-1EaoIqK55SmC8&_nc_ht=scontent.fhan5-9.fna&oh=00_AT9XkLChGy8MysQaFe_SuVlj0HSQweEdxolx8TGV2-hhcQ&oe=62E58E58'),
                radius: 20.0,
              ),
            ),
          ),
        ],
      ),

      body: ListView(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22.0,
                      backgroundColor: Colors.red,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('https://scontent.fhan5-9.fna.fbcdn.net/v/t1.6435-9/120030859_713751182560106_6892642878029460142_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=0debeb&_nc_ohc=eHsNMYJf2V8AX8rtWak&tn=xd-1EaoIqK55SmC8&_nc_ht=scontent.fhan5-9.fna&oh=00_AT9XkLChGy8MysQaFe_SuVlj0HSQweEdxolx8TGV2-hhcQ&oe=62E58E58'),
                        radius: 20.0,
                      ),
                    ),
                    Expanded(
                        child: Card(
                          child: ClipPath(
                            clipper: ShapeBorderClipper(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3))),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: Colors.greenAccent, width: 5),
                                ),
                              ),
                              child: Text('Xứ Đoàn TNTT Giáo xứ Dương Cước được thành lập vào ngày 27/7/2014, đến nay đã đc 8 năm.'),
                            ),
                          ),
                        )
                    ),
                    LikeButton(
                      size: 20,
                      isLiked: isLiked,
                      likeCount: likeCount,
                      likeBuilder: (isLiked) {
                        final color = isLiked ? Colors.red : Colors.grey;

                        return Icon(Icons.favorite, color: color, size: 20);
                      },
                      likeCountPadding: EdgeInsets.only(left: 12),
                      countBuilder: (count, isLiked, text) {
                        final color = (isLiked) ? Colors.red : Colors.grey;
                        
                        return Text(
                          text,
                          style: TextStyle(
                            color: color,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        );
                      },

                      onTap: (isLiked) async {
                        this.isLiked = !isLiked;
                        likeCount += (this.isLiked ? 1 : -1);

                        return !isLiked;
                      },
                    )
                  ],
                ),
                Divider(
                  height: 30.0,
                  color: Colors.grey[800],
                ),
                Row(

                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22.0,
                      backgroundColor: Colors.red,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('https://scontent.fhan5-9.fna.fbcdn.net/v/t1.6435-9/120030859_713751182560106_6892642878029460142_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=0debeb&_nc_ohc=eHsNMYJf2V8AX8rtWak&tn=xd-1EaoIqK55SmC8&_nc_ht=scontent.fhan5-9.fna&oh=00_AT9XkLChGy8MysQaFe_SuVlj0HSQweEdxolx8TGV2-hhcQ&oe=62E58E58'),
                        radius: 20.0,
                      ),
                    ),
                    Expanded(
                        child: Card(
                          child: ClipPath(
                            clipper: ShapeBorderClipper(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3))),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: Colors.greenAccent, width: 5),
                                ),
                              ),
                              child: Text('Xứ Đoàn TNTT Giáo xứ Dương Cước được thành lập vào ngày 27/7/2014, đến nay đã đc 8 năm.'),
                            ),
                          ),
                        )
                    ),
                    LikeButton(
                      size: 20,
                      isLiked: isLiked,
                      likeCount: likeCount,
                      likeBuilder: (isLiked) {
                        final color = isLiked ? Colors.red : Colors.grey;

                        return Icon(Icons.favorite, color: color, size: 20);
                      },
                      likeCountPadding: EdgeInsets.only(left: 12),
                      countBuilder: (count, isLiked, text) {
                        final color = (isLiked) ? Colors.red : Colors.grey;

                        return Text(
                          text,
                          style: TextStyle(
                              color: color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        );
                      },

                      onTap: (isLiked) async {
                        this.isLiked = !isLiked;
                        likeCount += (this.isLiked ? 1 : -1);

                        return !isLiked;
                      },
                    )
                  ],
                ),
                Divider(
                  height: 30.0,
                  color: Colors.grey[800],
                ),
                Row(

                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22.0,
                      backgroundColor: Colors.red,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('https://scontent.fhan5-9.fna.fbcdn.net/v/t1.6435-9/120030859_713751182560106_6892642878029460142_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=0debeb&_nc_ohc=eHsNMYJf2V8AX8rtWak&tn=xd-1EaoIqK55SmC8&_nc_ht=scontent.fhan5-9.fna&oh=00_AT9XkLChGy8MysQaFe_SuVlj0HSQweEdxolx8TGV2-hhcQ&oe=62E58E58'),
                        radius: 20.0,
                      ),
                    ),
                    Expanded(
                        child: Card(
                          child: ClipPath(
                            clipper: ShapeBorderClipper(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3))),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: Colors.greenAccent, width: 5),
                                ),
                              ),
                              child: Text('Xứ Đoàn TNTT Giáo xứ Dương Cước được thành lập vào ngày 27/7/2014, đến nay đã đc 8 năm.'),
                            ),
                          ),
                        )
                    ),
                    LikeButton(
                      size: 20,
                      isLiked: isLiked,
                      likeCount: likeCount,
                      likeBuilder: (isLiked) {
                        final color = isLiked ? Colors.red : Colors.grey;

                        return Icon(Icons.favorite, color: color, size: 20);
                      },
                      likeCountPadding: EdgeInsets.only(left: 12),
                      countBuilder: (count, isLiked, text) {
                        final color = (isLiked) ? Colors.red : Colors.grey;

                        return Text(
                          text,
                          style: TextStyle(
                              color: color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        );
                      },

                      onTap: (isLiked) async {
                        this.isLiked = !isLiked;
                        likeCount += (this.isLiked ? 1 : -1);

                        return !isLiked;
                      },
                    )
                  ],
                ),
                Divider(
                  height: 30.0,
                  color: Colors.grey[800],
                ),
                Row(

                ),
              ],
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeBlog()));
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.black,
              onPressed: () {},
            ),
            const SizedBox(
              width: 40,
            ),
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.account_box),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

}