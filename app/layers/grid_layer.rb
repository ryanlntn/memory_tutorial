class GridLayer < Joybox::Core::Layer
  scene

  def on_enter
    SpriteFrameCache.frames.add file_name: "sprites.plist"
    @sprite_batch = SpriteBatch.new file_name: "sprites.png"
    @sprite_batch << Sprite.new(frame_name: 'boy.png', position: [Screen.half_width, Screen.half_height])
    self << @sprite_batch
  end
end
