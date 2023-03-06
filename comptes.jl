function first()
    touch("ofoe4534opzaeu12/mlbshye")
    touch("ofoe4534opzaeu12/asxfthnjil")
    touch("ofoe4534opzaeu12/plknbgresw")
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
        sleep(1)
    else
        updated = parse(Float64, amount[index]) + parse(Float64, data["montant"])
        updated = string(updated, "")
        amount = setindex!(amount, updated, index)
        sleep(1)
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
try
    rm("ofoe4534opzaeu12/ygvdzqwxd")
    rm("ofoe4534opzaeu12/tdwqazedc") 
catch
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
println(montant)
    montant = map(x -> x * 100 / (parse(Float64, nouveauSolde)), montant)
println(montant)
    percents = open("soldes.txt","w")
    begin
        percent = ""
    end
    for i in eachindex(montant)
        begin
            percent = string(percent, nom[i], "        |        ", montant[i], " %\n")    
        end
    end
    write(percents, percent)
    write(percents, "\n::\n::\n\n Solde : $(BigFloat(nouveauSolde))")
    close(percents)
end

first()
asking()
datas()
update(search("ofoe4534opzaeu12/plknbgresw"))
cp("ofoe4534opzaeu12/asxfthnjil","ofoe4534opzaeu12/ygvdzqwxd")
cp("ofoe4534opzaeu12/plknbgresw","ofoe4534opzaeu12/tdwqazedc")
solde()
classify()
