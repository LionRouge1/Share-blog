// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// show avatar when on registration when avatar change
const avatar_input = document.getElementById('avatar_input');
const avatar_box = document.getElementById('avatar_box');

avatar_input.addEventListener('change', function() {
    const reader = new FileReader();
    reader.addEventListener('load', function() {
        const uploaded_image = reader.result;
        avatar_box.innerHTML = `<img src=${uploaded_image} title="avatar" >`;
    });
    console.log(reader);
    reader.readAsDataURL(this.files[0]);
})