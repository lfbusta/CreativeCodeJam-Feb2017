dialogue = {}

dialogue.emily = {
  lines = {
    "Hello my Booboo.",
    "How are you today?",
    "I'm hungry. Can I eat you?"
  },
  decision = {
    topchoice = "yes",
    bottomchoice = "no",
    topresponse = {"Oh really?","I will come to get you soon then!"},
    bottomresponse = {"But why not my Booboo?","You look so tasty."}
  },
  question = true
}

dialogue.basket = {
  lines = {
    "You got a hat!"
  },
  question = false
}

return dialogue
