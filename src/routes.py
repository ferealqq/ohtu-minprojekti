from flask import render_template, request, redirect
from app import app
from db_functions import DBFunctions

db_functions = DBFunctions()


@app.route("/")
def index():
    return render_template("index.html")


@app.route("/list")
def list_function():
    kirjarows = db_functions.get_kirjavinkit()
    blogirows = db_functions.get_blogivinkit()
    podrows = db_functions.get_podcastvinkit()
    vidrows = db_functions.get_videovinkit()
    return render_template(
        "list.html",
        kirjarows=kirjarows,
        blogirows=blogirows,
        podrows=podrows,
        vidrows=vidrows,
    )


@app.route("/new_book", methods=["GET", "POST"])
def new_book():
    if request.method == "GET":
        return render_template("new.html")
    if request.method == "POST":
        otsikko = request.form["otsikko"]
        kirjoittaja = request.form["kirjoittaja"]
        isbn = request.form["isbn"]
        kommentti = request.form["kommentti"]
        if (
            len(otsikko.split()) == 0
            or len(kirjoittaja.split()) == 0
            or len(isbn.split()) == 0
            or len(kommentti.split()) == 0
        ):
            return render_template("error.html", viesti="Kaikki kentät tulee täyttää")
        if db_functions.new_kirjavinkki(otsikko, kirjoittaja, isbn, kommentti):
            return redirect("/list")
        return render_template("error.html", viesti="Lisääminen epäonnistui")


@app.route("/new_blog", methods=["GET", "POST"])
def new_blog():
    if request.method == "GET":
        return render_template("new_blog.html")
    if request.method == "POST":
        nimi = request.form["nimi"]
        kirjoittaja = request.form["kirjoittaja"]
        url = request.form["url"]
        kommentti = request.form["kommentti"]
        if (
            len(nimi.split()) == 0
            or len(kirjoittaja.split()) == 0
            or len(url.split()) == 0
            or len(kommentti.split()) == 0
        ):
            return render_template("error.html", viesti="Kaikki kentät tulee täyttää")

        if db_functions.new_blogivinkki(nimi, kirjoittaja, url, kommentti):
            return redirect("/list")

        return render_template("error.html", viesti="Lisääminen epäonnistui")


@app.route("/new_podcast", methods=["GET", "POST"])
def new_podcast():
    if request.method == "GET":
        return render_template("new_podcast.html")
    if request.method == "POST":
        nimi = request.form["nimi"]
        tekija = request.form["tekija"]
        jakson_nimi = request.form["jakson_nimi"]
        kommentti = request.form["kommentti"]
        if (
            len(nimi.split()) == 0
            or len(tekija.split()) == 0
            or len(jakson_nimi.split()) == 0
            or len(kommentti.split()) == 0
        ):
            return render_template("error.html", viesti="Kaikki kentät tulee täyttää")
        if db_functions.new_podcastvinkki(nimi, tekija, jakson_nimi, kommentti):
            return redirect("/list")
        return render_template("error.html", viesti="Lisääminen epäonnistui")


@app.route("/new_video", methods=["GET", "POST"])
def new_video():
    if request.method == "GET":
        return render_template("new_video.html")
    if request.method == "POST":
        nimi = request.form["nimi"]
        tekija = request.form["tekija"]
        url = request.form["url"]
        kommentti = request.form["kommentti"]
        if (
            len(nimi.split()) == 0
            or len(tekija.split()) == 0
            or len(url.split()) == 0
            or len(kommentti.split()) == 0
        ):
            return render_template("error.html", viesti="Kaikki kentät tulee täyttää")
        if db_functions.new_videovinkki(nimi, tekija, url, kommentti):
            return redirect("/list")
        return render_template("error.html", viesti="Lisääminen epäonnistui")


@app.route("/mark_read")
def mark_read():
    id_field = request.args.get("id")
    category = request.args.get("category")
    if category == "book":
        if db_functions.merkitse_kirja_luetuksi(id_field):
            return redirect("/list")
        return render_template("/error.html", viesti="Luetuksi merkitseminen epäonnistui")
    elif category == "blog":
        if db_functions.merkitse_blogi_luetuksi(id_field):
            return redirect("/list")
        return render_template("/error.html", viesti="Luetuksi merkitseminen epäonnistui")
    elif category == "podcast":
        if db_functions.merkitse_podcast_kuunnelluksi(id_field):
            return redirect("/list")
        return render_template("/error.html", viesti="Luetuksi merkitseminen epäonnistui")
    elif category == "video":
        if db_functions.merkitse_video_katsotuksi(id_field):
            return redirect("/list")
        return render_template("/error.html", viesti="Luetuksi merkitseminen epäonnistui")
    else:
        return render_template("/error.html", viesti="Luetuksi merkitseminen epäonnistui")
