part of 'download_pdf_bloc.dart';

sealed class DownloadPdfState {}

final class InitialPdfState extends DownloadPdfState {}

final class LoadingPdfState extends DownloadPdfState {}

final class LoadedPdfState extends DownloadPdfState {
  
}

final class ErrorPdfState extends DownloadPdfState {}