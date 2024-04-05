<template>
  <div id="app">
    <header>
      <nav id="nav" class="navbar bg-dark navbar-light navbar-expand-lg border-greenC px-3 py-2">
        <div class="container">
          <a class="navbar-brand" href="/"> 
            <img src="../src/assets/Logo2.png" alt="Level Up Bet Logo" class="logo ">
          </a>

          <button
            class="navbar-toggler border-greenC"
            type="button"
            data-toggle="collapse"
            data-target="#navbarResponsive"
            aria-controls="navbarResponsive"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                <router-link to="/" class="nav-link">Home</router-link>
              </li>
              <li class="nav-item">
                <router-link to="/about" class="nav-link">About</router-link>
              </li>
              <li class="nav-item">
                <router-link to="/Brackets" class="nav-link">Brackets</router-link>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <router-view />

    <footer>
  <div class="border-greenC bg-dark px-5 py-4">
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <h5 class="text-light">About Us</h5>
          <p class="text-light">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam gravida magna nec metus posuere, sed ultricies justo sodales.</p>
        </div>
        <div class="col-md-4">
          <h5 class="text-light">Follow Us</h5>
          <ul class="social list-inline">
            <li class="list-inline-item">
              <a href="https://www.facebook.com/" target="_blank" class="text-light"><i class="fab fa-facebook"></i></a>
            </li>
            <li class="list-inline-item">
              <a href="https://www.instagram.com/" target="_blank" class="text-light"><i class="fab fa-instagram"></i></a>
            </li>
            <li class="list-inline-item">
              <a href="https://twitter.com/" target="_blank" class="text-light"><i class="fab fa-twitter"></i></a>
            </li>
            <li class="list-inline-item">
              <a href="https://www.youtube.com/" target="_blank" class="text-light"><i class="fab fa-youtube"></i></a>
            </li>
          </ul>
        </div>
        <div class="col-md-4">
          <h5 class="text-light">Opening Hours</h5>
          <p class="text-light">Monday - Friday: 07:00 AM - 11:00 PM</p>
          <p class="text-light">Saturday - Sunday: 08:00 AM - 10:00 PM</p>
        </div>
      </div>
    </div>
  </div>
</footer>
  </div>
</template>


<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #afafaf;

    &.router-link-exact-active {
      color: #247606;
    }
  }
}
</style>
