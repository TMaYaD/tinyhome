# frozen_string_literal: true

module ApplicationHelper # rubocop:todo Style/Documentation
  def body_classes
    [params[:controller], params[:action], params[:id]].compact.map { |n| n.split('/') }.flatten
  end
end
