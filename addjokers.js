let jokers = [
  {
    name: "Big Loser",
    text: [
      "Gain {C:attention}$4{} and {X:mult,C:white}X3{} Mult",
      "if {C:attention}poker hand{} is a {C:attention}High Card{}.",
      "Poker hand changes",
      "on every matching hand",
      "{C:inactive}(Impractical Joker + To-Do List){}",
    ],
    image_url: "assets/1x/j_f_big_loser.png",
    rarity: "Fusion",
    fusion_jokers: [
      "img/j_impractical.png",
      "img/j_todo_list.png"
    ]
  },
  {
    name: "Tightrope",
    text: [
      "{X:red,C:white} X3{} Mult on {C:attention}final hand{} of round. This Joker gains {X:red,C:white} X0.75{} Mult when {C:attention}final{}",
      "{C:attention}hand{} is played",
      "{C:inactive}(Acrobat + Chalk Outline){}"
    ],
    image_url: "assets/1x/j_f_tightrope.png",
    rarity: "Fusion",
    fusion_jokers: [
      "img/j_acrobat.png",
      "img/j_chalk_outline.png"
    ]
  },
  {
    name: "Commercial Chemist",
    text: [
      "{C:green}1 in 2{} chance to create an {C:alchemical}Alchemical{} card when you",
      "{C:attention}sell{} a non-{C:alchemical}Alchemical{} card",
      "{C:inactive}(Studious Joker + Pawn Joker){}",
    ],
    image_url: "assets/1x/j_f_commercial_chemist.png",
    rarity: "Fusion",
    fusion_jokers: [
      "img/j_studious_joker.png",
      "img/j_pawn.png"
    ]
  },
  {
    name: "Published Study",
    text: [
      "Create an {C:alchemical}Alchemical{} card when {C:attention}Blind{} is selected. Create a {C:dark_edition}Negative{} {C:tarot}Tarot{} card after using your first {C:alchemical}Alchemical{} card each round.",
      "{C:inactive}(Cartomancer + Chain Reaction){}"
    ],
    image_url: "assets/1x/j_f_published_study.png",
    rarity: "Fusion",
    fusion_jokers: [
      "img/j_cartomancer.png",
      "img/j_chain_reaction.png"
    ]
  },
  {
    name: "Monday Menace",
    text: [
      "{C:dark_edition}+1{} Joker Slot",
      "Create a random {C:planet}Planet{} or {C:tarot}Tarot{} card per 2 {C:attention}rerolls{} in the shop.",
      "{C:inactive}(Must have room){}",
      "{C:inactive}(Sunday Funnies + Philosophical Joker){}",
    ],
    image_url: "assets/1x/j_f_monday_menace.png",
    rarity: "Fusion",
    fusion_jokers: [
      "img/j_sunday_funnies.png",
      "img/j_mf_pipe.png"
    ]
  },
  {
    name: "Typography Joker",
    text: [
      "Other {C:blue}Common{} and {C:attention}Fusion{} Jokers each give {C:mult}+10{} Mult if played hand contains no {C:attention}face cards{}.",
      "{C:inactive}(Minimalist Joker + Simplified Joker){}"
    ],
    image_url: "assets/1x/j_f_typography.png",
    rarity: "Fusion",
    fusion_jokers: [
      "img/j_minimalist.png",
      "img/j_mf_simplified.png"
    ]
  },
  {
    name: "Party Animal",
    text: [
      "This Joker gains {C:chips}+16{} Chips when played hand is a {C:attention}High Card{} or {C:attention}Pair{}.",
      "{C:inactive}(Currently {}{C:chips,s:0.7}+0{}{C:inactive} Chips){}",
      "{C:inactive}(Pitiful Joker + Shepherd Joker)"
    ],
    image_url: "assets/1x/j_f_party_animal.png",
    rarity: "Fusion",
    fusion_jokers: [
      "img/j_pitiful.png",
      "img/j_shepherd.png"
    ]
  },
  {
    name: "Fishclown",
    text: [
      "{C:attention}Enhanced Cards{} gives {X:mult,C:white}X1.5{} Mult when scored.",
      "{C:inactive}(Expanded Art Joker + Clownfish){}"
    ],
    image_url: "assets/1x/j_f_fishclown.png",
    rarity: "Fusion",
    fusion_jokers: [
      "img/j_expanded_art.png",
      "img/j_mf_clownfish.png"
    ]
  },
  {
    name: "Electric Chair",
    text: [
      "{C:green}1 in 3{} chance to get an {C:alchemical}Alchemical{} card when you discard an {C:attention}Enhanced{} or {C:attention}face{} card.",
      "{C:inactive}(Faceless Joker + Shock Humor){}"
    ],
    image_url: "assets/1x/j_f_electric_chair.png",
    rarity: "Fusion",
    fusion_jokers: [
      "img/j_faceless.png",
      "img/j_shock_humor.png"
    ]
  },
  {
    name: "Original Character",
    text: [
      "{C:dark_edition}+1{} Joker Slot",
      "{C:mult}+12{} Mult for each empty {C:attention}Joker{} slot.",
      "{C:inactive}(Joker Stencil + Autism Creature){}"
    ],
    image_url: "assets/1x/j_f_original_character.png",
    rarity: "Fusion",
    fusion_jokers: [
      "img/j_stencil.png",
      "img/j_autism_creature.png"
    ]
  }
]

// works the same. 
let consumables = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Tarot"
  // },
]

let card_modifications = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Enhancement"
  // },
]

let decks = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/j_joker.png",
  //   rarity: "Deck"
  // },
]

let stickers = [
  // {
  //   name: "Joker",
  //   text: [
  //     "{C:mult}+4{} Mult"
  //   ],
  //   image_url: "img/sticker_example.png",
  //   rarity: "Sticker"
  // },
]

let blinds = [
  // {
  //   name: "The Wall",
  //   text: [
  //     "Extra large blind",
  //     "{C:inactive}({C:red}4x{C:inactive} Base for {C:attention}$$$$${C:inactive})",
  //     "{C:inactive}(Appears from Ante 2)"
  //   ],
  //   image_url: "img/the_wall.png",
  //   rarity: "Boss Blind"
  // },
]

let shop_items = [
]

let cols = {
  
  MULT: "#FE5F55",
  CHIPS: "#009dff",
  MONEY: "#f3b958",
  XMULT: "#FE5F55",
  FILTER: "#ff9a00",
  ATTENTION: "#ff9a00",
  BLUE: "#009dff",
  RED: "#FE5F55",
  GREEN: "#4BC292",
  PALE_GREEN: "#56a887",
  ORANGE: "#fda200",
  IMPORTANT: "#ff9a00",
  GOLD: "#eac058",
  YELLOW: "#ffff00",
  CLEAR: "#00000000", 
  WHITE: "#ffffff",
  PURPLE: "#8867a5",
  BLACK: "#374244",
  L_BLACK: "#4f6367",
  GREY: "#5f7377",
  CHANCE: "#4BC292",
  JOKER_GREY: "#bfc7d5",
  VOUCHER: "#cb724c",
  BOOSTER: "#646eb7",
  EDITION: "#ffffff",
  DARK_EDITION: "#5d5dff",
  ETERNAL: "#c75985",
  INACTIVE: "#ffffff99",
  HEARTS: "#f03464",
  DIAMONDS: "#f06b3f",
  SPADES: "#403995",
  CLUBS: "#235955",
  ENHANCED: "#8389DD",
  JOKER: "#708b91",
  TAROT: "#a782d1",
  ALCHEMICAL: "#C09D75",
  PLANET: "#13afce",
  SPECTRAL: "#4584fa",
  VOUCHER: "#fd682b",
  EDITION: "#4ca893",
}

let rarities = {
  "Common": "#009dff", 
  "Uncommon": "#4BC292",
  "Rare": "#fe5f55",
  "Legendary": "#b26cbb",
  "Joker": "#708b91",
  "Tarot": "#a782d1",
  "Planet": "#13afce",
  "Spectral": "#4584fa",
  "Voucher": "#fd682b",
  "Pack": "#9bb6bd",
  "Enhancement": "#8389DD",
  "Edition": "#4ca893",
  "Seal": "#4584fa",
  "Deck": "#9bb6bd",
  "Sticker": "#5d5dff",
  "Boss Blind": "#5d5dff",
  "Showdown": "#4584fa",
  "Fusion": "#F7D762"
}

regex = /{([^}]+)}/g;

let add_cards_to_div = (jokers, jokers_div) => {
  for (let joker of jokers) {
    console.log("adding joker", joker.name);
  
    joker.text = joker.text.map((line) => { return line + "{}"});
  
    joker.text = joker.text.join("<br/>");
    joker.text = joker.text.replaceAll("{}", "</span>");
    joker.text = joker.text.replace(regex, function replacer(match, p1, offset, string, groups) {
      let classes = p1.split(",");
  
      let css_styling = "";
  
      for (let i = 0; i < classes.length; i++) {
        let parts = classes[i].split(":");
        if (parts[0] === "C") {
          css_styling += `color: ${cols[parts[1].toUpperCase()]};`;
        } else if (parts[0] === "X") {
          css_styling += `background-color: ${cols[parts[1].toUpperCase()]}; border-radius: 5px; padding: 0 5px;`;
        }
      }
  
      return `</span><span style='${css_styling}'>`;
    });
  
    let joker_div = document.createElement("div");
    joker_div.classList.add("joker");
    if (joker.rarity === "Sticker" || joker.rarity == "Seal") {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <img src="${joker.image_url}" alt="${joker.name}" class="hasback" />
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    } else if (joker.soul) {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <span class="soulholder">
          <img src="${joker.image_url}" alt="${joker.name}" class="soul-bg" />
          <img src="${joker.image_url}" alt="${joker.name}" class="soul-top" />
        </span>
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    } else {
      joker_div.innerHTML = `
        <h3>${joker.name}</h3>
        <img src="${joker.image_url}" alt="${joker.name}" />
        <h4 class="rarity" style="background-color: ${rarities[joker.rarity]}">${joker.rarity}</h4>
        <div class="text">${joker.text}</div>
      `;
    }

    if (joker.fusion_jokers) {
      let fusion_div = document.createElement("div");
      fusion_div.innerHTML = `
      <table>
        <tr>
        <td><img src="${joker.fusion_jokers[0]}" alt="${joker.name}" style="width: 100%; height: 100%"/></td>
        <td><h1 style="padding-right: 20px; padding-left: 20px">+</h1></td>
        <td><img src="${joker.fusion_jokers[1]}" alt="${joker.name}" style="width: 100%; height: 100%"/></td>
        </tr>
      </table>
      `
      joker_div.innerHTML += `
      <button type="button" class="collapsible">Show Fusion</button>`

      fusion_div.classList.add("content");
      joker_div.appendChild(fusion_div);
    }
  
    jokers_div.appendChild(joker_div);
  }
}

if (jokers.length === 0) {
  document.querySelector(".jokersfull").style.display = "none"
} else {
  let jokers_div = document.querySelector(".jokers");
  add_cards_to_div(jokers, jokers_div);
}

if (consumables.length === 0) {
  document.querySelector(".consumablesfull").style.display = "none"
} else {
  let consumables_div = document.querySelector(".consumables");
  add_cards_to_div(consumables, consumables_div);
}

if (card_modifications.length === 0) {
  document.querySelector(".cardmodsfull").style.display = "none"
} else {
  let cardmods_div = document.querySelector(".cardmods");
  add_cards_to_div(card_modifications, cardmods_div);
}

if (decks.length === 0) {
  document.querySelector(".decksfull").style.display = "none"
} else {
  let decks_div = document.querySelector(".decks");
  add_cards_to_div(decks, decks_div);
}

if (stickers.length === 0) {
  document.querySelector(".stickersfull").style.display = "none"
} else {
  let stickers_div = document.querySelector(".stickers");
  add_cards_to_div(stickers, stickers_div);
}

if (blinds.length === 0) {
  document.querySelector(".blindsfull").style.display = "none"
} else {
  let blinds_div = document.querySelector(".blinds");
  add_cards_to_div(blinds, blinds_div);
}

if (shop_items.length === 0) {
  document.querySelector(".shopitemsfull").style.display = "none"
} else {
  let shopitems_div = document.querySelector(".shopitems");
  add_cards_to_div(shop_items, shopitems_div);
}

var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      this.innerHTML = "Show Fusion"
      content.style.maxHeight = null;
    } else {
      this.innerHTML = "Hide Fusion"
      content.style.maxHeight = content.scrollHeight + "px";
    }
  });
}