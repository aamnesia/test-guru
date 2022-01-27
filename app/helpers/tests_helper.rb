module TestsHelper
  TITLES = {new: 'Create New', edit: 'Edit'}.freeze

  def test_header
    "#{TITLES[action_name.to_sym]} Test"
  end
end
