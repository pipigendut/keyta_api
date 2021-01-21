module ExpeditionManage
  module_function

  protected

  def get_specific_expidition(result, expeditions)
    _result = get_markup_expeditions(result)
    _result[:results] = result[:results].filter{|f| expeditions.include?(f[:code])}
    _result
  end

  def get_markup_expeditions(result)
    result[:results].each do |value|
      value[:services].each do |service|
        service[:markup] = get_markup(service[:totalPrice])
      end
    end

    result
  end

  private

  def get_markup(value)
    (definition.filter{|data| (data[:min]..data[:max]) === value}[0] || {})[:markup] || 0
  end

  def definition
    [
      {
        min: 0,
        max: 17_000,
        markup: 1000
      },
      {
        min: 17_001,
        max: 30_000,
        markup: 2000
      },
      {
        min: 30_001,
        max: 40_000,
        markup: 3000
      },
      {
        min: 40_001,
        max: 129_000,
        markup: 5000
      },
      {
        min: 129_001,
        markup: 7000
      }
    ]
  end
end