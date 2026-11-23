import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_disli_atolyesi/oyun_disli_atolyesi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(disliAtolyesiConfig.title.length, 33);
    expect(disliAtolyesiConfig.tagline.length, 33);
    for (final s in disliAtolyesiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(disliAtolyesiConfig.gameId, disliAtolyesiId);
    expect(disliAtolyesiRules.gameId, disliAtolyesiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(disliAtolyesiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: disliAtolyesiId, optionalMechanics: disliAtolyesiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(disliAtolyesiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
