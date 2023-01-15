import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

class DownloadService {

  final ReceivePort _port = ReceivePort();

  void initialize(){
    IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
    FlutterDownloader.registerCallback(downloadCallback);
  }

  Future downloadMovie(String link, {String? fileName}) async{
    Directory directory = await getTemporaryDirectory();

    await FlutterDownloader.enqueue(
      url: link,
      savedDir: directory.path,
      showNotification: true, // show download progress in status bar (for Android)
      openFileFromNotification: true,
      saveInPublicStorage: true,
      fileName: fileName
    );
  }


  @pragma('vm:entry-point')
  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    final SendPort? send = IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }


}
