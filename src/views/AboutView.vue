<template>
  <div class="about">
    <div class="container">
    <h1>Bootstrap Table Example</h1>
    <table class="table table-striped table-hover">
        <thead class="thead-dark">
          <tr>
            <th scope="col">#</th>
            <th scope="col">Match</th>
            <th scope="col">Predicted Winner</th>
            <th scope="col">Bet Amount</th>
            <th scope="col">Potential Payout</th>
            <th scope="col">Status</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row">1</th>
            <td>Team A vs. Team B</td>
            <td>Team A</td>
            <td>10 ETH</td>
            <td>18 ETH</td>
            <td>Won</td>
          </tr>
          <tr>
            <th scope="row">2</th>
            <td>Team C vs. Team D</td>
            <td>Team D</td>
            <td>15 ETH</td>
            <td>27 ETH</td>
            <td>Lost</td>
          </tr>
        
        </tbody>
      </table>
  </div>
  </div>
</template>
