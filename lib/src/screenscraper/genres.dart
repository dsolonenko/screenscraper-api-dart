// Converted from https://gitlab.com/recalbox/recalbox/-/blob/master/projects/frontend/es-app/src/games/classifications/Genres.cpp

// References:
// https://www.idtech.com/blog/different-types-of-video-game-genres
// https://en.wikipedia.org/wiki/List_of_video_game_genres

// ignore_for_file: constant_identifier_names

import 'dart:core';

import 'package:screenscraper/screenscraper.dart';

enum GameGenres {
  None, // No genre
  Action, // Generic Action games
  ActionPlatformer, // - Action platform game
  ActionPlatformShooter, // - Action platform shooter (Turrican, ...)
  ActionFirstPersonShooter, // - First person shooter (007, ...)
  ActionShootEmUp, // - Shoot'em up/all (
  ActionShootWithGun, // - On-screen shooters (Operation wolf, Duck Hunt, ...)
  ActionFighting, // - Fighting games (mortal kombat, street fighters, ...)
  ActionBeatEmUp, // - Beat'em up/all (Renegade, Double Dragon, ...)
  ActionStealth, // - Stealth combat (MGS, Dishonored, ...)
  ActionBattleRoyale, // - Battle royale survivals (Fortnite, Apex legend, ...)
  ActionRythm, // - Music/Rythm games (Dance Dance Revolution, ...)
  Adventure, // Generic Adventure games
  AdventureText, // - Old-school text adventure (Zork, ...)
  AdventureGraphics, // - Mainly Point-and-clicks
  AdventureVisualNovels, // - Dating & legal simulation (Ace Attornay, ...)
  AdventureInteractiveMovie, // - Interactive movies (Tex Murphy, Fahrenheit, RE4, ...)
  AdventureRealTime3D, // - 3D adventures (Shenmue, Heavy rain, ...)
  AdventureSurvivalHorror, // - Survivals/Horror Survivals (Lost in blue, Resident evil, ...)
  RPG, // Generic RPG (Role Playing Games)
  RPGAction, // - Action RPG (Diablo, ...)
  RPGMMO, // - Massive Multiplayer Online RPG (TESO, WoW, ...)
  RPGDungeonCrawler, // - Dungeon Crawler (Dungeon Master, Eye of the beholder, ...)
  RPGTactical, // - Tactical RPG (Ogres Battle, FF Tactics, ...)
  RPGJapanese, // - Japaneese RPG, manga-like (Chrono Trigger, FF, ...)
  RPGFirstPersonPartyBased, // - Team-as-one RPG (Ishar, Bard's tales, ...)
  Simulation, // Generic simulation
  SimulationBuildAndManagement, // - Construction & Management simulations (Sim-city, ...)
  SimulationLife, // - Life simulation (Nintendogs, Tamagoshi, Sims, ...)
  SimulationFishAndHunt, // - Fighing and hunting (Deer hunting, Sega bass fishing, ...)
  SimulationVehicle, // - Car/Planes/Tank/... simulations (Flight Simulator, Sherman M4, ...)
  SimulationSciFi, // - Space Opera (Elite, Homeworld)
  Strategy, // Generic strategy games
  Strategy4X, // - eXplore, eXpand, eXploit, eXterminate (Civilization, ...)
  StrategyArtillery, // - multiplayer artillery games, turn by turn (Scortched Tanks, Worms, ...)
  StrategyAutoBattler, // - Auto-battle tacticals (Dota undergrounds, Heartstone Battlegrounds, ...)
  StrategyMOBA, // - Multiplayer Online Battle Arena (Dota 2, Smite, ...)
  StrategyRTS, // - Real Time Strategy (Warcrafs, Dune, C&C, ...)
  StrategyTBS, // - Turn based strategy (Might & Magic, Making History, ...)
  StrategyTowerDefense, // - Tower defenses!
  StrategyWargame, // - Military tactics
  Sports, // Generic sport games
  SportRacing, // - All racing games!
  SportSimulation, // - All physical/simulation sports
  SportCompetitive, // - High competitive factor (Ball Jack, ...)
  SportFight, // - Fighting sports/violent sports (SpeedBall, WWE 2K Fight Nights, ...)
  Pinball, // Pinball
  Board, // Board games (chess, backgammon, othello, ...)
  Casual, // Simple interaction games for casual gaming
  DigitalCard, // Card Collection/games (Hearthstone, Magic the Gathering, ...)
  PuzzleAndLogic, // Puzzle and logic games (Tetris, Sokoban, ...)
  Party, // Multiplayer party games (Mario party, ...)
  Trivia, // Answer/Quizz games (Family Feud, Are you smarter than a 5th grade, ...)
  Casino, // Casino games
  Compilation, // Multi games
  DemoScene, // Amiga/ST/PC Demo from demo scene
  Educative, // Educative games
}

const Map<GameGenres, int> gameGenreValues = {
  GameGenres.None: 0x0000,
  GameGenres.Action: 0x0100,
  GameGenres.ActionPlatformer: 0x0101,
  GameGenres.ActionPlatformShooter: 0x0102,
  GameGenres.ActionFirstPersonShooter: 0x0103,
  GameGenres.ActionShootEmUp: 0x0104,
  GameGenres.ActionShootWithGun: 0x0105,
  GameGenres.ActionFighting: 0x0106,
  GameGenres.ActionBeatEmUp: 0x0107,
  GameGenres.ActionStealth: 0x0108,
  GameGenres.ActionBattleRoyale: 0x0109,
  GameGenres.ActionRythm: 0x010A,
  GameGenres.Adventure: 0x0200,
  GameGenres.AdventureText: 0x0201,
  GameGenres.AdventureGraphics: 0x0202,
  GameGenres.AdventureVisualNovels: 0x0203,
  GameGenres.AdventureInteractiveMovie: 0x0204,
  GameGenres.AdventureRealTime3D: 0x0205,
  GameGenres.AdventureSurvivalHorror: 0x0206,
  GameGenres.RPG: 0x0300,
  GameGenres.RPGAction: 0x0301,
  GameGenres.RPGMMO: 0x0302,
  GameGenres.RPGDungeonCrawler: 0x0303,
  GameGenres.RPGTactical: 0x0304,
  GameGenres.RPGJapanese: 0x0305,
  GameGenres.RPGFirstPersonPartyBased: 0x0306,
  GameGenres.Simulation: 0x0400,
  GameGenres.SimulationBuildAndManagement: 0x0401,
  GameGenres.SimulationLife: 0x0402,
  GameGenres.SimulationFishAndHunt: 0x0403,
  GameGenres.SimulationVehicle: 0x0404,
  GameGenres.SimulationSciFi: 0x0405,
  GameGenres.Strategy: 0x0500,
  GameGenres.Strategy4X: 0x0501,
  GameGenres.StrategyArtillery: 0x0502,
  GameGenres.StrategyAutoBattler: 0x0503,
  GameGenres.StrategyMOBA: 0x0504,
  GameGenres.StrategyRTS: 0x0505,
  GameGenres.StrategyTBS: 0x0506,
  GameGenres.StrategyTowerDefense: 0x0507,
  GameGenres.StrategyWargame: 0x0508,
  GameGenres.Sports: 0x0600,
  GameGenres.SportRacing: 0x0601,
  GameGenres.SportSimulation: 0x0602,
  GameGenres.SportCompetitive: 0x0603,
  GameGenres.SportFight: 0x0604,
  GameGenres.Pinball: 0x0700,
  GameGenres.Board: 0x0800,
  GameGenres.Casual: 0x0900,
  GameGenres.DigitalCard: 0x0A00,
  GameGenres.PuzzleAndLogic: 0x0B00,
  GameGenres.Party: 0x0C00,
  GameGenres.Trivia: 0x0D00,
  GameGenres.Casino: 0x0E00,
  GameGenres.Compilation: 0x0F00,
  GameGenres.DemoScene: 0x1000,
  GameGenres.Educative: 0x1100,
};

class Genres {
  static bool isSubGenre(GameGenres genre) {
    final value = gameGenreValues[genre] ?? 0;
    return value & 0xFF != 0;
  }

  static bool topGenreMatching(GameGenres sub, GameGenres top) {
    return (sub.index >> 8) == (top.index >> 8);
  }

  static GameGenres getTopGenre(GameGenres genre) {
    final value = (gameGenreValues[genre] ?? 0) & 0xFF00;
    for (final g in GameGenres.values) {
      if (gameGenreValues[g] == value) {
        return g;
      }
    }
    return GameGenres.None;
  }

  String getResourcePath(GameGenres genre) {
    const Map<GameGenres, String> sNames = {
      GameGenres.None: '',
      GameGenres.Action: 'assets/genre/action.svg',
      GameGenres.ActionPlatformer: 'assets/genre/actionplatformer.svg',
      GameGenres.ActionPlatformShooter:
          'assets/genre/actionplatformshooter.svg',
      GameGenres.ActionFirstPersonShooter:
          'assets/genre/actionfirstpersonshooter.svg',
      GameGenres.ActionShootEmUp: 'assets/genre/actionshootemup.svg',
      GameGenres.ActionShootWithGun: 'assets/genre/actionshootwithgun.svg',
      GameGenres.ActionFighting: 'assets/genre/actionfighting.svg',
      GameGenres.ActionBeatEmUp: 'assets/genre/actionbeatemup.svg',
      GameGenres.ActionStealth: 'assets/genre/actionstealth.svg',
      GameGenres.ActionBattleRoyale: 'assets/genre/actionbattleroyale.svg',
      GameGenres.ActionRythm: 'assets/genre/actionrythm.svg',
      GameGenres.Adventure: 'assets/genre/adventure.svg',
      GameGenres.AdventureText: 'assets/genre/adventuretext.svg',
      GameGenres.AdventureGraphics: 'assets/genre/adventuregraphical.svg',
      GameGenres.AdventureVisualNovels: 'assets/genre/adventurevisualnovel.svg',
      GameGenres.AdventureInteractiveMovie:
          'assets/genre/adventureinteractivemovie.svg',
      GameGenres.AdventureRealTime3D: 'assets/genre/adventurerealtime3d.svg',
      GameGenres.AdventureSurvivalHorror:
          'assets/genre/adventuresurvivalhorror.svg',
      GameGenres.RPG: 'assets/genre/rpg.svg',
      GameGenres.RPGAction: 'assets/genre/rpgaction.svg',
      GameGenres.RPGMMO: 'assets/genre/rpgmmo.svg',
      GameGenres.RPGDungeonCrawler: 'assets/genre/rpgdungeoncrawler.svg',
      GameGenres.RPGTactical: 'assets/genre/rpgtactical.svg',
      GameGenres.RPGJapanese: 'assets/genre/rpgjapanese.svg',
      GameGenres.RPGFirstPersonPartyBased:
          'assets/genre/rpgfirstpersonpartybased.svg',
      GameGenres.Simulation: 'assets/genre/simulation.svg',
      GameGenres.SimulationBuildAndManagement:
          'assets/genre/simulationbuildandmanagement.svg',
      GameGenres.SimulationLife: 'assets/genre/simulationlife.svg',
      GameGenres.SimulationFishAndHunt:
          'assets/genre/simulationfishandhunt.svg',
      GameGenres.SimulationVehicle: 'assets/genre/simulationvehicle.svg',
      GameGenres.SimulationSciFi: 'assets/genre/simulationscifi.svg',
      GameGenres.Strategy: 'assets/genre/strategy.svg',
      GameGenres.Strategy4X: 'assets/genre/strategy4x.svg',
      GameGenres.StrategyArtillery: 'assets/genre/strategyartillery.svg',
      GameGenres.StrategyAutoBattler: 'assets/genre/strategyautobattler.svg',
      GameGenres.StrategyMOBA: 'assets/genre/strategymoba.svg',
      GameGenres.StrategyRTS: 'assets/genre/strategyrts.svg',
      GameGenres.StrategyTBS: 'assets/genre/strategytbs.svg',
      GameGenres.StrategyTowerDefense: 'assets/genre/strategytowerdefense.svg',
      GameGenres.StrategyWargame: 'assets/genre/strategywargame.svg',
      GameGenres.Sports: 'assets/genre/sports.svg',
      GameGenres.SportRacing: 'assets/genre/sportracing.svg',
      GameGenres.SportSimulation: 'assets/genre/sportsimulation.svg',
      GameGenres.SportCompetitive: 'assets/genre/sportcompetitive.svg',
      GameGenres.SportFight: 'assets/genre/sportfight.svg',
      GameGenres.Pinball: 'assets/genre/flipper.svg',
      GameGenres.Board: 'assets/genre/board.svg',
      GameGenres.Casual: 'assets/genre/casual.svg',
      GameGenres.DigitalCard: 'assets/genre/digitalcard.svg',
      GameGenres.PuzzleAndLogic: 'assets/genre/puzzleandlogic.svg',
      GameGenres.Party: 'assets/genre/party.svg',
      GameGenres.Trivia: 'assets/genre/trivia.svg',
      GameGenres.Casino: 'assets/genre/casino.svg',
      GameGenres.Compilation: 'assets/genre/compilation.svg',
      GameGenres.DemoScene: 'assets/genre/demoscene.svg',
      GameGenres.Educative: 'assets/genre/educative.svg',
    };

    String found = sNames[genre] ?? '';

    if (found.isEmpty) {
      print('[Genres] Unknown GameGenre ${genre.index}');
    }

    return found;
  }

  static const Map<GameGenres, String> longNameMap = {
    GameGenres.None: "None",
    GameGenres.Action: "Action (All)",
    GameGenres.ActionPlatformer: "Platform",
    GameGenres.ActionPlatformShooter: "Platform Shooter",
    GameGenres.ActionFirstPersonShooter: "First Person Shooter",
    GameGenres.ActionShootEmUp: "Shoot'em Up",
    GameGenres.ActionShootWithGun: "Shoot with Gun",
    GameGenres.ActionFighting: "Fighting",
    GameGenres.ActionBeatEmUp: "Beat'em All",
    GameGenres.ActionStealth: "Infiltration",
    GameGenres.ActionBattleRoyale: "Battle Royale",
    GameGenres.ActionRythm: "Rythm & Music",
    GameGenres.Adventure: "Adventure (All)",
    GameGenres.AdventureText: "Textual Adventure",
    GameGenres.AdventureGraphics: "Graphical Adventure",
    GameGenres.AdventureVisualNovels: "Visual Novel",
    GameGenres.AdventureInteractiveMovie: "Interactive Movie",
    GameGenres.AdventureRealTime3D: "Real Time 3D Adventure",
    GameGenres.AdventureSurvivalHorror: "Survival",
    GameGenres.RPG: "RPG (All)",
    GameGenres.RPGAction: "Action RPG",
    GameGenres.RPGMMO: "MMORPG",
    GameGenres.RPGDungeonCrawler: "Dungeon Crawler",
    GameGenres.RPGTactical: "Tactical RPG",
    GameGenres.RPGJapanese: "JRPG",
    GameGenres.RPGFirstPersonPartyBased: "Party based RPG",
    GameGenres.Simulation: "Simulation (All)",
    GameGenres.SimulationBuildAndManagement: "Build & Management",
    GameGenres.SimulationLife: "Life Simulation",
    GameGenres.SimulationFishAndHunt: "Fishing & Hunting",
    GameGenres.SimulationVehicle: "Vehicle Simulation",
    GameGenres.SimulationSciFi: "Science Fiction Simulation",
    GameGenres.Strategy: "Strategy (All)",
    GameGenres.Strategy4X: "eXplore, eXpand, eXploit & eXterminate",
    GameGenres.StrategyArtillery: "Artillery",
    GameGenres.StrategyAutoBattler: "Auto-battler",
    GameGenres.StrategyMOBA: "Multiplayer Online Battle Arena",
    GameGenres.StrategyRTS: "Real Time Strategy",
    GameGenres.StrategyTBS: "Turn Based Strategy",
    GameGenres.StrategyTowerDefense: "Tower Defense",
    GameGenres.StrategyWargame: "Wargame",
    GameGenres.Sports: "Sports (All)",
    GameGenres.SportRacing: "Racing",
    GameGenres.SportSimulation: "Sport Simulation",
    GameGenres.SportCompetitive: "Competition Sport",
    GameGenres.SportFight: "Fighting/Violent Sport",
    GameGenres.Pinball: "Pinball",
    GameGenres.Board: "Board game",
    GameGenres.Casual: "Casual game",
    GameGenres.DigitalCard: "Digital Cards",
    GameGenres.PuzzleAndLogic: "Puzzle & Logic",
    GameGenres.Party: "Multiplayer Party Game",
    GameGenres.Trivia: "Trivia",
    GameGenres.Casino: "Casino",
    GameGenres.Compilation: "Multi Game Compilation",
    GameGenres.DemoScene: "Demo from Demo Scene",
    GameGenres.Educative: "Educative",
  };

  static String getName(GameGenres? genre, {String ifNull = "Unknown"}) {
    if (longNameMap.containsKey(genre)) {
      return longNameMap[genre]!;
    }
    return ifNull;
  }

  static const Map<GameGenres, String> shortNameMap = {
    GameGenres.Action: "action",
    GameGenres.ActionPlatformer: "actionplatformer",
    GameGenres.ActionPlatformShooter: "actionplatformshooter",
    GameGenres.ActionFirstPersonShooter: "actionfirstpersonshooter",
    GameGenres.ActionShootEmUp: "actionshootemup",
    GameGenres.ActionShootWithGun: "actionshootwithgun",
    GameGenres.ActionFighting: "actionfighting",
    GameGenres.ActionBeatEmUp: "actionbeatemup",
    GameGenres.ActionStealth: "actionstealth",
    GameGenres.ActionBattleRoyale: "actionbattleroyale",
    GameGenres.ActionRythm: "actionrythm",
    GameGenres.Adventure: "adventure",
    GameGenres.AdventureText: "adventuretext",
    GameGenres.AdventureGraphics: "adventuregraphics",
    GameGenres.AdventureVisualNovels: "adventurevisualnovels",
    GameGenres.AdventureInteractiveMovie: "adventureinteractivemovie",
    GameGenres.AdventureRealTime3D: "adventurerealtime3d",
    GameGenres.AdventureSurvivalHorror: "adventuresurvivalhorror",
    GameGenres.RPG: "rpg",
    GameGenres.RPGAction: "rpgaction",
    GameGenres.RPGMMO: "rpgmmo",
    GameGenres.RPGDungeonCrawler: "rpgdungeoncrawler",
    GameGenres.RPGTactical: "rpgtactical",
    GameGenres.RPGJapanese: "rpgjapanese",
    GameGenres.RPGFirstPersonPartyBased: "rpgfirstpersonpartybased",
    GameGenres.Simulation: "simulation",
    GameGenres.SimulationBuildAndManagement: "simulationbuildandmanagement",
    GameGenres.SimulationLife: "simulationlife",
    GameGenres.SimulationFishAndHunt: "simulationfishandhunt",
    GameGenres.SimulationVehicle: "simulationvehicle",
    GameGenres.SimulationSciFi: "simulationscifi",
    GameGenres.Strategy: "strategy",
    GameGenres.Strategy4X: "strategy4x",
    GameGenres.StrategyArtillery: "strategyartillery",
    GameGenres.StrategyAutoBattler: "strategyautobattler",
    GameGenres.StrategyMOBA: "strategymoba",
    GameGenres.StrategyRTS: "strategyrts",
    GameGenres.StrategyTBS: "strategytbs",
    GameGenres.StrategyTowerDefense: "strategytowerdefense",
    GameGenres.StrategyWargame: "strategywargame",
    GameGenres.Sports: "sports",
    GameGenres.SportRacing: "sportracing",
    GameGenres.SportSimulation: "sportsimulation",
    GameGenres.SportCompetitive: "sportcompetitive",
    GameGenres.SportFight: "sportfight",
    GameGenres.Pinball: "pinball",
    GameGenres.Board: "board",
    GameGenres.Casual: "casual",
    GameGenres.DigitalCard: "digitalcard",
    GameGenres.PuzzleAndLogic: "puzzleandlogic",
    GameGenres.Party: "party",
    GameGenres.Trivia: "trivia",
    GameGenres.Casino: "casino",
    GameGenres.Compilation: "compilation",
    GameGenres.DemoScene: "demoscene",
    GameGenres.Educative: "educative",
  };

  static String getShortName(GameGenres genre) {
    if (shortNameMap.containsKey(genre)) {
      return shortNameMap[genre]!;
    }
    print('[Genres] Unknown GameGenre ${genre.index}');
    return 'Unknown';
  }

  static List<GameGenres> get orderedList => [
        GameGenres.Action,
        GameGenres.ActionPlatformer,
        GameGenres.ActionPlatformShooter,
        GameGenres.ActionFirstPersonShooter,
        GameGenres.ActionShootEmUp,
        GameGenres.ActionShootWithGun,
        GameGenres.ActionFighting,
        GameGenres.ActionBeatEmUp,
        GameGenres.ActionStealth,
        GameGenres.ActionBattleRoyale,
        GameGenres.ActionRythm,
        GameGenres.Adventure,
        GameGenres.AdventureText,
        GameGenres.AdventureGraphics,
        GameGenres.AdventureVisualNovels,
        GameGenres.AdventureInteractiveMovie,
        GameGenres.AdventureRealTime3D,
        GameGenres.AdventureSurvivalHorror,
        GameGenres.RPG,
        GameGenres.RPGAction,
        GameGenres.RPGMMO,
        GameGenres.RPGDungeonCrawler,
        GameGenres.RPGTactical,
        GameGenres.RPGJapanese,
        GameGenres.RPGFirstPersonPartyBased,
        GameGenres.Simulation,
        GameGenres.SimulationBuildAndManagement,
        GameGenres.SimulationLife,
        GameGenres.SimulationFishAndHunt,
        GameGenres.SimulationVehicle,
        GameGenres.SimulationSciFi,
        GameGenres.Strategy,
        GameGenres.Strategy4X,
        GameGenres.StrategyArtillery,
        GameGenres.StrategyAutoBattler,
        GameGenres.StrategyMOBA,
        GameGenres.StrategyRTS,
        GameGenres.StrategyTBS,
        GameGenres.StrategyTowerDefense,
        GameGenres.StrategyWargame,
        GameGenres.Sports,
        GameGenres.SportRacing,
        GameGenres.SportSimulation,
        GameGenres.SportCompetitive,
        GameGenres.SportFight,
        GameGenres.Pinball,
        GameGenres.Board,
        GameGenres.Casual,
        GameGenres.DigitalCard,
        GameGenres.PuzzleAndLogic,
        GameGenres.Party,
        GameGenres.Trivia,
        GameGenres.Casino,
        GameGenres.Compilation,
        GameGenres.DemoScene,
        GameGenres.Educative,
      ];

  static GameGenres lookupFromName(String name) {
    for (final item in Genres.shortNameMap.entries) {
      if (name == item.value) {
        return item.key;
      }
    }
    return GameGenres.None;
  }

  static GameGenres? lookupFromId(int? id) {
    if (id == null) {
      return null;
    }
    for (final item in GameGenres.values) {
      if (gameGenreValues[item] == id) {
        return item;
      }
    }
    return GameGenres.None;
  }

  static int? lookupId(GameGenres? genre) {
    return gameGenreValues[genre];
  }
}

// Coverted from https://gitlab.com/recalbox/recalbox/-/blob/master/projects/frontend/es-app/src/scraping/scrapers/screenscraper/ScreenScraperApis.cpp

final sScreenScraperSubGenresToGameGenres = <int, GameGenres>{
  2909: GameGenres.ActionPlatformer,
  7: GameGenres.ActionPlatformer,
  2915: GameGenres.ActionPlatformer,
  2897: GameGenres.ActionPlatformer,
  2937: GameGenres.ActionPlatformShooter,
  3026: GameGenres.ActionPlatformShooter,
  2887: GameGenres.ActionPlatformShooter,
  2896: GameGenres.ActionPlatformShooter,
  3024: GameGenres.ActionFirstPersonShooter,
  2988: GameGenres.ActionFirstPersonShooter,
  79: GameGenres.ActionShootEmUp,
  2955: GameGenres.ActionShootEmUp,
  2870: GameGenres.ActionShootEmUp,
  2851: GameGenres.ActionShootEmUp,
  2876: GameGenres.ActionShootEmUp,
  2900: GameGenres.ActionShootEmUp,
  2889: GameGenres.ActionShootEmUp,
  2945: GameGenres.ActionShootWithGun,
  32: GameGenres.ActionShootWithGun,
  14: GameGenres.ActionFighting,
  2874: GameGenres.ActionFighting,
  2914: GameGenres.ActionFighting,
  2920: GameGenres.ActionFighting,
  2885: GameGenres.ActionFighting,
  2957: GameGenres.ActionFighting,
  2922: GameGenres.ActionFighting,
  1: GameGenres.ActionBeatEmUp,
  425: GameGenres.ActionRythm,
  2925: GameGenres.ActionRythm,
  3237: GameGenres.AdventureGraphics,
  20672: GameGenres.AdventureGraphics,
  20678: GameGenres.AdventureRealTime3D,
  20676: GameGenres.AdventureInteractiveMovie,
  20674: GameGenres.AdventureVisualNovels,
  20680: GameGenres.AdventureSurvivalHorror,
  20670: GameGenres.AdventureText,
  2648: GameGenres.SimulationFishAndHunt,
  3192: GameGenres.SimulationFishAndHunt,
  2895: GameGenres.SimulationFishAndHunt,
  2893: GameGenres.SimulationVehicle,
  2911: GameGenres.SimulationVehicle,
  2953: GameGenres.SimulationVehicle,
  2940: GameGenres.SimulationVehicle,
  2910: GameGenres.SimulationVehicle,
  2934: GameGenres.SimulationVehicle,
  2938: GameGenres.SimulationVehicle,
  2921: GameGenres.SimulationVehicle,
  28: GameGenres.SportRacing,
  2924: GameGenres.SportRacing,
  2973: GameGenres.SportRacing,
  2871: GameGenres.SportRacing,
  2884: GameGenres.SportRacing,
  2943: GameGenres.SportRacing,
  2853: GameGenres.SportSimulation,
  2852: GameGenres.SportSimulation,
  3028: GameGenres.SportSimulation,
  2901: GameGenres.SportSimulation,
  2877: GameGenres.SportSimulation,
  2970: GameGenres.SportSimulation,
  2906: GameGenres.SportSimulation,
  2847: GameGenres.SportSimulation,
  2846: GameGenres.SportSimulation,
  2913: GameGenres.SportSimulation,
  2960: GameGenres.SportSimulation,
  2933: GameGenres.SportSimulation,
  2971: GameGenres.SportSimulation,
  2878: GameGenres.SportSimulation,
  2968: GameGenres.SportSimulation,
  2966: GameGenres.SportSimulation,
  2948: GameGenres.SportSimulation,
  2875: GameGenres.SportSimulation,
  2902: GameGenres.SportSimulation,
  2867: GameGenres.SportSimulation,
  2883: GameGenres.SportSimulation,
  2650: GameGenres.SportSimulation,
  2918: GameGenres.SportSimulation,
  2929: GameGenres.SportFight,
  2919: GameGenres.SportFight,
  3034: GameGenres.SportFight,
  1861: GameGenres.SportFight,
  2947: GameGenres.SportFight,
};

final sScreenScraperGenresToGameGenres = <int, GameGenres>{
  2855: GameGenres.None,
  2904: GameGenres.None,
  2879: GameGenres.None,
  10: GameGenres.Action,
  2903: GameGenres.Action,
  2928: GameGenres.Action,
  2881: GameGenres.Action,
  2646: GameGenres.Action,
  3566: GameGenres.Action,
  2917: GameGenres.Action,
  13: GameGenres.Adventure,
  8: GameGenres.RPG,
  2890: GameGenres.Simulation,
  40: GameGenres.Simulation,
  27: GameGenres.Strategy,
  685: GameGenres.Sports,
  31: GameGenres.Pinball,
  33: GameGenres.Board,
  2647: GameGenres.Board,
  2958: GameGenres.Board,
  2882: GameGenres.Board,
  2869: GameGenres.Board,
  2949: GameGenres.Board,
  2956: GameGenres.Board,
  2961: GameGenres.Board,
  171: GameGenres.Casual,
  42: GameGenres.DigitalCard,
  3511: GameGenres.PuzzleAndLogic,
  26: GameGenres.PuzzleAndLogic,
  2864: GameGenres.PuzzleAndLogic,
  2891: GameGenres.PuzzleAndLogic,
  2923: GameGenres.PuzzleAndLogic,
  2912: GameGenres.PuzzleAndLogic,
  2649: GameGenres.Trivia,
  2954: GameGenres.Trivia,
  2931: GameGenres.Trivia,
  2951: GameGenres.Trivia,
  2962: GameGenres.Trivia,
  2969: GameGenres.Trivia,
  2952: GameGenres.Trivia,
  2894: GameGenres.Trivia,
  2964: GameGenres.Trivia,
  2967: GameGenres.Trivia,
  320: GameGenres.Casino,
  2872: GameGenres.Casino,
  2950: GameGenres.Casino,
  2932: GameGenres.Casino,
  2860: GameGenres.Casino,
  2944: GameGenres.Casino,
  34: GameGenres.Compilation,
  2974: GameGenres.DemoScene,
  30: GameGenres.Educative,
};

GameGenres lookupNormalizedGenre(List<Genre>? genres) {
  if (genres == null) {
    return GameGenres.None;
  }

  // Lookup Sub-genre first
  for (final genre in genres) {
    GameGenres? found = sScreenScraperSubGenresToGameGenres[genre.id];
    if (found != null) {
      return found;
    }
  }

  // Lookup genre except "Action" & "Adult"
  for (final genre in genres) {
    if (genre.id != 10 && genre.id != 413) {
      GameGenres? found = sScreenScraperGenresToGameGenres[genre.id];
      if (found != null) {
        return found;
      }
    }
  }

  // Lookup what's available
  for (final genre in genres) {
    if (genre.id != 413) {
      GameGenres? found = sScreenScraperGenresToGameGenres[genre.id];
      if (found != null) {
        return found;
      }
    }
  }

  return GameGenres.None;
}

bool isAdult(List<Genre>? genres) {
  if (genres == null) {
    return false;
  }
  return genres.any((element) => element.id == 413);
}
