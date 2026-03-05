const express = require('express');
const router = express.Router();
const { getLocation,
    getPanels,
    getMeters,
    getPanelByLocation,
    getMeterByPanel } = require('../../controllers/navigation/navigation.controller.js');

//http://localhost:3000/api/ems/navigation/all/locations
router.get('/locations', async (req, res) => {
    try {
        const locations = await getLocation();
        res.json({ data: locations });
    } catch (error) {
        console.error('Error fetching locations: ', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

// http://localhost:3000/api/ems/navigation/all/panels
router.get('/panels', async (req, res) => {
    try {
        const panels = await getPanels();
        res.json({ data: panels });
    } catch (error) {
        console.error('Error fetching panels: ', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

//http://localhost:3000/api/ems/navigation/all/meters
router.get('/meters', async (req, res) => {
    try {
        const meters = await getMeters();
        res.json({ data: meters });
    } catch (error) {
        console.error('Error fetching meters: ', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});
// http://localhost:3000/api/ems/navigation/all/panels/location1
router.get('/panels/:location', async (req, res) => {
    try {
        const location = req.params.location;
        const panels = await getPanelByLocation({ location });
        res.json({ data: panels });
    } catch (error) {
        console.error('Error fetching panels by location: ', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});
// http://localhost:3000/api/ems/navigation/all/meters/HT01
router.get('/meters/:panel', async (req, res) => {
    try {
        const panel = req.params.panel;
        const meters = await getMeterByPanel({ panel });
        res.json({ data: meters });
    } catch (error) {
        console.error('Error fetching meters by panel: ', error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});


module.exports = router;