# frozen_string_literal: true

class JavascriptRequiredComponent < BaseComponent
  include LinkHelper

  attr_reader :header, :location, :intro

  BROWSER_RESOURCES = [
    { name: 'Google Chrome', url: 'https://support.google.com' },
    { name: 'Mozilla Firefox', url: 'https://support.mozilla.org/en-US' },
    { name: 'Microsoft Edge', url: 'https://support.microsoft.com/en-us/microsoft-edge' },
    { name: 'Apple Safari', url: 'https://support.apple.com/safari' },
  ].to_set.freeze

  def initialize(header:, location:, intro: nil)
    @header = header
    @location = location
    @intro = intro
  end

  def browser_resources
    BROWSER_RESOURCES
  end

  def was_no_js?
    session.delete(NoJsController::SESSION_KEY) == true
  end
end
