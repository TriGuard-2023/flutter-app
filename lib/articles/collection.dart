import 'package:flutter/material.dart';
import '../component/icons.dart';

// TOINTERACT: 增加var列表，用来保存内容页面需要展示的内容（图片、文字等）
// TOINTERACT: 增加bool变量记录文章是否被收藏
class ArticleInfo {
  final String title;
  final String content;
  final String imagePath;
  ArticleInfo(
      {required this.title, required this.content, required this.imagePath});
}

// TOIMPROVE: 返回收藏页面的时候保持在上次选的模块
class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  int _currentIndex = 0;
  var classSelected = <bool>[true, false, false, false];
  int curSelected = 0;
  var medicineArticleList = <ArticleInfo>[
    ArticleInfo(title: "Medicine 1", content: "", imagePath: ""),
    ArticleInfo(title: "Medicine 2", content: "", imagePath: ""),
    ArticleInfo(title: "Medicine 3", content: "", imagePath: ""),
    ArticleInfo(title: "Medicine 4", content: "", imagePath: ""),
  ];
  var foodArticleList = <ArticleInfo>[
    ArticleInfo(title: "Food 1", content: "", imagePath: ""),
    ArticleInfo(title: "Food 2", content: "", imagePath: ""),
    ArticleInfo(title: "Food 3", content: "", imagePath: ""),
    ArticleInfo(title: "Food 4", content: "", imagePath: ""),
    ArticleInfo(title: "Food 5", content: "", imagePath: ""),
  ];
  var preventionArticleList = <ArticleInfo>[
    ArticleInfo(
        title: "Title 5",
        content: "This is the fifth content...",
        imagePath:
            "https://images.nintendolife.com/3e199ccf1141f/doraemon-nobitars-little-star-wars-2021.large.jpg"),
    ArticleInfo(
        title: "Title 9",
        content: "This is the ninth content...",
        imagePath:
            "https://www.billboard.com/wp-content/uploads/2023/06/Oreo-x-Nintendo-billboard-1548.jpg?w=942&h=623&crop=1"),
  ];
  var scienceArticleList = <ArticleInfo>[
    ArticleInfo(
        title: "Title 7",
        content: "This is the seventh content...",
        imagePath:
            "https://news.cgtn.com/news/3049544e7751544f776b7a4e3249444f776b7a4e31457a6333566d54/img/dbc2bed8083940c4a70ca53dc7e784a2/dbc2bed8083940c4a70ca53dc7e784a2.jpg"),
    ArticleInfo(
        title: "Title 3",
        content: "This is the third content...",
        imagePath:
            "https://images.unsplash.com/photo-1576622085773-4eb399076362?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bWVycnklMjBnbyUyMHJvdW5kfGVufDB8fDB8fHww"),
    ArticleInfo(
        title: "Title 2",
        content: "This is the second content...",
        imagePath:
            "https://assets-global.website-files.com/61eaa3470cc7de3ef77364b3/651430a63005ee02c2bab489_istockphoto-1270902491-170667a.jpg"),
  ];
  var medicineTileList = <NonArticleTile>[];
  var foodTileList = <NonArticleTile>[];
  var preventionTileList = <ArticleTile>[];
  var scienceTileList = <ArticleTile>[];

  void clearTileList() {
    medicineTileList.clear();
    foodTileList.clear();
    scienceTileList.clear();
    preventionTileList.clear();
  }

  void createMedicineTileList() {
    for (int i = 0; i < medicineArticleList.length; ++i) {
      medicineTileList.add(NonArticleTile(
          articleList: medicineArticleList[i],
          linkpath: '/articles/collection/medicinepage'));
    }
  }

  void createFoodTileList() {
    for (int i = 0; i < foodArticleList.length; ++i) {
      foodTileList.add(NonArticleTile(
          articleList: foodArticleList[i],
          linkpath: '/articles/collection/foodsearchpage'));
    }
  }

  void createScienceTileList() {
    for (int i = 0; i < scienceArticleList.length; ++i) {
      scienceTileList.add(ArticleTile(articleList: scienceArticleList[i]));
    }
  }

  void createPreventionTileList() {
    for (int i = 0; i < preventionArticleList.length; ++i) {
      preventionTileList
          .add(ArticleTile(articleList: preventionArticleList[i]));
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    clearTileList();
    createMedicineTileList();
    createFoodTileList();
    createScienceTileList();
    createPreventionTileList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "我的收藏",
          style: TextStyle(
              fontFamily: 'BalooBhai',
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w900),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/articles');
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            )),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 250, 209, 252),
              Color.fromARGB(255, 255, 255, 255),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        ),
      ),

      // 主体内容
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ToggleButtons(
              fillColor: const Color.fromARGB(255, 250, 209, 252),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              color: Colors.black38,
              selectedColor: Colors.black,
              borderRadius: BorderRadius.circular(15),
              constraints: BoxConstraints.expand(
                  width: screenWidth * 0.85 * 0.25,
                  height: screenHeight * 0.06),
              isSelected: classSelected,
              children: const [
                Text("用药指南"),
                Text("食物参数"),
                Text("疾病预防"),
                Text("科普文章"),
              ],
              onPressed: (index) {
                setState(() {
                  classSelected[curSelected] = false;
                  classSelected[index] = true;
                  curSelected = index;
                });
              },
            ),
            SizedBox(
              height: screenHeight * 0.65,
              width: screenWidth * 0.88,
              child: ListView(
                children: [
                  Visibility(
                      visible: classSelected[0],
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: medicineTileList,
                      )),
                  Visibility(
                      visible: classSelected[1],
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: foodTileList,
                      )),
                  Visibility(
                      visible: classSelected[2],
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: preventionTileList,
                      )),
                  Visibility(
                      visible: classSelected[3],
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: scienceTileList,
                      ))
                ],
              ),
            )
          ],
        ),
      ),

      // 下方导航栏
      bottomNavigationBar: BottomNavigationBar(
        //被点击时
        // if index == 0, when press the icon, change the icon "home.png" to "home_.png"

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        currentIndex: _currentIndex, //被选中的
        // https://blog.csdn.net/yechaoa/article/details/89852488
        type: BottomNavigationBarType.fixed,
        // iconSize: 24,
        fixedColor: Colors.black, //被选中时的颜色
        selectedFontSize: 12, // Set the font size for selected label
        unselectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
              //https://blog.csdn.net/qq_27494241/article/details/107167585?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-1-107167585-blog-85248876.235^v38^pc_relevant_default_base3&spm=1001.2101.3001.4242.2&utm_relevant_index=4
              // https://stackoverflow.com/questions/60151052/can-i-add-spacing-around-an-icon-in-flutter-bottom-navigation-bar
              icon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                  child: _currentIndex == 0
                      ? MyIcons().home_()
                      : MyIcons().home()),
              label: "首页"),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                  child: _currentIndex == 1
                      ? MyIcons().article_()
                      : MyIcons().article()),
              label: "文章"),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                  child: _currentIndex == 2
                      ? MyIcons().supervisor_()
                      : MyIcons().supervisor()),
              label: "监护"),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                  child: _currentIndex == 3
                      ? MyIcons().moment_()
                      : MyIcons().moment()),
              label: "动态"),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                  child: _currentIndex == 4
                      ? MyIcons().user_()
                      : MyIcons().user()),
              label: "我的"),
        ],
      ),
    );
  }
}

// TOINTERACT: 在跳转去内容页面时，先设置好要展示的内容
class ArticleTile extends StatelessWidget {
  final ArticleInfo articleList;

  const ArticleTile({super.key, required this.articleList});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      shadowColor: Colors.black87,
      elevation: 6,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/articles/collection/articlepage');
        },
        child: ListTile(
          minVerticalPadding: 15,
          title: Text(articleList.title, maxLines: 1),
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.w900, color: Colors.black, fontSize: 20),
          subtitle: Text(articleList.content, maxLines: 1),
          leading: Container(
            height: 55,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: AspectRatio(
              aspectRatio: 1.6,
              child: Image.network(articleList.imagePath, fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}

// TOINTERACT: 在跳转去内容页面时，先设置好要展示的内容
class NonArticleTile extends StatelessWidget {
  final ArticleInfo articleList;
  final String linkpath;

  const NonArticleTile(
      {super.key, required this.articleList, required this.linkpath});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      shadowColor: Colors.black87,
      elevation: 6,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, linkpath);
        },
        child: ListTile(
          minVerticalPadding: 15,
          title: Text(articleList.title, maxLines: 1),
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.w900, color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
