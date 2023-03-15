GLYPHS = {
	'8b': '⬅',
	'91': '➡',
	'94': '⬆',
	'83': '⬇',
	'97': '❎',
	'8e': '🅾',
}

def main():
    data = None
    with open('nocart.p8', 'r') as file:
        data = file.read()

    for code, glyph in GLYPHS.items():
        data = data.replace(f'\\x{code}', glyph)
  
    with open('nocart.p8', 'w') as file:
        file.write(data)

main()
