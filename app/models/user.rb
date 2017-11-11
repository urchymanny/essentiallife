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

    #callbacks
    before_validation :generate_refferal_id, on: :create


    def first_downlines
       self.children.first
    end

    def self.insert_at_node(sponsore, new_user)
        raise "Are you trying to register your self?" if sponsore == new_user
        if sponsore.is_childless?
             sponsore.children.create(new_user)
        elsif sponsore.has_siblings?
             sponsore.children.first.siblings.create(new_user)
        else
            insert_at_node(sponsore.children.first, new_user)
        end 
    end

    def self.search_and_insert_node(sponsore, new_user) 
        insert_at_node(sponsore, new_user)  
    end

    def self.run_matrix(params_user)
        sponsore = User.find_by(refferal_id: params_user[:sponsor_id])
        new_user = params_user
        search_and_insert_node(sponsore, new_user)
    end
    
     private
    
    def generate_refferal_id
      begin
        self.refferal_id = SecureRandom.uuid.gsub("-", "").hex.to_s[1...6]
      end while self.class.exists?(refferal_id: refferal_id)
    end
end
