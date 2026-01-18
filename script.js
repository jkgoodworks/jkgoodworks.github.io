// Expandable sections functionality
document.addEventListener('DOMContentLoaded', function () {
    const expandableSections = document.querySelectorAll('.expandable-section');

    expandableSections.forEach(section => {
        const preview = section.querySelector('.section-preview');
        // Pre-calculate height for smoother animation might be complex with dynamic content,
        // relying on CSS max-height transition is safer and smoother than JS height manipulation.

        preview.addEventListener('click', function () {
            // Close all other expanded sections
            expandableSections.forEach(otherSection => {
                if (otherSection !== section && otherSection.classList.contains('expanded')) {
                    otherSection.classList.remove('expanded');
                }
            });

            // Toggle current section
            section.classList.toggle('expanded');

            // wait for transition to start before scrolling
            if (section.classList.contains('expanded')) {
                setTimeout(() => {
                    const headerOffset = 80;
                    const elementPosition = section.getBoundingClientRect().top;
                    const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

                    window.scrollTo({
                        top: offsetPosition,
                        behavior: "smooth"
                    });
                }, 300);
            }
        });
    });

    // Publications tabs functionality (Removed for now as content is empty)
    /*
    const tabButtons = document.querySelectorAll('.tab-button');
    const tabContents = document.querySelectorAll('.tab-content');

    tabButtons.forEach(button => {
        button.addEventListener('click', function() {
            const targetTab = this.getAttribute('data-tab');
            const targetElement = document.getElementById(targetTab + '-tab');

            if (targetElement) {
                // Remove active class from all buttons and contents
                tabButtons.forEach(btn => btn.classList.remove('active'));
                tabContents.forEach(content => content.classList.remove('active'));

                // Add active class to clicked button and corresponding content
                this.classList.add('active');
                targetElement.classList.add('active');
            }
        });
    });
    */

    // Intersection Observer for fade-in animations
    const observerOptions = {
        threshold: 0.15, // Slightly higher threshold to avoid triggering too early
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver(function (entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                // Stop observing once visible to save resources
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    // Observe elements for animation
    const animatedElements = document.querySelectorAll('.offer-card, .project-card, .video-card, .article-card, .paper-card, .hero-content');

    animatedElements.forEach((el, index) => {
        el.classList.add('fade-in-element');
        // Add a small delay based on index for staggered effect (optional, handled in CSS better usually)
        observer.observe(el);
    });
});

// Smooth scrolling for navigation links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();

        const targetId = this.getAttribute('href');
        if (targetId === '#') return;

        const target = document.querySelector(targetId);
        if (target) {
            // If target is an expandable section, expand it
            if (target.classList.contains('expandable-section')) {
                // Close all expanded sections first
                document.querySelectorAll('.expandable-section').forEach(section => {
                    section.classList.remove('expanded');
                });

                // Expand the target section
                target.classList.add('expanded');
            }

            const headerOffset = 80;
            const elementPosition = target.getBoundingClientRect().top;
            const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

            window.scrollTo({
                top: offsetPosition,
                behavior: "smooth"
            });
        }
    });
});

// Optimized Parallax Effect using requestAnimationFrame
let lastScrollY = window.pageYOffset;
let ticking = false;

function updateParallax() {
    const hero = document.querySelector('.hero'); // Changed from .hero-section to .hero to match HTML
    if (hero) {
        const scrolled = window.pageYOffset;
        // Limit the effect to when hero is visible
        if (scrolled < hero.offsetHeight) {
            hero.style.transform = `translateY(${scrolled * 0.3}px)`; // Reduced speed for subtler effect
        }
    }

    // Header shadow effect
    const header = document.querySelector('.header');
    if (header) {
        if (window.scrollY > 20) { // Trigger earlier
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    }

    ticking = false;
}

window.addEventListener('scroll', () => {
    lastScrollY = window.pageYOffset;
    if (!ticking) {
        window.requestAnimationFrame(() => {
            updateParallax();
        });
        ticking = true;
    }
});

// Project dropdown functionality
const HOVER_DELAY = 300; // Reduced delay for snappier feel

document.addEventListener('DOMContentLoaded', function () {
    const dropdowns = document.querySelectorAll('.project-dropdown');

    dropdowns.forEach(dropdown => {
        const menu = dropdown.querySelector('.dropdown-menu');
        let hoverTimeout;

        dropdown.addEventListener('mouseenter', function () {
            clearTimeout(hoverTimeout);
            menu.classList.add('show');
        });

        dropdown.addEventListener('mouseleave', function () {
            hoverTimeout = setTimeout(() => {
                menu.classList.remove('show');
            }, HOVER_DELAY);
        });
    });
});
