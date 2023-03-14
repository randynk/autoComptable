function chat(message::String, temps::Float64)
    texte = open("file","w")
    write(texte, message)
    write(texte, "\n")
    close(texte)
    texte = open("file","r")
    while !eof(texte)
        lettre = read(texte, Char)
        print(lettre)
        sleep(temps)
    end
    close(texte)
    rm("file")
end
function first()
    touch("ofoe4534opzaeu12/mlbshye")
    touch("ofoe4534opzaeu12/asxfthnjil")
    touch("ofoe4534opzaeu12/plknbgresw")
    try
        rm("ofoe4534opzaeu12/ygvdzqwxd")
        rm("ofoe4534opzaeu12/tdwqazedc") 
    catch
    end    
end
function asking()
    chat("Qui d'autre a contribué ?", 0.012)
    nom_temporaire = uppercase(readline())
    chat("Il/Elle a contribué à raison de combien ? (N'ajoute plus 'fcfa' stp)", 0.012)
    montant_temporaire = readline()  
    noms_temporaires = open("noms_temporaires.txt","w")
    montants_temporaires = open("montants_temporaires.txt","w")
    write(noms_temporaires, nom_temporaire)
    write(montants_temporaires, montant_temporaire)
    close(noms_temporaires)
    close(montants_temporaires)
end
function datas()
    noms = open("noms_temporaires.txt","r")
    montants = open("montants_temporaires.txt","r")
    nom = readline(noms)
    montant = readline(montants)
    close(noms)
    close(montants)
    global data = Dict("nom" => nom, "montant" => montant)
end
function search(fichier::String)
      bilan_noms = open(fichier,"r")
      bilan_nom = readlines(bilan_noms)
      close(bilan_noms)
    for j in eachindex(bilan_nom)
        if getindex(bilan_nom, j) == data["nom"]
            return j
            break
        end
    end
end
function update(index)
    names = open("ofoe4534opzaeu12/plknbgresw","r")
    amounts = open("ofoe4534opzaeu12/asxfthnjil","r")
    name = readlines(names)
    amount = readlines(amounts)
    close(names)
    close(amounts)
    if typeof(index) == Nothing
        noms = open("ofoe4534opzaeu12/plknbgresw","a")
        montants = open("ofoe4534opzaeu12/asxfthnjil","a")
        write(noms, "$(data["nom"])\n")
        write(montants, "$(data["montant"])\n")
        close(noms)
        close(montants)
    else
        updated = parse(Float64, amount[index]) + parse(Float64, data["montant"])
        updated = string(updated, "")
        amount = setindex!(amount, updated, index)
        news = open("montants.txt","a")
        for j in amount
            write(news, "$j\n")
        end
        close(news)
        rm("ofoe4534opzaeu12/asxfthnjil")
        cp("montants.txt","ofoe4534opzaeu12/asxfthnjil")
        rm("montants.txt")
    end
    rm("noms_temporaires.txt")
    rm("montants_temporaires.txt")
end
function solde()
    cp("ofoe4534opzaeu12/asxfthnjil","ofoe4534opzaeu12/ygvdzqwxd")
    cp("ofoe4534opzaeu12/plknbgresw","ofoe4534opzaeu12/tdwqazedc")
    touch("ofoe4534opzaeu12/mlbshye")
    try
        lireLeSolde = open("ofoe4534opzaeu12/mlbshye","r")
        begin
            global ancienSolde = parse(Float64, (readline(lireLeSolde)))
        end
        close(lireLeSolde)
    catch
        begin
            global ancienSolde = parse(Float64, "0")
        end
    end
    nouveauSolde = ancienSolde + parse(Float64, data["montant"])
    ecrireLeSolde = open("ofoe4534opzaeu12/mlbshye","w")
    write(ecrireLeSolde, string(nouveauSolde))
    close(ecrireLeSolde)
end
function classify()
    nouveau_Solde = open("ofoe4534opzaeu12/mlbshye","r")
    nouveauSolde = readline(nouveau_Solde)
    close(nouveau_Solde)
    montant = Float64[]
    nom = []    
    montants = open("ofoe4534opzaeu12/ygvdzqwxd","r")
    for i in eachline(montants)
        push!(montant, parse(Float64, i))
    end
    noms = open("ofoe4534opzaeu12/tdwqazedc","r")
    for i in eachline(noms)
        push!(nom, i)
    end 
    montant = map(x -> x * 100 / (parse(Float64, nouveauSolde)), montant)
    percents = open("soldes.txt","w")
    begin
        percent = ""
    end
    for i in eachindex(montant)
        begin
            percent = string(percent, nom[i], "        |        ", montant[i], " %\n")    
        end
    end
    retire = open("ofoe4534opzaeu12/bhtrlllmnb","a")
    write(retire, "0\n")
    close(retire)
    cumuls = open("ofoe4534opzaeu12/mlbshye","r")
    cumul = readline(cumuls)
    cumul = parse(Float64, cumul)
    close(cumuls)
    retraites = 0
    retire = open("ofoe4534opzaeu12/bhtrlllmnb","r")
    for i in eachline(retire)
        retraites += parse(Float64, i)
    end
    close(retire)
    sold = cumul - retraites
    write(percents, percent)
    write(percents, "\n    ::\n    ::\n\n Solde : $sold")
    close(percents)
    chat("\n   La contribution de $(data["montant"]) fcfa de $(data["nom"]) a bien été enregistée !\n\n      Nouveau solde : $sold fcfa", 0.012)
end
function remove()
    retire = open("ofoe4534opzaeu12/bhtrlllmnb","a")
    write(retire, "0\n")
    close(retire)
    chat("Tu vas retirer combien ?", 0.012)
    retrait = parse(Float64, readline())
    retire = open("ofoe4534opzaeu12/bhtrlllmnb","a")
    write(retire, "$retrait\n")
    close(retire)
    cumuls = open("ofoe4534opzaeu12/mlbshye","r")
    cumul = readline(cumuls)
    cumul = parse(Float64, cumul)
    close(cumuls)
    retraits = 0
    retire = open("ofoe4534opzaeu12/bhtrlllmnb","r")
    for i in eachline(retire)
        retraits += parse(Float64, i)
    end
    close(retire)
    sold = cumul - retraits
    news = open("soldes.txt","r")
    new = readlines(news)
    close(news)
    new = setindex!(new, " Solde : $sold", lastindex(new))
    rm("soldes.txt")
    news = open("soldes.txt","a")
    for i in new
        write(news, "\n$i")
    end
    close(news)
    chat("Votre retrait de $retrait a bien été notifié.\n\n Nouveau solde : $sold", 0.012)
end
chat("\nQuelle transaction allez-vous effectuer ? \n   Tapez 0 pour quitter\n   Tapez 1 pour notifier une nouvelle contribution\n   Tapez 2 pour notifier un retrait\n", 0.012)
choix = parse(Int64, readline())
if choix == 1
    first()
    asking()
    datas()
    update(search("ofoe4534opzaeu12/plknbgresw"))
    solde()
    classify()
elseif choix == 2
    remove()
elseif choix == 0
    exit()
else
    chat("       Cette entrée ne correspond à aucune modification.", 0.012)
end
