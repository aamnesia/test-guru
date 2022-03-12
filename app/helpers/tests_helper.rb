module TestsHelper
  TITLES = {new: 'Create New', edit: 'Edit'}.freeze
  TIMER_CHOICES = ['∞', (1..30).step(5)]

  def test_header
    "#{TITLES[action_name.to_sym]} Test"
  end

  def fixed_or_unlimited(test)
    if test.timer == 0
      '∞'
    else
      "#{test.timer} (min)"
    end
  end
end
