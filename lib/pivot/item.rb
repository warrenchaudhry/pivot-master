module Pivot
  class Item

    VALID_CODES = %w(EREC AZR).freeze

    attr_accessor :assignee
    attr_reader :name,  :points

    def initialize(name:, points:, assignee: nil)
      @name = name
      @assignee = assignee
      @points = points
    end

    def +(other_item)
      points + other_item.points
    end

    def project_code
      name.split('-')[0]
    end

    def valid?
      VALID_CODES.include?(project_code)
    end

  end
end