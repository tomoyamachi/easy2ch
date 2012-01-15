# -*- coding: utf-8 -*-
class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  def select_thread
    set_messages @locale
    get_category @locale
  end

  def set_messages(locale)
    case locale
    when "sg"
      @country = "Singapore"
      @select_message = "Please select a state."
      @side_message = "Feel free to click on a board that interests you and jump right in!"
      @name_navi = "Name"
      @image_navi = "File"
      @comment_navi = "Comment"
      @send_navi = "send"
    when "en"
      @country = "US"
      @select_message = "Please select a state."
      @side_message = "Feel free to click on a board that interests you and jump right in!"
      @name_navi = "Name"
      @image_navi = "File"
      @comment_navi = "Comment"
      @send_navi = "send"
    else
      @country = "Japan"
      @select_message = "都道府県を選択してください。"
      @side_message = "興味のある板をクリックしていろんな情報を書き込もう!"
      @name_navi = "名前"
      @image_navi = "画像"
      @comment_navi = "コメント"
      @send_navi = "送信"
    end
  end

  def show_thread
    @category = params[:c]
    set_messages @locale
    get_category @locale
    @comments = Comment.where("category = ?",@category).page params[:page]
  end

  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new
    @comment.name = params[:name]
    @comment.category = params[:category]
    @comment.description = params[:description]
    if @comment.save
      redirect_to(:action =>"show_thread",:locale => @locale, :c => params[:category], :notice => '書き込みに成功しました。')
    else
      redirect_to(:action =>"show_thread",:locale => @locale, :c => params[:category], :notice => '書き込みに失敗しました。')
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end

private
  def get_category(locale)
    case locale
    when "sg"
      @categories = %w[Singapore]
    when "en"
      @categories = %w[Alabama Alaska Arizona Arkansas California Colorado Connecticut Delaware Florida Georgia Hawaii Idaho Illinois Indiana Iowa Kansas Kentucky Louisiana Maine Maryland Massachusetts Michigan Minnesota Mississippi Missouri Montana Nebraska Nevada New Hampshire New Jersey New Mexico New York North Carolina North Dakota Ohio Oklahoma Oregon Pennsylvania Rhode Island South Carolina South Dakota Tennessee Texas Utah Vermont Virginia Washington West Virginia Wisconsin Wyoming]
    else
      @categories = %w[北海道 青森県 岩手県 宮城県 秋田県 山形県 福島県 茨城県 栃木県 群馬県 埼玉県 千葉県 東京都 神奈川県 新潟県 富山県 石川県 福井県 山梨県 長野県 岐阜県 静岡県 愛知県 三重県 滋賀県 京都府 大阪府 兵庫県 奈良県 和歌山県 鳥取県 島根県 岡山県 広島県 山口県 徳島県 香川県 愛媛県 高知県 福岡県 佐賀県 長崎県 熊本県 大分県 宮崎県 鹿児島県 沖縄県]
    end
  end
end
