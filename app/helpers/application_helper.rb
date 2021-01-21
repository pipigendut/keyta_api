module ApplicationHelper
  def to_hash_symbolize(value)
    JSON.parse(value.to_json, symbolize_names: true)
  end
end
