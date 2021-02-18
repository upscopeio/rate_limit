class Limit
  def self.build(max, controller_path, options)
    options.assert_valid_keys(:if, :unless, :every, :name, :scope, :only, :except)
    new(max, controller_path, {
      if: options[:if],
      unless: options[:unless],
      every: options[:every],
      name: options[:name],
      scope: options[:scope],
      only: options[:only],
      except: options[:except]
    })
  end

  attr_reader :max, :controller_path

  def initialize(max, controller_path, options)
    @max = max
    @controller_path = controller_path
    @options = options
  end

  def _if
    @options[:if]
  end

  def name
    @options[:name]
  end

  def every
    @options[:every]
  end

  def _unless
    @options[:unless]
  end

  def except
    @options[:except]
  end

  def only
    @options[:only]
  end

  def scope
    @options[:scope]
  end

  def has_if_condition?
    _if.present?
  end

  def has_unless_condition?
    _unless.present?
  end

  def controller_path_is?(controller_path)
    self.controller_path == controller_path
  end
end
