class ReviewsController < ApplicationController

  def create
    review = Review.create(review_params)
    user = User.find_by(id: review.user.id)
    if review.save
      redirect_to mentor_user_path(user.id), notice: '口コミの投稿が完了しました'
    else
      redirect_to mentor_user_path(user.id), alert: '口コミの投稿ができませんでした'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rate, :to_id).merge(user_id: current_user.id)
  end
end
