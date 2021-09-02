require 'minitest/autorun'
require './lib/word_synth'
require './lib/effects'


class WordSynthTest < Minitest::Test # クラス外で定数を参照する::
  def test_play_without_effects
    synth = WordSynth.new
    assert_equal 'Ruby is fun!', synth.play('Ruby is fun!')
  end

  def test_play_with_many_effects
    # クラスからオブジェクトを生成 イニシャライザにより空の配列となる  >> []
    # add_effectメソッド(引数のエフェクトというProcオブジェクトを配列へ格納するメソッド)を呼び出す >> [ ->(words) { words.chars.map { |c| c == ' ' ? c : c * 2 }.join] } ]
    # playメソッドの引数に文字列(words)を渡す. effect.call(words)により処理が実行され、戻り値をブロックの戻り値とする    >>>>>>>>
    synth = WordSynth.new
    synth.add_effect(Effects.reverse)

    synth.add_effect(Effects.echo(2))
    synth.add_effect(Effects.loud(3))
    assert_equal 'YYBBUURR!!! SSII!!! !!NNUUFF!!!', synth.play('Ruby is fun!')
  end
end