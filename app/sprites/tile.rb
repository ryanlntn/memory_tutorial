class Tile < Joybox::Core::Sprite
  def initialize(opts={})
    super frame_name: 'hidden.png', position: opts[:position]
  end

  def touched?(touch_location)
    rect = CGRect.new(boundingBox.origin, boundingBox.size)
    CGRectContainsPoint(rect, touch_location)
  end

  def flip
    run_action Sequence.with(actions: [
      Scale.to(scale: 1.5, duration: 0.2),
      Scale.to(scale: 1.0, duration: 0.2)
    ])
  end
end
