const http = require("http");

const PORT = process.env.PORT || 8080;

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/html" });

  res.end(`
    <html>
      <head>
        <title>Terraform Blue Green Deployment</title>
      </head>
      <body>
        <h1>AWS Elastic Beanstalk Deployment</h1>
        <h2>Day 18 - Terraform Blue Green Project</h2>
        <p>Application is running successfully!</p>
      </body>
    </html>
  `);
});

server.listen(PORT, "0.0.0.0", () => {
  console.log(`Application running on port ${PORT}`);
});
