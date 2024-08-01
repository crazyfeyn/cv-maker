import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

part 'donload_pdf_states.dart';
part 'download_pdf_events.dart';

class DownloadPdfBloc extends Bloc<PDFEvent, DownloadPdfState> {
  DownloadPdfBloc() : super(InitialPdfState()) {
    on<DownloadPdfEvent>(_onDownloadPdf);
  }

  final _dio = Dio();

  void _onDownloadPdf(
      DownloadPdfEvent event, Emitter<DownloadPdfState> emit) async {
    emit(LoadingPdfState());
    await Future.delayed(const Duration(seconds: 1));
    final savePath = await _getSavePath();
    _dio.download('https://msnlabs.com/img/resume-sample.pdf', savePath);
    emit(LoadedPdfState());
  }
}

Future<String> _getSavePath() async {
  Directory? savePath = await getApplicationDocumentsDirectory();

  if (Platform.isAndroid) {
    savePath = Directory("/storage/emulated/0/download");
  }
  final fullPath = "${savePath.path}/golib's_resume.pdf";
  return fullPath;
}


Future<void> _downloadPdfIsolate(String url) async {
  final Dio dio = Dio();
  final Directory savePath = await getApplicationDocumentsDirectory();
  final String filePath = "${savePath.path}/resume.pdf";
  await dio.download(url, filePath);
}
