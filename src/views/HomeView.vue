<template>
  <div class="home">

    <div id="carouselExampleIndicators" class="carousel slide px-5 py-4 border-greenC bg-dark" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img class="d-block w-100" src="@/assets/esports.jpg" alt="Esports">
        </div>
        <div class="carousel-item">
          <img class="d-block w-100" src="@/assets/esports1.webp" alt="Second slide">
        </div>
        <div class="carousel-item">
          <img class="d-block w-100" src="@/assets/esports3.jpg" alt="Third slide">
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>

    <!-- Cards -->
    <div class="container mt-5 px-5 py-5">
  <div class="row">
    <div class="col-md-4 mb-4">
      <div class="card border-greenC bg-dark text-white">
        <img class="card-img-top" src="@/assets/photo1.webp" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Blockchain Transparency</h5>
          <p class="card-text">Experience transparent and tamper-proof betting transactions with blockchain technology, ensuring fairness and trust in every wager.</p>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-4">
      <div class="card border-greenC bg-dark text-white">
        <img class="card-img-top" src="@/assets/photo2.jpg" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Secure Betting Platform</h5>
          <p class="card-text">Bet securely on esports tournaments with our blockchain-powered platform. Your funds and personal information are protected by advanced encryption.</p>
        </div>
      </div>
    </div>
    <div class="col-md-4 mb-4">
      <div class="card border-greenC bg-dark text-white">
        <img class="card-img-top" src="@/assets/photo3.webp" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Decentralized Betting</h5>
          <p class="card-text">Join the decentralized revolution in esports betting. With blockchain technology, betting is decentralized, ensuring autonomy and independence for all participants.</p>
        </div>
      </div>
    </div>
  </div>


    <!-- Services Section -->
    <div class="container mt-5">
  <h2 class="h2 py-3">Our Betting Services</h2>
  <div class="row">
    <div class="col-md-4">
      <div class="card">
        <div class="card-body border-greenC bg-dark text-white">
          <h5 class="card-title"> Betting</h5>
          <p class="card-text">Experience the thrill of betting on esports tournaments. Bet on your favorite teams and players as the action unfolds in real-time.</p>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card">
        <div class="card-body border-greenC bg-dark text-white">
          <h5 class="card-title">In-Play Analysis</h5>
          <p class="card-text">Get comprehensive in-play analysis and statistics to make informed betting decisions. Stay ahead with real-time data and insights.</p>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card">
        <div class="card-body border-greenC bg-dark text-white">
          <h5 class="card-title">Secure Transactions</h5>
          <p class="card-text">Enjoy secure transactions and fair play with our blockchain-based betting platform. Your bets are safe and your winnings are guaranteed.</p>
        </div>
      </div>
    </div>
  </div>

    </div>
    </div>

  </div>
</template>

<script>
// @ is an alias to /src


export default {
  name: 'HomeView',
  components: {
    
  }
}
</script>
