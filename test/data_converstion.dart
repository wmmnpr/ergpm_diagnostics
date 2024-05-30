import 'dart:convert';

import 'package:ergpm_diagnostics/main.dart';
import 'package:hex/hex.dart';

void main() {
  List<String> hexDataList = [
    "5f00002100007651000013014706990400000100",
    "e8000055000076517c0013014706990400000100",
    "39010078000082497c005a036207bf04af0e0200",
    "d90100bb0000824996005a036207bf04af0e0200",
    "220200dd000082419600f0037c07e1047a140300",
    "c7020024010082419a00f0037c07e1047a140300",
    "0f030047010085419a002a040b082d0570170400",
    "c203009701008541a5002a040b082d0570170400",
    "0a0400ba01008540a500780466082b05191a0500",
    "bb04000802008540a400780466082b05191a0500",
    "0505002c02008842a4007804f007fc04281a0600",
    "b0050079020088429e007804f007fc04281a0600",
    "f805009c020085409e005a042f08160580190700",
    "af0600ed02008540ab005a042f08160580190700",
    "fb06001103008843ab009004ee07eb04631a0800",
    "ac07005f03008843a7009004ee07eb04631a0800",
    "f507008203008240a7006804d807d5041e190900",
    "a10800cd03008240a0006804d807d5041e190900",
    "0000000000000000000000000000000000000000",
  ];

  for (String hexData in hexDataList) {
    List<int> buffer = HEX.decode(hexData);
    StrokeData strokeData = intListToStrokeData(buffer);
    var jsonStrokeData = json.encode(strokeData.toJson());
    print(jsonStrokeData);
  }
}
