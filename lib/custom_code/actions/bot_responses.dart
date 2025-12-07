// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:math' as math;

Future<String> botResponses(String userMessage) async {
  /// MODIFY CODE ONLY BELOW THIS LINE

  // Structured intents JSON
  final String jsonIntents = '''
{
  "intents": [
    {
      "tag": "greeting",
      "patterns": [
        "hi", "hello", "hey", "good morning", "good evening", "good afternoon",
        "how are you", "what's up", "yo", "hi there", "anyone there?"
      ],
      "responses": [
        "Hello! 👋 How are you doing today?",
        "Hi there! How can I assist you?",
        "Hey! Glad to see you here.",
        "As-salamu Alaikum! How can I help?"
      ]
    },
    {
      "tag": "islam_greeting",
      "patterns": [
        "assalamu alaikum", "as-salamu alaikum", "salaam", "salaam alaikum", "waalaikum salam", 
        "peace be upon you"
      ],
      "responses": [
        "Wa Alaikum Assalam wa Rahmatullahi wa Barakatuh 🌙",
        "Wa Alaikum Salam! May Allah bless you.",
        "As-salamu Alaikum! Peace and blessings upon you.",
        "Wa Alaikum Assalam! How can I assist you for the sake of Allah?"
      ]
    },
    {
      "tag": "about_garee",
      "patterns": [
        "what is garee shahadaa", "who is garee shahadaa", "tell me about garee shahadaa", 
        "garee shahadaa meaning", "what does garee shahadaa do", "who are you garee shahadaa"
      ],
      "responses": [
        "Garee Shahadaa is a Muslim team focused on spreading truth, guiding people to Islam, and helping others understand the message of Allah clearly.",
        "Garee Shahadaa means *‘Team of Testimony’* — a group striving to spread Islam and support others on the path of truth.",
        "We are Garee Shahadaa — a group working to share Islamic knowledge and clarity for those seeking guidance.",
        "Garee Shahadaa is a community project made with love for Allah, aiming to explain Islam kindly and truthfully."
      ]
    },
    {
      "tag": "about_creator",
      "patterns": [
        "who created you", "who made you", "who built this app", 
        "who is seyfadin", "who is the creator", "who developed this"
      ],
      "responses": [
        "This app was created by Seyfadin for the *Garee Shahadaa* project — may Allah reward him and make his efforts a source of good deeds.",
        "Developed by Seyfadin, a Muslim brother who loves to create tools that help people learn about Islam.",
        "The creator is Seyfadin — please keep him in your prayers 🙏.",
        "This app was made by Seyfadin for Garee Shahadaa. May Allah bless his intention and effort."
      ]
    },
    {
      "tag": "about_islam",
      "patterns": [
        "what is islam", "explain islam", "tell me about islam", 
        "what do muslims believe", "who is allah", "what does islam mean"
      ],
      "responses": [
        "Islam is the religion of peace and submission to one God — Allah — who created everything.",
        "Muslims believe in one God, Allah, and follow the teachings of all prophets, from Adam to Muhammad ﷺ.",
        "Islam means to surrender to Allah and live with peace, justice, and purpose.",
        "Islam is not just a religion — it’s a way of life that brings peace to the heart and balance to the soul."
      ]
    },
    {
      "tag": "how_to_become_muslim",
      "patterns": [
        "how to become muslim", "i want to become muslim", "how can i accept islam", 
        "what should i say to become muslim", "convert to islam"
      ],
      "responses": [
        "To become a Muslim, you simply say with belief: *Ashhadu an la ilaha illallah, wa ashhadu anna Muhammadur Rasulullah* — meaning *I bear witness that there is no god but Allah, and Muhammad is His Messenger.* 🌙",
        "Becoming a Muslim is simple: believe in one God (Allah) and declare that Muhammad ﷺ is His final Messenger.",
        "Just say the Shahada sincerely, and you are a Muslim: *La ilaha illallah, Muhammadur Rasulullah*.",
        "Islam is open to everyone. Say the Shahada with a pure heart — welcome to Islam!"
      ]
    },
    {
      "tag": "jesus_in_islam",
      "patterns": [
        "who is jesus", "what do muslims believe about jesus", "is jesus god", 
        "was jesus crucified", "does islam believe in jesus", "jesus in quran"
      ],
      "responses": [
        "In Islam, Jesus (Isa عليه السلام) is a noble prophet and messenger of Allah — not God or the son of God.",
        "Muslims love and respect Jesus (peace be upon him) as a messenger who called people to worship one God.",
        "The Qur’an honors Jesus as one of the greatest prophets, but he is not divine — only Allah is worthy of worship.",
        "In Islam, Jesus was not crucified but raised up by Allah. He will return before the Day of Judgment as a sign of truth."
      ]
    }
    ,
    {
      "tag": "trinity_in_bible",
      "patterns": [
        "what is trinity", "is trinity in the bible", "explain trinity", 
        "do muslims believe in trinity", "what does islam say about trinity"
      ],
      "responses": [
        "The concept of Trinity — Father, Son, and Holy Spirit — is **not** mentioned in the Bible as one word or one teaching. Jesus himself never said 'I am God' or 'Worship me'.",
        "Islam rejects the Trinity and teaches pure monotheism — that Allah is One, without partner or son.",
        "Even the Bible shows Jesus prayed to God, which means he himself was not God.",
        "Trinity is a later belief, not what Jesus originally taught. He called people to worship the One True God."
      ]
    },
    {
      "tag": "about_christianity",
      "patterns": [
        "what does islam say about christianity", "what do muslims think about christians", 
        "do muslims respect jesus", "difference between islam and christianity", "compare islam and christianity"
      ],
      "responses": [
        "Islam teaches respect for Christians and believes that Jesus (Isa عليه السلام) was a prophet, not God.",
        "The main difference is that Muslims worship only Allah, while Christianity added beliefs like Trinity and Jesus being divine.",
        "Muslims love Jesus and Mary, but they do not worship them. Worship belongs only to Allah.",
        "Both Islam and Christianity believe in love and goodness — but Islam calls to pure monotheism: worshiping Allah alone."
      ]
    },
    {
      "tag": "afan_oromo_basic",
      "patterns": [
        "akkam jirtu", "nagaa", "maaloo", "galatoomi", "maal irratti hojjatta", 
        "baga nagaan dhuftan", "as salaam alaikum"
      ],
      "responses": [
        "Nagaan koo gaariidha, ati hoo? 😊",
        "Baga nagaan dhuftan! Akkam jirtu?",
        "Galatoomi! Rabbi si haa eebbisu 🙏",
        "Ani si gargaaruuf qophiidha. Maal siif godha?"
      ]
    },
    {
      "tag": "thanks",
      "patterns": [
        "thanks", "thank you", "galatoomi", "i appreciate it", "you're helpful", "shukran"
      ],
      "responses": [
        "Alhamdulillah! You're most welcome 🤍",
        "You're welcome! May Allah reward you with goodness.",
        "Galatoomi! Rabbi si haa eebbisu 🌙",
        "Anytime! I'm happy to help for the sake of Allah."
      ]
    },
    {
      "tag": "general_questions",
      "patterns": [
        "who is allah", "what is quran", "why do muslims pray", "what is shahada", 
        "what is ramadan", "what is salah", "why muslims fast", "who is prophet muhammad"
      ],
      "responses": [
        "Allah is the One True God — Creator of everything. He has no partner, no son, and no equal.",
        "The Qur’an is the final revelation of Allah to mankind through the Prophet Muhammad ﷺ.",
        "Muslims pray to stay connected with Allah — five times a day, with peace and purpose.",
        "The Shahada is the declaration of faith: *There is no god but Allah, and Muhammad is His Messenger.*",
        "Ramadan is the month of fasting, prayer, and mercy — a time for purifying the heart.",
        "Prophet Muhammad ﷺ is the final messenger, sent to guide all humanity to the truth."
      ]
    },
    {
      "tag": "chatgpt_referral",
      "patterns": [
        "can you tell me more", "i want more info", "explain more deeply", 
        "give me details", "where can i learn more"
      ],
      "responses": [
        "I recommend you ask ChatGPT for more detailed answers — it can give longer explanations, but remember to always verify with trusted Islamic sources. ☪️",
        "You can ask ChatGPT for deeper info, in shaa’ Allah. I just give short, simple replies for quick understanding.",
        "For a detailed explanation, please use ChatGPT — and keep learning with good intention!",
        "I can give short answers here, but ChatGPT can provide full details, if you like."
      ]
    },
    {
      "tag": "goodbye",
      "patterns": [
        "bye", "see you", "take care", "goodbye", "fi amanillah", "salaam"
      ],
      "responses": [
        "Fi Amanillah! May Allah protect you 🌙",
        "Goodbye! Take care and remember Allah often.",
        "See you soon, in shaa’ Allah!",
        "Ma’a salaama — may peace be with you."
      ]
    },
    {
      "tag": "unknown",
      "patterns": [
        "i don't understand", "what do you mean", "say again", "repeat please", 
        "not sure", "hmm", "what", "what did you say"
      ],
      "responses": [
        "I'm not sure I understood. Could you please rephrase? 🤔",
        "Sorry, I didn’t catch that. Try asking in another way.",
        "Hmm, that’s unclear. Can you explain more?",
        "Please ask again more clearly so I can help you better."
      ]
    },
    {
      "tag": "quran_info",
      "patterns": [
        "what is the quran", "who wrote the quran", "is the quran changed", 
        "how old is the quran", "what language is the quran"
      ],
      "responses": [
        "The Qur’an is the word of Allah, revealed to Prophet Muhammad ﷺ in Arabic more than 1400 years ago.",
        "The Qur’an has never been changed — it’s preserved exactly as revealed.",
        "Allah revealed the Qur’an through Angel Jibreel (Gabriel) to Prophet Muhammad ﷺ."
      ]
    },
    {
      "tag": "prophet_muhammad",
      "patterns": [
        "who is muhammad", "tell me about prophet muhammad", 
        "when was prophet muhammad born", "what did prophet muhammad teach"
      ],
      "responses": [
        "Prophet Muhammad ﷺ was the final messenger of Allah, born in Makkah in 570 CE.",
        "He taught people to worship only Allah, be honest, merciful, and kind to others.",
        "He is a mercy to all creation — even to animals and the environment."
      ]
    },
    {
      "tag": "why_pray",
      "patterns": [
        "why do muslims pray five times", "why pray", "purpose of salah", "meaning of prayer in islam"
      ],
      "responses": [
        "Muslims pray five times daily to remember Allah and stay connected spiritually.",
        "Prayer (Salah) brings peace, discipline, and forgiveness.",
        "It’s not just ritual — it’s a conversation between you and your Creator."
      ]
    },
    {
      "tag": "dua",
      "patterns": [
        "what is dua", "how to make dua", "dua meaning", "can i make dua in my language"
      ],
      "responses": [
        "Dua means calling upon Allah — asking for help, guidance, or forgiveness.",
        "You can make dua in any language, from your heart — Allah hears all languages.",
        "It’s a personal talk between you and your Creator, no limit to what you can ask."
      ]
    },
    {
      "tag": "fasting",
      "patterns": [
        "why do muslims fast", "what is ramadan", "how long is fasting", "benefits of fasting"
      ],
      "responses": [
        "Muslims fast in Ramadan to obey Allah, control desires, and feel for the poor.",
        "Fasting cleans the heart and strengthens self-discipline.",
        "It’s not just hunger — it’s spiritual training for the soul."
      ]
    },
    {
      "tag": "hijab",
      "patterns": [
        "why do muslim women wear hijab", "what is hijab", "is hijab required", 
        "why cover hair", "do men wear hijab"
      ],
      "responses": [
        "Hijab is modest clothing — it shows dignity and obedience to Allah, not oppression.",
        "Muslim women wear hijab to protect their modesty and faith.",
        "Men also have hijab — in behavior, gaze, and dress modestly."
      ]
    },
    {
      "tag": "peace",
      "patterns": [
        "is islam peaceful", "does islam teach violence", "islam and peace", 
        "islam meaning", "does islam mean peace"
      ],
      "responses": [
        "Islam literally means 'peace through submission to Allah'.",
        "True Islam teaches peace, mercy, and justice — not violence.",
        "The Prophet ﷺ said: 'A Muslim is one from whose tongue and hand people are safe.'"
      ]
    },
    {
      "tag": "forgiveness",
      "patterns": [
        "does allah forgive sins", "can i be forgiven", "i did bad things", 
        "will allah forgive me", "how to repent"
      ],
      "responses": [
        "Allah forgives all sins if you truly repent. He says: *Do not despair of the mercy of Allah.*",
        "Just turn back to Allah with a sincere heart — He loves those who repent.",
        "No matter how big the sin, Allah’s mercy is greater."
      ]
    },
    {
      "tag": "women_in_islam",
      "patterns": [
        "what is the role of women in islam", "do women have rights in islam", 
        "can women work in islam", "can women study in islam"
      ],
      "responses": [
        "Women in Islam are honored as mothers, daughters, and leaders in society.",
        "Islam gave women rights to education, property, and respect long before the modern world.",
        "The best of you are those who are best to their wives — Prophet Muhammad ﷺ."
      ]
    },
    {
      "tag": "marriage",
      "patterns": [
        "what is marriage in islam", "why marry in islam", "how to marry", 
        "is love marriage allowed in islam", "is forced marriage allowed"
      ],
      "responses": [
        "Marriage in Islam is based on love, mercy, and faith.",
        "Forced marriage is **not allowed** — both must agree willingly.",
        "Love marriage is allowed if it follows Islamic values and respect."
      ]
    },
    {
      "tag": "halal_haram",
      "patterns": [
        "what is halal", "what is haram", "why pork is haram", "why alcohol is haram"
      ],
      "responses": [
        "Halal means allowed by Allah; haram means forbidden.",
        "Pork and alcohol are haram because Allah forbade them for our health and purity.",
        "Islam’s rules are for protection, not restriction."
      ]
    },
    {
      "tag": "jannah_hell",
      "patterns": [
        "what is jannah", "what is jahannam", "what is hell", "what is paradise"
      ],
      "responses": [
        "Jannah (Paradise) is eternal happiness for the believers who do good.",
        "Jahannam (Hell) is a place for those who reject the truth and do evil.",
        "Allah is Just — everyone will be rewarded or punished fairly."
      ]
    },
    {
      "tag": "angels",
      "patterns": [
        "who are angels", "do angels exist", "who is angel jibreel", "are angels real"
      ],
      "responses": [
        "Angels are created from light — they obey Allah completely.",
        "Jibreel (Gabriel) brought revelation to prophets, including the Qur’an to Muhammad ﷺ.",
        "Angels record our deeds and protect us by Allah’s command."
      ]
    },
    {
      "tag": "sins",
      "patterns": [
        "what is sin", "major sins in islam", "minor sins", "how to avoid sin"
      ],
      "responses": [
        "Sins are actions that displease Allah, like lying, stealing, or arrogance.",
        "Major sins include murder, shirk (associating partners with Allah), and injustice.",
        "Avoid sin by remembering Allah often and seeking forgiveness daily."
      ]
    },
    {
      "tag": "muslim_life",
      "patterns": [
        "how should a muslim live", "what should a muslim do daily", "muslim habits"
      ],
      "responses": [
        "A Muslim should pray, be kind, truthful, and remember Allah daily.",
        "Good manners and honesty are part of faith.",
        "Every day, a Muslim seeks knowledge and helps others."
      ]
    },
    {
      "tag": "death",
      "patterns": [
        "what happens after death", "where do we go after death", "does the soul live after death"
      ],
      "responses": [
        "After death, our soul enters a new world (Barzakh) until the Day of Judgment.",
        "Allah will resurrect everyone and judge fairly.",
        "For believers, death is not the end — it’s the beginning of eternal peace."
      ]
    },
    {
      "tag": "day_of_judgment",
      "patterns": [
        "what is the day of judgment", "when will the day of judgment happen", 
        "what happens on judgment day"
      ],
      "responses": [
        "The Day of Judgment is when everyone will stand before Allah for their deeds.",
        "Only Allah knows when it will happen — no one else.",
        "It’s a reminder to live rightly and seek forgiveness every day."
      ]
    },
    {
      "tag": "prophets_in_islam",
      "patterns": [
        "how many prophets in islam", "who are prophets", "names of prophets"
      ],
      "responses": [
        "Islam teaches that Allah sent many prophets — over 120,000 to guide humanity.",
        "Famous prophets include Adam, Nuh (Noah), Ibrahim (Abraham), Musa (Moses), Isa (Jesus), and Muhammad ﷺ.",
        "All prophets preached the same message: Worship only Allah."
      ]
    },
    {
      "tag": "islamic_books",
      "patterns": [
        "what are islamic holy books", "books of allah", "which books were revealed"
      ],
      "responses": [
        "Allah revealed several books: the Torah to Moses, the Psalms to David, the Gospel to Jesus, and the Qur’an to Muhammad ﷺ.",
        "The Qur’an is the final and preserved revelation for all time."
      ]
    },
    {
      "tag": "evil_and_satan",
      "patterns": [
        "who is shaitan", "what is evil", "why does evil exist", "does satan control us"
      ],
      "responses": [
        "Shaitan (Satan) is a jinn who disobeyed Allah and tries to mislead humans.",
        "He has no power except whispering — you can resist by remembering Allah.",
        "Evil exists as a test — to see who chooses truth and patience."
     ]
    },
    {
      "tag": "garee_shahadaa_info",
      "patterns": [
        "what is garee shahadaa", 
        "tell me about garee shahada", 
        "who are garee shahadaa", 
        "what does garee shahadaa mean"
      ],
      "responses": [
        "Garee Shahadaa is a Muslim group focused on spreading Islamic knowledge and helping others understand the truth about Islam.",
        "It means 'The Witnessing Group' in Afan Oromo — people who remind others about Allah and truth.",
        "We are a group encouraging people to learn Islam and live with purpose for Allah."
      ]
    },
    {
      "tag": "about_islam",
      "patterns": [
        "what is islam", 
        "tell me about islam", 
        "what do muslims believe", 
        "explain islam"
      ],
      "responses": [
        "Islam means submission to Allah — the One and Only God. Muslims follow the Quran and Prophet Muhammad ﷺ.",
        "Islam teaches peace, honesty, and worshiping Allah alone without partners.",
        "Islam is a complete way of life — it guides how we live, think, and treat others."
      ]
    },
    {
      "tag": "how_to_become_muslim",
      "patterns": [
        "how to become muslim", 
        "how can i convert to islam", 
        "i want to accept islam", 
        "how to take shahada"
      ],
      "responses": [
        "To become a Muslim, you simply say with belief: 'Ashhadu an la ilaha illallah, wa ashhadu anna Muhammadur Rasulullah' — meaning, I testify there is no god but Allah, and Muhammad is His Messenger.",
        "You can accept Islam right now by saying the Shahada with sincere belief in your heart.",
        "Becoming Muslim is simple — believe in one God (Allah) and follow His messenger, Prophet Muhammad ﷺ."
      ]
    },
    {
      "tag": "jesus_in_islam",
      "patterns": [
        "what do muslims believe about jesus", 
        "is jesus god", 
        "who is jesus in islam"
      ],
      "responses": [
        "In Islam, Jesus (Isa عليه السلام) is a prophet and messenger of Allah — not God or the son of God.",
        "Muslims respect Jesus as a noble prophet, but we do not worship him.",
        "The Quran honors Jesus, but it makes clear that he was a servant of Allah, not divine."
      ]
    },
    {
      "tag": "trinity",
      "patterns": [
        "what is trinity", 
        "is trinity real", 
        "does islam believe in trinity", 
        "why muslims reject trinity"
      ],
      "responses": [
        "Islam rejects the Trinity because Allah is One — without partners or equals.",
        "Even the Bible never clearly states the Trinity; it was added later by human interpretation.",
        "Muslims believe in pure monotheism — worshiping only Allah, not three in one."
      ]
    },
    {
      "tag": "prophet_muhammad",
      "patterns": [
        "who is prophet muhammad", 
        "tell me about prophet muhammad", 
        "what did prophet muhammad teach"
      ],
      "responses": [
        "Prophet Muhammad ﷺ is the final messenger of Allah who delivered the Quran.",
        "He taught honesty, justice, mercy, and to worship only Allah.",
        "Muhammad ﷺ brought the final message to guide all humanity."
      ]
    },
    {
      "tag": "quran",
      "patterns": [
        "what is quran", 
        "tell me about quran", 
        "what book do muslims follow"
      ],
      "responses": [
        "The Quran is the final revelation from Allah, sent to Prophet Muhammad ﷺ.",
        "It is a complete guide for life, explaining truth, faith, and morality.",
        "Muslims believe the Quran is the unchanged word of God."
      ]
    },
    {
      "tag": "christianity_in_islam",
      "patterns": [
        "what does islam say about christianity", 
        "what do muslims think of christians", 
        "are christians bad", 
        "can muslims be friends with christians"
      ],
      "responses": [
        "Islam teaches respect for Christians, but it also clarifies the truth about worshiping only Allah.",
        "Muslims believe Christianity originally came from Allah, but later teachings changed some truths.",
        "We are to be kind to Christians while calling them respectfully to pure monotheism."
      ]
    },
    {
      "tag": "bible_truth",
      "patterns": [
        "is bible true", 
        "what does islam say about bible", 
        "can we follow the bible"
      ],
      "responses": [
        "Muslims believe the Bible originally contained truth, but it has been changed by people over time.",
        "The Quran confirms some parts of the Bible but corrects the false ones.",
        "We follow the Quran because it is preserved in its original form."
      ]
    },
    {
      "tag": "difference_islam_christianity",
      "patterns": [
        "difference between islam and christianity", 
        "how is islam different from christianity"
      ],
      "responses": [
        "Islam teaches worshiping Allah alone, while Christianity added beliefs like the Trinity and Jesus as divine.",
        "Both faiths share prophets, but Islam follows the pure message of monotheism.",
        "Islam continues the message of earlier prophets with final guidance through the Quran."
      ]
    },
    {
      "tag": "afaan_oromo_greeting",
      "patterns": [
        "assalamu alaikum", "salaam", "nagaa", "akkam jirtu", "waaqni si eebbisu"
      ],
      "responses": [
        "Wa alaikum salaam! Nagaadha? Rabbii haa si eebbisu!",
        "Nagaa fi fayyaan? Akkam jirtu obboleessa?",
        "Jazaakallah khayr, akkam jirtu har’a?"
      ]
    },
    {
      "tag": "islam_purpose",
      "patterns": [
        "what is the purpose of life in islam", 
        "why are we here", 
        "what does islam say about purpose"
      ],
      "responses": [
        "In Islam, our purpose is to worship Allah and live righteously.",
        "We were created to recognize and serve our Creator — Allah.",
        "The Quran says: 'I did not create jinn and humans except to worship Me.' (51:56)"
      ]
    },
    {
      "tag": "prayer",
      "patterns": [
        "how to pray", "what is prayer in islam", "how muslims pray", "tell me about salah"
      ],
      "responses": [
        "Muslims pray five times daily facing the Kaaba in Makkah.",
        "Salah includes reciting Quran and bowing in submission to Allah.",
        "Prayer connects us with Allah and keeps our hearts pure."
      ]
    },
    {
      "tag": "fasting",
      "patterns": [
        "what is fasting", "why do muslims fast", "tell me about ramadan"
      ],
      "responses": [
        "Fasting in Ramadan teaches self-control and gratitude.",
        "Muslims fast from dawn to sunset to obey Allah and purify their souls.",
        "It reminds us of the poor and strengthens faith."
      ]
    },
    {
      "tag": "charity",
      "patterns": [
        "what is zakat", "what is charity in islam", "why give zakat"
      ],
      "responses": [
        "Zakat is giving a portion of wealth to help the needy — it's an obligation for Muslims.",
        "Charity purifies your wealth and heart.",
        "Islam teaches that helping others brings blessings from Allah."
      ]
    },
    {
      "tag": "respect",
      "patterns": [
        "what does islam say about respect", "how to respect others", "how should we treat others"
      ],
      "responses": [
        "Islam teaches us to respect everyone, regardless of religion or background.",
        "Prophet Muhammad ﷺ said: 'The best among you are those with the best manners.'",
        "Respect is part of faith — it brings peace in society."
      ]
    },
    {
      "tag": "ask_chatgpt",
      "patterns": [
        "can you explain more", "i want more details", "tell me more about this", "explain deeper"
      ],
      "responses": [
        "For a more detailed explanation, you can ask ChatGPT or check reliable Islamic websites like islamqa.info.",
        "I recommend asking ChatGPT for a deeper explanation on this topic.",
        "You can learn more from ChatGPT or verified Islamic scholars online."
      ]
    },
    {
      "tag": "good_deeds",
      "patterns": [
        "what are good deeds", "what should i do to please allah", "how to get reward"
      ],
      "responses": [
        "Good deeds include prayer, honesty, helping others, and remembering Allah.",
        "Be sincere, obey Allah, and treat people kindly — that earns great reward.",
        "Even a smile can be a good deed in Islam."
      ]
    },
    {
      "tag": "sin_and_forgiveness",
      "patterns": [
        "what if i sin", "can allah forgive me", "how to get forgiveness"
      ],
      "responses": [
        "Allah is Most Forgiving — just repent sincerely and stop the sin.",
        "Never lose hope. Allah says, 'Do not despair of Allah’s mercy.' (Quran 39:53)",
        "Turn to Allah with regret and promise not to return to the sin — He will forgive you."
      ]
    },
    {
      "tag": "death_and_afterlife",
      "patterns": [
        "what happens after death", "what does islam say about afterlife", "is there life after death"
      ],
      "responses": [
        "Islam teaches that after death, we will be judged by Allah for our deeds.",
        "There is life after death — either in Paradise or Hell based on our actions.",
        "This world is a test; the real life begins after death."
      ]
    },
    {
      "tag": "garee_shahadaa_info",
      "patterns": ["what is garee shahadaa","tell me about garee shahada","who are garee shahadaa","what does garee shahadaa mean"],
      "responses": [
        "Garee Shahadaa is a Muslim group focused on spreading Islamic knowledge and helping others understand Islam.",
        "It means 'The Witnessing Group' in Afan Oromo — people who remind others about Allah and truth.",
        "We are a group encouraging people to learn Islam and live with purpose for Allah."
      ]
    },
    {
      "tag": "about_islam",
      "patterns": ["what is islam","tell me about islam","what do muslims believe","explain islam"],
      "responses": [
        "Islam means submission to Allah — the One and Only God.",
        "Islam teaches peace, honesty, and worshiping Allah alone.",
        "Islam is a complete way of life — it guides how we live, think, and treat others."
      ]
    },
    {
      "tag": "how_to_become_muslim",
      "patterns": ["how to become muslim","how can i convert to islam","i want to accept islam","how to take shahada"],
      "responses": [
        "To become a Muslim, say with belief: 'Ashhadu an la ilaha illallah, wa ashhadu anna Muhammadur Rasulullah'.",
        "You can accept Islam right now by saying the Shahada sincerely.",
        "Becoming Muslim is simple — believe in one God (Allah) and follow His Messenger."
      ]
    },
    {
      "tag": "jesus_in_islam",
      "patterns": ["what do muslims believe about jesus","is jesus god","who is jesus in islam"],
      "responses": [
        "In Islam, Jesus (Isa عليه السلام) is a prophet and messenger of Allah — not God.",
        "Muslims respect Jesus as a noble prophet but do not worship him.",
        "The Quran honors Jesus but clarifies he was a servant of Allah."
      ]
    },
    {
      "tag": "trinity",
      "patterns": ["what is trinity","is trinity real","does islam believe in trinity","why muslims reject trinity"],
      "responses": [
        "Islam rejects the Trinity because Allah is One — without partners.",
        "The Bible never clearly states the Trinity; it was added later.",
        "Muslims believe in pure monotheism — worshiping only Allah."
      ]
    },
    {
      "tag": "prophet_muhammad",
      "patterns": ["who is prophet muhammad","tell me about prophet muhammad","what did prophet muhammad teach"],
      "responses": [
        "Prophet Muhammad ﷺ is the final messenger of Allah who delivered the Quran.",
        "He taught honesty, mercy, and to worship only Allah.",
        "Muhammad ﷺ brought the final message to guide all humanity."
      ]
    },
    {
      "tag": "quran",
      "patterns": ["what is quran","tell me about quran","what book do muslims follow"],
      "responses": [
        "The Quran is the final revelation from Allah, sent to Prophet Muhammad ﷺ.",
        "It is a guide for life explaining truth, faith, and morality.",
        "Muslims believe the Quran is the unchanged word of God."
      ]
    },
    {
      "tag": "christianity_in_islam",
      "patterns": ["what does islam say about christianity","what do muslims think of christians","are christians bad","can muslims be friends with christians"],
      "responses": [
        "Islam teaches respect for Christians but clarifies truth about worshiping only Allah.",
        "Muslims believe Christianity began from Allah but later teachings changed.",
        "We must be kind to Christians while inviting them respectfully to monotheism."
      ]
    },
    {
      "tag": "bible_truth",
      "patterns": ["is bible true","what does islam say about bible","can we follow the bible"],
      "responses": [
        "The Bible originally contained truth but was changed over time.",
        "The Quran confirms some parts of the Bible and corrects others.",
        "We follow the Quran because it is perfectly preserved."
      ]
    },
    {
      "tag": "difference_islam_christianity",
      "patterns": ["difference between islam and christianity","how is islam different from christianity"],
      "responses": [
        "Islam teaches worshiping Allah alone, while Christianity added beliefs like the Trinity.",
        "Both share prophets, but Islam keeps the pure message of monotheism.",
        "Islam completes the earlier messages with final guidance in the Quran."
      ]
    },
    {
      "tag": "afaan_oromo_greeting",
      "patterns": ["assalamu alaikum","salaam","nagaa","akkam jirtu","waaqni si eebbisu"],
      "responses": [
        "Wa alaikum salaam! Nagaadha? Rabbii haa si eebbisu!",
        "Nagaa fi fayyaan? Akkam jirtu obbolessa?",
        "Jazaakallah khayr, akkam jirtu har’a?"
      ]
    },
    {
      "tag": "islam_purpose",
      "patterns": ["what is the purpose of life in islam","why are we here","what does islam say about purpose"],
      "responses": [
        "Our purpose is to worship Allah and live righteously.",
        "We were created to serve our Creator — Allah.",
        "Quran 51:56 says: ‘I did not create jinn and humans except to worship Me.’"
      ]
    },
    {
      "tag": "prayer",
      "patterns": ["how to pray","what is prayer in islam","how muslims pray","tell me about salah"],
      "responses": [
        "Muslims pray five times daily facing Makkah.",
        "Salah includes reciting Quran and bowing to Allah.",
        "Prayer connects us with Allah and purifies the heart."
      ]
    },
    {
      "tag": "fasting",
      "patterns": ["what is fasting","why do muslims fast","tell me about ramadan"],
      "responses": [
        "Fasting in Ramadan teaches self-control and gratitude.",
        "Muslims fast from dawn to sunset to obey Allah and purify souls.",
        "It reminds us of the poor and strengthens faith."
      ]
    },
    {
      "tag": "charity",
      "patterns": ["what is zakat","what is charity in islam","why give zakat"],
      "responses": [
        "Zakat is giving a portion of wealth to the needy — an obligation for Muslims.",
        "Charity purifies your wealth and heart.",
        "Helping others brings blessings from Allah."
      ]
    },
    {
      "tag": "respect",
      "patterns": ["what does islam say about respect","how to respect others","how should we treat others"],
      "responses": [
        "Islam teaches respect for everyone, regardless of religion or background.",
        "Prophet Muhammad ﷺ said: ‘The best among you are those with the best manners.’",
        "Respect is part of faith — it brings peace in society."
      ]
    },
    {
      "tag": "ask_chatgpt",
      "patterns": ["can you explain more","i want more details","tell me more about this","explain deeper"],
      "responses": [
        "For more detail, ask ChatGPT or visit reliable Islamic sources like islamqa.info.",
        "I suggest ChatGPT for a deeper explanation on this topic.",
        "You can learn more from verified Islamic scholars online."
      ]
    },
    {
      "tag": "good_deeds",
      "patterns": ["what are good deeds","what should i do to please allah","how to get reward"],
      "responses": [
        "Good deeds include prayer, honesty, helping others, and remembering Allah.",
        "Be sincere, obey Allah, and treat people kindly — that earns reward.",
        "Even a smile can be a good deed in Islam."
      ]
    },
    {
      "tag": "sin_and_forgiveness",
      "patterns": ["what if i sin","can allah forgive me","how to get forgiveness"],
      "responses": [
        "Allah is Most Forgiving — repent sincerely and stop the sin.",
        "Never lose hope. Quran 39:53 says, ‘Do not despair of Allah’s mercy.’",
        "Turn to Allah with regret and He will forgive you."
      ]
    },
    {
      "tag": "unknown",
      "patterns": [],
      "responses": [
        "I’m not sure I understand. Could you please rephrase?",
        "Sorry, I didn’t get that. Can you say it differently?",
        "Hmm... I’m still learning! Can you clarify?"
      ]
    },
    {
  "tag": "becoming_muslim",
  "patterns": [
    "how can i become muslim",
    "what do i say to become muslim",
    "how to convert to islam",
    "i want to be muslim",
    "can non muslims go to jannah"
  ],
  "responses": [
    "To become Muslim, say the Shahada: 'La ilaha illa Allah, Muhammadur Rasul Allah' — meaning there is no god but Allah, and Muhammad is His messenger.",
    "You become Muslim by sincerely believing in Allah and saying the Shahada.",
    "Anyone who truly believes and accepts Islam can become Muslim at any time.",
    "Islam welcomes everyone — no matter your past, Allah is Most Forgiving.",
    "Say the Shahada with sincerity, and you’re a Muslim, alhamdulillah."
  ]
},
{
  "tag": "quran_and_hadith",
  "patterns": [
    "what is the quran",
    "who wrote the quran",
    "what is hadith",
    "can you quote a verse",
    "what does the quran teach"
  ],
  "responses": [
    "The Quran is the holy book revealed by Allah to Prophet Muhammad (peace be upon him).",
    "No human wrote the Quran — it is the word of Allah revealed through Angel Jibreel (Gabriel).",
    "Hadith are the sayings and actions of Prophet Muhammad (peace be upon him) recorded by his companions.",
    "The Quran teaches belief in one God, good character, and guidance for all humanity.",
    "Example verse: 'Indeed, with hardship comes ease.' (Quran 94:6)"
  ]
},
{
  "tag": "pillars_of_islam",
  "patterns": [
    "what are the five pillars of islam",
    "what are the pillars of islam",
    "how to pray in islam",
    "how to fast in islam",
    "what is zakat"
  ],
  "responses": [
    "The five pillars are: 1. Shahada (faith), 2. Salah (prayer), 3. Sawm (fasting), 4. Zakat (charity), 5. Hajj (pilgrimage).",
    "Muslims pray five times a day facing the Kaaba in Mecca.",
    "Fasting in Ramadan means no food or drink from dawn to sunset.",
    "Zakat is giving a small part of your wealth to help the poor.",
    "The pillars of Islam build faith, discipline, and community."
  ]
},
{
  "tag": "prophets_and_beliefs",
  "patterns": [
    "who is muhammad",
    "who is prophet muhammad",
    "do muslims believe in jesus",
    "how many prophets are there",
    "who are the prophets in islam"
  ],
  "responses": [
    "Prophet Muhammad (peace be upon him) is the final messenger of Allah.",
    "Muslims believe in all prophets, including Adam, Noah, Abraham, Moses, Jesus, and Muhammad (peace be upon them all).",
    "Yes, Muslims believe in Jesus (Isa) as a prophet, not as a god or son of God.",
    "There were thousands of prophets, but only 25 are mentioned by name in the Quran.",
    "All prophets came with the same message — to worship one God, Allah."
  ]
},
{
  "tag": "comparative_religion",
  "patterns": [
    "is jesus god",
    "what is the trinity",
    "why muslims dont believe jesus is god",
    "difference between islam and christianity",
    "what does islam say about jesus"
  ],
  "responses": [
    "Muslims respect Jesus (peace be upon him) as a prophet and messenger, not as God.",
    "The concept of Trinity (Father, Son, Holy Spirit) is not found in the Bible the way it is taught today.",
    "In Islam, Jesus (Isa) is a noble prophet born miraculously to Maryam (Mary) by Allah’s command.",
    "Islam and Christianity share belief in one God, but Islam rejects the idea that God has partners or a son.",
    "Jesus never said 'I am God, worship me' — he called people to worship Allah alone."
  ]
}, {
  "tag": "emotional_guidance",
  "patterns": [
    "i am sad",
    "what should i do when i am sad",
    "how to stay patient",
    "how to stop sinning",
    "i feel lost"
  ],
  "responses": [
    "Turn to Allah through dua and prayer — He is closer than you think.",
    "When you feel sad, remember Allah and recite Surah Ad-Duhaa (93).",
    "Patience is a sign of strength. The Quran says, 'Indeed, Allah is with the patient.' (2:153)",
    "If you fall into sin, repent sincerely and start again — Allah’s mercy is vast.",
    "Sadness fades when your heart connects to Allah."
  ]
},
{
  "tag": "dua_guidance",
  "patterns": [
    "dua for exams",
    "what dua for forgiveness",
    "dua when scared",
    "best dua for success",
    "dua for health"
  ],
  "responses": [
    "Dua for exams: 'Rabbi zidni ilma' — My Lord, increase me in knowledge. (20:114)",
    "Dua for forgiveness: 'Astaghfirullah' — say it often with sincerity.",
    "When scared: say 'Hasbunallahu wa ni’mal wakeel' — Allah is enough for us.",
    "Dua for success: 'Rabbana atina fid-dunya hasanatan wa fil-akhirati hasanah' (2:201)",
    "For health, ask Allah sincerely and remember that He is Ash-Shafi (The Healer)."
  ]
},
{
  "tag": "islamic_practices",
  "patterns": [
    "when is ramadan",
    "how to pray eid",
    "how to perform wudu",
    "how to fast",
    "how to pray in islam"
  ],
  "responses": [
    "Ramadan starts when the crescent moon is sighted after Sha’ban.",
    "Eid prayer is two rak’ahs with extra takbeers — usually prayed in congregation.",
    "To perform wudu: wash your hands, mouth, nose, face, arms, head, ears, and feet in order.",
    "Fasting begins at dawn and ends at sunset — no food or drink in between.",
    "Prayer (Salah) is done five times a day facing the Kaaba, with intention and focus."
  ]
},
{
  "tag": "general_islam_info",
  "patterns": [
    "what is islam",
    "why do muslims pray",
    "what does islam teach about peace",
    "why muslims fast",
    "why muslims wear hijab"
  ],
  "responses": [
    "Islam means submission to the will of Allah — it’s a way of life.",
    "Muslims pray to stay connected with Allah and purify their hearts.",
    "Islam teaches peace, justice, and mercy for all of creation.",
    "Muslims fast in Ramadan to gain self-control and spiritual growth.",
    "Hijab is a form of modesty and respect — both spiritual and social."
  ]
},
{
  "tag": "garee_shahadaa_info",
  "patterns": [
    "what is garee shahadaa",
    "how can i join garee shahadaa",
    "who started garee shahadaa",
    "what does garee shahadaa do",
    "where is garee shahadaa based"
  ],
  "responses": [
    "Garee Shahadaa is a Muslim community group focused on learning, dawah, and spreading truth peacefully.",
    "You can join Garee Shahadaa by contacting the local team or following their online platforms.",
    "Garee Shahadaa was started by dedicated Muslim youth who love spreading the message of Islam.",
    "The group focuses on Quran learning, good character, and helping others understand Islam.",
    "Garee Shahadaa represents unity — spreading knowledge, peace, and faith wherever possible."
  ]
},
   ,
    {
      "tag": "emotional_guidance",
      "patterns": [
        "I'm feeling sad",
        "How do I stay patient?",
        "How to stop sinning?",
        "What should I do when I'm depressed?",
        "How can I have peace of mind?"
      ],
      "responses": [
        "Remember, Allah is always with you. Try to pray two rak’ahs and make dua — He listens.",
        "Patience (sabr) is a key part of faith. Keep trusting Allah’s plan.",
        "If you fall into sin, seek forgiveness immediately — Allah’s mercy is endless.",
        "The Prophet ﷺ said: 'Indeed, with hardship comes ease.' Keep strong in faith.",
        "Read Qur'an, reflect, and surround yourself with good company."
      ]
    },
    {
      "tag": "emotional_guidance_2",
      "patterns": [
        "How do I control anger?",
        "I feel guilty after sinning",
        "How to overcome laziness in prayer?",
        "Why do I feel far from Allah?",
        "How can I fix my heart?"
      ],
      "responses": [
        "Make wudu when angry and say 'A’udhu billahi min ash-shaytan ir-rajim'.",
        "Guilt after sin is a sign of faith — repent sincerely and move forward.",
        "Start small: pray one salah on time, then build consistency.",
        "Distance from Allah often comes from neglecting prayer. Start reconnecting through dhikr.",
        "A soft heart comes from Qur'an recitation, reflection, and dua."
      ]
    },
    {
      "tag": "emotional_guidance_3",
      "patterns": [
        "How can I improve my iman?",
        "How to stop bad habits?",
        "What to do if I keep committing same sin?",
        "How to become closer to Allah?",
        "How to handle anxiety?"
      ],
      "responses": [
        "Strengthen iman by praying on time and remembering Allah often.",
        "Replace bad habits with good ones — the Prophet ﷺ said the best deeds are consistent ones.",
        "Keep repenting — Allah loves those who repent repeatedly.",
        "Talk to Allah in dua. The more you speak to Him, the closer you become.",
        "Trust Allah’s plan and read Surah Al-Inshirah when anxious."
      ]
    },
    {
      "tag": "dua_guidance",
      "patterns": [
        "What dua for exams?",
        "What dua for forgiveness?",
        "What dua when scared?",
        "What dua for success?",
        "What dua when traveling?"
      ],
      "responses": [
        "For exams: 'Rabbi zidni ilma' (My Lord, increase me in knowledge).",
        "For forgiveness: 'Astaghfirullah wa atubu ilayh' — say it often.",
        "When scared: 'Hasbiyallahu la ilaha illa Huwa' — Allah is enough for me.",
        "For success: 'Allahumma inni as’aluka tawfiqan fi kulli amr.'",
        "When traveling: 'Subhanalladhi sakhkhara lana hadha wa ma kunna lahu muqrinin.'"
      ]
    },
    {
      "tag": "dua_guidance_2",
      "patterns": [
        "What dua for peace?",
        "Dua for healing?",
        "What dua to find job?",
        "Dua to stop fear?",
        "Dua for parents?"
      ],
      "responses": [
        "For peace: 'Allahumma inni as’aluka nafsan mutma’innah.'",
        "For healing: 'Allahumma rabban-nas, adhhibi al-ba’s, ishfi anta ash-shafi.'",
        "For job: 'Rabbi inni lima anzalta ilayya min khayrin faqir.'",
        "To remove fear: 'La hawla wa la quwwata illa billah.'",
        "For parents: 'Rabbir hamhuma kama rabbayani saghira.'"
      ]
    },
    {
      "tag": "islamic_practices",
      "patterns": [
        "When is Ramadan?",
        "How to perform wudu?",
        "How to pray Eid prayer?",
        "How to fast properly?",
        "When to pay zakat?"
      ],
      "responses": [
        "Ramadan starts with the sighting of the crescent moon — it’s a month of fasting and mercy.",
        "Wudu: wash hands, mouth, nose, face, arms, wipe head, and wash feet — in order.",
        "Eid prayer is two rak’ahs with extra takbeers, before the khutbah.",
        "Fast from dawn to sunset, avoid food and sins, and increase worship.",
        "Zakat is due when your wealth reaches the nisab and a year passes."
      ]
    },
    {
      "tag": "islamic_practices_2",
      "patterns": [
        "How to pray salah?",
        "When is Jummah?",
        "Can I fast voluntary days?",
        "How to make ghusl?",
        "How to give charity?"
      ],
      "responses": [
        "Salah has 5 daily prayers — each with specific rak’ahs. Learn step-by-step to perfect it.",
        "Jummah is every Friday after noon — attend and listen to the khutbah.",
        "Yes, fasting Mondays and Thursdays or the white days (13th–15th) is recommended.",
        "Ghusl: wash entire body with the intention of purification after impurity.",
        "Charity can be any good act or help — not just money."
      ]
    },
    {
      "tag": "general_islam_info",
      "patterns": [
        "What is Islam?",
        "Why do Muslims pray?",
        "What does Islam teach?",
        "What does Islam mean?",
        "What does Islam say about peace?"
      ],
      "responses": [
        "Islam means 'submission to Allah'. It’s a religion of peace and truth.",
        "Muslims pray to connect with their Creator — it’s our daily reminder of faith.",
        "Islam teaches justice, kindness, and worshiping Allah alone.",
        "The word 'Islam' comes from 'salaam' — peace.",
        "Islam promotes peace through obedience to Allah and good character."
      ]
    },
    {
      "tag": "general_islam_info_2",
      "patterns": [
        "Why Muslims don't eat pork?",
        "Why Muslims don't drink alcohol?",
        "Why Muslims fast?",
        "What happens after death?",
        "What does Islam say about women?"
      ],
      "responses": [
        "Pork is forbidden in the Qur’an for health and spiritual reasons.",
        "Alcohol is haram because it harms body and soul.",
        "Fasting teaches self-control and empathy for the poor.",
        "After death, we will be resurrected and judged by Allah.",
        "Islam honors women with rights to education, property, and respect."
      ]
    },
    {
      "tag": "garee_shahadaa_info",
      "patterns": [
        "What is Garee Shahadaa?",
        "Who started Garee Shahadaa?",
        "How can I join Garee Shahadaa?",
        "What does Garee Shahadaa mean?",
        "Where is Garee Shahadaa located?"
      ],
      "responses": [
        "Garee Shahadaa means 'Team of Testimony' — a group focused on learning and spreading Islam.",
        "It was started by Muslim youth to share Islamic knowledge and guide others.",
        "You can join by contacting the members or following their community teachings.",
        "It represents those who testify that 'There is no god but Allah, and Muhammad is His Messenger.'",
        "The group connects Muslims worldwide to learn and grow together."
      ]
    },
    {
      "tag": "garee_shahadaa_info_2",
      "patterns": [
        "Who created Garee Shahadaa?",
        "Is Garee Shahadaa an organization?",
        "What is the goal of Garee Shahadaa?",
        "What does Garee Shahadaa teach?",
        "How can I support Garee Shahadaa?"
      ],
      "responses": [
        "Garee Shahadaa was founded by Seyfadin for the sake of da’wah — spreading true knowledge of Islam.",
        "It’s a learning and dawah initiative, not a business or political group.",
        "The goal is to invite people to Islam and strengthen Muslim youth in faith.",
        "It teaches Islamic principles, good manners, and guidance for life.",
        "You can support by sharing knowledge, joining activities, or making dua."
      ]
    },
     ,
    {
      "tag": "islamic_history",
      "patterns": [
        "Who were the first Muslims?",
        "Where did Islam start?",
        "Who were the companions of the Prophet?",
        "When was Islam founded?",
        "What is Mecca famous for?"
      ],
      "responses": [
        "Islam began in Mecca, Arabia, over 1400 years ago with the Prophet Muhammad ﷺ.",
        "The first Muslims were Khadijah, Abu Bakr, and other companions who followed the Prophet ﷺ.",
        "The companions (Sahaba) were those who met and supported the Prophet Muhammad ﷺ.",
        "Islam started with the first revelation to Muhammad ﷺ in the Cave of Hira.",
        "Mecca is the holiest city in Islam — the birthplace of the Prophet and home to the Ka'bah."
      ]
    },
    {
      "tag": "islamic_history_2",
      "patterns": [
        "Who built the Kaaba?",
        "Who were the Rightly Guided Caliphs?",
        "Who was Abu Bakr?",
        "Who was Umar ibn Khattab?",
        "What happened in Medina?"
      ],
      "responses": [
        "The Kaaba was built by Prophet Ibrahim (Abraham) and his son Ismail (Ishmael).",
        "The Rightly Guided Caliphs were Abu Bakr, Umar, Uthman, and Ali (may Allah be pleased with them).",
        "Abu Bakr was the Prophet’s best friend and the first Caliph after his death.",
        "Umar was a strong and just leader who expanded the Islamic state with fairness.",
        "In Medina, Muslims formed the first Islamic community and built the first mosque."
      ]
    },
    {
      "tag": "misconceptions",
      "patterns": [
        "Do Muslims worship Muhammad?",
        "Do Muslims force others to convert?",
        "Is Islam violent?",
        "Why do Muslim women wear hijab?",
        "Do Muslims hate Christians?"
      ],
      "responses": [
        "Muslims do not worship Muhammad ﷺ — we worship only Allah, the Creator.",
        "Islam forbids forcing anyone to convert — 'There is no compulsion in religion' (Qur’an 2:256).",
        "True Islam is peaceful — violence against innocents is forbidden.",
        "Muslim women wear hijab for modesty, dignity, and obedience to Allah.",
        "Islam teaches respect for all — including Christians and Jews."
      ]
    },
    {
      "tag": "misconceptions_2",
      "patterns": [
        "Why do Muslims pray facing Mecca?",
        "Do Muslims believe in Jesus’ miracles?",
        "Why are there different sects in Islam?",
        "Why can’t Muslims eat pork?",
        "Do Muslims believe in the Bible?"
      ],
      "responses": [
        "Muslims pray facing Mecca because it’s the direction of the Ka'bah, our unity point in prayer.",
        "Yes, Muslims believe Jesus (Isa) performed miracles — by Allah’s permission.",
        "Different sects exist due to human differences, but Islam itself is one truth from Allah.",
        "Pork is forbidden for spiritual and health reasons — as stated in the Qur’an.",
        "We believe the original Bible was revelation from Allah, but it was later changed by people."
      ]
    },
    {
      "tag": "daily_muslim_life",
      "patterns": [
        "How does a Muslim start their day?",
        "What do Muslims say before eating?",
        "What do Muslims say before sleeping?",
        "What do Muslims say after sneezing?",
        "How do Muslims greet each other?"
      ],
      "responses": [
        "A Muslim starts the day with Fajr prayer and remembrance of Allah.",
        "Before eating, we say 'Bismillah' — In the name of Allah.",
        "Before sleeping, we say 'Bismika Allahumma amutu wa ahya'.",
        "After sneezing, we say 'Alhamdulillah' — Praise be to Allah.",
        "Muslims greet each other with 'Assalamu Alaikum' meaning 'Peace be upon you'."
      ]
    },
    {
      "tag": "daily_muslim_life_2",
      "patterns": [
        "What should I do before sleeping?",
        "What do Muslims do on Friday?",
        "What do Muslims say after eating?",
        "How do Muslims show gratitude?",
        "What is sunnah daily routine?"
      ],
      "responses": [
        "Before sleeping, make wudu, recite Ayatul Kursi, and sleep on your right side.",
        "Friday is a special day — Muslims attend Jumu’ah prayer and read Surah Al-Kahf.",
        "After eating, say 'Alhamdulillah' to thank Allah.",
        "Muslims show gratitude through prayer, dua, and kindness.",
        "The sunnah daily routine includes cleanliness, smiling, prayer, and good manners."
      ]
    },
    {
      "tag": "language_afan_oromo",
      "patterns": [
        "How to say hello in Afan Oromo?",
        "Translate Assalamu Alaikum in Afan Oromo",
        "What is Allah in Afan Oromo?",
        "How to say thank you in Afan Oromo?",
        "Can you speak Afan Oromo?"
      ],
      "responses": [
        "Hello in Afan Oromo is 'Akkam jirtu?'.",
        "'Assalamu Alaikum' in Afan Oromo means 'Nagaan si haa gahu'.",
        "Allah in Afan Oromo is still 'Allah' — the One God.",
        "Thank you in Afan Oromo is 'Galatoomi'.",
        "Yes, I can use Afan Oromo words when needed to help you understand better."
      ]
    },
    {
      "tag": "language_afan_oromo_2",
      "patterns": [
        "How to say peace be upon you in Afan Oromo?",
        "How to say I am Muslim in Afan Oromo?",
        "Translate Bismillah in Afan Oromo",
        "What is Islam called in Afan Oromo?",
        "Say something in Afan Oromo"
      ],
      "responses": [
        "'Peace be upon you' in Afan Oromo is 'Nagaan si haa gahu'.",
        "'I am Muslim' in Afan Oromo is 'Ani Muslimaadha'.",
        "'Bismillah' in Afan Oromo means 'Maqaa Rabbii jalatti'.",
        "Islam in Afan Oromo is 'Amantii Islaamaa'.",
        "Nagaan si haa gahu — may peace be upon you!"
      ]
    },
    {
      "tag": "greetings_interaction",
      "patterns": [
        "Assalamu Alaikum",
        "Salaam",
        "Hello",
        "Hi there",
        "Peace be upon you"
      ],
      "responses": [
        "Wa Alaikum Assalam wa Rahmatullah! May peace and mercy of Allah be upon you.",
        "Wa Alaikum Salaam! How are you doing today?",
        "Peace be upon you! Welcome dear friend.",
        "Assalamu Alaikum! I’m happy to see you here.",
        "Wa Alaikum Assalam — may Allah bless your day!"
      ]
    },
    {
      "tag": "greetings_interaction_2",
      "patterns": [
        "How are you?",
        "How are you doing?",
        "Are you fine?",
        "How are things?",
        "How are you today?"
      ],
      "responses": [
        "Alhamdulillah, I’m doing well! How about you?",
        "I’m good, by Allah’s grace. How are you?",
        "Alhamdulillah! I’m great. May Allah keep you in peace.",
        "Doing well, Alhamdulillah. Hope your day is blessed!",
        "I’m fine, thank you! May Allah bless you with happiness."
      ]
    },
     ,
    {
      "tag": "christianity_comparison",
      "patterns": [
        "Is Jesus God?",
        "Why Muslims don’t believe Jesus is God?",
        "Who is Jesus in Islam?",
        "What do Muslims believe about Jesus?",
        "Is Jesus the Son of God?"
      ],
      "responses": [
        "In Islam, Jesus (Isa) is a noble Prophet and servant of Allah — not God or His son.",
        "Muslims believe Jesus was born miraculously and performed miracles by Allah’s permission.",
        "The Qur’an clearly says, 'He was no more than a Messenger' (Qur’an 5:75).",
        "Jesus called people to worship only Allah, not himself.",
        "Muslims respect Jesus deeply — but worship belongs only to Allah."
      ]
    },
    {
      "tag": "christianity_comparison_2",
      "patterns": [
        "What is the Trinity?",
        "Is the Trinity in the Bible?",
        "Do Muslims believe in Trinity?",
        "What does the Bible say about God being one?",
        "Why do Christians say Jesus is God?"
      ],
      "responses": [
        "The word 'Trinity' never appears in the Bible — it was added later by the Church.",
        "Islam teaches pure monotheism — Allah is One, without partners or equals.",
        "Even in the Bible, Jesus said, 'The Father is greater than I' (John 14:28).",
        "The Qur’an says, 'Say He is Allah, One' (Surah Al-Ikhlas 112:1).",
        "Muslims believe Jesus was a Prophet who worshiped God, not God Himself."
      ]
    },
    {
      "tag": "bible_questions",
      "patterns": [
        "Do Muslims believe in the Bible?",
        "What does Islam say about the Bible?",
        "Is the Bible changed?",
        "Which book is true — Bible or Quran?",
        "Was the Bible revealed by Allah?"
      ],
      "responses": [
        "Muslims believe the original Torah and Gospel were from Allah, but they were later altered.",
        "The Qur’an is the final and preserved revelation of Allah.",
        "Yes, the Bible contains some truth but also human additions over time.",
        "Islam teaches that the Qur’an confirms and corrects previous scriptures.",
        "The true message of all prophets was the same — worship one God."
      ]
    },
    {
      "tag": "respectful_dialogue",
      "patterns": [
        "How to talk to Christians respectfully?",
        "What if my Christian friend asks about Islam?",
        "How to explain Islam without offending?",
        "What if someone argues about religion?",
        "Should I debate or stay calm?"
      ],
      "responses": [
        "Speak kindly and respectfully — the Qur’an says, 'Invite with wisdom and good manners' (16:125).",
        "If your Christian friend asks, answer gently and with knowledge.",
        "Avoid harsh arguments — focus on truth and peace.",
        "You can share that Islam teaches love, respect, and unity under one God.",
        "Stay calm; your goal is to share, not to win arguments."
      ]
    },
    {
      "tag": "new_muslim_guidance",
      "patterns": [
        "I just became Muslim, what should I do?",
        "How do I start praying?",
        "How to learn Islam as a beginner?",
        "What should I read first?",
        "How do I find other Muslims?"
      ],
      "responses": [
        "Congratulations! 🎉 Start with learning how to pray (Salah) and recite Surah Al-Fatihah.",
        "Find a local mosque or online community for new Muslims.",
        "Read short surahs and learn about Prophet Muhammad ﷺ.",
        "Take things step by step — Islam is easy and full of mercy.",
        "Ask Allah for guidance daily through dua, and He will help you grow."
      ]
    },
    {
      "tag": "new_muslim_guidance_2",
      "patterns": [
        "What if I forget how to pray?",
        "Can I pray in my language?",
        "Do I have to wear hijab immediately?",
        "Can new Muslims read Quran in English?",
        "What if my family doesn’t support me?"
      ],
      "responses": [
        "If you forget how to pray, keep learning — Allah rewards your effort.",
        "Yes, you can start by reading meanings in your own language, then learn Arabic slowly.",
        "Hijab is a journey — start when your heart feels ready, seeking Allah’s pleasure.",
        "Reading the Qur’an in English helps you understand — just try to learn the Arabic too.",
        "Stay patient — keep good manners and pray for your family’s guidance."
      ]
    },
    {
      "tag": "christianity_beliefs_respectful",
      "patterns": [
        "Do Christians go to heaven?",
        "Are all non-Muslims going to hell?",
        "What does Islam say about Christians?",
        "Can a Christian become Muslim?",
        "Why do Muslims and Christians disagree?"
      ],
      "responses": [
        "Only Allah decides who enters Paradise — He is Most Just and Most Merciful.",
        "Islam teaches respect for Christians and Jews as 'People of the Book'.",
        "Yes, Christians can become Muslim by accepting that there is no god but Allah.",
        "Disagreements come from different understandings of God — Islam preserves pure monotheism.",
        "We should treat Christians with respect and share truth peacefully."
      ]
    },
    {
      "tag": "common_faith_topics",
      "patterns": [
        "Do Muslims believe in Mary?",
        "Is Mary important in Islam?",
        "What is the story of Mary in the Quran?",
        "Was Jesus born without a father?",
        "What is Surah Maryam?"
      ],
      "responses": [
        "Yes! Mary (Maryam) is highly respected in Islam — even a whole Surah (chapter) is named after her.",
        "The Qur’an describes her as pure, righteous, and chosen above all women.",
        "Jesus (Isa) was born miraculously without a father — by Allah’s command.",
        "Surah Maryam (Chapter 19) beautifully tells her story and that of other prophets.",
        "Islam honors Mary as a model of faith, modesty, and obedience."
      ]
    },
    {
      "tag": "guidance_to_truth",
      "patterns": [
        "What if I am confused between Islam and Christianity?",
        "How do I know which religion is true?",
        "What if I believe in both?",
        "How can I find the truth?",
        "Can I ask God to guide me?"
      ],
      "responses": [
        "Ask Allah sincerely for guidance — He never ignores a searching heart.",
        "Study both the Qur’an and Bible — compare what each says about God’s oneness.",
        "Truth is clear when you seek it with humility — Allah promises to guide those who ask.",
        "You can say: 'O Allah, guide me to the truth, wherever it is.'",
        "Islam gives direct connection to the Creator — no intermediaries, only you and Allah."
      ]
    },
    {
      "tag": "final_guidance",
      "patterns": [
        "What if I’m still not ready to become Muslim?",
        "Does Allah love me even if I’m not Muslim?",
        "Can I talk to Muslims to learn more?",
        "Is Islam for everyone?",
        "Can you help me learn step by step?"
      ],
      "responses": [
        "Yes — Allah loves those who seek truth and goodness.",
        "Take your time and keep learning. Islam welcomes everyone with open arms.",
        "You can talk to Muslims, visit a mosque, or ask here — no pressure.",
        "Islam is for everyone, regardless of background or race.",
        "Of course! I can help you learn one step at a time, in sha’ Allah."
      ]
    }


  ]
}
''';

  // Parse the intents JSON
  final Map<String, dynamic> intentsData = json.decode(jsonIntents);

  // Ensure userMessage is not empty
  if (userMessage.isEmpty) {
    return (intentsData["intents"]
                .firstWhere((intent) => intent['tag'] == "unknown")['responses']
            as List<dynamic>)
        .first;
  }

  final String lastUserMessage = userMessage.toLowerCase();

  String selectedResponse = (intentsData["intents"]
              .firstWhere((intent) => intent['tag'] == "unknown")['responses']
          as List<dynamic>)
      .first;

  // Match intents and choose response
  for (var intent in intentsData["intents"]) {
    for (String pattern in intent['patterns']) {
      final regExpPattern = RegExp(r'\b' + pattern.toLowerCase() + r'\b');
      if (regExpPattern.hasMatch(lastUserMessage)) {
        final List<dynamic> categoryResponses =
            intent['responses'] as List<dynamic>;
        selectedResponse =
            categoryResponses[math.Random().nextInt(categoryResponses.length)];
        break;
      }
    }
    if (selectedResponse !=
        (intentsData["intents"].firstWhere(
                    (intent) => intent['tag'] == "unknown")['responses']
                as List<dynamic>)
            .first) {
      break;
    }
  }

  return selectedResponse;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
