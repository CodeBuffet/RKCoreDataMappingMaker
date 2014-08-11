fs = require "fs"

path = process.argv[2]
fs.readFile path, (err, buf) ->
  throw err  if err

  data = buf.toString()
  re = /\* (.*?);/g

  output = "[mapping addAttributeMappingsFromArray:@[\n"

  while (match = re.exec(data)) != null
    fn = match[1]
    output += '\t@"' + fn + '",\n'

  output = output.substring(0, output.length - 2) + "];"

  console.log output

  return
