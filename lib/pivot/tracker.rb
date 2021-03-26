require 'pry'
module Pivot
  class Tracker
    class << self

      def count(items)
        items.count
      end

      def item_for(items, assignee)
        selected_pivots(items, assignee).last
      end

      def pivoted?(items, assignee)
        selected_pivots(items, assignee).any?
      end

      def total_points(items, assignee: nil)
        pivots = assignee ? selected_pivots(items, assignee) : pivots_with_lease_points(items)
        pivots.map { |item| item[:points] }.reduce(:+)
      end

      def unique_assignees(items)
        items.uniq { |item| item[:assignee] }
      end

      private

      def pivots_with_lease_points(items)
        sorted_pivots(items).uniq { |item| item[:assignee] }
      end

      def sorted_pivots(items)
        items.sort_by { |item| item[:points] }
      end

      def selected_pivots(items, assignee)
        items.select { |item| item[:assignee] == assignee }
      end

    end
  end
end