import app from './app';
import config from '../database/config/database';
import { Sequelize } from 'sequelize'; // Importe o Sequelize

const sequelize = new Sequelize(config); // Crie uma instância do Sequelize
const PORT = 3000;

app.get("/", async (req, res) => {
    try {
        await sequelize.authenticate();
        res.send('Connection has been established successfully');
    } catch (error) {
        res.status(500).send(`Error connecting to database: ${error}`);
    }
});


app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});
