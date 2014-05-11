class GridLayer < Joybox::Core::Layer
  scene

  def on_enter
    load_sprite_sheet
    load_tiles
  end

  def load_tiles
    @tiles = 4.times.map do |row|
      4.times.map do |column|
        Sprite.new frame_name: 'hidden.png', position: [
          column * 64 + 64,
          row * 64 + 128
        ]
      end
    end.flatten

    @tiles.each { |t| @sprite_batch << t }
  end

  def load_sprite_sheet
    SpriteFrameCache.frames.add file_name: "sprites.plist"
    @sprite_batch = SpriteBatch.new file_name: "sprites.png"
    self << @sprite_batch
  end
end
