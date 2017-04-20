# -*- coding: utf-8 -*-
class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    tweet = Micropost.find(params[:tweet_id])
    current_user.mark(tweet)
    flash[:success] = 'お気に入りを登録しました。'
    redirect_to root_url
  end

  def destroy
    tweet = Micropost.find(params[:tweet_id])
    current_user.unmark(tweet)
    flash[:success] = 'お気に入りを削除しました。'
    redirect_back(fallback_location: root_path)
  end
end
