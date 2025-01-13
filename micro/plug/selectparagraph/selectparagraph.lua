local config = import("micro/config")
local micro = import("micro")

-- Fonction pour sélectionner jusqu'au paragraphe précédent
function selectParagraphPrevious(bp)
    local cursor = bp.Cursor
    local startLoc = cursor.Loc -- Position actuelle en Loc (X, Y)

    -- Déplace le curseur au paragraphe précédent
    bp:ParagraphPrevious()

    -- Définit la sélection entre les deux positions
    cursor:SetSelectionStart(startLoc) -- Passe directement le Loc initial
    cursor:SetSelectionEnd(cursor.Loc) -- Nouvelle position après déplacement
end

-- Fonction pour sélectionner jusqu'au paragraphe suivant
function selectParagraphNext(bp)
    local cursor = bp.Cursor
    local startLoc = cursor.Loc -- Position actuelle en Loc (X, Y)

    -- Déplace le curseur au paragraphe suivant
    bp:ParagraphNext()

    -- Définit la sélection entre les deux positions
    cursor:SetSelectionStart(startLoc) -- Passe directement le Loc initial
    cursor:SetSelectionEnd(cursor.Loc) -- Nouvelle position après déplacement
end

function init()
    -- Enregistre les commandes Lua dans Micro
    config.MakeCommand("selectParagraphPrevious", selectParagraphPrevious, config.NoComplete)
    config.MakeCommand("selectParagraphNext", selectParagraphNext, config.NoComplete)
end
