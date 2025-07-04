// Sidebar toggle
function toggleSidebar() {
    document.getElementById("sidebar").classList.toggle("active");
    document.querySelector(".navbar").classList.toggle("collapsed");
    document.querySelector(".content").classList.toggle("collapsed");
}

// Dark mode toggle
document.getElementById("darkModeToggle").addEventListener("click", function () {
    document.body.classList.toggle("dark-mode");
    const icon = this.querySelector("i");
    icon.classList.toggle("bx-sun");
    icon.classList.toggle("bx-moon");
});

// Search filter
function filterTable() {
    const input = document.getElementById("searchInput").value.toLowerCase();
    const rows = document.querySelectorAll("#mahasiswaTable tbody tr");
    rows.forEach(row => {
        const nama = row.cells[2].innerText.toLowerCase();
        const nim = row.cells[1].innerText.toLowerCase();
        row.style.display = (nama.includes(input) || nim.includes(input)) ? "" : "none";
    });
}

document.getElementById("searchInput").addEventListener("keyup", filterTable);

function validateForm() {
    const nim = document.getElementById("nim").value.trim();
    const nama = document.getElementById("nama").value.trim();
    const nilai = document.getElementById("nilai").value;
    const matkul = document.getElementById("matkul").value.trim();
    const kelas = document.getElementById("kelas").value.trim();

    if (!nim || !nama || !matkul || !kelas || nilai === "") {
        alert("Semua field harus diisi!");
        return false;
    }

    if (isNaN(nilai) || nilai < 0 || nilai > 100) {
        alert("Nilai harus berupa angka antara 0 dan 100.");
        return false;
    }

    return true;
}

function updateClock() {
    const clock = document.getElementById('clock-time');
    if (!clock) return; // Jangan update jika elemen belum ada

    const now = new Date();
    const days = ['Minggu','Senin','Selasa','Rabu','Kamis','Jumat','Sabtu'];
    const dayName = days[now.getDay()];
    
    const date = now.getDate().toString().padStart(2, '0');
    const month = now.toLocaleString('id-ID', { month: 'long' });
    const year = now.getFullYear();
    
    const hours = now.getHours().toString().padStart(2, '0');
    const minutes = now.getMinutes().toString().padStart(2, '0');
    const seconds = now.getSeconds().toString().padStart(2, '0');

    const timeString = `${dayName}, ${date} ${month} ${year} - ${hours}:${minutes}:${seconds}`;
    clock.textContent = timeString;
}

setInterval(updateClock, 1000);
window.addEventListener("DOMContentLoaded", updateClock);


