class ProductsController < RankingController

  def index
    @products = Product.all.order('id ASC').limit(20)
  end

  def search
    @products = Product.where('title LIKE(?)',"%#{params[:keyword]}%").limit(20)
  end

  def show
    @product = Product.find(params[:id])
  end

  def category
    if params[:value]=="ボールペン"
      @products= Product.where(category: "ボールペン")
    elsif params[:value]=="万年筆"
      @products= Product.where(category: "万年筆")
    elsif params[:value]=="シャープペンシル"
      @products= Product.where(category: "シャープペンシル")
    elsif params[:value]=="マーカー・サインペン"
      @products= Product.where(category: "マーカー・サインペン")
    elsif params[:value]=="鉛筆・鉛筆削り"
      @products= Product.where(category: "鉛筆・鉛筆削り")
    elsif params[:value]=="消しゴム・修正液"
      @products= Product.where(category: "消しゴム・修正液
        ")
    elsif params[:value]=="ノート・メモ"
      @products= Product.where(category: "ノート・メモ")
    elsif params[:value]=="手帳・日記帳"
      @products= Product.where(category: "手帳・日記帳")
    elsif params[:value]=="カレンダー"
      @products= Product.where(category: "カレンダー")
    elsif params[:value]=="システム手帳・リフィル"
      @products= Product.where(category: "システム手帳・リフィル")
    elsif params[:value]=="ファイル"
      @products= Product.where(category: "ファイル")
    elsif params[:value]=="レターセット・便箋"
      @products= Product.where(category: "レターセット・便箋")
    elsif params[:value]=="封筒・ハガキ"
      @products= Product.where(category: "封筒・ハガキ
        ")
    elsif params[:value]=="封蝋・エンポッサー"
      @products= Product.where(category: "封蝋・エンポッサー")
    elsif params[:value]=="はさみ・カッターナイフ"
      @products= Product.where(category: "はさみ・カッターナイフ")
    elsif params[:value]=="定規・コンパス"
      @products= Product.where(category: "定規・コンパス")
    elsif params[:value]=="クリップ・ステープラー"
      @products= Product.where(category: "クリップ・ステープラー")
    elsif params[:value]=="のり"
      @products= Product.where(category: "のり")
    elsif params[:value]=="下敷き"
      @products= Product.where(category: "下敷き")
    elsif params[:value]=="シール"
      @products= Product.where(category: "シール")
    elsif params[:value]=="スタンプ"
      @products= Product.where(category: "スタンプ")
    elsif params[:value]=="カード・ポストカード"
      @products= Product.where(category: "カード・ポストカード")
    elsif params[:value]=="のし・色紙"
      @products= Product.where(category: "のし・色紙")
    elsif params[:value]=="ペーパーアイテム・ウェディングアイテム"
      @products= Product.where(category: "ペーパーアイテム・ウェディングアイテム")
    elsif params[:value]=="アルバム・フォトフレーム"
      @products= Product.where(category: "アルバム・フォトフレーム")
    elsif params[:value]=="絵の具"
      @products= Product.where(category: "絵の具")
    elsif params[:value]=="画材"
      @products= Product.where(category: "画材")
    elsif params[:value]=="製図用品"
      @products= Product.where(category: "製図用品")
    end
  end
end
