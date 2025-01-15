extends TextureRect
class_name FlippableTextureRect

@export var textures: Array[Texture2D];

var current_texture_index: int = 0;

func _ready():
	if textures == null || textures.size() == 0:
		printerr("Error: No textures provided for FlippableTextureRect.")
		return
	current_texture_index = 0;
	texture = textures[current_texture_index];

func switch_to_next_texture():
	if textures == null || textures.size() == 0:
		printerr("Error: No textures provided for FlippableTextureRect.")
		return
	switch_to(current_texture_index + 1);

func switch_to(index: int):
	current_texture_index = index % textures.size();
	texture = textures[current_texture_index];

func flip():
	if textures == null || textures.size() == 0:
		printerr("Error: No textures provided for FlippableTextureRect.")
		return
	if textures.size() > 2:
		print("Warn: Flipping texture is not supported for more than 2 textures. Set to index 0.");
		switch_to(0);
		return ;
	switch_to(current_texture_index == 0);
