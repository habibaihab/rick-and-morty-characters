import 'dart:io';

import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rick_and_morty_characters/features/characters/domain/entities/character_entity.dart';
import 'package:share_plus/share_plus.dart';

class ExcelExportService {

  Future<void> exportCharactersData(List<CharacterEntity> charactersData) async{

    final excel = Excel.createExcel();
    
    final Sheet sheet = excel["Characters"];
    
    sheet.appendRow([
      TextCellValue("Id"),
      TextCellValue("Name"),
      TextCellValue("Status"),
      TextCellValue("Species"),
      TextCellValue("Gender"),
      TextCellValue("Type"),
    ]);

    for(final char in charactersData){

      sheet.appendRow([
        TextCellValue("${char.id}"),
        TextCellValue(char.name),
        TextCellValue(char.status),
        TextCellValue(char.species),
        TextCellValue(char.gender),
        TextCellValue(char.type),
      ]);
    }

    final directory = await getApplicationDocumentsDirectory();

    final file = File("${directory.path}/charactersData.xlsx");
    final bytes = excel.save();

    await file.writeAsBytes(bytes!);

    await Share.shareXFiles(
      [XFile(file.path)],
      text: "Rick & Morty Characters",
    );
  }
}