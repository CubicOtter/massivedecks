module MassiveDecks.Strings.Languages.Fr exposing (pack)

{-| French localization.

Contributors:

  - CubicOtter <https://github.com/cubicotter>

-}

import MassiveDecks.Card.Source.BuiltIn.Model as BuiltIn
import MassiveDecks.Card.Source.Model as Source
import MassiveDecks.Strings exposing (MdString(..), Noun(..), Quantity(..), noun, nounMaybe, nounUnknownQuantity)
import MassiveDecks.Strings.Languages.Model exposing (Language(..))
import MassiveDecks.Strings.Translation as Translation
import MassiveDecks.Strings.Translation.Model as Translation exposing (Result(..))


pack : Translation.Pack
pack =
    Translation.pack
        { lang = Fr
        , code = "fr"
        , name = French
        , translate = translate
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
            [ Text "Cartes Compactes" ]

        CardSizeExplanation ->
            [ Text "Ajustez la taille des cartes — cela peut être utile sur les petits écrans pour moins faire défiler." ]

        AutoAdvanceSetting ->
            [ Text "Avancer Automatiquement le Tour" ]

        AutoAdvanceExplanation ->
            [ Text "À la fin d’un tour, passez automatiquement au suivant sans attendre." ]

        SpeechSetting ->
            [ Text "Synthèse Vocale" ]

        SpeechExplanation ->
            [ Text "Lisez les cartes à haute voix grâce à la synthèse vocale." ]

        SpeechNotSupportedExplanation ->
            [ Text "Votre navigateur ne prend pas en charge la synthèse vocale ou n’a pas de voix installées." ]

        VoiceSetting ->
            [ Text "Voix de Synthèse" ]

        NotificationsSetting ->
            [ Text "Notifications du Navigateur" ]

        NotificationsExplanation ->
            [ Text "Avertissez-vous lorsque vous devez faire quelque chose dans le jeu grâce aux notifications du navigateur." ]

        NotificationsUnsupportedExplanation ->
            [ Text "Votre navigateur ne prend pas en charge les notifications." ]

        NotificationsBrowserPermissions ->
            [ Text "Vous devez donner l’autorisation à "
            , ref MassiveDecks
            , Text " de vous notifier. Cela ne sera utilisé que lorsque le jeu est ouvert et cette option activée."
            ]

        NotificationOnlyWhenHiddenSetting ->
            [ Text "Uniquement Quand Caché" ]

        NotificationsOnlyWhenHiddenExplanation ->
            [ Text "Envoyez des notifications uniquement lorsque vous ne regardez pas la page (par exemple : sur un autre onglet ou minimisé)." ]

        NotificationsOnlyWhenHiddenUnsupportedExplanation ->
            [ Text "Votre navigateur ne prend pas en charge la vérification de la visibilité de la page." ]

        -- Terms
        Czar ->
            [ Text "Maître des Cartes" ]

        CzarDescription ->
            [ Text "Le joueur qui juge le tour." ]

        CallDescription ->
            [ Text "Une carte noire avec une question ou une phrase à compléter." ]

        ResponseDescription ->
            [ Text "Une carte blanche avec une phrase, jouée durant les tours." ]

        PointDescription ->
            [ Text "Un point—en avoir plus signifie gagner." ]

        GameCodeTerm ->
            [ Text "Code de Partie" ]

        GameCodeDescription ->
            [ Text "Un code qui permet à d’autres personnes de trouver et rejoindre votre partie." ]

        GameCode { code } ->
            [ Text code ]

        GameCodeSpecificDescription ->
            [ Text "Donnez ce code de partie aux personnes pour qu’elles puissent rejoindre la partie." ]

        GameCodeHowToAcquire ->
            [ Text "Demandez à la personne qui vous a invité le ", ref GameCodeTerm, Text "." ]

        Deck ->
            [ Text "Paquet" ]

        DeckSource ->
            [ ref Deck, Text " Source" ]

        DeckLanguage { language } ->
            [ Text "en ", Text language ]

        DeckAuthor { author } ->
            [ Text "par ", Text author ]

        DeckTranslator { translator } ->
            [ Text "traduction par ", Text translator ]

        StillPlaying ->
            [ Text "En Train de Jouer" ]

        PlayingDescription ->
            [ Text "Ce joueur est dans le tour, mais n’a pas encore soumis de cartes." ]

        Played ->
            [ Text "A Joué" ]

        PlayedDescription ->
            [ Text "Ce joueur a soumis ses cartes pour le tour." ]

        -- Lobby Browser
        LobbyBrowserTitle ->
            [ Text "Parties Publiques" ]

        NoPublicGames ->
            [ Text "Aucune partie publique disponible." ]

        PlayingGame ->
            [ Text "Parties en cours." ]

        SettingUpGame ->
            [ Text "Parties qui n’ont pas encore commencé." ]

        StartYourOwn ->
            [ Text "Créer une nouvelle partie ?" ]

        -- Spectation
        JoinTheGame ->
            [ Text "Rejoindre la partie !" ]

        ToggleAdvertDescription ->
            [ Text "Afficher ou masquer les informations pour rejoindre la partie." ]

        -- Cards
        Pick numberOfCards ->
            [ Text "Choisissez", ref (NumberOfCards numberOfCards) ]

        Draw numberOfCards ->
            [ Text "Piochez", ref (NumberOfCards numberOfCards) ]

        PickDescription { numberOfCards } ->
            [ Text "Vous devez jouer "
            , Text (asWord numberOfCards)
            , Text " "
            , ref (noun Response numberOfCards)
            , Text "."
            ]

        DrawDescription { numberOfCards } ->
            [ Text "Vous recevez "
            , Text (asWord numberOfCards)
            , Text " cartes supplémentaires avant de jouer."
            ]

        NumberOfCards { numberOfCards } ->
            [ Text (String.fromInt numberOfCards) ]

        -- Lobby
        LobbyNameLabel ->
            [ Text "Nom de Partie" ]

        DefaultLobbyName { owner } ->
            [ Text "Partie de ", Text owner ]

        Invite ->
            [ Text "Invitez des joueurs à la partie." ]

        InviteLinkHelp ->
            [ Text "Envoyez ce lien aux joueurs pour les inviter à la partie, ou laissez-les scanner le QR code ci-dessous." ]

        InviteExplanation { gameCode, password } ->
            let
                extra =
                    password
                        |> Maybe.map
                            (\p ->
                                [ Text " et le mot de passe “"
                                , Text p
                                , Text "”"
                                ]
                            )
                        |> Maybe.withDefault []
            in
            List.concat
                [ [ Text "Votre code de partie est "
                  , ref (GameCode { code = gameCode })
                  , Text ". Les joueurs peuvent rejoindre la partie en chargeant "
                  , ref MassiveDecks
                  , Text " et en entrant ce code"
                  ]
                , extra
                , [ Text "."
                  ]
                ]

        Cast ->
            [ Text "Caster sur TV." ]

        CastConnecting ->
            [ Text "Connexion en cours…" ]

        CastConnected { deviceName } ->
            [ Text "Connecté à ", Text deviceName, Text "." ]

        Players ->
            [ ref (nounUnknownQuantity Player) ]

        PlayersDescription ->
            [ Text "Joueurs participant à la partie." ]

        Spectators ->
            [ ref (nounUnknownQuantity Spectator) ]

        SpectatorsDescription ->
            [ Text "Utilisateurs regardant la partie sans y jouer." ]

        Left ->
            [ Text "Parti" ]

        LeftDescription ->
            [ Text "Utilisateurs qui ont quitté la partie." ]

        Away ->
            [ Text "Absent" ]

        AwayDescription ->
            [ Text "Cet utilisateur est temporairement absent de la partie." ]

        Disconnected ->
            [ Text "Déconnecté" ]

        DisconnectedDescription ->
            [ Text "Cet utilisateur n’est pas connecté à la partie." ]

        Privileged ->
            [ Text "Propriétaire" ]

        PrivilegedDescription ->
            [ Text "Cet utilisateur peut ajuster les paramètres de la partie." ]

        Ai ->
            [ Text "IA" ]

        AiDescription ->
            [ Text "Ce joueur est contrôlé par l’ordinateur." ]

        Score { total } ->
            [ Text (String.fromInt total) ]

        ScoreDescription ->
            [ Text "Le nombre de "
            , ref (nounUnknownQuantity Point)
            , Text " que ce joueur possède."
            ]

        Likes { total } ->
            [ Text (String.fromInt total) ]

        LikesDescription ->
            [ Text "Le nombre de mentions “j’aime” reçues."
            ]

        ToggleUserList ->
            [ Text "Afficher ou masquer le tableau des scores." ]

        GameMenu ->
            [ Text "Menu de la partie." ]

        UnknownUser ->
            [ Text "Un utilisateur inconnu" ]

        InvitePlayers ->
            [ Text "Inviter des Joueurs" ]

        InvitePlayersDescription ->
            [ Text "Obtenez le code de la partie, le lien ou le QR code pour permettre à d'autres de rejoindre cette partie." ]

        SetAway ->
            [ Text "Marquer Comme Absent" ]

        SetBack ->
            [ Text "Marquer Comme Présent" ]

        LeaveGame ->
            [ Text "Quitter la Partie" ]

        LeaveGameDescription ->
            [ Text "Quittez définitivement la partie." ]

        Spectate ->
            [ Text "Vue Spectateur" ]

        SpectateDescription ->
            [ Text "Ouvrez une vue spectateur de la partie dans un nouvel onglet/fenêtre." ]

        BecomeSpectator ->
            [ Text "Devenir Spectateur" ]

        BecomeSpectatorDescription ->
            [ Text "Regardez simplement la partie sans y jouer." ]

        BecomePlayer ->
            [ Text "Jouer" ]

        BecomePlayerDescription ->
            [ Text "Participez à la partie." ]

        EndGame ->
            [ Text "Terminer la Partie" ]

        EndGameDescription ->
            [ Text "Terminez immédiatement la partie." ]

        ReturnViewToGame ->
            [ Text "Revenir à la Partie" ]

        ReturnViewToGameDescription ->
            [ Text "Revenez à la vue principale de la partie." ]

        ViewConfiguration ->
            [ Text "Configurer" ]

        ViewConfigurationDescription ->
            [ Text "Passez à la vue de configuration du jeu." ]

        KickUser ->
            [ Text "Exclure" ]

        Promote ->
            [ Text "Promouvoir" ]

        Demote ->
            [ Text "Rétrograder" ]

        -- Notifications
        UserConnected { username } ->
            [ Text username, Text " s'est reconnecté à la partie." ]

        UserDisconnected { username } ->
            [ Text username, Text " s'est déconnecté de la partie." ]

        UserJoined { username } ->
            [ Text username, Text " a rejoint la partie." ]

        UserLeft { username } ->
            [ Text username, Text " a quitté la partie." ]

        UserKicked { username } ->
            [ Text username, Text " a été exclu de la partie." ]

        Dismiss ->
            [ Text "Fermer" ]

        -- Configuration
        ConfigureTitle ->
            [ Text "Configuration de la Partie" ]

        NoDecks ->
            [ Segment [ Text "Aucun paquet. " ]
            , Text " "
            , Segment [ Text "Vous devez en ajouter au moins un à la partie." ]
            ]

        NoDecksHint ->
            [ Text "En manque d'idée ? Ajoutez le paquet original ", raw CardsAgainstHumanity, Text "." ]

        WaitForDecks ->
            [ Text "Les paquets doivent se charger avant de pouvoir démarrer la partie." ]

        MissingCardType { cardType } ->
            [ Text "Aucun de vos paquets ne contient de "
            , ref (nounUnknownQuantity cardType)
            , Text ". Vous avez besoin d’un paquet qui en contient pour commencer la partie."
            ]

        NotEnoughCardsOfType { cardType, needed, have } ->
            [ Text "Pour le nombre de joueurs dans la partie, vous avez besoin d’au moins "
            , Text (needed |> String.fromInt)
            , Text " "
            , ref (noun cardType needed)
            , Text " mais vous n’en avez que "
            , Text (have |> String.fromInt)
            , Text "."
            ]

        AddBlankCards { amount } ->
            [ Text "Ajouter "
            , amount |> String.fromInt |> Text
            , ref (noun Response amount)
            , Text (if amount > 1 then " vierges" else " vierge")
            ]

        AddDeck ->
            [ Text "Ajouter un paquet." ]

        RemoveDeck ->
            [ Text "Supprimer un paquet." ]

        SourceNotFound { source } ->
            [ ref source, Text " ne reconnaît pas le paquet demandé. Vérifiez les informations fournies." ]

        SourceServiceFailure { source } ->
            [ ref source, Text " n’a pas pu fournir le paquet. Veuillez réessayer plus tard ou choisir une autre source." ]

        ManyDecks ->
            [ Text "Many Decks" ]

        ManyDecksDeckCodeTitle ->
            [ Text "Code du Paquet" ]

        ManyDecksDeckCodeShort ->
            [ Text "Un code de paquet doit comporter au moins cinq caractères." ]

        ManyDecksWhereToGet ->
            [ Text "Vous pouvez créer et trouver des paquets à utiliser sur ", ref ManyDecks, Text "." ]

        JsonAgainstHumanity ->
            [ Text "JSON Against Humanity" ]

        JsonAgainstHumanityAbout ->
            [ Text "Paquets fournis par ", ref JsonAgainstHumanity ]

        BuiltIn ->
            [ Text "Intégré" ]

        APlayer ->
            [ Text "Un Joueur" ]

        Generated { by } ->
            [ Text "Généré par ", ref by ]

        DeckAlreadyAdded ->
            [ Text "Ce paquet est déjà ajouté à la partie." ]

        ConfigureDecks ->
            [ Text "Paquets" ]

        ConfigureRules ->
            [ Text "Règles" ]

        ConfigureTimeLimits ->
            [ Text "Limites de Temps" ]

        ConfigurePrivacy ->
            [ Text "Confidentialité" ]

        HandSize ->
            [ Text "Taille de la Main" ]

        HandSizeDescription ->
            [ Text "Le nombre de cartes de base que chaque joueur a en main pendant la partie." ]

        ScoreLimit ->
            [ Text "Limite de ", ref (noun Point 1) ]

        ScoreLimitDescription ->
            [ Segment
                [ Text "Le nombre de "
                , ref (nounUnknownQuantity Point)
                , Text " qu’un joueur doit obtenir pour gagner la partie."
                ]
            , Text " "
            , Segment [ Text "Si désactivé, la partie continue indéfiniment." ]
            ]

        UnsavedChangesWarning ->
            [ Text "Vous avez des modifications non sauvegardées dans la configuration, elles doivent être sauvegardées d'abord si vous voulez qu'elles s'appliquent "
            , Text "à la partie."
            ]

        SaveChanges ->
            [ Text "Sauvegardez vos modifications." ]

        RevertChanges ->
            [ Text "Abandonnez vos modifications non sauvegardées." ]

        NeedAtLeastOneDeck ->
            [ Text "Vous devez ajouter un paquet de cartes pour commencer la partie." ]

        NeedAtLeastThreePlayers ->
            [ Text "Vous devez avoir au moins trois joueurs pour commencer la partie." ]

        NeedAtLeastOneHuman ->
            [ Text "Malheureusement, les joueurs automatiques ne peuvent pas être le "
            , ref Czar
            , Text ", vous avez donc besoin d’au moins un joueur humain pour commencer la partie."
            , Text " (Même si un seul humain risque d'être un peu ennuyeux !)"
            ]

        RandoCantWrite ->
            [ Text "Les joueurs IA ne peuvent pas écrire leurs propres cartes." ]

        DisableComedyWriter ->
            [ Text "Désactiver ", ref HouseRuleComedyWriter ]

        DisableRando ->
            [ Text "Désactiver ", ref HouseRuleRandoCardrissian ]

        AddAnAiPlayer ->
            [ Text "Ajouter un joueur IA à la partie." ]

        PasswordShared ->
            [ Text "Tout le monde dans la partie peut voir le mot de passe ! "
            , Text "Le cacher ici n'affecte que vous (utile si vous streamez, etc.)."
            ]

        PasswordNotSecured ->
            [ Text "Les mots de passe des parties ne sont "
            , Em [ Text "pas" ]
            , Text " stockés de manière sécurisée—par conséquent, veuillez "
            , Em [ Text "ne pas" ]
            , Text " utiliser des mots de passe sérieux que vous utilisez ailleurs !"
            ]

        LobbyPassword ->
            [ Text "Mot de Passe de la Partie" ]

        LobbyPasswordDescription ->
            [ Text "Un mot de passe que les utilisateurs doivent saisir avant de pouvoir rejoindre la partie." ]

        AudienceMode ->
            [ Text "Mode Audience" ]

        AudienceModeDescription ->
            [ Text "Si activé, les nouveaux utilisateurs seront par défaut spectateurs, et seul vous pourrez "
            , Text "les transformer en joueurs."
            ]

        StartGame ->
            [ Text "Démarrer la Partie" ]

        Public ->
            [ Text "Partie Publique" ]

        PublicDescription ->
            [ Text "Si activé, la partie apparaîtra dans la liste publique des parties pour que tout le monde puisse la trouver." ]

        ApplyConfiguration ->
            [ Text "Appliquer cette modification." ]

        AppliedConfiguration ->
            [ Text "Enregistré." ]

        InvalidConfiguration ->
            [ Text "Cette valeur de configuration n'est pas valide." ]

        Automatic ->
            [ Text "Marquer Automatiquement les Joueurs Comme Absents" ]

        AutomaticDescription ->
            [ Text "Si activé, lorsque la limite de temps est dépassée, les joueurs seront automatiquement marqués comme absents. "
            , Text "Sinon, quelqu'un devra appuyer sur le bouton pour le faire."
            ]

        TimeLimit { stage } ->
            [ ref stage, Text " Limite de Temps" ]

        StartingTimeLimitDescription ->
            [ Text "Combien de temps (en secondes) le "
            , ref Czar
            , Text " a pour choisir/écrire un "
            , ref (noun Call 1)
            , Text ", lorsque la règle maison "
            , raw HouseRuleCzarChoices
            , Text " est activée."
            ]

        PlayingTimeLimitDescription ->
            [ Text "Combien de temps (en secondes) les ", ref Players, Text " ont pour jouer leurs cartes." ]

        PlayingAfterDescription ->
            [ Text "Combien de temps (en secondes) les joueurs ont pour changer leur jeu avant que la prochaine phase ne commence." ]

        RevealingTimeLimitDescription ->
            [ Text "Combien de temps (en secondes) le ", ref Czar, Text " a pour révéler les propositions." ]

        RevealingAfterDescription ->
            [ Text "Combien de temps (en secondes) attendre après la révélation de la dernière carte avant que la prochaine phase ne commence." ]

        JudgingTimeLimitDescription ->
            [ Text "Combien de temps (en secondes) le ", ref Czar, Text " a pour juger les propositions." ]

        CompleteTimeLimitDescription ->
            [ Text "Combien de temps (en secondes) attendre après la fin d'un tour avant de commencer le suivant." ]

        RevealingEnabledTitle ->
            [ Text "Le Czar Révèle les Propositions" ]

        RevealingEnabled ->
            [ Text "Si cela est activé, le "
            , ref Czar
            , Text " révèle une proposition à la fois avant de choisir un gagnant."
            ]

        DuringTitle ->
            [ Text "Limite de temps" ]

        AfterTitle ->
            [ Text "Après" ]

        Conflict ->
            [ Text "Conflit" ]

        ConflictDescription ->
            [ Text "Quelqu'un d'autre a apporté des modifications pendant que vous faisiez des changements. "
            , Text "Veuillez choisir si vous voulez conserver vos modifications ou les leurs."
            ]

        YourChanges ->
            [ Text "Vos modifications" ]

        TheirChanges ->
            [ Text "Leurs modifications" ]

        ConfigurationDisabledWhileInGame ->
            [ Text "Pendant que le jeu est en cours, vous ne pouvez pas modifier la configuration." ]

        ConfigurationDisabledIfNotPrivileged ->
            [ Text "Vous ne pouvez pas modifier la configuration de ce jeu." ]

        ConfigureNextGame ->
            [ Text "Configurer la prochaine partie" ]

        -- Game
        PickCall ->
            [ Text "Choisissez cette ", ref (noun Call 1), Text " pour ce tour des autres joueurs." ]

        WriteCall ->
            [ Text "Écrivez une ", ref (noun Call 1), Text " personnalisée pour ce tour des autres joueurs." ]

        SubmitPlay ->
            [ Text "Donnez ces cartes au ", ref Czar, Text " en tant que votre proposition pour le tour." ]

        TakeBackPlay ->
            [ Text "Reprenez vos cartes pour modifier votre proposition pour le tour." ]

        JudgePlay ->
            [ Text "Choisissez cette proposition comme gagnante pour le tour." ]

        LikePlay ->
            [ Text "Ajoutez un j'aime à cette proposition." ]

        AdvanceRound ->
            [ Text "Tour suivant." ]

        Starting ->
            [ raw HouseRuleCzarChoices ]

        Playing ->
            [ Text "En jeu" ]

        Revealing ->
            [ Text "Révélation" ]

        Judging ->
            [ Text "Jugement" ]

        Complete ->
            [ Text "Terminé" ]

        ViewGameHistoryAction ->
            [ Text "Voir les tours précédents de cette partie." ]

        ViewHelpAction ->
            [ Text "Aide" ]

        EnforceTimeLimitAction ->
            [ Text "Mettre tous les joueurs attendus en mode absent et les ignorer jusqu'à leur retour." ]

        Blank ->
            [ Text "Vide" ]

        RoundStarted ->
            [ Text "Tour commencé" ]

        JudgingStarted ->
            [ Text "Jugement commencé" ]

        Paused ->
            [ Text "Le jeu a été mis en pause car il n'y a pas assez de joueurs actifs pour continuer."
            , Text "Lorsque quelqu'un rejoint ou revient, il continuera automatiquement."
            ]

        ClientAway ->
            [ Text "Vous êtes actuellement en mode absent du jeu et ne jouez pas." ]

        Discard ->
            [ Text "Défaussez la carte sélectionnée, en la révélant aux autres utilisateurs du jeu." ]

        Discarded { player } ->
            [ Text player
            , Text " a défaussé la carte suivante :"
            ]

        -- Instructions
        PickCallInstruction ->
            [ Text "Choisissez une ", ref (noun Call 1), Text " que les autres joueurs complèteront." ]

        WaitForCallInstruction ->
            [ Text "Vous attendez que le "
            , ref Czar
            , Text " choisisse une "
            , ref (noun Call 1)
            , Text " que vous complèterez."
            ]

        PlayInstruction { numberOfCards } ->
            [ Text "Vous devez choisir "
            , Text (asWord numberOfCards)
            , Text (if numberOfCards > 1 then " autres " else " autre ")
            , ref (noun Response numberOfCards)
            , Text " de votre main dans ce tour avant de pouvoir soumettre votre jeu."
            ]

        SubmitInstruction ->
            [ Text "Vous devez soumettre votre proposition pour ce tour." ]

        WaitingForPlaysInstruction ->
            [ Text "Vous attendez que les autres joueurs jouent leur tour." ]

        CzarsDontPlayInstruction ->
            [ Text "Vous êtes le/la "
            , ref Czar
            , Text " pour ce tour - vous ne soumettez pas de "
            , ref (nounUnknownQuantity Response)
            , Text ". À la place, vous choisissez le gagnant une fois que tous les autres ont soumis leur proposition."
            ]

        NotInRoundInstruction ->
            [ Text "Vous ne participez pas à ce tour. Vous jouerez au prochain sauf si vous êtes en mode absent." ]

        RevealPlaysInstruction ->
            [ Text "Cliquez sur les propositions pour les retourner, puis choisissez celle que vous trouvez la meilleure." ]

        WaitingForCzarInstruction ->
            [ Text "Vous pouvez liker des propositions pendant que vous attendez que le/la ", ref Czar, Text " révèle les propositions et choisisse un gagnant pour le tour." ]

        AdvanceRoundInstruction ->
            [ Text "Le prochain tour a commencé, vous pouvez avancer." ]

        -- 404 Unknown
        UnknownPageTitle ->
            [ Text "Erreur 404 : Page inconnue." ]

        GoBackHome ->
            [ Text "Retourner à la page principale." ]

        -- Actions
        Refresh ->
            [ Text "Actualiser" ]

        Accept ->
            [ Text "OK" ]

        -- Editor
        AddSlot ->
            [ Text "Ajouter ", ref Blank ]

        AddText ->
            [ Text "Ajouter du texte" ]

        EditText ->
            [ Text "Modifier" ]

        EditSlotIndex ->
            [ Text "Modifier" ]

        MoveLeft ->
            [ Text "Déplacer plus tôt" ]

        Remove ->
            [ Text "Supprimer" ]

        MoveRight ->
            [ Text "Déplacer plus tard" ]

        Normal ->
            [ Text "Normal" ]

        Capitalise ->
            [ Text "Mettre en majuscule" ]

        UpperCase ->
            [ Text "Majuscules" ]

        Emphasise ->
            [ Text "Mettre en évidence" ]

        MustContainAtLeastOneSlot ->
            [ Text "Vous devez avoir au moins un ", ref Blank, Text " que les gens complèteront." ]

        SlotIndexExplanation ->
            [ Text "Quel nombre de "
            , ref (noun Response 1)
            , Text " jouée sera utilisé pour ce "
            , ref Blank
            , Text ". Cela vous permet de répéter une "
            , ref (noun Response 1)
            , Text "."
            ]

        -- Errors
        Error ->
            [ Text "Erreur" ]

        ErrorHelp ->
            [ Text "Le serveur de jeu est peut-être hors ligne, ou il s'agit peut-être d'un bug. Actualiser la page devrait résoudre le problème. "
            , Text "Plus de détails sont disponibles ci-dessous."
            ]

        ErrorHelpTitle ->
            [ Text "Désolé, quelque chose s'est mal passé." ]

        ErrorCheckOutOfBand ->
            [ Text "Veuillez vérifier ", ref TwitterHandle, Text " pour des mises à jour et le statut du service. Le serveur de jeu sera hors ligne pendant un court moment lors de la publication d'une nouvelle version. Si vous voyez une mise à jour récente, réessayez dans quelques minutes." ]

        TwitterHandle ->
            [ Text "@Massive_Decks" ]

        ReportError ->
            [ Text "Signaler un bug" ]

        ReportErrorDescription ->
            [ Text "Informez les développeurs d'un bug rencontré afin qu'ils puissent le corriger." ]

        ReportErrorBody ->
            [ Text "Je faisais [remplacer par une brève explication de ce que vous faisiez] quand j'ai rencontré l'erreur suivante : " ]

        BadUrlError ->
            [ Text "Nous avons essayé de faire une requête vers une page invalide." ]

        TimeoutError ->
            [ Text "Le serveur n'a pas répondu à temps. Il est peut-être hors ligne, veuillez réessayer après un court délai." ]

        NetworkError ->
            [ Text "Votre connexion internet a été interrompue." ]

        ServerDownError ->
            [ Text "Le serveur de jeu est actuellement hors ligne. Veuillez réessayer plus tard." ]

        BadStatusError ->
            [ Text "Le serveur a donné une réponse inattendue." ]

        BadPayloadError ->
            [ Text "Le serveur a donné une réponse incompréhensible." ]

        PatchError ->
            [ Text "Le serveur a envoyé une mise à jour que nous n'avons pas pu appliquer." ]

        VersionMismatch ->
            [ Text "Le serveur a envoyé une modification de configuration pour une version différente de celle attendue." ]

        CastError ->
            [ Text "Désolé, une erreur est survenue lors de la tentative de connexion au jeu." ]

        ActionExecutionError ->
            [ Text "Vous ne pouvez pas effectuer cette action." ]

        IncorrectPlayerRoleError { role, expected } ->
            [ Text "Vous devez être un ", ref expected, Text " pour faire cela, mais vous êtes un ", ref role, Text "." ]

        IncorrectUserRoleError { role, expected } ->
            [ Text "Vous devez être un ", ref expected, Text " pour faire cela, mais vous êtes un ", ref role, Text "." ]

        IncorrectRoundStageError { stage, expected } ->
            [ Text "Le tour doit être à l'étape ", ref expected, Text " pour faire cela, mais il est à l'étape ", ref stage, Text "." ]

        ConfigEditConflictError ->
            [ Text "Quelqu'un d'autre a modifié la configuration avant vous, votre changement n'a pas été enregistré." ]

        UnprivilegedError ->
            [ Text "Vous n'avez pas les privilèges nécessaires pour faire cela." ]

        GameNotStartedError ->
            [ Text "Le jeu doit avoir commencé pour faire cela." ]

        InvalidActionError { reason } ->
            [ Text "Le serveur n'a pas compris une requête du client. Détails : ", Text reason ]

        AuthenticationError ->
            [ Text "Vous ne pouvez pas rejoindre ce jeu." ]

        IncorrectIssuerError ->
            [ Text "Vos informations d'identification pour rejoindre ce jeu ne sont plus valides, le jeu n'existe plus." ]

        InvalidAuthenticationError ->
            [ Text "Vos informations d'identification pour rejoindre ce jeu sont corrompues." ]

        InvalidLobbyPasswordError ->
            [ Text "Le mot de passe du jeu que vous avez saisi est incorrect. Essayez à nouveau et, si cela ne fonctionne toujours pas, demandez à la personne qui vous a invité(e)." ]

        AlreadyLeftError ->
            [ Text "Vous avez déjà quitté ce jeu." ]

        LobbyNotFoundError ->
            [ Text "Ce jeu n'existe pas." ]

        LobbyClosedError { gameCode } ->
            [ Text "Le jeu que vous souhaitez rejoindre (", ref (GameCode { code = gameCode }), Text ") est terminé." ]

        LobbyDoesNotExistError { gameCode } ->
            [ Text "Le code du jeu que vous avez saisi ("
            , ref (GameCode { code = gameCode })
            , Text ") n'existe pas. "
            , Text "Essayez de le saisir à nouveau et, si cela ne fonctionne toujours pas, demandez à la personne qui vous a invité(e)."
            ]

        RegistrationError ->
            [ Text "Problème lors de la tentative de rejoindre le jeu." ]

        UsernameAlreadyInUseError { username } ->
            [ Text "Quelqu'un utilise déjà le nom d'utilisateur « "
            , Text username
            , Text " »—essayez un autre nom."
            ]

        GameError ->
            [ Text "Quelque chose s'est mal passé dans le jeu." ]

        OutOfCardsError ->
            [ Text "Il n'y avait pas assez de cartes dans le paquet pour distribuer une main à tout le monde ! Essayez d'ajouter plus de paquets dans la configuration du jeu." ]

        -- Language Names
        English ->
            [ Text "Anglais" ]

        BritishEnglish ->
            [ Text "Anglais (Britannique)" ]

        Italian ->
            [ Text "Italien" ]

        BrazilianPortuguese ->
            [ Text "Portugais (Brésilien)" ]

        German ->
            [ Text "Allemand (Formel)" ]

        GermanInformal ->
            [ Text "Allemand (Informel)" ]

        Polish ->
            [ Text "Polonnais" ]

        Indonesian ->
            [ Text "Indonésien" ]

        Spanish ->
            [ Text "Espagnol" ]

        Korean ->
            [ Text "Coréen" ]

        French ->
            [ Text "Français" ]



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
            "un"

        2 ->
            "deux"

        3 ->
            "trois"

        4 ->
            "quatre"

        5 ->
            "cinq"

        6 ->
            "six"

        7 ->
            "sept"

        8 ->
            "huit"

        9 ->
            "neuf"

        10 ->
            "dix"

        11 ->
            "onze"

        12 ->
            "douze"

        other ->
            String.fromInt other

