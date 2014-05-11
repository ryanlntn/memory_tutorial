class Tile < Joybox::Core::Sprite
  def initialize(opts={})
    super frame_name: 'hidden.png', position: opts[:position]
  end
end
