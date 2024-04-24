<template>
  <div id="app">
    <header>
      <nav id="nav" class="navbar bg-dark navbar-light navbar-expand-lg  px-3 py-2">
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
    
    <div class=" GradientBlackGreen">
<br>
<br>
<br>
<br>
<br>

    </div>
    <router-view />

    <div class=" GradientBlackGreenReverted">
<br>
<br>
<br>
<br>
<br>

    </div>
    
    <footer>
  <div class="bg-dark px-5 py-4">
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <h5 class="text-light">About Esports Tournaments through Blockchain</h5>
          <p class="text-light">Explore the exciting world of esports powered by blockchain technology. Join us as we revolutionize competitive gaming with transparency, security, and decentralization.</p>
        </div>
        <div class="col-md-4">
          <h5 class="text-light">Follow Us</h5>
          <ul class="social list-inline">
            <li class="list-inline-item">
              <a href="https://www.facebook.com/" target="_blank" class="text-light"><i class="fab fa-facebook">FB</i></a>
            </li>
            <li class="list-inline-item">
              <a href="https://www.instagram.com/" target="_blank" class="text-light"><i class="fab fa-instagram">I</i></a>
            </li>
            <li class="list-inline-item">
              <a href="https://twitter.com/" target="_blank" class="text-light"><i class="fab fa-twitter">X</i></a>
            </li>
            <li class="list-inline-item">
              <a href="https://www.youtube.com/" target="_blank" class="text-light"><i class="fab fa-youtube">YT</i></a>
            </li>
          </ul>
        </div>
        <div class="col-md-4">
          <h5 class="text-light">Contact Us</h5>
          <p class="text-light">For inquiries and support, reach out to us:</p>
          <p class="text-light">Email: contact@esportsblox.com</p>
          <p class="text-light">Phone: +1 (123) 456-7890</p>
        </div>
      </div>
    </div>
  </div>
</footer>
  </div>
</template>

<script>



</script>


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
      font-size: 20px;
      
    }
  }
}
</style>
