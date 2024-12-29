module MassiveDecks.Strings.Languages.Fr exposing (pack)

{-| French localization.

Contributors:

  - CubicOtter <https://github.com/cubicotter>

-}

import MassiveDecks.Card.Source.BuiltIn.Model as BuiltIn
import MassiveDecks.Card.Source.Model as Source
import MassiveDecks.Strings exposing (MdString(..), Noun(..), Quantity(..))
import MassiveDecks.Strings.Languages.En.Internal as Internal
import MassiveDecks.Strings.Languages.Model exposing (Language(..))
import MassiveDecks.Strings.Translation as Translation
import MassiveDecks.Strings.Translation.Model as Translation exposing (Result(..))


pack : Translation.Pack
pack =
    Translation.pack
        { lang = Fr
        , code = "fr"
        , name = French
        , translate = Internal.translate
        , recommended = "cah-base-en" |> BuiltIn.hardcoded |> Source.BuiltIn
        }

{-| The French translation-}

translate : Maybe never -> MdString -> List (Translation.Result never)
translate _ mdString =
    case mdString of
        -- General
        MassiveDecks ->
            [ Text "Massive Decks" ]

        Close ->
            [ Text "Fermer" ]

        Noun { noun, quantity } ->
            case quantity of
                Quantity 1 ->
                    case noun of
                        Call ->
                            [ Text "Carte Noire" ]

                        Response ->
                            [ Text "Carte Blanche" ]

                        Point ->
                            [ Text "Point d’Excellence" ]

                        Player ->
                            [ Text "Joueur" ]

                        Spectator ->
                            [ Text "Spectateur" ]

                _ ->
                    case noun of
                        Call ->
                            [ Text "Cartes Noires" ]

                        Response ->
                            [ Text "Cartes Blanches" ]

                        Point ->
                            [ Text "Points d’Excellence" ]

                        Player ->
                            [ Text "Joueurs" ]

                        Spectator ->
                            [ Text "Spectateurs" ]

        -- Start screen.
        Version { clientVersion, serverVersion } ->
            let
                quote version =
                    [ Text "“", Text version, Text "”" ]
            in
            List.concat
                [ [ Text "Version " ]
                , clientVersion |> quote
                , [ Text " / " ]
                , serverVersion |> Maybe.map quote |> Maybe.withDefault []
                ]

        ShortGameDescription ->
            [ Text "Un jeu d'ambiance décalé." ]

        WhatIsThis ->
            [ Text "Qu’est-ce que ", ref MassiveDecks, Text "?" ]

        GameDescription ->
            [ ref MassiveDecks
            , Text " est un jeu d'ambiance basé sur "
            , ref CardsAgainstHumanity
            , Text ", développé par "
            , ref RereadGames
            , Text " et d'autres contributeurs—le jeu est open source sous "
            , ref License
            , Text ", donc vous pouvez aider à améliorer le jeu, regarder le code source, ou juste en apprendre plus sur "
            , ref MDProject
            , Text "."
            ]

        NewGame ->
            [ Text "Nouveau" ]

        NewGameDescription ->
            [ Text "Commencer une nouvelle partie de ", ref MassiveDecks, Text "." ]

        FindPublicGame ->
            [ Text "Rechercher" ]

        JoinPrivateGame ->
            [ Text "Rejoindre" ]

        JoinPrivateGameDescription ->
            [ Text "Rejoindre une partie à laquelle vous avez été invité." ]

        PlayGame ->
            [ Text "Jouer" ]

        AboutTheGame ->
            [ Text "À propos" ]

        AboutTheGameDescription ->
            [ Text "En apprendre plus sur ", ref MassiveDecks, Text " et son développement." ]

        MDLogoDescription ->
            [ Text "Une ", ref (noun Call 1), Text " et une ", ref (noun Response 1), Text " marquées avec un « M » et un « D »." ]

        RereadLogoDescription ->
            [ Text "Un livre entouré d'une flèche de recyclage." ]

        MDProject ->
            [ Text "le projet GitHub" ]

        License ->
            [ Text "la licence AGPLv3" ]

        DevelopedByReread ->
            [ Text "Développé par ", ref RereadGames, Text "." ]

        RereadGames ->
            [ Text "Reread Games" ]

        NameLabel ->
            [ Text "Votre nom" ]

        NameInUse ->
            [ Text "Quelqu'un d'autre utilise ce nom dans le jeu—veuillez en essayer un autre." ]

        RejoinTitle ->
            [ Text "Rejoindre la partie" ]

        RejoinGame { code } ->
            [ Text "Rejoindre « ", GameCode { code = code } |> ref, Text " »." ]

        LobbyRequiresPassword ->
            [ Text "Vous avez besoin d'un mot de passe pour rejoindre cette partie. Essayez de demander à la personne qui vous a invité." ]

        YouWereKicked ->
            [ Text "Vous avez été expulsé de la partie." ]

        ScrollToTop ->
            [ Text "Revenir en haut." ]

        Copy ->
            [ Text "Copier" ]

        -- Rules
        CardsAgainstHumanity ->
            [ Text "Cards Against Humanity" ]

        Rules ->
            [ Text "Comment jouer." ]

        RulesHand ->
            [ Text "Chaque joueur a une main de ", ref (nounUnknownQuantity Response), Text "." ]

        RulesCzar ->
            [ Text "Le premier joueur commence en tant que "
            , ref Czar
            , Text ". Le "
            , ref Czar
            , Text " lit la question ou la phrase à compléter sur la "
            , ref (noun Call 1)
            , Text " à voix haute."
            ]

        RulesPlaying ->
            [ Text "Tous les autres répondent à la question ou complètent la phrase en choisissant une "
            , ref (noun Response 1)
            , Text " de leur main à jouer pour le tour."
            ]

        RulesJudging ->
            [ Text "Les réponses sont ensuite mélangées, et le "
            , ref Czar
            , Text " les lit aux autres joueurs—pour un effet maximal, le "
            , ref Czar
            , Text " devrait généralement relire la "
            , ref (noun Call 1)
            , Text " avant de présenter chaque réponse. Le "
            , ref Czar
            , Text " choisit ensuite la réponse la plus drôle, et celui qui l'a jouée gagne un "
            , ref (noun Point 1)
            , Text "."
            ]

        RulesPickTitle ->
            [ ref (Pick { numberOfCards = 2 }) ]

        RulesPick ->
            [ Text "Certaines cartes nécessiteront plus d'une "
            , ref (noun Response 1)
            , Text " comme réponse. Jouez les cartes dans l'ordre où le "
            , ref Czar
            , Text " doit les lire—l'ordre est important."
            ]

        ExamplePickDescription ->
            [ Text "Des "
            , ref (nounUnknownQuantity Call)
            , Text " comme celle-ci nécessiteront de choisir davantage de "
            , ref (nounUnknownQuantity Response)
            , Text ", mais vous donneront plus d'options."
            ]

        RulesDraw ->
            [ Text "Certaines "
            , ref (nounUnknownQuantity Call)
            , Text " nécessiteront encore plus de "
            , ref (nounUnknownQuantity Response)
            , Text "—elles indiqueront "
            , ref (Draw { numberOfCards = 2 })
            , Text " ou plus, et vous recevrez autant de cartes supplémentaires avant de jouer."
            ]

        GameRulesTitle ->
            [ Text "Règles du jeu" ]

        HouseRulesTitle ->
            [ Text "Règles personnalisées" ]

        HouseRules ->
            [ Text "Vous pouvez modifier la manière de jouer au jeu de différentes manières. Lors de la configuration de la partie, choisissez "
            , Text "autant de règles personnalisées que vous souhaitez utiliser."
            ]

        HouseRuleReboot ->
            [ Text "Redémarrage de l'univers" ]

        HouseRuleRebootDescription { cost } ->
            [ Text "À tout moment, les joueurs peuvent échanger "
            , Text (an cost)
            , ref (nounMaybe Point cost)
            , Text " pour défausser leur main et en tirer une nouvelle."
            ]

        HouseRuleRebootAction { cost } ->
            [ Text "Dépensez "
            , Text (asWord cost)
            , Text " "
            , ref (noun Point cost)
            , Text " pour défausser votre main et en tirer une nouvelle."
            ]

        HouseRuleRebootCost ->
            [ ref (noun Point 1), Text " Coût" ]

        HouseRuleRebootCostDescription ->
            [ Text "Combien de ", ref (nounUnknownQuantity Point), Text " il en coûte pour refaire une main." ]

        HouseRulePackingHeat ->
            [ Text "Jouer gros" ]

        HouseRulePackingHeatDescription ->
            [ Text "Toute "
            , ref (noun Call 1)
            , Text " avec "
            , ref (Pick { numberOfCards = 2 })
            , Text " reçoit aussi "
            , ref (Draw { numberOfCards = 1 })
            , Text ", afin que tout le monde ait plus d'options."
            ]

        HouseRuleComedyWriter ->
            [ Text "Écrivain comique" ]

        HouseRuleComedyWriterDescription ->
            [ Text "Ajoutez des "
            , ref (nounUnknownQuantity Response)
            , Text " vierges où les joueurs peuvent écrire des réponses personnalisées."
            ]

        HouseRuleComedyWriterNumber ->
            [ ref (nounUnknownQuantity Response), Text " vierges" ]

        HouseRuleComedyWriterNumberDescription ->
            [ Text "Le nombre de "
            , ref (nounUnknownQuantity Response)
            , Text " vierges qui seront dans la partie."
            ]

        HouseRuleComedyWriterExclusive ->
            [ Text "Seulement des ", ref (nounUnknownQuantity Response), Text " vierges" ]

        HouseRuleComedyWriterExclusiveDescription ->
            [ Text "Si activé, toutes les autres "
            , ref (nounUnknownQuantity Response)
            , Text " seront ignorées, seules les vierges existeront dans le jeu."
            ]

        HouseRuleRandoCardrissian ->
            [ Text "Rando Cardrissian" ]

        HouseRuleRandoCardrissianDescription ->
            [ Text "À chaque tour, la première "
            , ref (noun Response 1)
            , Text " du paquet sera jouée comme réponse. Ce jeu appartient à un joueur IA nommé "
            , Text "Rando Cardrissian, et s'il gagne la partie, tous les joueurs rentrent chez eux dans un état de honte éternelle."
            ]

        HouseRuleRandoCardrissianNumber ->
            [ Text "Joueurs IA" ]

        HouseRuleRandoCardrissianNumberDescription ->
            [ Text "Le nombre de joueurs IA dans la partie." ]

        HouseRuleNeverHaveIEver ->
            [ Text "Je n'ai jamais..." ]

        HouseRuleNeverHaveIEverDescription ->
            [ Text "À tout moment, un joueur peut défausser des cartes qu'il ne comprend pas, mais il doit avouer son "
            , Text "ignorance : la carte est partagée publiquement."
            ]

        HouseRuleHappyEnding ->
            [ Text "Happy Ending" ]

        HouseRuleHappyEndingDescription ->
            [ Text "Quand la partie se termine, le dernier tour est une ", ref (noun Call 1), " 'Créer un Haïku'." ]

        HouseRuleCzarChoices ->
            [ Text "Choix du ", ref Czar ]

        HouseRuleCzarChoicesDescription ->
            [ Text "Au début du tour, le "
            , ref Czar
            , Text " pioche plusieurs "
            , ref (nounUnknownQuantity Call)
            , Text " et en choisit une, et/ou a le choix d'écrire la sienne."
            ]

        HouseRuleCzarChoicesNumber ->
            [ Text "Nombre" ]

        HouseRuleCzarChoicesNumberDescription ->
            [ Text "Le nombre de choix à donner au ", ref Czar, Text " parmi lesquelles choisir." ]

        HouseRuleCzarChoicesCustom ->
            [ Text "Personnalisé" ]

        HouseRuleCzarChoicesCustomDescription ->
            [ Text "Si le ", ref Czar, Text " peut écrire des ", ref (nounUnknownQuantity Call), " personnalisées. Cela prend l'une des options." ]

        HouseRuleWinnersPick ->
            [ Text "Choix du gagnant" ]

        HouseRuleWinnersPickDescription ->
            [ Text "Le gagnant de chaque tour devient le ", ref Czar, Text " pour le tour suivant." ]

        SeeAlso { rule } ->
            [ Text "Voir aussi : ", ref rule ]

        MustBeMoreThanOrEqualValidationError { min } ->
            [ Text "La valeur doit être au moins ", Text (String.fromInt min), Text "." ]

        MustBeLessThanOrEqualValidationError { max } ->
            [ Text "La valeur doit être au plus ", Text (String.fromInt max), Text "." ]

        SetValue { value } ->
            [ Text "Définir la valeur à ", Text (String.fromInt value), Text "." ]

        CantBeEmpty ->
            [ Text "Cela ne peut pas être vide." ]

        SettingsTitle ->
            [ Text "Paramètres" ]

        LanguageSetting ->
            [ Text "Langue" ]

        MissingLanguage ->
            [ Text "Vous ne voyez pas votre langue ? ", ref TranslationBeg ]

        AutonymFormat { autonym } ->
            [ Text "(", Text autonym, Text ")" ]

        TranslationBeg ->
            [ Text "Aidez à traduire "
            , ref MassiveDecks
            , Text " !"
            ]

        CardSizeSetting ->
            [ Text "Compact Cards" ]

        CardSizeExplanation ->
            [ Text "Adjust how big cards are—this can be useful on small screens to scroll less." ]

        AutoAdvanceSetting ->
            [ Text "Automatically Advance Round" ]

        AutoAdvanceExplanation ->
            [ Text "When a round ends, automatically advance to the next one rather than waiting." ]

        SpeechSetting ->
            [ Text "Text To Speech" ]

        SpeechExplanation ->
            [ Text "Read out cards using text to speech." ]

        SpeechNotSupportedExplanation ->
            [ Text "Your browser does not support text to speech, or has no voices installed." ]

        VoiceSetting ->
            [ Text "Speech Voice" ]

        NotificationsSetting ->
            [ Text "Browser Notifications" ]

        NotificationsExplanation ->
            [ Text "Alert you when you need to do something in the game using browser notifications."
            ]

        NotificationsUnsupportedExplanation ->
            [ Text "Your browser doesn't support notifications." ]

        NotificationsBrowserPermissions ->
            [ Text "You will need to give permission for "
            , ref MassiveDecks
            , Text " to notify you. This will only be used while the game is open and while you have this enabled."
            ]

        NotificationOnlyWhenHiddenSetting ->
            [ Text "Only When Hidden" ]

        NotificationsOnlyWhenHiddenExplanation ->
            [ Text "Only send notifications when you are not looking at the page (e.g: on another tab or minimised)." ]

        NotificationsOnlyWhenHiddenUnsupportedExplanation ->
            [ Text "Your browser doesn't support checking for page visibility." ]

        -- Terms
        Czar ->
            [ Text "Card Czar" ]

        CzarDescription ->
            [ Text "The player judging the round." ]

        CallDescription ->
            [ Text "A black card with a question or fill-in-the-blank phrase." ]

        ResponseDescription ->
            [ Text "A white card with a phrase played into rounds." ]

        PointDescription ->
            [ Text "A point—having more means winning." ]

        GameCodeTerm ->
            [ Text "Game Code" ]

        GameCodeDescription ->
            [ Text "A code that lets other people find and join your game." ]

        GameCode { code } ->
            [ Text code ]

        GameCodeSpecificDescription ->
            [ Text "Give this game code to people and they can join the game." ]

        GameCodeHowToAcquire ->
            [ Text "Ask the person who invited you for the game’s ", ref GameCodeTerm, Text "." ]

        Deck ->
            [ Text "Deck" ]

        DeckSource ->
            [ ref Deck, Text " Source" ]

        DeckLanguage { language } ->
            [ Text "in ", Text language ]

        DeckAuthor { author } ->
            [ Text "by ", Text author ]

        DeckTranslator { translator } ->
            [ Text "translation by ", Text translator ]

        StillPlaying ->
            [ Text "Playing" ]

        PlayingDescription ->
            [ Text "This player is in the round, but has not yet submitted a play." ]

        Played ->
            [ Text "Played" ]

        PlayedDescription ->
            [ Text "This player has submitted their play for the round." ]

        -- Lobby Browser
        LobbyBrowserTitle ->
            [ Text "Public Games" ]

        NoPublicGames ->
            [ Text "No public games available." ]

        PlayingGame ->
            [ Text "Games that are in progress." ]

        SettingUpGame ->
            [ Text "Games that have not yet started." ]

        StartYourOwn ->
            [ Text "Start a new game?" ]

        -- Spectation
        JoinTheGame ->
            [ Text "Join the game!" ]

        ToggleAdvertDescription ->
            [ Text "Toggle showing the information on joining the game." ]

        -- Cards
        Pick numberOfCards ->
            [ Text "Pick", ref (NumberOfCards numberOfCards) ]

        Draw numberOfCards ->
            [ Text "Draw", ref (NumberOfCards numberOfCards) ]

        PickDescription { numberOfCards } ->
            [ Text "You need to play "
            , Text (asWord numberOfCards)
            , Text " "
            , ref (noun Response numberOfCards)
            , Text "."
            ]

        DrawDescription { numberOfCards } ->
            [ Text "You get "
            , Text (asWord numberOfCards)
            , Text " extra "
            , ref (noun Response numberOfCards)
            , Text " before playing."
            ]

        NumberOfCards { numberOfCards } ->
            [ Text (String.fromInt numberOfCards) ]

        -- Lobby
        LobbyNameLabel ->
            [ Text "Game Name" ]

        DefaultLobbyName { owner } ->
            [ Text owner, Text "'s Game" ]

        Invite ->
            [ Text "Invite players to the game." ]

        InviteLinkHelp ->
            [ Text "Send this link to players to invite them to the game, or let them scan the QR code below." ]

        InviteExplanation { gameCode, password } ->
            let
                extra =
                    password
                        |> Maybe.map
                            (\p ->
                                [ Text " and the game password “"
                                , Text p
                                , Text "”"
                                ]
                            )
                        |> Maybe.withDefault []
            in
            List.concat
                [ [ Text "Your game code is "
                  , ref (GameCode { code = gameCode })
                  , Text ". Players can join the game by loading "
                  , ref MassiveDecks
                  , Text " and entering that code"
                  ]
                , extra
                , [ Text "."
                  ]
                ]

        Cast ->
            [ Text "Cast to TV." ]

        CastConnecting ->
            [ Text "Connecting…" ]

        CastConnected { deviceName } ->
            [ Text "Casting to ", Text deviceName, Text "." ]

        Players ->
            [ ref (nounUnknownQuantity Player) ]

        PlayersDescription ->
            [ Text "Users playing the game." ]

        Spectators ->
            [ ref (nounUnknownQuantity Spectator) ]

        SpectatorsDescription ->
            [ Text "Users watching the game without playing." ]

        Left ->
            [ Text "Left" ]

        LeftDescription ->
            [ Text "Users who have left the game." ]

        Away ->
            [ Text "Away" ]

        AwayDescription ->
            [ Text "This user is temporarily away from the game." ]

        Disconnected ->
            [ Text "Disconnected" ]

        DisconnectedDescription ->
            [ Text "This user is not connected to the game." ]

        Privileged ->
            [ Text "Owner" ]

        PrivilegedDescription ->
            [ Text "This user can adjust settings in the game." ]

        Ai ->
            [ Text "AI" ]

        AiDescription ->
            [ Text "This player is controlled by the computer." ]

        Score { total } ->
            [ Text (String.fromInt total) ]

        ScoreDescription ->
            [ Text "The number of "
            , ref (nounUnknownQuantity Point)
            , Text " this player has."
            ]

        Likes { total } ->
            [ Text (String.fromInt total) ]

        LikesDescription ->
            [ Text "The number of likes received."
            ]

        ToggleUserList ->
            [ Text "Show or hide the scoreboard." ]

        GameMenu ->
            [ Text "Game menu." ]

        UnknownUser ->
            [ Text "An unknown user" ]

        InvitePlayers ->
            [ Text "Invite Players" ]

        InvitePlayersDescription ->
            [ Text "Get the game code/link/qr code to let others join this game." ]

        SetAway ->
            [ Text "Mark As Away" ]

        SetBack ->
            [ Text "Mark As Back" ]

        LeaveGame ->
            [ Text "Leave Game" ]

        LeaveGameDescription ->
            [ Text "Permanently leave the game." ]

        Spectate ->
            [ Text "Spectator View" ]

        SpectateDescription ->
            [ Text "Open a spectator's view of the game in a new tab/window." ]

        BecomeSpectator ->
            [ Text "Spectate" ]

        BecomeSpectatorDescription ->
            [ Text "Just watch the game without playing." ]

        BecomePlayer ->
            [ Text "Play" ]

        BecomePlayerDescription ->
            [ Text "Play in the game." ]

        EndGame ->
            [ Text "End Game" ]

        EndGameDescription ->
            [ Text "End the game now." ]

        ReturnViewToGame ->
            [ Text "Return to game" ]

        ReturnViewToGameDescription ->
            [ Text "Return to the main game view." ]

        ViewConfiguration ->
            [ Text "Configure" ]

        ViewConfigurationDescription ->
            [ Text "Switch to view the game's configuration." ]

        KickUser ->
            [ Text "Kick" ]

        Promote ->
            [ Text "Promote" ]

        Demote ->
            [ Text "Demote" ]

        -- Notifications
        UserConnected { username } ->
            [ Text username, Text " has reconnected to the game." ]

        UserDisconnected { username } ->
            [ Text username, Text " has disconnected from the game." ]

        UserJoined { username } ->
            [ Text username, Text " has joined the game." ]

        UserLeft { username } ->
            [ Text username, Text " has left the game." ]

        UserKicked { username } ->
            [ Text username, Text " has been kicked from the game." ]

        Dismiss ->
            [ Text "Dismiss" ]

        -- Configuration
        ConfigureTitle ->
            [ Text "Game Setup" ]

        NoDecks ->
            [ Segment [ Text "No decks. " ]
            , Text " "
            , Segment [ Text "You will need to add at least one to the game." ]
            ]

        NoDecksHint ->
            [ Text "Not sure? Add the original ", raw CardsAgainstHumanity, Text " deck." ]

        WaitForDecks ->
            [ Text "The decks must load before you can start the game." ]

        MissingCardType { cardType } ->
            [ Text "None of your decks contain any "
            , ref (nounUnknownQuantity cardType)
            , Text ". You need a deck that does to start the game."
            ]

        NotEnoughCardsOfType { cardType, needed, have } ->
            [ Text "For the number of players in the game, you need at least "
            , Text (needed |> String.fromInt)
            , Text " "
            , ref (noun cardType needed)
            , Text " but you only have "
            , Text (have |> String.fromInt)
            , Text "."
            ]

        AddBlankCards { amount } ->
            [ Text "Add "
            , amount |> String.fromInt |> Text
            , Text " blank "
            , ref (noun Response amount)
            ]

        AddDeck ->
            [ Text "Add deck." ]

        RemoveDeck ->
            [ Text "Remove deck." ]

        SourceNotFound { source } ->
            [ ref source, Text " doesn't recognise the deck you asked for. Check the details you gave are correct." ]

        SourceServiceFailure { source } ->
            [ ref source, Text " failed to provide the deck. Please try again later or try another source." ]

        ManyDecks ->
            [ Text "Many Decks" ]

        ManyDecksDeckCodeTitle ->
            [ Text "Deck Code" ]

        ManyDecksDeckCodeShort ->
            [ Text "A deck code must be at least five characters long." ]

        ManyDecksWhereToGet ->
            [ Text "You can create and find decks to play with at ", ref ManyDecks, Text "." ]

        JsonAgainstHumanity ->
            [ Text "JSON Against Humanity" ]

        JsonAgainstHumanityAbout ->
            [ Text "Decks provided by ", ref JsonAgainstHumanity ]

        BuiltIn ->
            [ Text "Built-in" ]

        APlayer ->
            [ Text "A Player" ]

        Generated { by } ->
            [ Text "Generated by ", ref by ]

        DeckAlreadyAdded ->
            [ Text "This deck is already in the game." ]

        ConfigureDecks ->
            [ Text "Decks" ]

        ConfigureRules ->
            [ Text "Rules" ]

        ConfigureTimeLimits ->
            [ Text "Time Limits" ]

        ConfigurePrivacy ->
            [ Text "Privacy" ]

        HandSize ->
            [ Text "Hand Size" ]

        HandSizeDescription ->
            [ Text "The base number of cards each player has in their hand during the game." ]

        ScoreLimit ->
            [ ref (noun Point 1), Text " Limit" ]

        ScoreLimitDescription ->
            [ Segment
                [ Text "The number of "
                , ref (nounUnknownQuantity Point)
                , Text " a player needs to win the game."
                ]
            , Text " "
            , Segment [ Text "If disabled, the game continues indefinitely." ]
            ]

        UnsavedChangesWarning ->
            [ Text "You have unsaved changes to the configuration, they must be saved first if you want them to apply "
            , Text "to the game."
            ]

        SaveChanges ->
            [ Text "Save your changes." ]

        RevertChanges ->
            [ Text "Discard your unsaved changes." ]

        NeedAtLeastOneDeck ->
            [ Text "You need a deck of cards added to start the game." ]

        NeedAtLeastThreePlayers ->
            [ Text "You need at least three players to start the game." ]

        NeedAtLeastOneHuman ->
            [ Text "Unfortunately computer players can't be the "
            , ref Czar
            , Text ", so you need at least one human player to start the game."
            , Text " (Although only one human might be a bit boring!)"
            ]

        RandoCantWrite ->
            [ Text "Computer players can't write their own cards." ]

        DisableComedyWriter ->
            [ Text "Disable ", ref HouseRuleComedyWriter ]

        DisableRando ->
            [ Text "Disable ", ref HouseRuleRandoCardrissian ]

        AddAnAiPlayer ->
            [ Text "Add an AI player to the game." ]

        PasswordShared ->
            [ Text "Anyone in the game can see the password! "
            , Text "Hiding it above only affects you (useful if streaming, etc…)."
            ]

        PasswordNotSecured ->
            [ Text "Game passwords are "
            , Em [ Text "not" ]
            , Text " stored securely—given this, please "
            , Em [ Text "do not" ]
            , Text " use serious passwords you use elsewhere!"
            ]

        LobbyPassword ->
            [ Text "Game Password" ]

        LobbyPasswordDescription ->
            [ Text "A password the users must enter before they can join the game." ]

        AudienceMode ->
            [ Text "Audience Mode" ]

        AudienceModeDescription ->
            [ Text "If enabled, newly joining users will be spectators by default, and only you will be able to "
            , Text "make them players."
            ]

        StartGame ->
            [ Text "Start Game" ]

        Public ->
            [ Text "Public Game" ]

        PublicDescription ->
            [ Text "If enabled, the game will show up in the public game list for anyone to find." ]

        ApplyConfiguration ->
            [ Text "Apply this change." ]

        AppliedConfiguration ->
            [ Text "Saved." ]

        InvalidConfiguration ->
            [ Text "This configuration value isn't valid." ]

        Automatic ->
            [ Text "Automatically Mark Players As Away" ]

        AutomaticDescription ->
            [ Text "If enabled, when the time limit runs out players will automatically be marked as away. "
            , Text "Otherwise someone will need to press the button to do so."
            ]

        TimeLimit { stage } ->
            [ ref stage, Text " Time Limit" ]

        StartingTimeLimitDescription ->
            [ Text "How long (in seconds) the "
            , ref Czar
            , Text " has to choose/write a "
            , ref (noun Call 1)
            , Text ", when the "
            , raw HouseRuleCzarChoices
            , Text " house rule is enabled."
            ]

        PlayingTimeLimitDescription ->
            [ Text "How long (in seconds) the ", ref Players, Text " have to make their plays." ]

        PlayingAfterDescription ->
            [ Text "How long (in seconds) players have to change their play before the next stage starts." ]

        RevealingTimeLimitDescription ->
            [ Text "How long (in seconds) the ", ref Czar, Text " has to reveal the plays." ]

        RevealingAfterDescription ->
            [ Text "How long (in seconds) to wait after the last card is revealed before the next stage starts." ]

        JudgingTimeLimitDescription ->
            [ Text "How long (in seconds) the ", ref Czar, Text " has to judge the plays." ]

        CompleteTimeLimitDescription ->
            [ Text "How much time (in seconds) to wait after one round ends before starting the next one." ]

        RevealingEnabledTitle ->
            [ Text "Czar Reveals Plays" ]

        RevealingEnabled ->
            [ Text "If this is enabled, the "
            , ref Czar
            , Text " reveals one play at a time before picking a winner."
            ]

        DuringTitle ->
            [ Text "Time Limit" ]

        AfterTitle ->
            [ Text "After" ]

        Conflict ->
            [ Text "Conflict" ]

        ConflictDescription ->
            [ Text "Someone else made changes to this while you were also making changes. "
            , Text "Please choose if you want to keep your changes or theirs."
            ]

        YourChanges ->
            [ Text "Your Changes" ]

        TheirChanges ->
            [ Text "Their Changes" ]

        ConfigurationDisabledWhileInGame ->
            [ Text "While the game in progress, you can't change the configuration." ]

        ConfigurationDisabledIfNotPrivileged ->
            [ Text "You can't change the configuration of this game." ]

        ConfigureNextGame ->
            [ Text "Configure Next Game" ]

        -- Game
        PickCall ->
            [ Text "Pick this ", ref (noun Call 1), Text " for the others to play into for the round." ]

        WriteCall ->
            [ Text "Write a custom ", ref (noun Call 1), Text " for the others to play into for the round." ]

        SubmitPlay ->
            [ Text "Give these cards to the ", ref Czar, Text " as your play for the round." ]

        TakeBackPlay ->
            [ Text "Take back your cards to change your play for the round." ]

        JudgePlay ->
            [ Text "Pick this play as the winner for the round." ]

        LikePlay ->
            [ Text "Add a like to this play." ]

        AdvanceRound ->
            [ Text "Next round." ]

        Starting ->
            [ raw HouseRuleCzarChoices ]

        Playing ->
            [ Text "Playing" ]

        Revealing ->
            [ Text "Revealing" ]

        Judging ->
            [ Text "Judging" ]

        Complete ->
            [ Text "Finished" ]

        ViewGameHistoryAction ->
            [ Text "View previous rounds from this game." ]

        ViewHelpAction ->
            [ Text "Help" ]

        EnforceTimeLimitAction ->
            [ Text "Set all players the game is waiting on to away and skip them until they return." ]

        Blank ->
            [ Text "Blank" ]

        RoundStarted ->
            [ Text "Round Started" ]

        JudgingStarted ->
            [ Text "Judging Started" ]

        Paused ->
            [ Text "The game has been paused because there are not enough active players to continue."
            , Text "When someone joins or returns it will continue automatically."
            ]

        ClientAway ->
            [ Text "You are currently set as away from the game, and are not playing." ]

        Discard ->
            [ Text "Discard the selected card, revealing it to the other users in the game." ]

        Discarded { player } ->
            [ Text player
            , Text " discarded the following card:"
            ]

        -- Instructions
        PickCallInstruction ->
            [ Text "Pick a ", ref (noun Call 1), Text " for the others to play into." ]

        WaitForCallInstruction ->
            [ Text "You are waiting for the "
            , ref Czar
            , Text " to pick a "
            , ref (noun Call 1)
            , Text " for you to play into."
            ]

        PlayInstruction { numberOfCards } ->
            [ Text "You need to choose "
            , Text (asWord numberOfCards)
            , Text " more "
            , ref (noun Response numberOfCards)
            , Text " from your hand into this round before you can submit your play."
            ]

        SubmitInstruction ->
            [ Text "You need to submit your play for this round." ]

        WaitingForPlaysInstruction ->
            [ Text "You are waiting for other players to play into the round." ]

        CzarsDontPlayInstruction ->
            [ Text "You are the "
            , ref Czar
            , Text " for the round - you don't submit any "
            , ref (nounUnknownQuantity Response)
            , Text ". Instead you choose the winner once everyone else has submitted theirs."
            ]

        NotInRoundInstruction ->
            [ Text "You are not in this round. You will play in the next one unless you are set to away." ]

        RevealPlaysInstruction ->
            [ Text "Click on the plays to flip them, then pick the one you think is best." ]

        WaitingForCzarInstruction ->
            [ Text "You can like plays while you wait for the ", ref Czar, Text " to reveal the plays and pick a winner for the round." ]

        AdvanceRoundInstruction ->
            [ Text "The next round has started, you can advance." ]

        -- 404 Unknown
        UnknownPageTitle ->
            [ Text "404 Error: Unknown page." ]

        GoBackHome ->
            [ Text "Go to the main page." ]

        -- Actions
        Refresh ->
            [ Text "Refresh" ]

        Accept ->
            [ Text "OK" ]

        -- Editor
        AddSlot ->
            [ Text "Add ", ref Blank ]

        AddText ->
            [ Text "Add Text" ]

        EditText ->
            [ Text "Edit" ]

        EditSlotIndex ->
            [ Text "Edit" ]

        MoveLeft ->
            [ Text "Move Earlier" ]

        Remove ->
            [ Text "Remove" ]

        MoveRight ->
            [ Text "Move Later" ]

        Normal ->
            [ Text "Normal" ]

        Capitalise ->
            [ Text "Capitalise" ]

        UpperCase ->
            [ Text "Upper Case" ]

        Emphasise ->
            [ Text "Emphasise" ]

        MustContainAtLeastOneSlot ->
            [ Text "You must have at least one ", ref Blank, Text " for people to play into." ]

        SlotIndexExplanation ->
            [ Text "What number "
            , ref (noun Response 1)
            , Text " played will be used for this "
            , ref Blank
            , Text ". This lets you repeat a "
            , ref (noun Response 1)
            , Text "."
            ]

        -- Errors
        Error ->
            [ Text "Error" ]

        ErrorHelp ->
            [ Text "The game server might be down, or this might be a bug. Refreshing the page should get you going "
            , Text "again. More details can be found below."
            ]

        ErrorHelpTitle ->
            [ Text "Sorry, something went wrong." ]

        ErrorCheckOutOfBand ->
            [ Text "Please check ", ref TwitterHandle, Text " for updates and service status. The game server will go down for a short time when a new version is released, so if you see a recent update, try again in a few minutes." ]

        TwitterHandle ->
            [ Text "@Massive_Decks" ]

        ReportError ->
            [ Text "Report Bug" ]

        ReportErrorDescription ->
            [ Text "Let the developers know about a bug you encountered so they can fix it." ]

        ReportErrorBody ->
            [ Text "I was [replace with a short explanation of what you were doing] when I got the following error:" ]

        BadUrlError ->
            [ Text "We tried to make a request to an invalid page." ]

        TimeoutError ->
            [ Text "The server didn’t respond for too long. It may be down, please try again after a short delay." ]

        NetworkError ->
            [ Text "Your internet connection was interrupted." ]

        ServerDownError ->
            [ Text "The game server is currently offline. Please try again later." ]

        BadStatusError ->
            [ Text "The server gave a response we didn’t expect." ]

        BadPayloadError ->
            [ Text "The server gave a response we didn’t understand." ]

        PatchError ->
            [ Text "The server gave a patch we couldn't apply." ]

        VersionMismatch ->
            [ Text "The server gave a config change for a different version than we expected." ]

        CastError ->
            [ Text "Sorry, something went wrong trying to connect to the game." ]

        ActionExecutionError ->
            [ Text "You can't perform that action." ]

        IncorrectPlayerRoleError { role, expected } ->
            [ Text "You need to be a ", ref expected, Text " to do that, but you are a ", ref role, Text "." ]

        IncorrectUserRoleError { role, expected } ->
            [ Text "You need to be a ", ref expected, Text " to do that, but you are a ", ref role, Text "." ]

        IncorrectRoundStageError { stage, expected } ->
            [ Text "The round needs to be at the ", ref expected, Text " stage to do that, but it is at the ", ref stage, Text " stage." ]

        ConfigEditConflictError ->
            [ Text "Someone else changed the configuration before you, your change was not saved." ]

        UnprivilegedError ->
            [ Text "You don't have the privileges to do that." ]

        GameNotStartedError ->
            [ Text "The game needs to started to do that." ]

        InvalidActionError { reason } ->
            [ Text "The server didn't understand a request from the client. Details: ", Text reason ]

        AuthenticationError ->
            [ Text "You can't join that game." ]

        IncorrectIssuerError ->
            [ Text "Your credentials to join this game are out of date, the game no longer exists." ]

        InvalidAuthenticationError ->
            [ Text "Your credentials to join this game are corrupt." ]

        InvalidLobbyPasswordError ->
            [ Text "The game password you gave was wrong. Try typing it again and if it still doesn't work, ask the person who invited you again." ]

        AlreadyLeftError ->
            [ Text "You have already left this game." ]

        LobbyNotFoundError ->
            [ Text "That game doesn't exist." ]

        LobbyClosedError { gameCode } ->
            [ Text "The game you wish to join (", ref (GameCode { code = gameCode }), Text ") has ended." ]

        LobbyDoesNotExistError { gameCode } ->
            [ Text "The game code you entered ("
            , ref (GameCode { code = gameCode })
            , Text ") doesn't exist. "
            , Text "Try typing it again and if it still doesn't work, ask the person who invited you again."
            ]

        RegistrationError ->
            [ Text "Problem while joining the game." ]

        UsernameAlreadyInUseError { username } ->
            [ Text "Someone is already using the username “"
            , Text username
            , Text "”—try a different name."
            ]

        GameError ->
            [ Text "Something has gone wrong in the game." ]

        OutOfCardsError ->
            [ Text "There were not enough cards in the deck to deal everyone a hand! Try adding more decks in the game configuration." ]

        -- Language Names
        English ->
            [ Text "English" ]

        BritishEnglish ->
            [ Text "English (British)" ]

        Italian ->
            [ Text "Italian" ]

        BrazilianPortuguese ->
            [ Text "Portuguese (Brazilian)" ]

        German ->
            [ Text "German (Formal)" ]

        GermanInformal ->
            [ Text "German (Informal)" ]

        Polish ->
            [ Text "Polish" ]

        Indonesian ->
            [ Text "Indonesian" ]

        Spanish ->
            [ Text "Spanish" ]

        Korean ->
            [ Text "Korean" ]



{- Private -}


raw : MdString -> Translation.Result never
raw =
    Raw Nothing


ref : MdString -> Translation.Result never
ref =
    Ref Nothing


an : Maybe Int -> String
an amount =
    case amount of
        Just 1 ->
            "an "

        _ ->
            ""


{-| Take a number and give back the name of that number. Falls back to the number when it gets too big.
-}
asWord : Int -> String
asWord number =
    case number of
        0 ->
            "zero"

        1 ->
            "one"

        2 ->
            "two"

        3 ->
            "three"

        4 ->
            "four"

        5 ->
            "five"

        6 ->
            "six"

        7 ->
            "seven"

        8 ->
            "eight"

        9 ->
            "nine"

        10 ->
            "ten"

        11 ->
            "eleven"

        12 ->
            "twelve"

        other ->
            String.fromInt other

