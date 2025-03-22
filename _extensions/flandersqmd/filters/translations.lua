function is_empty(s)
  return s == nil or s == ''
end

function entity_en(entity, level)
  local result
  if (entity == "INBO") then
    result = {
      url = "https://www.vlaanderen.be/inbo/en",
      entity_name = "Research Insitutite for Nature and Forest (INBO)",
    }
    if is_empty(level) or tonumber(pandoc.utils.stringify(level)) < 2 then
      result.entity_title_logo = "inbo-en-black.jpg"
    else
      result.entity_title_logo = "inbo-en-title.png"
    end
  else
    result = {
      url = "invalid `flandersqmd.entity`"
    }
  end
  result.flanders_title_logo = "flanders-en-title.png"
  result.flanders_alt = "Flanders, state of the art"
  result.title_logo_style = "max-width: 205px;"
  return result
end

function entity_nl(entity, level)
  local result
  if (entity == "INBO") then
    result = {
      url = "https://www.vlaanderen.be/inbo",
      entity_name = "Instituut voor Natuur- en Bosonderzoek (INBO)",
      flanders_alt = "Vlaanderen is wetenschap"
    }
    if is_empty(level) or tonumber(pandoc.utils.stringify(level)) < 2 then
      result.flanders_title_logo = "flanders-nl-intermediate.jpg"
      result.entity_title_logo = "inbo-nl-black.png"
      result.title_logo_style = "max-width: 245px;"
    else
      result.flanders_title_logo = "flanders-nl-title.png"
      result.entity_title_logo = "inbo-nl-title.png"
      result.title_logo_style = "max-width: 250px;"
    end
  else
    result = {
      url = "invalid `flandersqmd.entity`"
    }
  end
  return result
end

function translation(lang, entity, level)
  if (lang == "nl-BE") then
    result = entity_nl(entity, level)
  else
    result = entity_en(entity, level)
  end
  return result
end

function display_person (person, i)
  res = ""
  if is_empty(person.name) then
    res = '<h1 class = "missing">!!! flandersqmd.authors element ' .. i .. ' has no name element!!!</h1>'
    return res
  end
  if is_empty(person.name.given) then
    res = '<h1 class = "missing">!!! flandersqmd.authors element ' .. i .. ' has no given element under name!!!</h1>'
    return res
  end
  if is_empty(person.name.family) then
    res = '<h1 class = "missing">!!! flandersqmd.authors element ' .. i .. ' has no given element under name!!!</h1>'
    return res
  end
  if is_empty(person.email) then
    res = pandoc.utils.stringify(person.name.given) .. ' ' .. pandoc.utils.stringify(person.name.family)
  else
    res = res .. '<a href= "mailto:' .. pandoc.utils.stringify(person.email) .. '" class = "title email">' .. pandoc.utils.stringify(person.name.given) .. ' ' .. pandoc.utils.stringify(person.name.family) .. '</a>'
  end
  if (is_empty(person.orcid)) then
    return res
  end
  res = res .. '<a href="https://orcid.org/' .. pandoc.utils.stringify(person.orcid) .. '" class="quarto-title-author-orcid"> <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1N0NEMjA4MDI1MjA2ODExOTk0QzkzNTEzRjZEQTg1NyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozM0NDOEJGNEZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozM0NDOEJGM0ZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZDN0YxMTc0MDcyMDY4MTE5NUZFRDc5MUM2MUUwNEREIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjU3Q0QyMDgwMjUyMDY4MTE5OTRDOTM1MTNGNkRBODU3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+84NovQAAAR1JREFUeNpiZEADy85ZJgCpeCB2QJM6AMQLo4yOL0AWZETSqACk1gOxAQN+cAGIA4EGPQBxmJA0nwdpjjQ8xqArmczw5tMHXAaALDgP1QMxAGqzAAPxQACqh4ER6uf5MBlkm0X4EGayMfMw/Pr7Bd2gRBZogMFBrv01hisv5jLsv9nLAPIOMnjy8RDDyYctyAbFM2EJbRQw+aAWw/LzVgx7b+cwCHKqMhjJFCBLOzAR6+lXX84xnHjYyqAo5IUizkRCwIENQQckGSDGY4TVgAPEaraQr2a4/24bSuoExcJCfAEJihXkWDj3ZAKy9EJGaEo8T0QSxkjSwORsCAuDQCD+QILmD1A9kECEZgxDaEZhICIzGcIyEyOl2RkgwAAhkmC+eAm0TAAAAABJRU5ErkJggg=="></a>'
  return res
end

function title_author(author)
  if is_empty(author) then
    return '!!! Missing flandersqmd.author !!!'
  end
  z =''
  for i, person in pairs(author) do
    z = z .. display_person(person, i) .. '&emsp;'
  end
  return pandoc.RawInline('html', z)
end

function levelcss (entity)
  local css
  css = ':root {'
  if (entity == "inbo") then
    -- white
    css = css .. '  --flandersqmd-level1-colour: #FFFFFF;'
    -- fushia
    css = css .. '  --flandersqmd-level1-trapezium: #C04384;'
    -- fushia
    css = css .. '  --flandersqmd-level2-colour: #C04384;'
    -- fushia
    css = css .. '  --flandersqmd-sidebar-bg: #C04384;'
    -- white
    css = css .. '  --flandersqmd-sidebar-colour: #FFFFFF;'
    -- fushia
    css = css .. '  --flandersqmd-sidebar-tussen-colour: #C04384;'
    -- darkblue
    css = css .. '  --flandersqmd-link-colour: #356196;'
    -- black
    css = css .. '  --r-main-color: #000000;'
    -- black
    css = css .. '  --quarto-hl-fu-color: #000000;'
    -- gray
    css = css .. '  --flandersqmd-footnote: #8E9DA7;'
    -- fushia
    css = css .. '  --flandersqmd-border: #C04384;'
    -- blue
    css = css .. ' --r-link-color: #356196;'
    -- lightblue
    css = css .. ' --r-link-color-hover: #BDDDD7;'
  else
    -- canary yellow
    css = css .. '  --flandersqmd-level1-trapezium: #FFED00;'
    -- darkgray
    css = css .. '  --flandersqmd-level1-colour: #3C3D3C;'
    -- dark yellow
    css = css .. '  --flandersqmd-level2-colour: #F0D70F;'
    -- canary yellow
    css = css .. '  --flandersqmd-sidebar-bg: #FFED00;'
    -- darkgray
    css = css .. '  --flandersqmd-sidebar-colour: #3C3D3C;'
    -- darkgray
    css = css .. '  --flandersqmd-sidebar-tussen-colour: #3C3D3C;'
    -- darkblue
    css = css .. '  --flandersqmd-link-colour: #215E9E;'
    -- darkgray main color
    css = css .. '  --r-main-color: #3C3D3C;'
    -- darkgray code base color
    css = css .. '  --quarto-hl-fu-color: #3C3D3C;'
    -- gray
    css = css .. '  --flandersqmd-footnote: #D5D5D5;'
    -- dark yellow
    css = css .. '  --flandersqmd-border: #F0D70F;'
    -- dark blue
    css = css .. ' --r-link-color: #15465B;'
    -- light blue
    css = css .. ' --r-link-color-hover: #32B2E9;'
  end
  -- white
  css = css .. '  --flandersqmd-title-colour: #FFFFFF;'
  -- white
  css = css .. '  --flandersqmd-title-border: #FFFFFF;'
  -- white
  css = css .. '  --flandersqmd-level1-bg: #FFFFFF;'
  css = css .. '}'
  return css
end

return {
  {
    Meta = function(meta)
      if is_empty(meta.flandersqmd) then
        meta.title = "No `flandersqmd` entry found in yaml"
        meta.entitycolours = 'flanders'
        meta.translation = translation(
          pandoc.utils.stringify(meta.lang), "INBO"
        )
      else
        if is_empty(meta.flandersqmd.entity) then
          meta.translation = translation(
            pandoc.utils.stringify(meta.lang), "INBO", meta.flandersqmd.level
          )
        else
          meta.translation = translation(
            pandoc.utils.stringify(meta.lang),
            pandoc.utils.stringify(meta.flandersqmd.entity),
            meta.flandersqmd.level
          )
        end
        if is_empty(meta.flandersqmd.title) then
          meta.title = "missing `flandersqmd:title`"
        else
          meta.title = pandoc.utils.stringify(meta.flandersqmd.title)
        end
        if is_empty(meta.flandersqmd.level) or tonumber(pandoc.utils.stringify(meta.flandersqmd.level)) < 2 then
          meta.entitycolours = 'flanders'
        else
          if is_empty(meta.flandersqmd.entity) then
            meta.entitycolours = 'inbo'
          else
            meta.entitycolours = pandoc.text.lower(pandoc.utils.stringify(meta.flandersqmd.entity))
          end
        end
        meta.title_author = title_author(meta.flandersqmd.author)
      end
      meta.entitycss = levelcss(meta.entitycolours)
      return meta
    end,
  }
}
