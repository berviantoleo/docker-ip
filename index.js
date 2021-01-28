const express = require('express')
const app = express()
const requestIp = require('request-ip');
const port = 80

app.use(requestIp.mw())

const directory = {

}

app.get('/', (req,res) =>
{
  const ip = req.clientIp;
  directory[ip] = directory[ip] ? directory[ip] + 1 : 1
  res.send({
    'User address': ip,
    'Hits': directory[ip]
  });
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
})