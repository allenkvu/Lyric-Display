# Lyric-Display
Rainmeter skin that shows lyrics synced with the music by using corresponding .lrc file.

This skin will look for the .lrc file at user given path for the current playing music and displays the lryic line by line in sync with the music.
Works well with the music player foobar2000.

What you need to change and prepare:

-This skin needs .lrc file for each of the music you want to display lyrics for (you could google for it or create your own in foobar)

-Make sure the name format for the .lrc file is (whateverArtistName) - (whateverSongName).lrc (ex. yuzu - from.lrc)

-Open lyric.ini in this skin

-Change the "PlayerPath" to your foobar2000 player location (if using any other player then also change the "Player" to corresponding one)

-Change "URL" at [MeasureGetLyrics] to the path to your lyric folder that contains .lrc

-Now if the music your playing has corresponding .lrc file then lyric will be displayed line by line.
