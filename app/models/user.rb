class User < ApplicationRecord

  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable


  # RegExp To Allow Only Siswa Email For User Authentication
  validates :email, format: {
    with: /\b[A-Z0-9._%a-z\-]+@(siswa.upsi.edu)\.my\z/,
    message: "Must be a siswa account"
  }

  has_many :questions
  has_many :answers
end
