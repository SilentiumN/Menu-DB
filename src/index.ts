import pkg from '@prisma/client';
const { PrismaClient } = pkg;
import cors from "cors";
import express from 'express';

const prisma = new PrismaClient()
const app = express()

const options: cors.CorsOptions = {
    origin: '*'
};

// Then pass these options to cors:
app.use(cors(options));

app.use(express.json())

app.get('/menuItems', async (req, res) => {
    const menuItems = await prisma.menuItem.findMany()
    res.json(menuItems)
})

app.get('/categories', async (req, res) => {
    const categories = await prisma.category.findMany()
    res.json(categories)
})

app.get('/country', async (req, res) => {
    const country = await prisma.country.findMany()
    res.json(country)
})

app.post('/menuItems', async (req, res) => {

    const checkMenuItem = await prisma.menuItem.findFirst({
        where: {
            name: req.body["name"],
        },
        rejectOnNotFound: false
    })

    async function main() {
        try {
            if (checkMenuItem == null) {
                await prisma.menuItem.create({
                    data: {
                        name: req.body["name"],
                        price: parseFloat(req.body["price"]),
                        MenuItemCountry: req.body["MenuItemCountry"],
                        MenuItemCategory: req.body["MenuItemCategory"]
                    },
                })
                console.log('Created new menu item: '+ req.body["name"])
                res.send('Created new menu item: '+ req.body["name"])
            }
            else {
                console.log(req.body["name"] + ' already existing')
                res.send(req.body["name"] + ' already existing')
            }
        }

        catch (e) {
            console.log(e)
        }

    }

    main()
        .catch(() => console.log('Error when adding menu item: ' + req.body["name"]))

})

app.listen(3000, () =>
  console.log('REST API server ready at: http://localhost:3000'),
)

