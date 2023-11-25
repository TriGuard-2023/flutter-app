import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../component/icons.dart';

// TOIMPROVE: 增加类似目录索引这样方便快速查找
class MedicinePage extends StatefulWidget {
  final String title;
  final String link;
  final int id;
  const MedicinePage(
      {super.key, required this.title, required this.link, required this.id});

  @override
  State<MedicinePage> createState() => _MedicinePageState();
}

class _MedicinePageState extends State<MedicinePage> {
  int _currentIndex = 0;
  bool addedCollection = false;
  Map medicineInfo = {};
  Map medicineInfo1 = {
    "id": 0,
    "name":
        "通用名称：辛伐他汀片\n英文名称：Simvastatin Tablets\n汉语拼音：Xinfatating Pian\n规格：10mg",
    "component":
        "本品活性成份为辛伐他汀。\n化学名称：2,2-二甲基丁酸(4R,6R)-6-[2-[(1S,2S,6R,8S,8aR) -1,2,6,7,8,8a-六氢-8-羟基-2,6-二甲基-1-萘基] 乙基]四氢-4-羟基-2H-吡喃-2-酮-8-酯。",
    "usage":
        "病人在接受辛伐他汀治疗以前应接受标准降胆固醇饮食并在治疗过程中继续维持。\n\n1．高胆固醇血症：\n一般起始剂量为每天10mg，晚间顿服。对于胆固醇水平轻至中度升高的患者，起始剂量为每天5mg。若需调整剂量，应间隔四周以上，最大剂量为每天40mg，晚间顿服。\n应定期监测胆固醇水平，如果胆固醇水平明显低于目标范围，应考虑减少辛伐他汀的剂量。\n\n2．冠心病：\n冠心病患者可以20mg/日为起始剂量，如需调整剂量，应间隔四周以上，最大剂量为每天40mg，晚间顿服。\n\n3．合并用药：\n辛伐他汀单独应用或与胆酸螯合剂协同应用时均有效。一般情况下应避免与贝特类或烟酸类药物同时应用。同时服用免疫抑制剂（如环孢菌素）的患者，辛伐他汀的起始剂量应为5mg/天，且不超过10mg/天。\n\n4．肾功能不全的病人：\n由于辛伐他汀主要经胆汁排泄，经肾脏排泄的量很少，故中度肾功能不全病人不必调整剂量。严重肾功能不全 (肌酐清除率＜30ml/分)的患者应慎用本品，此类病人的起始剂量应为5mg/天，当剂量超过10mg/天时，应严密监测。",
    "caution":
        "以下情况禁用：\n——对本品任何成份过敏者。\n——活动性肝病或无法解释的血清转氨酶持续升高者。\n——怀孕及哺乳期妇女。\n——禁止与四氢酚类钙通道阻滞剂米贝地尔合用。",
    "sideEffect":
        "辛伐他汀一般耐受性良好，大部分不良反应轻微且为一过性。在临床对照研究中不足2%的病人因辛伐他汀的不良反应而中途停药。\n\n在临床对照研究中，与药物有关的发生率≥1%的不良反应有腹痛、便秘、胃肠胀气，发生率在0.5%～0.9%的不良反应有疲乏无力、头痛。肌病的报告很罕见。\n\n在临床观察、上市后的应用中报道过下列不良反应：恶心、腹泻、皮疹、消化不良、瘙痒、脱发、晕眩、肌肉痉挛、肌痛、胰腺炎、感觉异常、外周神经病变、呕吐和贫血、横纹肌溶解和肝炎/黄疸罕有发生。\n\n包括下列一项或多项症状的明显的过敏反应综合症罕有报道：血管神经性水肿、狼疮样综合征、风湿性多发性肌痛、脉管炎、血小板减少症、嗜酸性粒细胞增多、ESR增高、关节炎、关节痛、荨麻疹、光敏感、发烧、潮红、呼吸困难以及不适。\n\n实验室检查发现：血清转氨酶显著和持续升高的情况罕有报道。曾报道有碱性磷酸酶和γ—谷氨酸转肽酶升高的情况。肝功能检查异常一般为轻微或一过性的。来源于骨骼肌的血清肌酸激酶(CK)升高的情况已有报道。\n\n他汀类药品的上市后监测中有高血糖反应、糖耐量异常、糖化血红蛋白水平升高、新发糖尿病、血糖控制恶化的报告，部分他汀类药品亦有低血糖反应的报告。\n\n上市后经验：他汀类药品的国外上市后监测中有罕见的认知障碍的报道，表现为记忆力丧失、记忆力下降、思维混乱等，多为非严重、可逆性反应，一般停药后即可恢复。",
    "interaction":
        "吉非贝齐和其它贝特类药物，降脂剂量（≥1g/天）的烟酸（尼克酸）：这些药物与辛伐他汀合用时发生肌病的危险性增加，可能是因为这些药物单独使用时均能引起肌病发生（请参阅注意事项，肌肉作用）。尚无证据显示这些药物对辛伐他汀的药代动力学有影响。\n\n与CYP3A4的相互作用：\n他汀类药物通过肝酶CYP3A4代谢，因此，理论上认为对该酶有抑制作用的药物，均可导致他汀类暴露量升高，增加包括横纹肌溶解在内的严重不良反应的发生风险。与他汀类可能产生相互作用的药物包括：HIV蛋白酶抑制剂、唑类抗真菌药（如伊曲康唑、酮康唑）、大环内酯类抗感染药（如红霉素、克拉霉素、泰利霉素）、贝特类调脂药（如吉非贝特、苯扎贝特）、烟酸、奈法唑酮、环孢素、胺碘酮、地尔硫卓、夫地西酸等。\n辛伐他汀无CYP3A4抑制活性，因此，推测它不影响其它经CYP3A4代谢的药物的血浆水平。然而，辛伐他汀本身是CYP3A4的底物。在辛伐他汀治疗期内，CYP3A4的强抑制剂可能通过增加血浆HMG-CoA还原酶抑制活性水平而增加肌病发生的危险性。这些强抑制剂包括环孢菌素、米贝地尔、伊曲康唑、酮康唑、红霉素、克拉霉素、HIV蛋白酶抑制剂及奈法唑酮（请参阅注意事项，肌肉作用）。",
    "expiry": "24个月",
    "condition": "遮光，密封，在阴凉处（不超过20℃）保存。",
    "image":
        "http://www.santao.com.cn/uploadfile/2019/0123/20190123010435930.jpg",
  };
  var token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJuYW1lIjoiYWRtaW4iLCJpZCI6MywiZXhwIjoxNzAxMDg2MTM1LCJpYXQiOjE3MDA4MjY5MzUsImp0aSI6IjkyYzBlOGNlLTBlNDMtNDBmNC05MmFjLWUwNmFmNDgwZDdjNyIsImF1dGhvcml0aWVzIjpbIlJPTEVfdXNlciJdfQ.vyD6DuOBUWDIiEoHh5IuY8Ri5Pmu5Qi-DjHp3hD8yVU';

  void fetchNShowMedicineInfo() async {
    try {
      final dio = Dio(); // Create Dio instance
      final headers = {
        'Authorization': 'Bearer $token',
      };
      final response = await dio.get(
          'http://43.138.75.58:8080/api/medicine/info?id=${widget.id}',
          options: Options(headers: headers));

      if (response.statusCode == 200) {
        //print(response.data);
        setState(() {
          medicineInfo = response.data["data"];
        });
      } else {
        //print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      //print('Request failed: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNShowMedicineInfo();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
              fontFamily: 'BalooBhai',
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w900),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, widget.link);
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
          const SizedBox(height: 10),
          SizedBox(
            width: screenWidth * 0.8,
            child: const Center(
                child: Text(
              "Medicine name",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  addedCollection = !addedCollection;
                });
              },
              icon: addedCollection ? MyIcons().starr() : MyIcons().star()),
          Container(
            height: screenHeight * 0.6,
            width: screenWidth,
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: ListView(children: [
              // 图片
              medicineInfo["image"] != null
                  ? Image.network(
                      medicineInfo["image"],
                      height: 150,
                    )
                  : Container(),
              const SizedBox(height: 30),
              // 药品名称
              medicineInfo["name"] != null
                  ? MedicineContent(
                      title: "药品名称", content: medicineInfo["name"])
                  : Container(),
              // 主要成分
              medicineInfo["component"] != null
                  ? MedicineContent(
                      title: "主要成分", content: medicineInfo["component"])
                  : Container(),
              // 用法用量
              medicineInfo["usage"] != null
                  ? MedicineContent(
                      title: "用法用量", content: medicineInfo["usage"])
                  : Container(),
              // 注意事项
              medicineInfo["caution"] != null
                  ? MedicineContent(
                      title: "注意事项", content: medicineInfo["caution"])
                  : Container(),
              // 不良反应
              medicineInfo["sideEffect"] != null
                  ? MedicineContent(
                      title: "不良反应", content: medicineInfo["sideEffect"])
                  : Container(),
              // 相互作用
              medicineInfo["interaction"] != null
                  ? MedicineContent(
                      title: "相互作用", content: medicineInfo["interaction"])
                  : Container(),
              // 有效期
              medicineInfo["expiry"] != null
                  ? MedicineContent(
                      title: "有效期", content: medicineInfo["expiry"])
                  : Container(),
              // 贮存条件
              medicineInfo["condition"] != null
                  ? MedicineContent(
                      title: "贮存条件", content: medicineInfo["condition"])
                  : Container()
            ]),
          ),
          const SizedBox(height: 10),
        ],
      )),

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

class MedicineContent extends StatelessWidget {
  final String title;
  final String content;
  const MedicineContent(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 2, color: Colors.black26),
      ],
    );
  }
}