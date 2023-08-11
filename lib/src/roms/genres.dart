// Converted from https://gitlab.com/recalbox/recalbox/-/blob/master/projects/frontend/es-app/src/games/classifications/Genres.cpp

// ignore_for_file: constant_identifier_names

import 'dart:core';

enum GameGenre {
  None(id: 0x0000, shortName: "none", longName: "None"), // No genre
  Action(
      id: 0x0100,
      shortName: "action",
      longName: "Action (All)"), // Generic Action games
  ActionPlatformer(
      id: 0x0101,
      shortName: "actionplatformer",
      longName: "Platform"), // - Action platform game
  ActionPlatformShooter(
      id: 0x0102,
      shortName: "actionplatformshooter",
      longName:
          "Platform Shooter"), // - Action platform shooter (Turrican, ...)
  ActionFirstPersonShooter(
      id: 0x0103,
      shortName: "actionfirstpersonshooter",
      longName: "First Person Shooter"), // - First person shooter (007, ...)
  ActionShootEmUp(
      id: 0x0104,
      shortName: "actionshootemup",
      longName: "Shoot'em Up"), // - Shoot'em up/all (
  ActionShootWithGun(
      id: 0x0105,
      shortName: "actionshootwithgun",
      longName:
          "Shoot with Gun"), // - On-screen shooters (Operation wolf, Duck Hunt, ...)
  ActionFighting(
      id: 0x0106,
      shortName: "actionfighting",
      longName:
          "Fighting"), // - Fighting games (mortal kombat, street fighters, ...)
  ActionBeatEmUp(
      id: 0x0107,
      shortName: "actionbeatemup",
      longName:
          "Beat'em All"), // - Beat'em up/all (Renegade, Double Dragon, ...)
  ActionStealth(
      id: 0x0108,
      shortName: "actionstealth",
      longName: "Infiltration"), // - Stealth combat (MGS, Dishonored, ...)
  ActionBattleRoyale(
      id: 0x0109,
      shortName: "actionbattleroyale",
      longName:
          "Battle Royale"), // - Battle royale survivals (Fortnite, Apex legend, ...)
  ActionRythm(
      id: 0x010A,
      shortName: "actionrythm",
      longName:
          "Rythm & Music"), // - Music/Rythm games (Dance Dance Revolution, ...)
  Adventure(
      id: 0x0200,
      shortName: "adventure",
      longName: "Adventure (All)"), // Generic Adventure games
  AdventureText(
      id: 0x0201,
      shortName: "adventuretext",
      longName: "Textual Adventure"), // - Old-school text adventure (Zork, ...)
  AdventureGraphics(
      id: 0x0202,
      shortName: "adventuregraphics",
      longName: "Graphical Adventure"), // - Mainly Point-and-clicks
  AdventureVisualNovels(
      id: 0x0203,
      shortName: "adventurevisualnovels",
      longName:
          "Visual Novel"), // - Dating & legal simulation (Ace Attornay, ...)
  AdventureInteractiveMovie(
      id: 0x0204,
      shortName: "adventureinteractivemovie",
      longName:
          "Interactive Movie"), // - Interactive movies (Tex Murphy, Fahrenheit, RE4, ...)
  AdventureRealTime3D(
      id: 0x0205,
      shortName: "adventurerealtime3d",
      longName:
          "Real Time 3D Adventure"), // - 3D adventures (Shenmue, Heavy rain, ...)
  AdventureSurvivalHorror(
      id: 0x0206,
      shortName: "adventuresurvivalhorror",
      longName:
          "Survival"), // - Survivals/Horror Survivals (Lost in blue, Resident evil, ...)
  RPG(
      id: 0x0300,
      shortName: "rpg",
      longName: "RPG (All)"), // Generic RPG (Role Playing Games)
  RPGAction(
      id: 0x0301,
      shortName: "rpgaction",
      longName: "Action RPG"), // - Action RPG (Diablo, ...)
  RPGMMO(
      id: 0x0302,
      shortName: "rpgmmo",
      longName: "MMORPG"), // - Massive Multiplayer Online RPG (TESO, WoW, ...)
  RPGDungeonCrawler(
      id: 0x0303,
      shortName: "rpgdungeoncrawler",
      longName:
          "Dungeon Crawler"), // - Dungeon Crawler (Dungeon Master, Eye of the beholder, ...)
  RPGTactical(
      id: 0x0304,
      shortName: "rpgtactical",
      longName:
          "Tactical RPG"), // - Tactical RPG (Ogres Battle, FF Tactics, ...)
  RPGJapanese(
      id: 0x0305,
      shortName: "rpgjapanese",
      longName:
          "JRPG"), // - Japaneese RPG, manga-like (Chrono Trigger, FF, ...)
  RPGFirstPersonPartyBased(
      id: 0x0306,
      shortName: "rpgfirstpersonpartybased",
      longName:
          "Party based RPG"), // - Team-as-one RPG (Ishar, Bard's tales, ...)
  Simulation(
      id: 0x0400,
      shortName: "simulation",
      longName: "Simulation (All)"), // Generic simulation
  SimulationBuildAndManagement(
      id: 0x0401,
      shortName: "simulationbuildandmanagement",
      longName:
          "Build & Management"), // - Construction & Management simulations (Sim-city, ...)
  SimulationLife(
      id: 0x0402,
      shortName: "simulationlife",
      longName:
          "Life Simulation"), // - Life simulation (Nintendogs, Tamagoshi, Sims, ...)
  SimulationFishAndHunt(
      id: 0x0403,
      shortName: "simulationfishandhunt",
      longName:
          "Fishing & Hunting"), // - Fighing and hunting (Deer hunting, Sega bass fishing, ...)
  SimulationVehicle(
      id: 0x0404,
      shortName: "simulationvehicle",
      longName:
          "Vehicle Simulation"), // - Car/Planes/Tank/... simulations (Flight Simulator, Sherman M4, ...)
  SimulationSciFi(
      id: 0x0405,
      shortName: "simulationscifi",
      longName:
          "Science Fiction Simulation"), // - Space Opera (Elite, Homeworld)
  Strategy(
      id: 0x0500,
      shortName: "strategy",
      longName: "Strategy (All)"), // Generic strategy games
  Strategy4X(
      id: 0x0501,
      shortName: "strategy4x",
      longName:
          "eXplore, eXpand, eXploit & eXterminate"), // - eXplore, eXpand, eXploit, eXterminate (Civilization, ...)
  StrategyArtillery(
      id: 0x0502,
      shortName: "strategyartillery",
      longName:
          "Artillery"), // - multiplayer artillery games, turn by turn (Scortched Tanks, Worms, ...)
  StrategyAutoBattler(
      id: 0x0503,
      shortName: "strategyautobattler",
      longName:
          "Auto-battler"), // - Auto-battle tacticals (Dota undergrounds, Heartstone Battlegrounds, ...)
  StrategyMOBA(
      id: 0x0504,
      shortName: "strategymoba",
      longName:
          "Multiplayer Online Battle Arena"), // - Multiplayer Online Battle Arena (Dota 2, Smite, ...)
  StrategyRTS(
      id: 0x0505,
      shortName: "strategyrts",
      longName:
          "Real Time Strategy"), // - Real Time Strategy (Warcrafs, Dune, C&C, ...)
  StrategyTBS(
      id: 0x0506,
      shortName: "strategytbs",
      longName:
          "Turn Based Strategy"), // - Turn based strategy (Might & Magic, Making History, ...)
  StrategyTowerDefense(
      id: 0x0507,
      shortName: "strategytowerdefense",
      longName: "Tower Defense"), // - Tower defenses!
  StrategyWargame(
      id: 0x0508,
      shortName: "strategywargame",
      longName: "Wargame"), // - Military tactics
  Sports(
      id: 0x0600,
      shortName: "sports",
      longName: "Sports (All)"), // Generic sport games
  SportRacing(
      id: 0x0601,
      shortName: "sportracing",
      longName: "Racing"), // - All racing games!
  SportSimulation(
      id: 0x0602,
      shortName: "sportsimulation",
      longName: "Sport Simulation"), // - All physical/simulation sports
  SportCompetitive(
      id: 0x0603,
      shortName: "sportcompetitive",
      longName:
          "Competition Sport"), // - High competitive factor (Ball Jack, ...)
  SportFight(
      id: 0x0604,
      shortName: "sportfight",
      longName:
          "Fighting/Violent Sport"), // - Fighting sports/violent sports (SpeedBall, WWE 2K Fight Nights, ...)
  Pinball(id: 0x0700, shortName: "pinball", longName: "Pinball"), // Pinball
  Board(
      id: 0x0800,
      shortName: "board",
      longName: "Board game"), // Board games (chess, backgammon, othello, ...)
  Casual(
      id: 0x0900,
      shortName: "casual",
      longName: "Casual game"), // Simple interaction games for casual gaming
  DigitalCard(
      id: 0x0A00,
      shortName: "digitalcard",
      longName:
          "Digital Cards"), // Card Collection/games (Hearthstone, Magic the Gathering, ...)
  PuzzleAndLogic(
      id: 0x0B00,
      shortName: "puzzleandlogic",
      longName:
          "Puzzle & Logic"), // Puzzle and logic games (Tetris, Sokoban, ...)
  Party(
      id: 0x0C00,
      shortName: "party",
      longName:
          "Multiplayer Party Game"), // Multiplayer party games (Mario party, ...)
  Trivia(
      id: 0x0D00,
      shortName: "trivia",
      longName:
          "Trivia"), // Answer/Quizz games (Family Feud, Are you smarter than a 5th grade, ...)
  Casino(id: 0x0E00, shortName: "casino", longName: "Casino"), // Casino games
  Compilation(
      id: 0x0F00,
      shortName: "compilation",
      longName: "Multi Game Compilation"), // Multi games
  DemoScene(
      id: 0x1000,
      shortName: "demoscene",
      longName: "Demo from Demo Scene"), // Amiga/ST/PC Demo from demo scene
  Educative(
      id: 0x1100,
      shortName: "educative",
      longName: "Educative"); // Educative games

  final int id;
  final String shortName;
  final String longName;

  const GameGenre({
    required this.id,
    required this.shortName,
    required this.longName,
  });

  static bool isSubGenre(GameGenre genre) {
    final value = genre.id;
    return value & 0xFF != 0;
  }

  static bool topGenreMatching(GameGenre sub, GameGenre top) {
    return (sub.index >> 8) == (top.index >> 8);
  }

  static GameGenre getTopGenre(GameGenre genre) {
    final value = genre.id & 0xFF00;
    for (final g in GameGenre.values) {
      if (g.id == value) {
        return g;
      }
    }
    return GameGenre.None;
  }

  static GameGenre lookupFromName(String name) {
    for (final e in GameGenre.values) {
      if (e.shortName == name) {
        return e;
      }
    }
    return GameGenre.None;
  }

  static GameGenre? lookupFromId(int? id) {
    if (id == null) {
      return null;
    }
    for (final e in GameGenre.values) {
      if (e.id == id) {
        return e;
      }
    }
    return GameGenre.None;
  }
}

// Coverted from https://gitlab.com/recalbox/recalbox/-/blob/master/projects/frontend/es-app/src/scraping/scrapers/screenscraper/ScreenScraperApis.cpp

final sScreenScraperSubGenresToGameGenres = <int, GameGenre>{
  2909: GameGenre.ActionPlatformer,
  7: GameGenre.ActionPlatformer,
  2915: GameGenre.ActionPlatformer,
  2897: GameGenre.ActionPlatformer,
  2937: GameGenre.ActionPlatformShooter,
  3026: GameGenre.ActionPlatformShooter,
  2887: GameGenre.ActionPlatformShooter,
  2896: GameGenre.ActionPlatformShooter,
  3024: GameGenre.ActionFirstPersonShooter,
  2988: GameGenre.ActionFirstPersonShooter,
  79: GameGenre.ActionShootEmUp,
  2955: GameGenre.ActionShootEmUp,
  2870: GameGenre.ActionShootEmUp,
  2851: GameGenre.ActionShootEmUp,
  2876: GameGenre.ActionShootEmUp,
  2900: GameGenre.ActionShootEmUp,
  2889: GameGenre.ActionShootEmUp,
  2945: GameGenre.ActionShootWithGun,
  32: GameGenre.ActionShootWithGun,
  14: GameGenre.ActionFighting,
  2874: GameGenre.ActionFighting,
  2914: GameGenre.ActionFighting,
  2920: GameGenre.ActionFighting,
  2885: GameGenre.ActionFighting,
  2957: GameGenre.ActionFighting,
  2922: GameGenre.ActionFighting,
  1: GameGenre.ActionBeatEmUp,
  425: GameGenre.ActionRythm,
  2925: GameGenre.ActionRythm,
  3237: GameGenre.AdventureGraphics,
  20672: GameGenre.AdventureGraphics,
  20678: GameGenre.AdventureRealTime3D,
  20676: GameGenre.AdventureInteractiveMovie,
  20674: GameGenre.AdventureVisualNovels,
  20680: GameGenre.AdventureSurvivalHorror,
  20670: GameGenre.AdventureText,
  2648: GameGenre.SimulationFishAndHunt,
  3192: GameGenre.SimulationFishAndHunt,
  2895: GameGenre.SimulationFishAndHunt,
  2893: GameGenre.SimulationVehicle,
  2911: GameGenre.SimulationVehicle,
  2953: GameGenre.SimulationVehicle,
  2940: GameGenre.SimulationVehicle,
  2910: GameGenre.SimulationVehicle,
  2934: GameGenre.SimulationVehicle,
  2938: GameGenre.SimulationVehicle,
  2921: GameGenre.SimulationVehicle,
  28: GameGenre.SportRacing,
  2924: GameGenre.SportRacing,
  2973: GameGenre.SportRacing,
  2871: GameGenre.SportRacing,
  2884: GameGenre.SportRacing,
  2943: GameGenre.SportRacing,
  2853: GameGenre.SportSimulation,
  2852: GameGenre.SportSimulation,
  3028: GameGenre.SportSimulation,
  2901: GameGenre.SportSimulation,
  2877: GameGenre.SportSimulation,
  2970: GameGenre.SportSimulation,
  2906: GameGenre.SportSimulation,
  2847: GameGenre.SportSimulation,
  2846: GameGenre.SportSimulation,
  2913: GameGenre.SportSimulation,
  2960: GameGenre.SportSimulation,
  2933: GameGenre.SportSimulation,
  2971: GameGenre.SportSimulation,
  2878: GameGenre.SportSimulation,
  2968: GameGenre.SportSimulation,
  2966: GameGenre.SportSimulation,
  2948: GameGenre.SportSimulation,
  2875: GameGenre.SportSimulation,
  2902: GameGenre.SportSimulation,
  2867: GameGenre.SportSimulation,
  2883: GameGenre.SportSimulation,
  2650: GameGenre.SportSimulation,
  2918: GameGenre.SportSimulation,
  2929: GameGenre.SportFight,
  2919: GameGenre.SportFight,
  3034: GameGenre.SportFight,
  1861: GameGenre.SportFight,
  2947: GameGenre.SportFight,
};

final sScreenScraperGenresToGameGenres = <int, GameGenre>{
  2855: GameGenre.None,
  2904: GameGenre.None,
  2879: GameGenre.None,
  10: GameGenre.Action,
  2903: GameGenre.Action,
  2928: GameGenre.Action,
  2881: GameGenre.Action,
  2646: GameGenre.Action,
  3566: GameGenre.Action,
  2917: GameGenre.Action,
  13: GameGenre.Adventure,
  8: GameGenre.RPG,
  2890: GameGenre.Simulation,
  40: GameGenre.Simulation,
  27: GameGenre.Strategy,
  685: GameGenre.Sports,
  31: GameGenre.Pinball,
  33: GameGenre.Board,
  2647: GameGenre.Board,
  2958: GameGenre.Board,
  2882: GameGenre.Board,
  2869: GameGenre.Board,
  2949: GameGenre.Board,
  2956: GameGenre.Board,
  2961: GameGenre.Board,
  171: GameGenre.Casual,
  42: GameGenre.DigitalCard,
  3511: GameGenre.PuzzleAndLogic,
  26: GameGenre.PuzzleAndLogic,
  2864: GameGenre.PuzzleAndLogic,
  2891: GameGenre.PuzzleAndLogic,
  2923: GameGenre.PuzzleAndLogic,
  2912: GameGenre.PuzzleAndLogic,
  2649: GameGenre.Trivia,
  2954: GameGenre.Trivia,
  2931: GameGenre.Trivia,
  2951: GameGenre.Trivia,
  2962: GameGenre.Trivia,
  2969: GameGenre.Trivia,
  2952: GameGenre.Trivia,
  2894: GameGenre.Trivia,
  2964: GameGenre.Trivia,
  2967: GameGenre.Trivia,
  320: GameGenre.Casino,
  2872: GameGenre.Casino,
  2950: GameGenre.Casino,
  2932: GameGenre.Casino,
  2860: GameGenre.Casino,
  2944: GameGenre.Casino,
  34: GameGenre.Compilation,
  2974: GameGenre.DemoScene,
  30: GameGenre.Educative,
};
