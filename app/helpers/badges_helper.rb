module BadgesHelper
  def rules_array
    Badge::RULES_NAME.map { |rule| [t(".#{rule}"), rule] }
  end
end
