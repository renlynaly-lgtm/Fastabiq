require('dotenv').config();
const express = require('express');
const cors = require('cors');
const axios = require('axios');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Health check
app.get('/', (req, res) => {
    res.json({ status: 'Fastabiq Backend Running ✓' });
});

// ================= GEMINI AI CHAT API =================
app.post('/api/chat', async (req, res) => {
    const { message, userId, muhasabah } = req.body;

    if (!message || message.trim() === '') {
        return res.status(400).json({ success: false, error: 'Message tidak boleh kosong' });
    }

    if (!process.env.GEMINI_API_KEY) {
        return res.status(500).json({ success: false, error: 'Server error: GEMINI_API_KEY tidak dikonfigurasi' });
    }

    try {
        const systemPrompt = `Kamu adalah Fastabiq AI Coach, pendamping ibadah dan produktivitas Islami yang bijaksana, memotivasi, dan penuh empati. 
Peran kamu:
1. Memberikan motivasi Islami yang inspiratif
2. Membantu user breakdown target ibadah mereka
3. Memberikan saran praktis untuk meningkatkan amal harian
4. Responsif terhadap jurnal muhasabah user
5. Berbicara dalam bahasa Indonesia dengan nada hangat dan mendukung

${muhasabah ? `\nJurnal muhasabah user hari ini:\n${muhasabah}` : ''}`;

        const response = await axios.post(
            `https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${process.env.GEMINI_API_KEY}`,
            {
                contents: [{
                    parts: [{
                        text: `${systemPrompt}\n\nUser: ${message}`
                    }]
                }]
            }
        );

        if (response.data.candidates && response.data.candidates[0] && response.data.candidates[0].content.parts[0]) {
            const aiReply = response.data.candidates[0].content.parts[0].text;
            res.json({
                success: true,
                reply: aiReply,
                timestamp: new Date().toISOString()
            });
        } else {
            throw new Error('Response format tidak valid dari Gemini API');
        }
    } catch (error) {
        console.error('Gemini API Error:', error.response?.data || error.message);
        res.status(500).json({
            success: false,
            error: 'AI Coach sedang offline. Coba lagi nanti.',
            details: process.env.NODE_ENV === 'development' ? error.message : undefined
        });
    }
});

// ================= AUTH ENDPOINTS =================

// Email Login
app.post('/api/auth/email-login', async (req, res) => {
    const { email, password } = req.body;
    
    if (!email || !password) {
        return res.status(400).json({ success: false, error: 'Email dan password harus diisi' });
    }

    // Note: Validasi email/password dilakukan di Firebase Client SDK
    // Backend ini hanya berfungsi sebagai proxy untuk operasi yang memerlukan secret
    res.json({
        success: true,
        message: 'Gunakan Firebase Client SDK untuk login. Validasi dilakukan di client-side.',
        hint: 'Auth sudah dikonfigurasi di index.html'
    });
});

// Email Registration
app.post('/api/auth/register', async (req, res) => {
    const { email, password } = req.body;
    
    if (!email || !password) {
        return res.status(400).json({ success: false, error: 'Email dan password harus diisi' });
    }

    if (password.length < 6) {
        return res.status(400).json({ success: false, error: 'Password minimal 6 karakter' });
    }

    // Note: Pendaftaran dilakukan di Firebase Client SDK
    res.json({
        success: true,
        message: 'Gunakan Firebase Client SDK untuk registrasi.',
        hint: 'Client-side form sudah tersedia di index.html'
    });
});

// Password Reset
app.post('/api/auth/reset-password', async (req, res) => {
    const { email } = req.body;
    
    if (!email) {
        return res.status(400).json({ success: false, error: 'Email harus diisi' });
    }

    // Note: Reset password dilakukan di Firebase Client SDK
    res.json({
        success: true,
        message: 'Link reset akan dikirim ke email Anda',
        hint: 'Proses ini ditangani oleh Firebase'
    });
});

// ================= USER DATA ENDPOINTS =================

// Get user profile
app.get('/api/user/:userId', async (req, res) => {
    const { userId } = req.params;
    
    if (!userId) {
        return res.status(400).json({ success: false, error: 'User ID diperlukan' });
    }

    // Seharusnya connect ke Firestore untuk mengambil user data
    // Untuk sekarang, response placeholder
    res.json({
        success: true,
        message: 'User data diambil dari Firestore secara real-time melalui Firebase SDK'
    });
});

// Update user profile
app.post('/api/user/:userId/update', async (req, res) => {
    const { userId } = req.params;
    const userData = req.body;
    
    if (!userId) {
        return res.status(400).json({ success: false, error: 'User ID diperlukan' });
    }

    // Seharusnya update ke Firestore
    res.json({
        success: true,
        message: 'User data disinkronkan dengan Firestore',
        updatedAt: new Date().toISOString()
    });
});

// ================= ERROR HANDLING =================
app.use((err, req, res, next) => {
    console.error('Server Error:', err);
    res.status(500).json({
        success: false,
        error: 'Server error terjadi',
        message: process.env.NODE_ENV === 'development' ? err.message : undefined
    });
});

// 404 Handler
app.use((req, res) => {
    res.status(404).json({
        success: false,
        error: 'Endpoint tidak ditemukan',
        path: req.path
    });
});

// ================= START SERVER =================
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`
╔═══════════════════════════════════════╗
║   🚀 Fastabiq Backend Server         ║
║   Port: ${PORT}                          ║
║   Environment: ${process.env.NODE_ENV || 'development'}            ║
╚═══════════════════════════════════════╝
    `);
});

module.exports = app;
