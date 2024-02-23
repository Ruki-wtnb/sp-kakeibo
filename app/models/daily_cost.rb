# == Schema Information
#
# Table name: daily_costs
#
#  id          :integer          not null, primary key
#  pay_date    :date
#  category_id :string
#  detail      :string
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class DailyCost < ApplicationRecord

    after_save :caluculate_category_total
    after_update :caluculate_category_total
    after_destroy :caluculate_category_total

    validates :pay_date, presence: true
    validates :category_id,
        presence: true, 
        numericality: { only_integer: true },
        length: { is: 1}
    validates :detail, presence: true
    validates :price,
        presence: true,
        numericality: { only_integer: true, greater_than: 0, less_than: 100000 }

    scope :get_this_month, -> { where('pay_date LIKE ?', "%#{Date.today.strftime("%Y-%m")}%") }
    
    belongs_to :category

    private
    def get_ym_from_date(date = Date.today)
        date.strftime("%Y-%m")
    end

    def caluculate_category_total
        year_month = get_ym_from_date(self.pay_date)
        #該当月・カテゴリーの合計を取得する
        category_total ||= CategoryTotal.find_by(category_id: self.category_id, year_month: year_month)
        
        # カテゴリー合計がnilの場合:モデルを新規作成、nilでない場合:合計を再計算・アップデート
        if category_total.nil?
            CategoryTotal.create(category_id: self.category_id, year_month: year_month, price: self.price)
        else
            total = DailyCost.where("pay_date like ?", "#{year_month}%").where(category_id: self.category_id).sum(:price)
            category_total.update(price: total)
        end
    end

end
