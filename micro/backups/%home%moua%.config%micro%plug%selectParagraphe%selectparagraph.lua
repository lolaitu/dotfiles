local config = import("micro/config")

-- Fonction pour sélectionner jusqu'au paragraphe précédent
function SelectToParagraphPrevious(bp)
    local cursor = bp.Cursor
    local origLine = cursor.Y

    -- Déplace le curseur au paragraphe précédent
    bp:ParagraphPrevious()

    -- Sélectionne entre la position d'origine et la nouvelle
    cursor:StartSelection()
    cursor:LineDown(origLine - cursor.Y) -- Nombre de lignes à remonter
end

-- Fonction pour sélectionner jusqu'au paragraphe suivant
function SelectToParagraphNext(bp)
    local cursor = bp.Cursor
    local origLine = cursor.Y

    -- Déplace le curseur au paragraphe suivant
    bp:ParagraphNext()

    -- Sélectionne entre la position d'origine et la nouvelle
    cursor:StartSelection()
    cursor:LineDown(cursor.Y - origLine) -- Nombre de lignes à descendre
end

function init()
    -- Enregistre les commandes Lua dans Micro
    config.MakeCommand("selecttoparagraphprevious", SelectToParagraphPrevious, config.NoComplete)
    config.MakeCommand("selecttoparagraphnext", SelectToParagraphNext, config.NoComplete)
end
