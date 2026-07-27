import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_entity.dart';
import 'package:share_plus/share_plus.dart';

class ExcelExportService {

  Future<File> _generateExcelFile(
      List<CharacterEntity> charactersData,
      ) async {
    final excel = Excel.createExcel();

    final Sheet sheet = excel["Characters"];

    sheet.appendRow([
      TextCellValue("Id"),
      TextCellValue("Name"),
      TextCellValue("Status"),
      TextCellValue("Species"),
      TextCellValue("Gender"),
      TextCellValue("Type"),
      TextCellValue("Origin"),
      TextCellValue("Location"),
    ]);

    for (final char in charactersData) {
      sheet.appendRow([
        TextCellValue(char.id.toString()),
        TextCellValue(char.name),
        TextCellValue(char.status),
        TextCellValue(char.species),
        TextCellValue(char.gender),
        TextCellValue(char.type),
        TextCellValue(char.origin),
        TextCellValue(char.location),
      ]);
    }

    final bytes = excel.save();

    if (bytes == null) {
      throw Exception("Failed to generate excel file.");
    }

    final tempDir = await getTemporaryDirectory();

    final file = File("${tempDir.path}/characters.xlsx");

    await file.writeAsBytes(bytes);

    return file;
  }

  Future<void> saveCharactersData(
      List<CharacterEntity> charactersData,
      ) async {
    final file = await _generateExcelFile(charactersData);

    await FlutterFileDialog.saveFile(
      params: SaveFileDialogParams(
        sourceFilePath: file.path,
        fileName: "characters.xlsx",
      ),
    );
  }

  Future<void> shareCharactersData(
      List<CharacterEntity> charactersData,
      ) async {
    final file = await _generateExcelFile(charactersData);

    await Share.shareXFiles(
      [XFile(file.path)],
      text: "Rick & Morty Characters",
    );
  }
}