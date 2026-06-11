/* ============================================
   SOS.RESPIRA - INTERACTIVE JAVASCRIPT
   ============================================ */

// Breathing Orb Interaction
const breathingOrb = document.querySelector('.breathing-orb');
let isBreathing = false;
let breathingSession = null;

// Start breathing meditation on button click
const ctaButtons = document.querySelectorAll('.cta-button');
ctaButtons.forEach(button => {
    button.addEventListener('click', startBreathingSession);
});

// Breathing pattern: 4s inhale, 4s hold, 4s exhale
function startBreathingSession() {
    if (isBreathing) return;
    
    isBreathing = true;
    console.log('🌊 Iniciando sessão de meditação...');
    
    // Visual feedback
    alert('Respire com o orbe. Siga o ciclo: Inspire (4s) → Segure (4s) → Expire (4s)\n\nClique novamente para parar.');
    
    // You could expand this to include audio, full-screen mode, etc.
}

// Smooth scroll for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Navbar scroll effect
window.addEventListener('scroll', () => {
    const navbar = document.querySelector('.navbar');
    if (window.scrollY > 50) {
        navbar.style.background = 'rgba(10, 22, 40, 0.98)';
        navbar.style.boxShadow = '0 5px 30px rgba(46, 196, 199, 0.1)';
    } else {
        navbar.style.background = 'rgba(10, 22, 40, 0.95)';
        navbar.style.boxShadow = 'none';
    }
});

// Intersection Observer for animations on scroll
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -100px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.animation = 'fadeInUp 0.8s ease-out forwards';
            observer.unobserve(entry.target);
        }
    });
}, observerOptions);

// Observe feature cards and items
document.querySelectorAll('.feature-card, .feature-item').forEach(el => {
    el.style.opacity = '0';
    observer.observe(el);
});

// Enhanced breathing orb with mouse interaction
breathingOrb?.addEventListener('mouseenter', () => {
    breathingOrb.style.filter = 'brightness(1.2)';
});

breathingOrb?.addEventListener('mouseleave', () => {
    breathingOrb.style.filter = 'brightness(1)';
});

// Performance optimization - reduce animations on mobile
const isMobile = window.innerWidth < 768;
if (isMobile) {
    document.documentElement.style.setProperty('--animation-duration', '0.5s');
}

// Load custom cursor if needed (optional enhancement)
document.addEventListener('mousemove', (e) => {
    // Could add parallax effects here
});

// Preload fonts
const link = document.createElement('link');
link.rel = 'preload';
link.as = 'font';
link.href = 'https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;600;700&display=swap';
link.crossOrigin = 'anonymous';
document.head.appendChild(link);

console.log('🌊✨ Sos.respira carregado com sucesso!');
