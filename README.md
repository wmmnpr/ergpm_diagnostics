# ergpm_diagnostics

# usage
Execute step 1 and 2. Notice, in screenshot, which characteristics are selected.
![Alt text](doc/howto-use-simple.png)

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.




open -a Wireshark

# get just value
jq ' .["layers"]["btatt"]["btatt.value"]' pm5-ergdata-airplus-extract.json
# get both handle and value
jq  ' .[]["_source"]["layers"]["btatt"] | {handle: .["btatt.handle"], value: .["btatt.value"]}' pm5-ergdata-airplus-extract.json
# get uuid 
jq  ' .[]["_source"]["layers"]["btatt"] | {uuid128: .["btatt.handle_tree"]["btatt.uuid128"], value: .["btatt.value"]}' pm5-ergdata-airplus-extract.json
# couunt number of different uuid referenced
jq  'group_by(.["_source"]["layers"]["btatt"]["btatt.handle_tree"]["btatt.uuid128"]) | map({uuid128: .[0]["_source"]["layers"]["btatt"]["btatt.handle_tree"]["btatt.uuid128"], count: length})' pm5-ergdata-airplus-extract.json

jq  '.[]["_source"]["layers"]["btatt"]["btatt.handle_tree"]["btatt.uuid128"]'





echo '[{"name": "Alice", "age": 30}, {"name": "Bob"}, {"name": "Charlie", "age": 25}]' | jq 'map(.[]["age"]) // 0) | .[]["age"]'


f18686f2
f18787f2
f1210301002201f2
f11a0705058064000000f9f2
f12402000026f2
f18585f2



          "btatt.handle": "0x0013",
          "btatt.handle_tree": {
            "btatt.service_uuid128": "ce:06:00:20:43:e5:11:e4:91:6c:08:00:20:0c:9a:66",
            "btatt.uuid128": "ce:06:00:21:43:e5:11:e4:91:6c:08:00:20:0c:9a:66"
          },
          "btatt.value": "f0:fd:00:76:09:22:07:0a:26:01:06:07:07:e8:99:f2"
        }


          "btatt.handle": "0x0010",
          "btatt.handle_tree": {
            "btatt.service_uuid128": "ce:06:00:20:43:e5:11:e4:91:6c:08:00:20:0c:9a:66",
            "btatt.uuid128": "ce:06:00:22:43:e5:11:e4:91:6c:08:00:20:0c:9a:66"
          },
          "btatt.value": "f0:00:fd:81:7e:09:85:07:0a:25:01:06:07:07:e8:b4:f2"
        }


send get horizotal
Horizontal: f101a10300002487f2
send get horizotal
Horizontal: f181a10300002407f2
send get horizotal
Horizontal: f101a10300002487f2
clicked _handleSetupWorkout
Horizontal: f11111f2
Horizontal: f18181f2
Horizontal: f10101f2
Horizontal: f1811a009bf2
Horizontal: f10101f2
Horizontal: f18585f2
send get horizotal
Horizontal: f105a10300002483f2
send get horizotal
Horizontal: f185a10316002415f2
send get horizotal
Horizontal: f105a1031900249af2


f1 
05 a1 03 19 00 24 => 9a
f2




f107a103640024e5f2


F1 76 6F 18 01 00 01 01 08 17 01 01 03 05 80 00
00 01 F4 04 02 00 3C 06 04 00 00 27 10 14 01 01
18 01 01 17 01 00 03 05 00 00 00 46 50 04 02 00 
00 06 04 00 00 27 10 14 01 01 18 01 02 17 01 01
03 05 80 00 00 03 E8 04 02 00 00 06 04 00 00 27
10 14 01 01 18 01 03 17 01 00 03 05 00 00 00 75
30 04 02 00 78 06 04 00 00 27 10 14 01 01 13 02
01 01 C6 F2



sudo log config --mode "level:info" --subsystem com.apple.bluetooth --category transport
sudo log stream --predicate 'subsystem == "com.apple.bluetooth"' --info



















an] <private> allowDupes:0, agentAllowDupes:1, active:0
2024-06-02 10:42:49.537071+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> active 0
2024-06-02 10:42:49.537126+0200 0x152ccb   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] session <private> asked to scan with usecase FindMyNotOptedIn screenOn:1 entry:<private>
2024-06-02 10:42:49.537178+0200 0x152ccb   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] canScanNow session:<private>(FindMyNotOptedIn) allowed:1  deviceLocked:0 deviceFirstUnlocked:1 allowedInBKG:1 sessionState:daemon <private>
2024-06-02 10:42:49.537204+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] state 32
2024-06-02 10:42:49.537276+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] Findmy usecase "FindMyNotOptedIn" is asking for duplicates? No
2024-06-02 10:42:49.537304+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> allowDupes:0, agentAllowDupes:0, active:0
2024-06-02 10:42:49.537327+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> active 0
2024-06-02 10:42:49.537366+0200 0x152ccb   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] session <private> asked to scan with usecase FindMyNotOptedIn screenOn:1 entry:<private>
2024-06-02 10:42:49.537414+0200 0x152ccb   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] canScanNow session:<private>(FindMyNotOptedIn) allowed:1  deviceLocked:0 deviceFirstUnlocked:1 allowedInBKG:1 sessionState:daemon <private>
2024-06-02 10:42:49.537436+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] state 32
2024-06-02 10:42:49.537551+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] Findmy usecase "FindMyNotOptedIn" is asking for duplicates? No
2024-06-02 10:42:49.537579+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> allowDupes:0, agentAllowDupes:0, active:0
2024-06-02 10:42:49.537626+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> active 0
2024-06-02 10:42:49.537723+0200 0x152ccb   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] canScanNow session:<private>(Unspecified) allowed:1  deviceLocked:0 deviceFirstUnlocked:1 allowedInBKG:1 sessionState:daemon <private>
2024-06-02 10:42:49.537749+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] state 32
2024-06-02 10:42:49.537770+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] Upgrading <private> to active scan hasZoneScan:0 hasMatchingRulesScan:0
2024-06-02 10:42:49.537986+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> allowDupes:0, agentAllowDupes:0, active:1
2024-06-02 10:42:49.538008+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> active 0
2024-06-02 10:42:49.538049+0200 0x152ccb   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] canScanNow session:<private>(Unspecified) allowed:1  deviceLocked:0 deviceFirstUnlocked:1 allowedInBKG:1 sessionState:daemon <private>
2024-06-02 10:42:49.538077+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] state 32
2024-06-02 10:42:49.538122+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> allowDupes:0, agentAllowDupes:0, active:0
2024-06-02 10:42:49.538142+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> active 0
2024-06-02 10:42:49.538182+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] ScanParams: numScanAgents 5, combined params AD:0 AS:0 MSL:3 (30/300) PSV:1
2024-06-02 10:42:49.538212+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] ScanParams: [com.apple.bluetoothd-central-62824-27] AP:0 AD:1(30/300) AS:0 RAS:0 DMN:1 FG:0 ADVBF:0 pBT:0|[com.apple.locationd-central-349-6] AP:0 AD:0(30/300) AS:0 RAS:0 DMN:1 FG:0 ADVBF:0 pBT:0|[com.apple.locationd-central-349-8] AP:0 AD:0(30/300) AS:0 RAS:0 DMN:1 FG:0 ADVBF:0 pBT:0
2024-06-02 10:42:49.538236+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] ScanParams: [com.apple.bluetoothd-central-62824-29] AP:0 AD:0(30/966) AS:0 RAS:0 DMN:1 FG:0 ADVBF:0 pBT:0|[CBDaemon-0xB364001E] AP:0 AD:0(30/300) AS:0 RAS:0 DMN:1 FG:0 ADVBF:0 pBT:0
2024-06-02 10:42:49.539563+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] Returning scan parameters: Main:30.00ms/300.00ms LP:0.00ms/300.00ms(supported) SC:0.00ms/50.00ms/non-concurrent(supported) Dm:(m:30/300) Cond:0:1:0 Sc:1 (passive) Dupfilter:Enabled minScanLevel:3 ENAssertion:N Pri:0/0
2024-06-02 10:42:49.539830+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] needToRestart=1
2024-06-02 10:42:49.540042+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] Starting passive scan (300.00ms/30.00ms) with duplicate filter enabled scNeed=0 stateO=0, retainDups=0 fScanFiltersNeedUpdating=NO
2024-06-02 10:42:49.540093+0200 0x152ccb   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] canScanNow session:<private>(Unspecified) allowed:1  deviceLocked:0 deviceFirstUnlocked:1 allowedInBKG:1 sessionState:daemon <private>
2024-06-02 10:42:49.540166+0200 0x152ccb   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] canScanNow session:<private>(FindMyNotOptedIn) allowed:1  deviceLocked:0 deviceFirstUnlocked:1 allowedInBKG:1 sessionState:daemon <private>
2024-06-02 10:42:49.540204+0200 0x152ccb   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] canScanNow session:<private>(FindMyNotOptedIn) allowed:1  deviceLocked:0 deviceFirstUnlocked:1 allowedInBKG:1 sessionState:daemon <private>
2024-06-02 10:42:49.540254+0200 0x152ccb   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] canScanNow session:<private>(Unspecified) allowed:1  deviceLocked:0 deviceFirstUnlocked:1 allowedInBKG:1 sessionState:daemon <private>
2024-06-02 10:42:49.540292+0200 0x152ccb   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] canScanNow session:<private>(Unspecified) allowed:1  deviceLocked:0 deviceFirstUnlocked:1 allowedInBKG:1 sessionState:daemon <private>
2024-06-02 10:42:49.540336+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] overrideEnableGlobalDupFilter:1
2024-06-02 10:42:49.540387+0200 0x152ccb   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.Core] Sending: BT_VSC_OLYMPIC_SET_RETAIN_LE_SCAN_DUPLICATES_ON_START
2024-06-02 10:42:49.540426+0200 0x152ccb   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.Core] VSC BT_VSC_OLYMPIC_SET_RETAIN_LE_SCAN_DUPLICATES_ON_START, not supported
2024-06-02 10:42:49.540561+0200 0x152ccb   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.BTDaemon] <private>
2024-06-02 10:42:49.550078+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] Scanning started successfully
2024-06-02 10:42:49.550150+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] canScanNow session:<private>(Unspecified) allowed:1  deviceLocked:0 deviceFirstUnlocked:1 allowedInBKG:1 sessionState:daemon <private>
2024-06-02 10:42:49.550178+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] ShouldScan=1 AnyValidScanRequests=1 anyValidScanRequestInPaused=0 fObserverState=Active ClientScanPowerAssertRequired=0 fScanFiltersNeedUpdagint=0
2024-06-02 10:42:49.550206+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] updateADVBufferConfig current:00 new:00 configChanged:00
2024-06-02 10:42:49.550232+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] enableObjectDiscoveryADVBuffersIfNeeded objectDiscoveryHwAdvBufferOnly:0 fScreenState:1
2024-06-02 10:42:49.550259+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] AOPBTBUFF config current:0 new:0 configChanged:0
2024-06-02 10:42:49.550284+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] enableAOPBTBuffersIfNeeded haveAnyHwAOPBTBufferRequests:0 fScreenState:1 fAOPBTBufferReadInProgress:0
2024-06-02 10:42:49.550340+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] updateAgentScanUseCaseEntry controllerSupportsScanRx:0 session:<private> usecase:FindMyNotOptedIn previous:<private> entry:<private>
2024-06-02 10:42:49.550403+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] updateAgentScanUseCaseEntry controllerSupportsScanRx:0 session:<private> usecase:FindMyNotOptedIn previous:<private> entry:<private>
2024-06-02 10:42:49.550464+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] canScanNow session:<private>(Unspecified) allowed:1  deviceLocked:0 deviceFirstUnlocked:1 allowedInBKG:1 sessionState:daemon <private>
2024-06-02 10:42:49.550487+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] state 32
2024-06-02 10:42:49.550545+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> allowDupes:0, agentAllowDupes:1, active:0
2024-06-02 10:42:49.550568+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> active 0
2024-06-02 10:42:49.550618+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] session <private> asked to scan with usecase FindMyNotOptedIn screenOn:1 entry:<private>
2024-06-02 10:42:49.550668+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] canScanNow session:<private>(FindMyNotOptedIn) allowed:1  deviceLocked:0 deviceFirstUnlocked:1 allowedInBKG:1 sessionState:daemon <private>
2024-06-02 10:42:49.550692+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] state 32
2024-06-02 10:42:49.550723+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] Findmy usecase "FindMyNotOptedIn" is asking for duplicates? No
2024-06-02 10:42:49.550750+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> allowDupes:0, agentAllowDupes:0, active:0
2024-06-02 10:42:49.550781+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> active 0
2024-06-02 10:42:49.550824+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] session <private> asked to scan with usecase FindMyNotOptedIn screenOn:1 entry:<private>
2024-06-02 10:42:49.550872+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] canScanNow session:<private>(FindMyNotOptedIn) allowed:1  deviceLocked:0 deviceFirstUnlocked:1 allowedInBKG:1 sessionState:daemon <private>
2024-06-02 10:42:49.550898+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] state 32
2024-06-02 10:42:49.550926+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] Findmy usecase "FindMyNotOptedIn" is asking for duplicates? No
2024-06-02 10:42:49.550983+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> allowDupes:0, agentAllowDupes:0, active:0
2024-06-02 10:42:49.551032+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> active 0
2024-06-02 10:42:49.551096+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] canScanNow session:<private>(Unspecified) allowed:1  deviceLocked:0 deviceFirstUnlocked:1 allowedInBKG:1 sessionState:daemon <private>
2024-06-02 10:42:49.551121+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] state 32
2024-06-02 10:42:49.551164+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] Upgrading <private> to active scan hasZoneScan:0 hasMatchingRulesScan:0
2024-06-02 10:42:49.551237+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> allowDupes:0, agentAllowDupes:0, active:1
2024-06-02 10:42:49.551280+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> active 0
2024-06-02 10:42:49.551720+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] canScanNow session:<private>(Unspecified) allowed:1  deviceLocked:0 deviceFirstUnlocked:1 allowedInBKG:1 sessionState:daemon <private>
2024-06-02 10:42:49.551749+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] state 32
2024-06-02 10:42:49.551795+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> allowDupes:0, agentAllowDupes:0, active:0
2024-06-02 10:42:49.551817+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] <private> active 0
2024-06-02 10:42:49.551856+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] ScanParams: numScanAgents 5, combined params AD:0 AS:0 MSL:3 (30/300) PSV:1
2024-06-02 10:42:49.551893+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] ScanParams: [com.apple.bluetoothd-central-62824-27] AP:0 AD:1(30/300) AS:0 RAS:0 DMN:1 FG:0 ADVBF:0 pBT:0|[com.apple.locationd-central-349-6] AP:0 AD:0(30/300) AS:0 RAS:0 DMN:1 FG:0 ADVBF:0 pBT:0|[com.apple.locationd-central-349-8] AP:0 AD:0(30/300) AS:0 RAS:0 DMN:1 FG:0 ADVBF:0 pBT:0
2024-06-02 10:42:49.552248+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] ScanParams: [com.apple.bluetoothd-central-62824-29] AP:0 AD:0(30/966) AS:0 RAS:0 DMN:1 FG:0 ADVBF:0 pBT:0|[CBDaemon-0xB364001E] AP:0 AD:0(30/300) AS:0 RAS:0 DMN:1 FG:0 ADVBF:0 pBT:0
2024-06-02 10:42:49.552566+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] Returning scan parameters: Main:30.00ms/300.00ms LP:0.00ms/300.00ms(supported) SC:0.00ms/50.00ms/non-concurrent(supported) Dm:(m:30/300) Cond:0:1:0 Sc:1 (passive) Dupfilter:Enabled minScanLevel:3 ENAssertion:N Pri:0/0
2024-06-02 10:42:49.552628+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] needToRestart=0
2024-06-02 10:42:49.693314+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.XPC] Received XPC message "CBMsgIdCharacteristicWriteValue" from session "com.example.ergpmDiagnostics-central-335-45"
2024-06-02 10:42:49.693413+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.GATT] Writing value with response to characteristic handle 0x0013 on device "40BD468A-6C6B-35C1-1896-831F32320BF4"
2024-06-02 10:42:49.693453+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.GATT] Using Write Characteristic value
2024-06-02 10:42:49.869964+0200 0x152b43   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice 331605C5-E6AB-E4AA-3139-BC0FFF930DC6, BDA 52:FB:07:9B:96:97, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -83, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIAT <01 5f 27>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:49.870346+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: (WPDaemon) [com.apple.bluetooth:WirelessProximity] WPDScanManager - Notifying Client About Discovered Device: Client (<private>) - UUID (<private>)
2024-06-02 10:42:49.870373+0200 0x152b43   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice 331605C5-E6AB-E4AA-3139-BC0FFF930DC6, BDA 52:FB:07:9B:96:97, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -83, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIAT <01 5f 27>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:49.870475+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: (WPDaemon) [com.apple.bluetooth:WirelessProximity] Telling process <private> (<private>) about discovered device (<private>) of type 16 with data <private>
2024-06-02 10:42:49.870545+0200 0x152b43   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice 331605C5-E6AB-E4AA-3139-BC0FFF930DC6, BDA 52:FB:07:9B:96:97, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -83, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIAT <01 5f 27>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:49.871284+0200 0x152d51   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice 331605C5-E6AB-E4AA-3139-BC0FFF930DC6, BDA 52:FB:07:9B:96:97, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -83, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:49.871670+0200 0x152d51   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice 331605C5-E6AB-E4AA-3139-BC0FFF930DC6, BDA 52:FB:07:9B:96:97, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -83, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:49.871971+0200 0x152d51   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice 331605C5-E6AB-E4AA-3139-BC0FFF930DC6, BDA 52:FB:07:9B:96:97, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -83, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:49.872249+0200 0x1690     Info        0x0                  651    0    sharingd: (WirelessProximity) [com.apple.bluetooth:WirelessProximity] Nearby didDiscoverType 1 UUID <private> info <private>
2024-06-02 10:42:49.871149+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice 331605C5-E6AB-E4AA-3139-BC0FFF930DC6, BDA 52:FB:07:9B:96:97, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -83, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:49.871505+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice 331605C5-E6AB-E4AA-3139-BC0FFF930DC6, BDA 52:FB:07:9B:96:97, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -83, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:49.871756+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice 331605C5-E6AB-E4AA-3139-BC0FFF930DC6, BDA 52:FB:07:9B:96:97, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -83, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.197274+0200 0x150d8e   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice A5834401-213A-7448-635C-7266860CD487, BDA 49:79:66:39:F5:70, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 07 19 4f 02 05 18>, nbIAT <4f 02 05>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.197381+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: (WPDaemon) [com.apple.bluetooth:WirelessProximity] WPDScanManager - Notifying Client About Discovered Device: Client (<private>) - UUID (<private>)
2024-06-02 10:42:50.200387+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice A5834401-213A-7448-635C-7266860CD487, BDA 49:79:66:39:F5:70, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 07 19 4f 02 05 18>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.197537+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: (WPDaemon) [com.apple.bluetooth:WirelessProximity] Telling process <private> (<private>) about discovered device (<private>) of type 16 with data <private>
2024-06-02 10:42:50.199113+0200 0x1690     Info        0x0                  651    0    sharingd: (WirelessProximity) [com.apple.bluetooth:WirelessProximity] Nearby didDiscoverType 1 UUID <private> info <private>
2024-06-02 10:42:50.197774+0200 0x150d8e   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice A5834401-213A-7448-635C-7266860CD487, BDA 49:79:66:39:F5:70, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 07 19 4f 02 05 18>, nbIAT <4f 02 05>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.200714+0200 0x152ecd   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice A5834401-213A-7448-635C-7266860CD487, BDA 49:79:66:39:F5:70, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 07 19 4f 02 05 18>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.200724+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice A5834401-213A-7448-635C-7266860CD487, BDA 49:79:66:39:F5:70, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 07 19 4f 02 05 18>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.197991+0200 0x150d8e   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice A5834401-213A-7448-635C-7266860CD487, BDA 49:79:66:39:F5:70, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 07 19 4f 02 05 18>, nbIAT <4f 02 05>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.201104+0200 0x152ecd   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice A5834401-213A-7448-635C-7266860CD487, BDA 49:79:66:39:F5:70, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 07 19 4f 02 05 18>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.201065+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice A5834401-213A-7448-635C-7266860CD487, BDA 49:79:66:39:F5:70, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 07 19 4f 02 05 18>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.201384+0200 0x152ecd   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice A5834401-213A-7448-635C-7266860CD487, BDA 49:79:66:39:F5:70, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 07 19 4f 02 05 18>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.479898+0200 0x152b43   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice 4A255883-4FEB-EE7B-DEB0-0AEA0BDDA56A, BDA 6B:EB:5C:98:82:35, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -89, AMfD <4c 00 10 05 0d 18 a1 02 d1>, nbIAT <a1 02 d1>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.481548+0200 0x1690     Info        0x0                  651    0    sharingd: (WirelessProximity) [com.apple.bluetooth:WirelessProximity] Nearby didDiscoverType 1 UUID <private> info <private>
2024-06-02 10:42:50.479909+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: (WPDaemon) [com.apple.bluetooth:WirelessProximity] WPDScanManager - Notifying Client About Discovered Device: Client (<private>) - UUID (<private>)
2024-06-02 10:42:50.483118+0200 0x151e18   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice 4A255883-4FEB-EE7B-DEB0-0AEA0BDDA56A, BDA 6B:EB:5C:98:82:35, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -89, AMfD <4c 00 10 05 0d 18 a1 02 d1>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.480150+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: (WPDaemon) [com.apple.bluetooth:WirelessProximity] Telling process <private> (<private>) about discovered device (<private>) of type 16 with data <private>
2024-06-02 10:42:50.483621+0200 0x151e18   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice 4A255883-4FEB-EE7B-DEB0-0AEA0BDDA56A, BDA 6B:EB:5C:98:82:35, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -89, AMfD <4c 00 10 05 0d 18 a1 02 d1>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.480335+0200 0x152b43   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice 4A255883-4FEB-EE7B-DEB0-0AEA0BDDA56A, BDA 6B:EB:5C:98:82:35, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -89, AMfD <4c 00 10 05 0d 18 a1 02 d1>, nbIAT <a1 02 d1>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.483955+0200 0x151e18   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice 4A255883-4FEB-EE7B-DEB0-0AEA0BDDA56A, BDA 6B:EB:5C:98:82:35, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -89, AMfD <4c 00 10 05 0d 18 a1 02 d1>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.480548+0200 0x152b43   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice 4A255883-4FEB-EE7B-DEB0-0AEA0BDDA56A, BDA 6B:EB:5C:98:82:35, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -89, AMfD <4c 00 10 05 0d 18 a1 02 d1>, nbIAT <a1 02 d1>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.482717+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice 4A255883-4FEB-EE7B-DEB0-0AEA0BDDA56A, BDA 6B:EB:5C:98:82:35, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -89, AMfD <4c 00 10 05 0d 18 a1 02 d1>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.483244+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice 4A255883-4FEB-EE7B-DEB0-0AEA0BDDA56A, BDA 6B:EB:5C:98:82:35, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -89, AMfD <4c 00 10 05 0d 18 a1 02 d1>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.483577+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice 4A255883-4FEB-EE7B-DEB0-0AEA0BDDA56A, BDA 6B:EB:5C:98:82:35, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -89, AMfD <4c 00 10 05 0d 18 a1 02 d1>, nbIF 0xC0 < AT Duet >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.623273+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.Core] SystemSettings Foreground App now changed : <private>
2024-06-02 10:42:50.623346+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.Core] Foreground App is now <private>
2024-06-02 10:42:50.631158+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.Audio] notify Foreground app changed :<private>
2024-06-02 10:42:50.696602+0200 0x1690     Default     0x0                  651    0    sharingd: (WirelessProximity) [com.apple.bluetooth:WirelessProximity] Nearby clear duplicate filter cache type 1
2024-06-02 10:42:50.696995+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: (WPDaemon) [com.apple.bluetooth:WirelessProximity] clear dup filter cache for process sharingd (651) with scan request of type 16, blob: {length = 0, bytes = 0x}, mask {length = 0, bytes = 0x}, active: 0, duplicates: 0, screen on: No Scan, screen off: No Scan, locked: 1,  rssi: -90, peers: (
) nearby scan mode: 10, advbuf: 0, priority critical: 0, range: 0, usecases:
2024-06-02 10:42:50.697062+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: (WPDaemon) [com.apple.bluetooth:WirelessProximity] About to clearDuplicateFilterCache for type: 16
2024-06-02 10:42:50.697157+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.XPC] Received XPC message "CBMsgIdClearDuplicateFilterCache" from session "com.apple.bluetoothd-central-62824-27"
2024-06-02 10:42:50.697205+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.Core] Sending: BD_VSC_LE_META_REMV_MULTIPLE_DUPLICATE_ENTRIE_ADV_MATCHING_RULE
2024-06-02 10:42:50.700671+0200 0xec8ca    Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.Core] BD_VSC_LE_META_REMV_MULTIPLE_DUPLICATE_ENTRIE_ADV_MATCHING_RULE completed with status 0
2024-06-02 10:42:50.700766+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.App] clearDuplicateFilterCache for session "com.apple.bluetoothd" type 16
2024-06-02 10:42:50.723383+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.XPC] Received XPC message "CBMsgIdCharacteristicWriteValue" from session "com.example.ergpmDiagnostics-central-335-45"
2024-06-02 10:42:50.723438+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.GATT] Writing value with response to characteristic handle 0x0013 on device "40BD468A-6C6B-35C1-1896-831F32320BF4"
2024-06-02 10:42:50.723463+0200 0x152b42   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.GATT] Using Write Characteristic value
2024-06-02 10:42:50.806999+0200 0x150d8e   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice 36DE08FD-E66B-E7A8-F5CB-74EB29BD98C9, BDA 49:5B:A6:3A:99:F0, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -77, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIAT <01 5f 27>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.807053+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: (WPDaemon) [com.apple.bluetooth:WirelessProximity] WPDScanManager - Notifying Client About Discovered Device: Client (<private>) - UUID (<private>)
2024-06-02 10:42:50.807783+0200 0x1690     Info        0x0                  651    0    sharingd: (WirelessProximity) [com.apple.bluetooth:WirelessProximity] Nearby didDiscoverType 1 UUID <private> info <private>
2024-06-02 10:42:50.807161+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: (WPDaemon) [com.apple.bluetooth:WirelessProximity] Telling process <private> (<private>) about discovered device (<private>) of type 16 with data <private>
2024-06-02 10:42:50.808248+0200 0x153056   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice 36DE08FD-E66B-E7A8-F5CB-74EB29BD98C9, BDA 49:5B:A6:3A:99:F0, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -77, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.807277+0200 0x150d8e   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice 36DE08FD-E66B-E7A8-F5CB-74EB29BD98C9, BDA 49:5B:A6:3A:99:F0, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -77, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIAT <01 5f 27>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.807848+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice 36DE08FD-E66B-E7A8-F5CB-74EB29BD98C9, BDA 49:5B:A6:3A:99:F0, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -77, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.808566+0200 0x153056   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice 36DE08FD-E66B-E7A8-F5CB-74EB29BD98C9, BDA 49:5B:A6:3A:99:F0, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -77, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.807447+0200 0x150d8e   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice 36DE08FD-E66B-E7A8-F5CB-74EB29BD98C9, BDA 49:5B:A6:3A:99:F0, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -77, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIAT <01 5f 27>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.808128+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice 36DE08FD-E66B-E7A8-F5CB-74EB29BD98C9, BDA 49:5B:A6:3A:99:F0, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -77, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.810563+0200 0x153056   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice 36DE08FD-E66B-E7A8-F5CB-74EB29BD98C9, BDA 49:5B:A6:3A:99:F0, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -77, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:50.808382+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice 36DE08FD-E66B-E7A8-F5CB-74EB29BD98C9, BDA 49:5B:A6:3A:99:F0, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -77, AMfD <4c 00 10 06 43 1d 01 5f 27 38>, nbIF 0x1C1 < AirDrop AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:51.057242+0200 0xec8ca    Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Stack.LE]  Invalid Dual mode support indication in AD flags 0x00000000.
2024-06-02 10:42:51.057759+0200 0x152b43   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] Device "AA41B75C-7E6D-7474-9C87-FE11EADF14AB" matched MFG data
2024-06-02 10:42:51.058220+0200 0x152b43   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] Device "AA41B75C-7E6D-7474-9C87-FE11EADF14AB" matched MFG data
2024-06-02 10:42:51.110741+0200 0x152b43   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice B0E31470-5492-B11E-E2DD-495B7FA6D941, BDA D8:BB:2C:73:FB:7E, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, RSSI -67, AMfD <4c 00 10 05 13 1c 37 47 31>, nbIAT <37 47 31>, nbIF 0x1C4 < Me AT Duet WiFiP2P >, CF 0x200000000 < RSSI >
2024-06-02 10:42:51.112213+0200 0x1690     Info        0x0                  651    0    sharingd: (WirelessProximity) [com.apple.bluetooth:WirelessProximity] Nearby didDiscoverType 1 UUID <private> info <private>
2024-06-02 10:42:51.110908+0200 0x150d8e   Info        0x0                  62824  0    bluetoothd: (WPDaemon) [com.apple.bluetooth:WirelessProximity] WPDScanManager - Notifying Client About Discovered Device: Client (<private>) - UUID (<private>)
2024-06-02 10:42:51.113145+0200 0x151e18   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice B0E31470-5492-B11E-E2DD-495B7FA6D941, BDA D8:BB:2C:73:FB:7E, Nm 'William Pennoyer’s iPhone', Md iPhone7,2, IDS C1E440F6-3511-498D-BD50-E2B5266F85FE, stID C1E440F6-3511-498D-BD50-E2B5266F85FE, DsFl 0x800040 < NearbyInfo Pairing >, DvF 0xB080 < SameAccount Hidden BLEPaired CloudPaired >, RSSI -67, AMfD <4c 00 10 05 13 1c 37 47 31>, nbIF 0x1C4 < Me AT Duet WiFiP2P >, CF 0x200000000 < RSSI >
2024-06-02 10:42:51.112333+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice B0E31470-5492-B11E-E2DD-495B7FA6D941, BDA D8:BB:2C:73:FB:7E, Nm 'William Pennoyer’s iPhone', Md iPhone7,2, IDS C1E440F6-3511-498D-BD50-E2B5266F85FE, stID C1E440F6-3511-498D-BD50-E2B5266F85FE, DsFl 0x800040 < NearbyInfo Pairing >, DvF 0xB080 < SameAccount Hidden BLEPaired CloudPaired >, RSSI -67, AMfD <4c 00 10 05 13 1c 37 47 31>, nbIF 0x1C4 < Me AT Duet WiFiP2P >, CF 0x200000000 < RSSI >
2024-06-02 10:42:51.111075+0200 0x150d8e   Info        0x0                  62824  0    bluetoothd: (WPDaemon) [com.apple.bluetooth:WirelessProximity] Telling process <private> (<private>) about discovered device (<private>) of type 16 with data <private>
2024-06-02 10:42:51.113624+0200 0x151e18   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice B0E31470-5492-B11E-E2DD-495B7FA6D941, BDA D8:BB:2C:73:FB:7E, Nm 'William Pennoyer’s iPhone', Md iPhone7,2, IDS C1E440F6-3511-498D-BD50-E2B5266F85FE, stID C1E440F6-3511-498D-BD50-E2B5266F85FE, DsFl 0x800040 < NearbyInfo Pairing >, DvF 0xB080 < SameAccount Hidden BLEPaired CloudPaired >, RSSI -67, AMfD <4c 00 10 05 13 1c 37 47 31>, nbIF 0x1C4 < Me AT Duet WiFiP2P >, CF 0x200000000 < RSSI >
2024-06-02 10:42:51.112886+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice B0E31470-5492-B11E-E2DD-495B7FA6D941, BDA D8:BB:2C:73:FB:7E, Nm 'William Pennoyer’s iPhone', Md iPhone7,2, IDS C1E440F6-3511-498D-BD50-E2B5266F85FE, stID C1E440F6-3511-498D-BD50-E2B5266F85FE, DsFl 0x800040 < NearbyInfo Pairing >, DvF 0xB080 < SameAccount Hidden BLEPaired CloudPaired >, RSSI -67, AMfD <4c 00 10 05 13 1c 37 47 31>, nbIF 0x1C4 < Me AT Duet WiFiP2P >, CF 0x200000000 < RSSI >
2024-06-02 10:42:51.111257+0200 0x152b43   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice B0E31470-5492-B11E-E2DD-495B7FA6D941, BDA D8:BB:2C:73:FB:7E, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, RSSI -67, AMfD <4c 00 10 05 13 1c 37 47 31>, nbIAT <37 47 31>, nbIF 0x1C4 < Me AT Duet WiFiP2P >, CF 0x200000000 < RSSI >
2024-06-02 10:42:51.113942+0200 0x151e18   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice B0E31470-5492-B11E-E2DD-495B7FA6D941, BDA D8:BB:2C:73:FB:7E, Nm 'William Pennoyer’s iPhone', Md iPhone7,2, IDS C1E440F6-3511-498D-BD50-E2B5266F85FE, stID C1E440F6-3511-498D-BD50-E2B5266F85FE, DsFl 0x800040 < NearbyInfo Pairing >, DvF 0xB080 < SameAccount Hidden BLEPaired CloudPaired >, RSSI -67, AMfD <4c 00 10 05 13 1c 37 47 31>, nbIF 0x1C4 < Me AT Duet WiFiP2P >, CF 0x200000000 < RSSI >
2024-06-02 10:42:51.113262+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice B0E31470-5492-B11E-E2DD-495B7FA6D941, BDA D8:BB:2C:73:FB:7E, Nm 'William Pennoyer’s iPhone', Md iPhone7,2, IDS C1E440F6-3511-498D-BD50-E2B5266F85FE, stID C1E440F6-3511-498D-BD50-E2B5266F85FE, DsFl 0x800040 < NearbyInfo Pairing >, DvF 0xB080 < SameAccount Hidden BLEPaired CloudPaired >, RSSI -67, AMfD <4c 00 10 05 13 1c 37 47 31>, nbIF 0x1C4 < Me AT Duet WiFiP2P >, CF 0x200000000 < RSSI >
2024-06-02 10:42:51.111612+0200 0x152b43   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice B0E31470-5492-B11E-E2DD-495B7FA6D941, BDA D8:BB:2C:73:FB:7E, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, RSSI -67, AMfD <4c 00 10 05 13 1c 37 47 31>, nbIAT <37 47 31>, nbIF 0x1C4 < Me AT Duet WiFiP2P >, CF 0x200000000 < RSSI >
2024-06-02 10:42:51.128982+0200 0x152b43   Info        0x0                  62824  0    bluetoothd: (WPDaemon) [com.apple.bluetooth:WirelessProximity] WPDScanManager - Notifying Client About Discovered Device: Client (<private>) - UUID (<private>)
2024-06-02 10:42:51.129256+0200 0x152b43   Info        0x0                  62824  0    bluetoothd: (WPDaemon) [com.apple.bluetooth:WirelessProximity] Telling process <private> (<private>) about discovered device (<private>) of type 16 with data <private>
2024-06-02 10:42:51.129731+0200 0x152b43   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice A3B6132B-6814-1856-471A-898CC858F7AC, BDA 5B:47:A1:BE:95:AA, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 02 1d 57 b8 c3 48>, nbIAT <57 b8 c3>, nbIF 0x1C0 < AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:51.130014+0200 0x152b43   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice A3B6132B-6814-1856-471A-898CC858F7AC, BDA 5B:47:A1:BE:95:AA, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 02 1d 57 b8 c3 48>, nbIAT <57 b8 c3>, nbIF 0x1C0 < AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:51.130327+0200 0x152b43   Info        0x0                  62824  0    bluetoothd: (CoreUtils) [com.apple.bluetooth:CBStackBLEScanner] Device found changed: CBDevice A3B6132B-6814-1856-471A-898CC858F7AC, BDA 5B:47:A1:BE:95:AA, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 02 1d 57 b8 c3 48>, nbIAT <57 b8 c3>, nbIF 0x1C0 < AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:51.132306+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice A3B6132B-6814-1856-471A-898CC858F7AC, BDA 5B:47:A1:BE:95:AA, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 02 1d 57 b8 c3 48>, nbIF 0x1C0 < AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:51.132692+0200 0x151e18   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice A3B6132B-6814-1856-471A-898CC858F7AC, BDA 5B:47:A1:BE:95:AA, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 02 1d 57 b8 c3 48>, nbIF 0x1C0 < AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:51.130829+0200 0x1690     Info        0x0                  651    0    sharingd: (WirelessProximity) [com.apple.bluetooth:WirelessProximity] Nearby didDiscoverType 1 UUID <private> info <private>
2024-06-02 10:42:51.132821+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice A3B6132B-6814-1856-471A-898CC858F7AC, BDA 5B:47:A1:BE:95:AA, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 02 1d 57 b8 c3 48>, nbIF 0x1C0 < AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:51.133058+0200 0x151e18   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice A3B6132B-6814-1856-471A-898CC858F7AC, BDA 5B:47:A1:BE:95:AA, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 02 1d 57 b8 c3 48>, nbIF 0x1C0 < AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:51.133103+0200 0x14ebaf   Info        0x0                  349    0    locationd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] CLMiLoLeeching: Device found: CBDevice A3B6132B-6814-1856-471A-898CC858F7AC, BDA 5B:47:A1:BE:95:AA, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 02 1d 57 b8 c3 48>, nbIF 0x1C0 < AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:51.133320+0200 0x151e18   Info        0x0                  661    0    nearbyd: (CoreUtils) [com.apple.bluetooth:CBDiscovery] Device found: CBDevice A3B6132B-6814-1856-471A-898CC858F7AC, BDA 5B:47:A1:BE:95:AA, Nm 'Bluetooth Device', DsFl 0x40 < NearbyInfo >, DvF 0x40000000000 < Connectable >, RSSI -82, AMfD <4c 00 10 06 02 1d 57 b8 c3 48>, nbIF 0x1C0 < AT Duet WiFiP2P >, CF 0x80200000000 < RSSI Attributes >
2024-06-02 10:42:51.396583+0200 0xec8ca    Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Stack.LE]  Invalid Dual mode support indication in AD flags 0x00000000.
2024-06-02 10:42:51.397226+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] Device "AC0401E2-0278-CC11-FBB0-83CC362E17AC" matched MFG data
2024-06-02 10:42:51.397868+0200 0x152b42   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.LE.Scan] Device "AC0401E2-0278-CC11-FBB0-83CC362E17AC" matched MFG data
2024-06-02 10:42:51.696286+0200 0x152b43   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.XPC] Received XPC message "CBMsgIdCharacteristicWriteValue" from session "com.example.ergpmDiagnostics-central-335-45"
2024-06-02 10:42:51.696432+0200 0x152b43   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.GATT] Writing value with response to characteristic handle 0x0013 on device "40BD468A-6C6B-35C1-1896-831F32320BF4"
2024-06-02 10:42:51.696489+0200 0x152b43   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.GATT] Using Write Characteristic value
^C
william@Williams-MBP tmp % sudo log stream --predicate 'subsystem == "com.apple.bluetooth"' --info | grep -i ce0


2024-06-02 10:51:03.961948+0200 0x158707   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.App] Dispatching GATT indication for device "40BD468A-6C6B-35C1-1896-831F32320BF4" to session "com.example.ergpmDiagnostics-central-335-45"
2024-06-02 10:51:04.693052+0200 0x158707   Default     0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.GATT] Writing value with response to characteristic handle 0x0013 on device "40BD468A-6C6B-35C1-1896-831F32320BF4"
2024-06-02 10:51:04.861886+0200 0x158707   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.GATT] Dispatching indication for device 40BD468A-6C6B-35C1-1896-831F32320BF4
2024-06-02 10:51:04.862262+0200 0x158707   Info        0x0                  62824  0    bluetoothd: [com.apple.bluetooth:Server.App] Dispatching GATT indication for device "40BD468A-6C6B-35C1-1896-831F32320BF4" to session "com.example.ergpmDiagnostics-central-335-45"




