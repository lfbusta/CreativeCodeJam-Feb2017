return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "v0.15.2-100-gd5be8ea",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 10,
  height = 10,
  tilewidth = 32,
  tileheight = 32,
  nextobjectid = 8,
  properties = {},
  tilesets = {
    {
      name = "tileset",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "images/tileset.png",
      imagewidth = 320,
      imageheight = 640,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 200,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Base",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 18, 18, 18, 18, 18, 18, 18, 18, 0,
        0, 18, 18, 18, 18, 18, 18, 18, 18, 0,
        0, 18, 18, 18, 18, 18, 18, 18, 18, 0,
        0, 18, 18, 18, 18, 18, 18, 18, 18, 0,
        0, 18, 18, 18, 18, 18, 18, 18, 18, 0,
        0, 18, 18, 18, 18, 18, 18, 18, 18, 0,
        0, 18, 18, 18, 18, 18, 18, 18, 18, 0,
        0, 18, 18, 18, 18, 18, 18, 18, 18, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "Middle",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 127, 127, 127, 127, 127, 127, 127, 127, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 130, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 119, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 104, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "Collision",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = true
      },
      encoding = "lua",
      data = {
        33, 34, 34, 34, 34, 34, 34, 34, 34, 35,
        43, 0, 0, 0, 0, 0, 0, 0, 0, 45,
        43, 66, 67, 0, 0, 0, 0, 0, 0, 45,
        43, 0, 0, 0, 0, 0, 0, 0, 0, 45,
        43, 0, 0, 0, 0, 0, 0, 0, 0, 45,
        43, 0, 0, 0, 0, 0, 0, 0, 84, 45,
        43, 0, 0, 0, 0, 0, 0, 0, 0, 45,
        43, 0, 0, 0, 0, 0, 0, 0, 0, 45,
        43, 0, 0, 0, 0, 0, 0, 0, 0, 45,
        53, 54, 54, 54, 54, 54, 54, 54, 54, 55
      }
    },
    {
      type = "objectgroup",
      name = "Object Layer 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 3,
          name = "Basket",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 160,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 150,
          visible = true,
          properties = {
            ["height"] = 19,
            ["offsetx"] = 7,
            ["offsety"] = 8,
            ["width"] = 19
          }
        },
        {
          id = 5,
          name = "Stool",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 192,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 146,
          visible = true,
          properties = {
            ["height"] = 32,
            ["offsetx"] = 0,
            ["offsety"] = 0,
            ["width"] = 32
          }
        },
        {
          id = 6,
          name = "Drawer",
          type = "",
          shape = "rectangle",
          x = 256,
          y = 224,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 94,
          visible = true,
          properties = {
            ["height"] = 32,
            ["offsetx"] = 0,
            ["offsety"] = 0,
            ["width"] = 32
          }
        },
        {
          id = 7,
          name = "Bin",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 288,
          width = 32,
          height = 32,
          rotation = 0,
          gid = 160,
          visible = true,
          properties = {
            ["height"] = 22,
            ["offsetx"] = 9,
            ["offsety"] = 5,
            ["width"] = 15
          }
        }
      }
    },
    {
      type = "tilelayer",
      name = "Foreground",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 56, 57, 0, 0, 0, 0, 100, 0, 0,
        0, 0, 0, 0, 100, 0, 0, 130, 0, 0,
        0, 0, 0, 0, 140, 0, 0, 120, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      name = "Foreground 2",
      x = 0,
      y = 0,
      width = 10,
      height = 10,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 140, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
