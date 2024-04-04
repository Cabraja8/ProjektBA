<template>
  <div id="app">
    <header>
      <nav id="nav" class="navbar bg-light navbar-light navbar-expand-lg">
    <div class="container">
      <a class="navbar-brand" href="/">Your App Name</a>

      <button
        class="navbar-toggler"
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
           
           <router-link to="/" class="nav-link"
                 >Home</router-link
               >
         </li>
         <li class="nav-item">
           <router-link to="/about" class="nav-link"
                 >About</router-link>
         </li>
         <li class="nav-item">
           <router-link to="/Brackets" class="nav-link"
                 >Brackets</router-link>
         </li>
        </ul>
      </div>
    </div>
  </nav>
</header>

<router-view />

<footer>
      <div class="container">
        <div class="row text-light bg-light text-center py-4 justify-content-center">
          <div class="col-sm-10 col-md-8-col-lg-6">
            <img src="" alt="" />
            <p>"Gamers"</p>
            <ul class="social pt-3">
              <li>
                <a href="https://www.facebook.com/" target="_blank"
                  ><i class="fab fa-facebook"></i
                ></a>
              </li>
              <li>
                <a href="https://www.instagram.com/" target="_blank"
                  ><i class="fab fa-instagram"></i
                ></a>
              </li>
              <li>
                <a href="https://twitter.com/" target="_blank"
                  ><i class="fab fa-twitter"></i
                ></a>
              </li>
              <li>
                <a href="https://www.youtube.com/" target="_blank"
                  ><i class="fab fa-youtube"></i
                ></a>
              </li>
            </ul>
            <br />
            <p>Radno vrijeme: 07:00h-23:00h</p>
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
    color: #5b5555;

    &.router-link-exact-active {
      color: #4C9A7E;
    }
  }
}
</style>
