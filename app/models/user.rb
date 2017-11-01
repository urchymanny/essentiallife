class User < ApplicationRecord
    require 'matrix'
   
    has_secure_password
    has_ancestry cache_depth: true
    
    #validations
    validates :password, 
              :email, 
              :username, 
            #   :sponsor_id, 
              :full_name, 
              :phone_number, 
              :address, 
              :city,
              :state,
              :country,
              :account_number,
              :bank_name,
              :account_name,  presence: true

    validates :email, :username, :refferal_id,  uniqueness: true
    validates :password, :confirmation => true
    

    #associations
    # belongs_to :country
    # belongs_to :state
    # belongs_to :city
    has_many :bonus_wallet_details
    has_many :wallet_details

<<<<<<< 5dc9612d45b88987a5a06b0ffeccc8b04da2bde4
    # #callbacks
    # before_validation :generate_refferal_id, on: :create
    # before_create :check_for_sponsor, on: :create

    # def assign_user_to_sponsor_downlines(sponsor, user)
    #     if sponsor_has_more_than_two_downlines?(sponsor.first_downlines)
    #         if sponsor_has_more_than_two_downlines?(sponsor.first_downlines.siblings.first)
    #             if sponsor_has_more_than_two_downlines?(sponsor.first_downlines.first_downlines)
    #         else
    #             user.parent = sponsor.first_downlines.siblings.first
    #         end
    #     else
    #         user.parent = sponsor.first_downlines
    #     end
    # end
   

    # def assign_user_to_sponsor(sponsor, user)
    #     if sponsor_has_more_than_two_downlines?(sponsor)
    #         assign_user_to_sponsor_downlines(sponsor, user)
    #     else
    #         #add user to sponsor
    #         user.parent = sponsor
    #     end
    # end

    # def sponsor_has_more_than_two_downlines?(user)
    #     return true if user.children && user.children.count >= 2
    #     return false
    # end


    # def find_sponsor(user)
    #     #find sponsore
    #     sponsor = User.find_by(refferal_id: user.sponsor_id)
        
    #     #assign user to sponsor
    #     assign_user_to_sponsor(sponsor, user)
    # end

    # def check_for_sponsor
    #     if self.sponsor_id.present?
    #         find_sponsor(self)
    #     else
    #         #assign to default
    #         self.sponsor_id = "1000" 
    #     end
    # end


    # def first_downlines
    #     self.children.first
    # end
=======
    #callbacks
    before_validation :generate_refferal_id, on: :create


    def first_downlines
       self.children.first
    end

    def self.insert_at_node(sponsore, new_user)
        raise "Are you trying to register your self?" if sponsore == new_user
        if sponsore.is_childless?
             sponsore.children.create(new_user)
        elsif sponsore.children.size == 1
             sponsore.children.first.siblings.create(new_user)
        else
            raise "Not understanding the flow" 
        end 
    end

    def self.search_and_insert_node(sponsore, new_user) 
        insert_at_node(sponsore, new_user)  
    end
>>>>>>> chore(): setup matrix

    def self.run_matrix(params_user)
        sponsore = User.find_by(refferal_id: params_user[:sponsor_id])
        new_user = params_user
        search_and_insert_node(sponsore, new_user)
    end
    
    # private
    
    # def generate_refferal_id
    #   begin
    #     self.refferal_id = SecureRandom.uuid.gsub("-", "").hex.to_s[1...6]
    #   end while self.class.exists?(refferal_id: refferal_id)
    # end
end
