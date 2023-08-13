// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// In your application.js or separate JavaScript file
document.addEventListener('turbo:load', function() {
    const addToCartButtons = document.querySelectorAll('[data-action="click->cart#add"]');
  
    addToCartButtons.forEach(button => {
      button.addEventListener('turbo:submit-end', event => {
        Turbo.visit('/carts/show');
      });
    });
  });
  