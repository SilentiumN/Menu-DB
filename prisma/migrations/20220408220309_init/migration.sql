-- CreateTable
CREATE TABLE "Category" (
    "categoryId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("categoryId")
);

-- CreateTable
CREATE TABLE "Country" (
    "countryId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Country_pkey" PRIMARY KEY ("countryId")
);

-- CreateTable
CREATE TABLE "MenuItem" (
    "menuItemId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "MenuItemCategory" TEXT NOT NULL,
    "MenuItemCountry" TEXT NOT NULL,

    CONSTRAINT "MenuItem_pkey" PRIMARY KEY ("menuItemId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Category_name_key" ON "Category"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Country_name_key" ON "Country"("name");

-- CreateIndex
CREATE UNIQUE INDEX "MenuItem_name_key" ON "MenuItem"("name");

-- AddForeignKey
ALTER TABLE "MenuItem" ADD CONSTRAINT "MenuItem_MenuItemCategory_fkey" FOREIGN KEY ("MenuItemCategory") REFERENCES "Category"("name") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MenuItem" ADD CONSTRAINT "MenuItem_MenuItemCountry_fkey" FOREIGN KEY ("MenuItemCountry") REFERENCES "Country"("name") ON DELETE RESTRICT ON UPDATE CASCADE;
