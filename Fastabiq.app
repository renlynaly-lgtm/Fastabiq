<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fastabiqul Khairat - Amalan Harian</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #059669;
            --primary-hover: #047857;
            --background: #f3f4f6;
            --surface: #ffffff;
            --text: #1f2937;
            --text-light: #6b7280;
            --border: #e5e7eb;
            --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Inter', sans-serif;
            -webkit-tap-highlight-color: transparent;
        }

        body {
            background-color: var(--background);
            color: var(--text);
            display: flex;
            justify-content: center;
            min-height: 100vh;
        }

        .phone-container {
            width: 100%;
            max-width: 480px;
            background-color: var(--surface);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            position: relative;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
        }

        /* Auth Screen */
        #auth-screen {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 2rem;
            background: linear-gradient(135deg, #059669 0%, #10b981 100%);
            color: white;
        }

        .auth-header {
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .auth-logo { font-size: 3.5rem; margin-bottom: 0.5rem; }
        .auth-title { font-size: 1.75rem; font-weight: 700; }

        .auth-card {
            background: white;
            padding: 1.5rem;
            border-radius: 16px;
            box-shadow: var(--shadow);
            color: var(--text);
        }

        .auth-toggle {
            display: flex;
            margin-bottom: 1.25rem;
            border-bottom: 2px solid var(--border);
        }

        .toggle-tab {
            flex: 1;
            text-align: center;
            padding: 0.75rem;
            cursor: pointer;
            font-weight: 600;
            color: var(--text-light);
        }

        .toggle-tab.active {
            color: var(--primary);
            border-bottom: 2px solid var(--primary);
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            font-size: 0.85rem;
            font-weight: 600;
            margin-bottom: 0.4rem;
            color: var(--text);
        }

        .form-group input {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid var(--border);
            border-radius: 10px;
            font-size: 0.95rem;
            outline: none;
        }

        .form-group input:focus {
            border-color: var(--primary);
        }

        .btn-auth {
            width: 100%;
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 0.85rem;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            margin-top: 0.5rem;
        }

        .btn-auth:active { background-color: var(--primary-hover); }

        .divider {
            text-align: center;
            margin: 1rem 0;
            font-size: 0.85rem;
            color: var(--text-light);
            position: relative;
        }

        .btn-anonymous {
            width: 100%;
            background-color: #f3f4f6;
            color: #374151;
            border: 1px solid var(--border);
            padding: 0.85rem;
            border-radius: 10px;
            font-size: 0.95rem;
            font-weight: 600;
            cursor: pointer;
        }

        .btn-anonymous:active { background-color: #e5e7eb; }

        /* App Screen */
        #app-screen { display: none; flex-direction: column; flex: 1; padding-bottom: 80px; }
        header { background-color: var(--surface); padding: 1.25rem; border-bottom: 1px solid var(--border); display: flex; justify-content: space-between; align-items: center; }
        .user-info { display: flex; flex-direction: column; }
        .user-name { font-size: 1rem; font-weight: 700; }
        .user-phone { font-size: 0.8rem; color: var(--text-light); }
        .btn-logout { background: none; border: none; color: #ef4444; font-weight: 500; cursor: pointer; padding: 0.5rem; }

        main { padding: 1.25rem; flex: 1; }
        .dashboard-card { background: linear-gradient(135deg, #047857 0%, #059669 100%); color: white; padding: 1.5rem; border-radius: 16px; margin-bottom: 1.5rem; }
        .stats-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; }
        .stat-box { background: rgba(255, 255, 255, 0.1); padding: 1rem; border-radius: 12px; text-align: center; }
        .stat-label { font-size: 0.8rem; color: #a7f3d0; margin-bottom: 0.25rem; }
        .stat-val { font-size: 1.5rem; font-weight: 700; }
        .section-title { font-size: 1.1rem; font-weight: 700; margin-bottom: 1rem; }

        /* Checklist Items */
        .checklist-container { display: flex; flex-direction: column; gap: 0.75rem; margin-bottom: 2rem; }
        .amalan-item { display: flex; align-items: center; justify-content: space-between; background-color: var(--surface); padding: 1rem; border-radius: 14px; border: 1px solid var(--border); }
        .amalan-item.checked { border-color: #a7f3d0; background-color: #f0fdf4; }
        .amalan-info { display: flex; align-items: center; gap: 0.85rem; }
        .amalan-icon { font-size: 1.35rem; background-color: #f3f4f6; width: 40px; height: 40px; display: flex; align-items: center; justify-content: center; border-radius: 10px; }
        .amalan-name { font-weight: 500; font-size: 0.95rem; }
        .amalan-xp { font-size: 0.75rem; color: var(--primary); font-weight: 600; }
        .checkbox-wrapper input[type="checkbox"] { width: 24px; height: 24px; accent-color: var(--primary); }

        /* Tasbih */
        .tasbih-card { background-color: var(--surface); border: 1px solid var(--border); border-radius: 16px; padding: 1.5rem; text-align: center; }
        .tasbih-display { font-size: 3rem; font-weight: 700; color: var(--primary); margin-bottom: 1.25rem; background-color: #f0fdf4; padding: 0.5rem; border-radius: 12px; }
        .tasbih-buttons { display: flex; gap: 1rem; }
        .btn-count { flex: 2; background-color: var(--primary); color: white; border: none; padding: 1rem; border-radius: 12px; font-size: 1.1rem; font-weight: 600; }
        .btn-reset { flex: 1; background-color: #f3f4f6; color: #4b5563; border: 1px solid var(--border); padding: 1rem; border-radius: 12px; }

        #loading-overlay { position: fixed; top: 0; left: 0; right: 0; bottom: 0; background-color: var(--surface); display: flex; justify-content: center; align-items: center; z-index: 999; font-size: 1.2rem; font-weight: 600; color: var(--primary); }
    </style>
</head>
<body>

    <div class="phone-container">
        <div id="loading-overlay">Memuat sistem...</div>

        <!-- SCREEN 1: LOGIN / REGISTER -->
        <div id="auth-screen">
            <div class="auth-header">
                <div class="auth-logo">🕌</div>
                <h1 class="auth-title">Fastabiqul Khairat</h1>
            </div>

            <div class="auth-card">
                <div class="auth-toggle">
                    <div class="toggle-tab active" id="tab-login">Masuk</div>
                    <div class="toggle-tab" id="tab-register">Daftar</div>
                </div>

                <form id="auth-form">
                    <div class="form-group" id="group-name" style="display: none;">
                        <label>Nama Lengkap</label>
                        <input type="text" id="auth-name" placeholder="Nama Anda">
                    </div>
                    <div class="form-group" id="group-email">
                        <label>Email</label>
                        <input type="email" id="auth-email" placeholder="nama@email.com">
                    </div>
                    <div class="form-group" id="group-phone" style="display: none;">
                        <label>Nomor HP</label>
                        <input type="tel" id="auth-phone" placeholder="08xxxxxxxxxx">
                    </div>
                    <div class="form-group" id="group-password">
                        <label>Password</label>
                        <input type="password" id="auth-password" placeholder="Minimal 6 karakter">
                    </div>
                    <button type="submit" class="btn-auth" id="btn-submit">Masuk</button>
                </form>

                <div class="divider">atau</div>
                <button class="btn-anonymous" id="btn-anonymous">✨ Masuk Sebagai Tamu (Tanpa Daftar)</button>
            </div>
        </div>

        <!-- SCREEN 2: MAIN APP -->
        <div id="app-screen">
            <header>
                <div class="user-info">
                    <div class="user-name" id="user-display-name">-</div>
                    <div class="user-phone" id="user-display-phone">-</div>
                </div>
                <button class="btn-logout" id="btn-logout">Keluar</button>
            </header>

            <main>
                <div class="dashboard-card">
                    <div class="stats-grid">
                        <div class="stat-box">
                            <div class="stat-label">Total Skor XP</div>
                            <div class="stat-val" id="display-xp">0</div>
                        </div>
                        <div class="stat-box">
                            <div class="stat-label">🔥 Streak</div>
                            <div class="stat-val" id="display-streak">0 Hari</div>
                        </div>
                    </div>
                </div>

                <h2 class="section-title">✅ Amalan Yaumi</h2>
                <div class="checklist-container" id="checklist-container"></div>

                <h2 class="section-title">📿 Tasbih Counter</h2>
                <div class="tasbih-card">
                    <div class="tasbih-display" id="tasbih-counter">0</div>
                    <div class="tasbih-buttons">
                        <button class="btn-reset" id="btn-tasbih-reset">Reset</button>
                        <button class="btn-count" id="btn-tasbih-count">TAP</button>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- FIREBASE MODULES -->
    <script type="module">
        import { initializeApp } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-app.js";
        import { getAuth, createUserWithEmailAndPassword, signInWithEmailAndPassword, signInAnonymously, signOut, onAuthStateChanged } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-auth.js";
        import { getFirestore, doc, getDoc, setDoc, updateDoc } from "https://www.gstatic.com/firebasejs/10.8.0/firebase-firestore.js";

        // For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyAJl2vGTmqdqZTtmUAb_d6VVyzj6UEaC6w",
  authDomain: "fstbq-app.firebaseapp.com",
  projectId: "fstbq-app",
  storageBucket: "fstbq-app.firebasestorage.app",
  messagingSenderId: "200677901168",
  appId: "1:200677901168:web:36789b12bdbc25ee6d05b5",
  measurementId: "G-X9VSBBWB0B"
};

        const app = initializeApp(firebaseConfig);
        const auth = getAuth(app);
        const db = getFirestore(app);

        let isLoginMode = true;
        let currentUserData = { totalXp: 0, streak: 0, lastActiveDate: "", completedAmalan: {}, tasbihCount: 0, nama: "", nomorHp: "" };
        let currentUid = null;

        const LIST_AMALAN = [
            { id: "sholat_wajib", name: "Sholat Wajib 5 Waktu", xp: 50, icon: "🕌" },
            { id: "sholat_dhuha", name: "Sholat Sunnah Dhuha", xp: 30, icon: "☀️" },
            { id: "tilawah_quran", name: "Tilawah Al-Qur'an", xp: 100, icon: "📖" },
            { id: "sedekah_harian", name: "Sedekah Harian", xp: 30, icon: "🪙" }
        ];

        // Toggle Login / Register View
        const tabLogin = document.getElementById('tab-login');
        const tabRegister = document.getElementById('tab-register');
        const groupName = document.getElementById('group-name');
        const groupPhone = document.getElementById('group-phone');
        const btnSubmit = document.getElementById('btn-submit');
        const inputEmail = document.getElementById('auth-email');
        const inputPassword = document.getElementById('auth-password');

        tabLogin.addEventListener('click', () => {
            isLoginMode = true;
            tabLogin.classList.add('active');
            tabRegister.classList.remove('active');
            groupName.style.display = 'none';
            groupPhone.style.display = 'none';
            inputEmail.required = true;
            inputPassword.required = true;
            btnSubmit.innerText = "Masuk";
        });

        tabRegister.addEventListener('click', () => {
            isLoginMode = false;
            tabRegister.classList.add('active');
            tabLogin.classList.remove('active');
            groupName.style.display = 'block';
            groupPhone.style.display = 'block';
            inputEmail.required = true;
            inputPassword.required = true;
            btnSubmit.innerText = "Daftar Akun Baru";
        });

        // Handle Form Submit (Daftar / Login Biasa)
        document.getElementById('auth-form').addEventListener('submit', async (e) => {
            e.preventDefault();
            document.getElementById('loading-overlay').style.display = 'flex';
            
            const email = inputEmail.value;
            const password = inputPassword.value;
            const nama = document.getElementById('auth-name').value;
            const phone = document.getElementById('auth-phone').value;

            try {
                if (isLoginMode) {
                    await signInWithEmailAndPassword(auth, email, password);
                } else {
                    const userCredential = await createUserWithEmailAndPassword(auth, email, password);
                    const user = userCredential.user;
                    
                    await setDoc(doc(db, "users", user.uid), {
                        nama: nama,
                        nomorHp: phone,
                        totalXp: 0,
                        streak: 1,
                        lastActiveDate: getTodayString(),
                        completedAmalan: {},
                        tasbihCount: 0
                    });
                }
            } catch (error) {
                document.getElementById('loading-overlay').style.display = 'none';
                alert("Gagal: " + error.message);
            }
        });

        // Handle LOGIN ANONYMOUS (Tamu)
        document.getElementById('btn-anonymous').addEventListener('click', async () => {
            document.getElementById('loading-overlay').style.display = 'flex';
            document.getElementById('loading-overlay').innerText = "Membuka gerbang tamu...";
            try {
                await signInAnonymously(auth);
            } catch (error) {
                document.getElementById('loading-overlay').style.display = 'none';
                alert("Gagal masuk mode tamu: " + error.message);
            }
        });

        // Sinkronisasi data ke dashboard aplikasi
        async function sinkronisasiData(user) {
            currentUid = user.uid;
            const todayStr = getTodayString();
            const docSnap = await getDoc(doc(db, "users", user.uid));

            if (docSnap.exists()) {
                currentUserData = docSnap.data();
            } else {
                // Jika user anonim masuk pertama kali, buat dokumen defaultnya di firestore
                if(user.isAnonymous) {
                    currentUserData = {
                        nama: "Tamu (Anonim)",
                        nomorHp: "Tanpa Nomor HP",
                        totalXp: 0,
                        streak: 1,
                        lastActiveDate: todayStr,
                        completedAmalan: {},
                        tasbihCount: 0
                    };
                    await setDoc(doc(db, "users", user.uid), currentUserData);
                }
            }

            document.getElementById('user-display-name').innerText = currentUserData.nama || "Tamu (Anonim)";
            document.getElementById('user-display-phone').innerText = currentUserData.nomorHp || "Tanpa Nomor HP";
            document.getElementById('display-xp').innerText = currentUserData.totalXp || 0;
            document.getElementById('display-streak').innerText = `${currentUserData.streak || 0} Hari`;
            document.getElementById('tasbih-counter').innerText = currentUserData.tasbihCount || 0;

            renderChecklist(todayStr);
            
            document.getElementById('loading-overlay').style.display = 'none';
            document.getElementById('auth-screen').style.display = 'none';
            document.getElementById('app-screen').style.display = 'flex';
        }

        function renderChecklist(todayStr) {
            const container = document.getElementById('checklist-container');
            container.innerHTML = "";
            const todayDone = currentUserData.completedAmalan[todayStr] || [];

            LIST_AMALAN.forEach(amalan => {
                const isChecked = todayDone.includes(amalan.id);
                const div = document.createElement('div');
                div.className = `amalan-item ${isChecked ? 'checked' : ''}`;
                div.innerHTML = `
                    <div class="amalan-info">
                        <div class="amalan-icon">${amalan.icon}</div>
                        <div>
                            <div class="amalan-name">${amalan.name}</div>
                            <div class="amalan-xp">+${amalan.xp} XP</div>
                        </div>
                    </div>
                    <div class="checkbox-wrapper"><input type="checkbox" ${isChecked ? 'checked' : ''}></div>
                `;

                div.querySelector('input').addEventListener('change', async (e) => {
                    if (!currentUserData.completedAmalan[todayStr]) currentUserData.completedAmalan[todayStr] = [];
                    const list = currentUserData.completedAmalan[todayStr];

                    if (e.target.checked) {
                        list.push(amalan.id);
                        currentUserData.totalXp += amalan.xp;
                    } else {
                        const idx = list.indexOf(amalan.id);
                        if (idx > -1) list.splice(idx, 1);
                        currentUserData.totalXp = Math.max(0, currentUserData.totalXp - amalan.xp);
                    }

                    document.getElementById('display-xp').innerText = currentUserData.totalXp;
                    div.classList.toggle('checked', e.target.checked);
                    await updateDoc(doc(db, "users", currentUid), { totalXp: currentUserData.totalXp, completedAmalan: currentUserData.completedAmalan });
                });

                container.appendChild(div);
            });
        }

        // Tasbih Button Events
        document.getElementById('btn-tasbih-count').addEventListener('click', async () => {
            currentUserData.tasbihCount = (currentUserData.tasbihCount || 0) + 1;
            document.getElementById('tasbih-counter').innerText = currentUserData.tasbihCount;
            await updateDoc(doc(db, "users", currentUid), { tasbihCount: currentUserData.tasbihCount });
        });

        document.getElementById('btn-tasbih-reset').addEventListener('click', async () => {
            currentUserData.tasbihCount = 0;
            document.getElementById('tasbih-counter').innerText = 0;
            await updateDoc(doc(db, "users", currentUid), { tasbihCount: 0 });
        });

        function getTodayString() {
            const d = new Date();
            return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`;
        }

        // Auth State Observer
        onAuthStateChanged(auth, (user) => {
            if (user) {
                sinkronisasiData(user);
            } else {
                document.getElementById('loading-overlay').style.display = 'none';
                document.getElementById('app-screen').style.display = 'none';
                document.getElementById('auth-screen').style.display = 'flex';
                currentUid = null;
            }
        });

        document.getElementById('btn-logout').addEventListener('click', () => { signOut(auth); });
    </script>
</body>
</html>
