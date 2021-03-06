function Initialize()
	 TitleMeasure = SKIN:GetMeasure('MPlayer')
	 ArtistMeasure = SKIN:GetMeasure('MArtist')
   LyricsMeasure = SKIN:GetMeasure('MeasureGetLyrics')
   PositionMeasure = SKIN:GetMeasure('MPosition')
   OldTitleVariable = TitleMeasure:GetStringValue()
	 LyricsValue = LyricsMeasure:GetStringValue()
	 Contents = {}
		i = 1
		found = 0
end

function Update()

   PositionValue = PositionMeasure:GetStringValue()
   NewTitleVariable = TitleMeasure:GetStringValue()
	 ArtistVariable = ArtistMeasure:GetStringValue()

	 line = ""
   r = "ss"

	 if LyricsValue == "-1" then
	 		LyricsValue = LyricsMeasure:GetStringValue()
	 elseif LyricsValue ~= "-1" and found == 0 then
		 	LyricOrganize(LyricsValue)
			found=1
	 end

   if NewTitleVariable == OldTitleVariable then
      r = "same"
   elseif NewTitleVariable ~= OldTitleVariable then --[[new music detected, reload the skin to get the lyric]]
      r = "new"
			SKIN:Bang("!Refresh")
   else
      r = "error"
   end

	 if Contents[PositionValue] ~= nil then
		 SKIN:Bang('!SetOption Meter1 Text "' .. Contents[PositionValue] .. '"')
	 end

   return r
end

function LyricOrganize(LyricsString)
  Contents = {}
	str = LyricsString

	local startFound = 0

	for line in str:gmatch("[^\r\n]+") do
		if string.match(line, "%[00:") and startFound == 0 then
			startFound = 1
		end
		if startFound == 1	then							 --[[skip non timestamped lines ]]
			lyricStartIndex = line:match'^.*()%d+%d+%]'
			if lyricStartIndex == nil then
				lyricLine =""
			else
				lyricLine = string.sub(line,lyricStartIndex+3)
				if lyricLine == " " then
					lyricLine = " "
				end
			end
			while string.match(line, "%[........%]") do
				key = string.sub(line,2,6)
				line = string.sub(line,11)
				Contents[key] = lyricLine
			end
		end
	end

	return Contents
end
