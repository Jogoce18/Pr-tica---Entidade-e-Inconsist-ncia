CREATE TABLE "public.users" (
	"Id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("Id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	"price" serial NOT NULL,
	"categoryId" TEXT NOT NULL,
	"sizeId" integer NOT NULL,
	"mainPictureId" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.orders" (
	"id" serial NOT NULL,
	"status" serial NOT NULL,
	"date" DATE NOT NULL,
	"addressId" integer NOT NULL,
	"userId" integer NOT NULL,
	CONSTRAINT "orders_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.pictures" (
	"id" serial NOT NULL,
	"url" TEXT NOT NULL,
	"productId" integer NOT NULL,
	CONSTRAINT "pictures_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ordersProducts" (
	"id" serial NOT NULL,
	"orderId" integer NOT NULL,
	"productId" integer NOT NULL,
	"quantity" integer NOT NULL,
	"paidPrice" integer NOT NULL,
	CONSTRAINT "ordersProducts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.address" (
	"id" serial NOT NULL,
	"street" serial NOT NULL,
	"number" integer NOT NULL,
	"complement" TEXT NOT NULL,
	"postalCode" TEXT NOT NULL,
	"cityId" integer NOT NULL,
	"ordersId" integer NOT NULL,
	"userId" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sizes" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.states" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "states_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cities" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"statesId" integer NOT NULL,
	CONSTRAINT "cities_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("sizeId") REFERENCES "sizes"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk2" FOREIGN KEY ("mainPictureId") REFERENCES "pictures"("id");

ALTER TABLE "orders" ADD CONSTRAINT "orders_fk0" FOREIGN KEY ("addressId") REFERENCES "address"("id");
ALTER TABLE "orders" ADD CONSTRAINT "orders_fk1" FOREIGN KEY ("userId") REFERENCES "users"("Id");

ALTER TABLE "pictures" ADD CONSTRAINT "pictures_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "ordersProducts" ADD CONSTRAINT "ordersProducts_fk0" FOREIGN KEY ("orderId") REFERENCES "orders"("id");
ALTER TABLE "ordersProducts" ADD CONSTRAINT "ordersProducts_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");

ALTER TABLE "address" ADD CONSTRAINT "address_fk0" FOREIGN KEY ("cityId") REFERENCES "cities"("id");
ALTER TABLE "address" ADD CONSTRAINT "address_fk1" FOREIGN KEY ("ordersId") REFERENCES "orders"("id");
ALTER TABLE "address" ADD CONSTRAINT "address_fk2" FOREIGN KEY ("userId") REFERENCES "users"("Id");




ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("statesId") REFERENCES "states"("id");











