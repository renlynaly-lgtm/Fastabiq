# Fastabiq Backend Setup Guide

## 📋 Persyaratan
- Node.js v14+ dan npm
- Git
- Gemini API Key (dari Google Cloud)

## 🚀 Installation & Setup

### 1. Clone Repository
```bash
git clone https://github.com/renlynaly-lgtm/Fastabiq.git
cd Fastabiq
```

### 2. Install Dependencies
```bash
npm install
```

### 3. Setup Environment Variables
```bash
cp .env.example .env
```

Edit `.env` dan isi:
```
PORT=5000
NODE_ENV=development
GEMINI_API_KEY=AIzaSyAwisAQprYRG59rFLncOgv34BAyNRJupNQ
```

### 4. Jalankan Server (Development)
```bash
npm run dev
```

Server akan berjalan di: `http://localhost:5000`

### 5. Test API
```bash
curl -X POST http://localhost:5000/api/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Bagaimana cara meningkatkan istiqamah sholat?","userId":"test123"}'
```

---

## 🔑 Konfigurasi API Endpoints

### Chat dengan AI Coach
```
POST /api/chat
Body: {
  "message": "string",
  "userId": "string (optional)",
  "muhasabah": "string (optional)"
}

Response: {
  "success": true,
  "reply": "AI response",
  "timestamp": "2026-06-05T14:00:00Z"
}
```

### Email Login (untuk referensi)
```
POST /api/auth/email-login
Body: {
  "email": "user@example.com",
  "password": "password123"
}

Note: Autentikasi utama dilakukan via Firebase Client SDK
```

### Registrasi User
```
POST /api/auth/register
Body: {
  "email": "user@example.com",
  "password": "password123"
}

Note: Pendaftaran dilakukan via Firebase Client SDK
```

---

## 🔐 Firebase Auth Integration (Client-Side)

### Login dengan Email:
```javascript
// Di index.html - sudah dikonfigurasi
import { signInWithEmailAndPassword } from "firebase/auth";

signInWithEmailAndPassword(auth, email, password)
  .then(user => console.log("Login berhasil"))
  .catch(error => console.error(error));
```

### Registrasi:
```javascript
import { createUserWithEmailAndPassword } from "firebase/auth";

createUserWithEmailAndPassword(auth, email, password)
  .then(user => console.log("Registrasi berhasil"))
  .catch(error => console.error(error));
```

### Reset Password:
```javascript
import { sendPasswordResetEmail } from "firebase/auth";

sendPasswordResetEmail(auth, email)
  .then(() => console.log("Email reset dikirim"))
  .catch(error => console.error(error));
```

---

## 📊 Data Synchronization Flow

```
┌─────────────────────────────────────────────────────┐
│             FASTABIQ ARCHITECTURE                    │
└─────────────────────────────────────────────────────┘

Frontend (index.html)
    ↓
    ├─→ [Firebase Auth] (Login/Register/Password Reset)
    │   └─→ Firestore (User Data Sync)
    │
    └─→ [Backend Server] (Proxy)
        ├─→ /api/chat → Gemini API (AI Coach)
        └─→ /api/user/* → Firestore Operations
```

### Real-time Sync dengan Firebase:
1. **User Login** → Firebase Auth
2. **User Data Saved** → Firestore (via `setDoc()`)
3. **Data Updated** → Real-time listener triggers
4. **Local Storage Backup** → Browser localStorage

```javascript
// Contoh: Save data ke Firestore
setDoc(doc(db, "users", userId), {
  totalXP: 100,
  score: 75,
  sholat: { Subuh: { claimed: true } }
});

// Contoh: Read real-time data
onSnapshot(doc(db, "users", userId), (doc) => {
  console.log("Data terbaru:", doc.data());
});
```

---

## 🔐 Security Best Practices

✅ **Sudah Diimplementasikan:**
- [x] API Key di backend, bukan di frontend
- [x] CORS enabled untuk frontend domain
- [x] Environment variables untuk secrets
- [x] Firebase security rules di Firestore

⚠️ **TODO - Tambahkan di Production:**
- [ ] JWT token authentication
- [ ] Rate limiting untuk API endpoints
- [ ] Input validation & sanitization
- [ ] Logging & monitoring
- [ ] HTTPS/SSL certificate
- [ ] Firewall configuration

---

## 🚀 Deployment Options

### Option 1: Heroku
```bash
heroku create fastabiq-backend
git push heroku main
heroku config:set GEMINI_API_KEY=your_key
heroku open
```

### Option 2: Vercel (Node.js)
```bash
npm i -g vercel
vercel
vercel env add GEMINI_API_KEY
vercel deploy
```

### Option 3: Railway
```bash
npm i -g @railway/cli
railway login
railway init
railway up
```

### Option 4: Self-Hosted (VPS/DigitalOcean)
```bash
ssh your_vps
cd /var/www/fastabiq
git clone ...
npm install
PM2 start server.js
```

---

## 🐛 Troubleshooting

### Error: "GEMINI_API_KEY tidak dikonfigurasi"
```
Solusi: Pastikan .env file sudah dibuat dan berisi GEMINI_API_KEY
```

### Error: "Cannot POST /api/chat"
```
Solusi: Pastikan server sudah berjalan (npm run dev)
```

### CORS Error di Frontend
```
Solusi: Update CORS_ORIGIN di .env sesuai domain frontend
```

### Firebase Auth Not Working
```
Solusi: Pastikan firebaseConfig di index.html sudah benar
```

---

## 📚 Dokumentasi Referensi

- [Express.js Documentation](https://expressjs.com/)
- [Firebase Auth Docs](https://firebase.google.com/docs/auth)
- [Gemini API Docs](https://ai.google.dev/tutorials/python_quickstart)
- [Firestore Docs](https://firebase.google.com/docs/firestore)

---

## 👨‍💻 Developer Contact
- GitHub: https://github.com/renlynaly-lgtm
- Email: renlynaly@gmail.com

---

**Status:** ✅ Production Ready | Last Updated: June 5, 2026
