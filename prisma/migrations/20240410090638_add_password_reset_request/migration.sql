-- CreateTable
CREATE TABLE "Categorie" (
    "id_categorie" SERIAL NOT NULL,
    "type" INTEGER NOT NULL,
    "image" TEXT,
    "name" VARCHAR(50) NOT NULL,

    CONSTRAINT "categorie_pkey" PRIMARY KEY ("id_categorie")
);

-- CreateTable
CREATE TABLE "Favori" (
    "id_user" INTEGER NOT NULL,
    "id_produit" INTEGER NOT NULL,
    "id_favoris" INTEGER NOT NULL,

    CONSTRAINT "favori_pkey" PRIMARY KEY ("id_user","id_produit")
);

-- CreateTable
CREATE TABLE "Marque" (
    "id_marque" SERIAL NOT NULL,
    "titre" VARCHAR(50) NOT NULL,

    CONSTRAINT "marque_pkey" PRIMARY KEY ("id_marque")
);

-- CreateTable
CREATE TABLE "Panier" (
    "id_user" INTEGER NOT NULL,
    "id_produit" INTEGER NOT NULL,
    "id_panier" INTEGER NOT NULL,
    "date_panier" DATE NOT NULL,

    CONSTRAINT "panier_pkey" PRIMARY KEY ("id_user","id_produit")
);

-- CreateTable
CREATE TABLE "Produit" (
    "id_produit" SERIAL NOT NULL,
    "titre" VARCHAR(50) NOT NULL,
    "description" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "prix" DECIMAL(15,2) NOT NULL,
    "poids" DECIMAL(15,2),
    "price_kg" DECIMAL(15,2),
    "price_liter" DECIMAL,
    "id_marque" INTEGER NOT NULL,

    CONSTRAINT "produit_pkey" PRIMARY KEY ("id_produit")
);

-- CreateTable
CREATE TABLE "Produit_Categorie" (
    "id_produit" INTEGER NOT NULL,
    "id_categorie" INTEGER NOT NULL,

    CONSTRAINT "posséder_pkey" PRIMARY KEY ("id_produit","id_categorie")
);

-- CreateTable
CREATE TABLE "Produit_Promotion" (
    "id_produit" INTEGER NOT NULL,
    "id_promotion" INTEGER NOT NULL,

    CONSTRAINT "appartenir_pkey" PRIMARY KEY ("id_produit","id_promotion")
);

-- CreateTable
CREATE TABLE "Promotion" (
    "id_promotion" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" TEXT NOT NULL,
    "date_debut" DATE,
    "date_fin" DATE,

    CONSTRAINT "promotion_pkey" PRIMARY KEY ("id_promotion")
);

-- CreateTable
CREATE TABLE "User_Customer" (
    "id_user" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "user_customer_pkey" PRIMARY KEY ("id_user")
);

-- CreateTable
CREATE TABLE "password_reset_requests" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,
    "used" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "password_reset_requests_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "categorie_id_categorie_key" ON "Categorie"("id_categorie");

-- CreateIndex
CREATE UNIQUE INDEX "favori_id_favoris_key" ON "Favori"("id_favoris");

-- CreateIndex
CREATE UNIQUE INDEX "marque_id_marque_key" ON "Marque"("id_marque");

-- CreateIndex
CREATE UNIQUE INDEX "panier_id_panier_key" ON "Panier"("id_panier");

-- CreateIndex
CREATE UNIQUE INDEX "User_Customer_email_key" ON "User_Customer"("email");

-- CreateIndex
CREATE UNIQUE INDEX "password_reset_requests_token_key" ON "password_reset_requests"("token");

-- AddForeignKey
ALTER TABLE "Favori" ADD CONSTRAINT "favori_id_produit_fkey" FOREIGN KEY ("id_produit") REFERENCES "Produit"("id_produit") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Favori" ADD CONSTRAINT "favori_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "User_Customer"("id_user") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Panier" ADD CONSTRAINT "panier_id_produit_fkey" FOREIGN KEY ("id_produit") REFERENCES "Produit"("id_produit") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Panier" ADD CONSTRAINT "panier_id_user_fkey" FOREIGN KEY ("id_user") REFERENCES "User_Customer"("id_user") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Produit" ADD CONSTRAINT "produit_id_marque_fkey" FOREIGN KEY ("id_marque") REFERENCES "Marque"("id_marque") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Produit_Categorie" ADD CONSTRAINT "posséder_id_categorie_fkey" FOREIGN KEY ("id_categorie") REFERENCES "Categorie"("id_categorie") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Produit_Categorie" ADD CONSTRAINT "posséder_id_produit_fkey" FOREIGN KEY ("id_produit") REFERENCES "Produit"("id_produit") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Produit_Promotion" ADD CONSTRAINT "appartenir_id_produit_fkey" FOREIGN KEY ("id_produit") REFERENCES "Produit"("id_produit") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Produit_Promotion" ADD CONSTRAINT "appartenir_id_promotion_fkey" FOREIGN KEY ("id_promotion") REFERENCES "Promotion"("id_promotion") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "password_reset_requests" ADD CONSTRAINT "password_reset_requests_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User_Customer"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;
