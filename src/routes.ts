import express from 'express';
import { prisma } from './prisma';

export const routes = express.Router();

routes.get('/reviews', async (req, res) => {
    try {
        const reviews = await prisma.review.findMany();
    
        return res.status(200).json({data: reviews});
    } catch (err) {
        return res.status(500).json({error: err});
    }
});

routes.post('/reviews/create', async (req, res) => {
    try {
        const { title, author, link, platform, rate, feedback } = req.body;
    
        const reviews_create = await prisma.review.create({
            data: {
                title,
                author,
                link,
                platform,
                rate,
                feedback,
            }
        });

        return res.status(201).json({data: reviews_create});
    } catch (err) {
        return res.status(500).json({error: err});
    }
});
