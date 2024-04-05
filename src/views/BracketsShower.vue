<template>
  <div class="brackets">
    <div class="container mt-5 py-1">
      <h1 class="text-center mb-4">Esports Tournament Brackets</h1>
      
      <div class="row justify-content-center">
        <div class="col">
          <h2 class="text-center">Quarter Finals</h2>
        </div>
        <div class="col">
          <h2 class="text-center">Semi Finals</h2>
        </div>
        <div class="col">
          <h2 class="text-center">Finals</h2>
        </div>
      </div>
      
      <div class="container mt-5 py-1">
      
      
      <div class="bracket-columns py-4">
        <!-- Quarter Finals -->
        <div class="bracket-column justify-content-center">
          <div class="bracket-round">
            <div class="bracket-matches">
              <div v-for="(match, matchIndex) in tournamentRounds[0]" :key="matchIndex" class="bracket-match">
                <div class="match-details">
                  <p>{{ match.team1 }} vs. {{ match.team2 }}</p>
                </div>
                <div class="connector"></div> <!-- Connector line -->
              </div>
            </div>
          </div>
        </div>
        
        <!-- Semi Finals -->
        <div class="bracket-column justify-content-center">
          <div class="bracket-round">
            <div class="bracket-matches">
              <!-- Semi Finals Left Bracket -->
              <div v-for="(match, matchIndex) in tournamentRounds[1]" :key="matchIndex" class="bracket-match">
                <div class="match-details">
                  <p v-if="semiFinalWinners[matchIndex]">{{ semiFinalWinners[matchIndex] }} (Winner)</p>
                  <p v-else>{{ match.team1 }} vs. {{ match.team2 }}</p>
                </div>
                <div class="connector-left"></div> <!-- Connector line -->
                <div class="connector-right"></div> <!-- Connector line -->
              </div>
            </div>
          </div>
        </div>
        
        <!-- Finals -->
        <div class="bracket-column justify-content-center">
          <div class="bracket-round">
            <div class="bracket-matches">
              <div v-for="(match, matchIndex) in tournamentRounds[2]" :key="matchIndex" class="bracket-match">
                <div class="match-details">
                  <p>{{ match.team1 }} vs. {{ match.team2 }}</p>
                </div>
                <div class="connector-right"></div> <!-- Connector line -->
              </div>
            </div>
          </div>
        </div>
      </div>

          <h2>Upcoming Matches</h2>
      <div class="brackets-table table-responsive">
        <table class="table table-striped">
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
            <!-- Placeholder content -->
            <tr>
              <th scope="row">1</th>
              <td>Team A vs. Team B</td>
              <td>Team A</td>
              <td>10 ETH</td>
              <td>18 ETH</td>
              <td>Pending</td>
            </tr>
            <tr>
              <th scope="row">2</th>
              <td>Team C vs. Team D</td>
              <td>Team D</td>
              <td>15 ETH</td>
              <td>27 ETH</td>
              <td>Pending</td>
            </tr>
            <!-- Add more upcoming matches here -->
            <tr>
              <th scope="row">3</th>
              <td>Team E vs. Team F</td>
              <td>Team E</td>
              <td>20 ETH</td>
              <td>36 ETH</td>
              <td>Pending</td>
            </tr>
          </tbody>
        </table>
      </div>

      <!-- Past Match Results -->
      <h2>Past Match Results</h2>
      <div class="brackets-table table-responsive">
        <table class="table table-striped">
          <thead class="thead-dark">
            <tr>
              <th scope="col">#</th>
              <th scope="col">Match</th>
              <th scope="col">Winner</th>
              <th scope="col">Bet Amount</th>
              <th scope="col">Payout</th>
              <th scope="col">Status</th>
            </tr>
          </thead>
          <tbody>
            <!-- Placeholder content -->
            <tr>
              <th scope="row">1</th>
              <td>Team G vs. Team H</td>
              <td>Team H</td>
              <td>25 ETH</td>
              <td>45 ETH</td>
              <td>Won</td>
            </tr>
            <!-- Add more past match results here -->
            <tr>
              <th scope="row">2</th>
              <td>Team I vs. Team J</td>
              <td>Team I</td>
              <td>30 ETH</td>
              <td>54 ETH</td>
              <td>Lost</td>
            </tr>
          </tbody>
        </table>
      </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'BracketsShower',
  data() {
    return {
      tournamentRounds: [
        // Quarter Finals
        [
          { team1: 'Team A', team2: 'Team B' },
          { team1: 'Team C', team2: 'Team D' },
          { team1: 'Team E', team2: 'Team F' },
          { team1: 'Team G', team2: 'Team H' }
        ],
        // Semi Finals
        [
          { team1: 'Winner QF1', team2: 'Winner QF2' },
          { team1: 'Winner QF3', team2: 'Winner QF4' }
        ],
        // Finals
        [
          { team1: 'Winner SF1', team2: 'Winner SF2' }
        ]
      ],
      semiFinalWinners: ['Winner SF1', 'Winner SF2']
    };
  }
}
</script>


<style>
  .brackets {
    display: flex;
    justify-content: center;
  }
  

  .bracket-columns {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    grid-column-gap: 30px;
  }

  .bracket-column {
  display: flex;
  flex-direction: column;
  align-items: center !important; /* Center items horizontally */
  margin-bottom: 30px;
}

.bracket-round {
  display: flex;
  flex-direction: column;
  align-items: center !important; /* Center items horizontally */
}

  .bracket-matches {
    display: flex;
    flex-direction: column;
    align-items: center; /* Center items horizontally */
    margin-top: 10px;
  }

  
  .connector {
    position: absolute;
    top: 50%;
    width: 50px; /* Adjust length of connector line */
    height: 2px; /* Adjust thickness of connector line */
    background-color: #000; /* Adjust color of connector line */
    left: 100%; /* Position the connector line at the end of the match */
    transform: translateY(-50%); /* Center the connector line vertically */
  }
  
  .winner-connector {
    position: absolute;
    width: 50px; /* Adjust length of connector line */
    height: 2px; /* Adjust thickness of connector line */
    background-color: #000; /* Adjust color of connector line */
    left: 100%; /* Position the connector line at the end of the match */
    top: 50%; /* Position the connector line vertically in the middle */
    transform: translateY(-1px); /* Adjust vertical position for perfect alignment */
  }

  .bracket-match {
    position: relative; /* Required for absolute positioning of the connector */
    width: 100%;
    border: 1px solid #ccc;
    padding: 10px;
    border-radius: 5px;
    margin-bottom: 10px;
  }


  .match-details {
    font-weight: bold;
  }

  @media (max-width: 768px) {
    .winner-connector {
      width: 30px; /* Adjust length of connector line */
      height: 2px; /* Adjust thickness of connector line */
      background-color: #000; /* Adjust color of connector line */
      left: 100%; /* Position the connector line at the end of the match */
      top: 50%; /* Position the connector line vertically in the middle */
      transform: translateY(-1px); /* Adjust vertical position for perfect alignment */
    }}


    .connector-left,
  .connector-right {
    position: absolute;
    top: 50%;
    width: 50px; /* Adjust length of connector line */
    height: 2px; /* Adjust thickness of connector line */
    background-color: #000; /* Adjust color of connector line */
    transform: translateY(-50%); /* Center the connector line vertically */
  }
  
  .connector-left {
    left: 100%; /* Position the connector line at the end of the left bracket */
  }
  
  .connector-right {
    right: 100%; /* Position the connector line at the end of the right bracket */
  }

</style>

