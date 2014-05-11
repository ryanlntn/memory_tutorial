class Tile < Joybox::Core::Sprite
  def initialize(opts={})
    super frame_name: 'hidden.png', position: opts[:position]
  end

  def touched?(touch_location)
    rect = CGRect.new(boundingBox.origin, boundingBox.size)
    CGRectContainsPoint(rect, touch_location)
  end
end
