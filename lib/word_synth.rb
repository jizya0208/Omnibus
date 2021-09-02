class WordSynth
  def initialize
    @effects = []
  end
  
  def add_effect(effect) 
    @effects << effect
  end
  
  # injectの引数 original_words は、ブロックローカルな words 変数の初期値。ブロックの中身 (effect.call(words) )の実行結果がeffectに入る
  
  def play(original_words) 
    @effects.inject(original_words) do |words, effect| # injectの引数original_wordsは初期値、第一ブロック引数は結果, 第二ブロック引数は要素(配列から取り出した中身=Procオブジェクト)。 callメソッドでProcオブジェクトを実行する
      p effect
      effect.call(words) 
    end
  end
end