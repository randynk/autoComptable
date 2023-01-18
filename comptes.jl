function first()
    touch("bilan_montants.txt")
    touch("bilan_noms.txt")
end

function asking()
    println("Qui d'autre a contribué ?")
    nom_temporaire = uppercase(readline())
    println("Il/Elle a contribué à raison de combien ? (N'ajoute plus 'fcfa' stp)")
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
    names = open("bilan_noms.txt","r")
    amounts = open("bilan_montants.txt","r")
    name = readlines(names)
    amount = readlines(amounts)
    close(names)
    close(amounts)

    if typeof(index) == Nothing
        noms = open("bilan_noms.txt","a")
        montants = open("bilan_montants.txt","a")
        write(noms, "$(data["nom"])\n")
        write(montants, "$(data["montant"])\n")
        close(noms)
        close(montants)
        sleep(1)
    else
        updated = parse(Int64, amount[index]) + parse(Int64, data["montant"])
        updated = string(updated, "")
        amount = setindex!(amount, updated, index)
        sleep(1)
        news = open("montants.txt","a")
        for j in amount
            write(news, "$j\n")
        end
        close(news)
        rm("bilan_montants.txt")
        cp("montants.txt","bilan_montants.txt")
        rm("montants.txt")
    end
    rm("noms_temporaires.txt")
    rm("montants_temporaires.txt")
end

first()
asking()
datas()
update(search("bilan_noms.txt"))