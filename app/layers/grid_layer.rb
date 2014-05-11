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
      if tile = tile_to_flip(touch.location)
        tile.flip
      end
    end
  end

  def tile_to_flip(touch_location)
    @tiles.detect { |t| t.touched?(touch_location) }
  end

  def load_tiles
    types = 8.times.map { Tile::TYPES.sample } * 2

    @tiles = 4.times.map do |row|
      4.times.map do |column|
        Tile.new type: types.shift, position: [
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
