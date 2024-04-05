<template>
  <div class="home">

    <div id="carouselExampleIndicators" class="carousel slide px-5 py-4" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img class="d-block w-100" src="https://via.placeholder.com/800x400" alt="First slide">
        </div>
        <div class="carousel-item">
          <img class="d-block w-100" src="https://via.placeholder.com/800x400" alt="Second slide">
        </div>
        <div class="carousel-item">
          <img class="d-block w-100" src="https://via.placeholder.com/800x400" alt="Third slide">
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
          <div class="card">
            <img class="card-img-top" src="https://via.placeholder.com/300" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">Card 1</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-4">
          <div class="card">
            <img class="card-img-top" src="https://via.placeholder.com/300" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">Card 2</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-4">
          <div class="card">
            <img class="card-img-top" src="https://via.placeholder.com/300" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">Card 3</h5>
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            </div>
          </div>
        </div>
      </div>
      <div class="container mt-5">
      <div class="row">
        <div class="col-md-6">
          <h2>Featured Content</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam gravida magna nec metus posuere, sed ultricies justo sodales.</p>
          <a href="#" class="btn btn-primary">Read More</a>
        </div>
        <div class="col-md-6">
          <img src="https://via.placeholder.com/600x300" alt="Featured Image" class="img-fluid">
        </div>
      </div>
    </div>

    <!-- Services Section -->
    <div class="container mt-5">
      <h2>Our Services</h2>
      <div class="row">
        <div class="col-md-4">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Service 1</h5>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam gravida magna nec metus posuere, sed ultricies justo sodales.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Service 2</h5>
              <p class="card-text">Ut accumsan arcu in dolor fermentum, vel blandit diam molestie.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Service 3</h5>
              <p class="card-text">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
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
