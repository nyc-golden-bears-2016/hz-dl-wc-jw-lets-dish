require_relative 'parser'
require_relative 'view'

class Controller
  attr_reader :view, :parser

  def initialize
    @parser = InspectionSorter.new
    @view = View.new
  end

  def find_violations
    violations = @parser.get_violations(@view.argv_helper)
    @view.display_descriptions(violations)
  end
end
