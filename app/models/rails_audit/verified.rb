module RailsVerify::Verified
  extend ActiveSupport::Concern

  included do
    has_many :verifications, -> { order(position: :asc) }, as: :verified, dependent: :delete_all
  end

  def next_verifiers
    taxon.verifiers.pluck(:id) - verifications.pluck(:verifier_id)
  end

  def next_verifier
    Verifier.find next_verifiers[0]
  end

end
