const express = require("express")
const app = express()

const PORT = process.env.PORT || 8000

app.get("/", (req,res)=>{
      res.json({ "message": "Hey, I am nodejs  in container "})
})
app.get("/health", (req, res) => {
  res.status(200).json({
    status: "healthy",
    uptime: process.uptime(),
    timestamp: Date.now()
  });
});
app.listen(PORT, ()=>console.log(`Server started on  PORT: ${PORT}`))