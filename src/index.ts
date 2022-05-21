import express from 'express';
import cors from 'cors';
import {routes} from './routes';

const app = express();

app.use(cors());
app.use(express.json());

app.use(routes);

const port = 3030;

app.listen(port, () => console.log(`Server running at http://localhost:${port}`));
