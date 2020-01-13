function conky_int3pad (number)
    return string.format('%3i', conky_parse(number))
end

function conky_int4pad (number)
    return string.format('%4i', conky_parse(number))
end

function conky_float5pad (number)
   return string.format("%5.1f", conky_parse(number))
end

function conky_extractnum (str)
   for match in string.gmatch(conky_parse(str), '%d[%d.,]*')
   do
      return match
   end
end
