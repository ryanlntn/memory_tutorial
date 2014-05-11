class GridLayer < Joybox::Core::Layer
  scene

  TILE_SIZE = 64
  LEFT_GUTTER = 64
  BOTTOM_GUTTER = 128

  def on_enter
    load_sprite_sheet
    load_tiles
    handle_touches
  end

  def handle_touches
    on_touches_ended do |touches, event|
      touch = touches.any_object
      puts [touch.location.x, touch.location.y].inspect
    end
  end

  def load_tiles
    @tiles = 4.times.map do |row|
      4.times.map do |column|
        Sprite.new frame_name: 'hidden.png', position: [
          column * TILE_SIZE + LEFT_GUTTER,
          row * TILE_SIZE + BOTTOM_GUTTER
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
