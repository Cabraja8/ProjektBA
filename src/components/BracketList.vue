<template>
    <div class="brackets">

    
        <div class="container mt-5 py-1">
      <h1 class="h1 py-3">Tournament Bracket</h1>
      <div class="tournament-container">
      <div class="tournament-headers">
        <h3>Round of 16</h3>
        <h3>Quarter-Finals</h3>
        <h3>Semi-Finals</h3>
        <h3>Final</h3>
        <h3>Winner</h3>
      </div>
      
      <div class="tournament-brackets">
        <ul class="bracket bracket-1">
  <li class="team-item">{{ teams[0].name }} <time>{{ teams[0].time }}</time> {{ teams[1].name }}</li>
  <li class="team-item">{{ teams[2].name }} <time>{{ teams[2].time }}</time> {{ teams[3].name }}</li>
  <li class="team-item">{{ teams[4].name }} <time>{{ teams[4].time }}</time> {{ teams[5].name }}</li>
  <li class="team-item">{{ teams[6].name }} <time>{{ teams[6].time }}</time> {{ teams[7].name }}</li>
  <li class="team-item">{{ teams[8].name }} <time>{{ teams[8].time }}</time> {{ teams[9].name }}</li>
  <li class="team-item">{{ teams[10].name }} <time>{{ teams[10].time }}</time> {{ teams[11].name }}</li>
  <li class="team-item">{{ teams[12].name }} <time>{{ teams[12].time }}</time> {{ teams[13].name }}</li>
  <li class="team-item">{{ teams[14].name }} <time>{{ teams[14].time }}</time> {{ teams[15].name }}</li>
</ul>
        <ul class="bracket bracket-2">
          <li class="team-item">? <time>20:00</time> ?</li>
          <li class="team-item">? <time>20:00</time> ?</li>
          <li class="team-item">? <time>20:00</time> ?</li>
          <li class="team-item">? <time>20:00</time> ?</li>
        </ul>  
        <ul class="bracket bracket-3">
          <li class="team-item">? <time>20:00</time> ?</li>
          <li class="team-item">? <time>20:00</time> ?</li>
        </ul>  
        <ul class="bracket bracket-4">
          <li class="team-item">? <time>20:00</time> ?</li>
        </ul>  
      
        <ul class="bracket bracket-5">
          <li class="team-item">?</li>
        </ul>  
      </div>
      </div>
      


        </div>
        <div class="container py-4">
          
  <h2 class="h2 py-3">Make winner</h2>

  <table class="table  ">
    <thead class="thead-dark">
      <tr>
        <th>Team</th>
        
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <select v-model="WinningTeam" >
            <option v-for="(team, index) in teams" :key="index" :value="team">{{ team.name }}</option>
          </select>
        </td>
      
        <td>
          <button @click="MakeWinner(WinningTeam)" class="btn btnDarkGreen">Choose winner</button>
        </td>
      </tr>
    </tbody>
  </table>
</div>

        
        
       
        <div class="container py-4" >
          <p>Logged in as: {{ account }}</p>
  <h2 class="h2 py-3">ETH Betting Table</h2>

  <main role="main" class="col-lg-12 d-flex">
    <div v-if="loading" id="loader" class="text-center">
      <p class="text-center">Loading...</p>
    </div>
    <div v-else>
      <!-- Place your content here -->
      <p>This is the content when not loading</p>
    </div>
  </main>

  <table class="table  ">
    <thead class="thead-dark">
      <tr>
        <th>Team</th>
        <th>Bet Amount (ETH)</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>
          <select v-model="selectedTeam">
            <option v-for="(team, index) in teams" :key="index" :value="team">{{ team.name }}</option>
          </select>
        </td>
        <td>
          <input type="number" v-model="selectedTeam.betAmount" class="form-control">
        </td>
        <td>
          <button @click="placeBet(selectedTeam)" class="btn btnDarkGreen">Place Bet</button>
        </td>
      </tr>
    </tbody>
  </table>
</div>
        
    </div>
</template>


<script>

import Web3 from 'web3';
import bet  from '@/abis/bet.json';
export default {

    name:"BracketList",
    


    data() {
    return {
      IsOwner: false,
      account: '',
      loading: true,
      Bet: null,
      WinningTeam:"",
      selectedTeam: { name: "", betAmount: 0 },
      teams : [
    { id: "0", name: "Cloud9", betAmount: 0, time: "14:00" },
    { id: "1", name: "Fnatic", betAmount: 0, time: "14:00" },
    { id: "2", name: "Rogue", betAmount: 0, time: "20:00" },
    { id: "3", name: "G2 Esports", betAmount: 0, time: "20:00" },
    { id: "4", name: "T1", betAmount: 0, time: "17:00" },
    { id: "5", name: "Gen.G", betAmount: 0, time: "17:00" },
    { id: "6", name: "DWG KIA", betAmount: 0, time: "20:00" },
    { id: "7", name: "EDward Gaming", betAmount: 0, time: "20:00" },
    { id: "8", name: "Team Liquid", betAmount: 0, time: "17:00" },
    { id: "9", name: "TSM", betAmount: 0, time: "17:00" },
    { id: "10", name: "Invictus Gaming", betAmount: 0, time: "17:00" },
    { id: "11", name: "Team WE", betAmount: 0, time: "17:00" },
    { id: "12", name: "Misfits Gaming", betAmount: 0, time: "14:00" },
    { id: "13", name: "Schalke 04 Esports", betAmount: 0, time: "14:00" },
    { id: "14", name: "Origen", betAmount: 0, time: "20:00" },
    { id: "15", name: "Vitality", betAmount: 0, time: "20:00" }
]
    };
  },
  async created() {
    this.web3 = new Web3(window.web3.currentProvider);
    await this.loadWeb3();
    await this.loadBlockchainData();
    this.loading = false;   
    this.IsOwner = await this.Bet.methods.isOwner().call();
  },
  methods: {


  
 
    placeBet(team) {

    // Perform actions when the bet is placed
    console.log(`Bet placed on ${team.name} for $${team.betAmount}`);

    const name = this.account;
    const STeam = team.id; 
    const betAmount = window.web3.utils.toWei(team.betAmount.toString(), 'ether'); 

    console.log("Name:", name);
    console.log("Team 1:", STeam);
    console.log("Bet Amount:", betAmount);


   this.createBet(name,STeam,betAmount);

   
},  
async createBet(name, teamId, betAmount) {
      this.loading = true;
      //let address = "0xb1ecb4a1c87e5d930369B29E08C6d8b9882ea28f"
      const accounts = await window.ethereum.request({
        
        method: 'eth_requestAccounts',
    });
    console.log(accounts);
      await this.Bet.methods.createBet(name, teamId).send({ from: this.account, value: betAmount }).on('receipt', (receipt) => {
            console.log("Transaction receipt:", receipt);
            this.loading = false; 
        });

  },

 

  async loadWeb3() {
      
      if (window.ethereum) {
        window.web3 = new Web3(window.ethereum);
        await window.ethereum.enable();
      } else if (window.web3) {
        window.web3 = new Web3(window.web3.currentProvider);
      } else {
        window.alert('Non-Ethereum browser detected. You should consider trying MetaMask!');
      }
    },
    async loadBlockchainData() {
  const web3 = window.web3;

  try {
    const accounts = await web3.eth.getAccounts();
    this.account = accounts[0];
   
    // const networkId = await web3.eth.net.getId();
    // const networkData = bet.networks[networkId];
    let address = "0x0c1F6D7179d8a15D0ac2a89969056FeA43dFF8BC"
    
    const Bet = new web3.eth.Contract(bet.abi, address );
    this.Bet = Bet;
    // if (networkData) {
    //   // const Bet = new web3.eth.Contract(bet.abi, networkData.address );
    //   // console.log(networkData.address);
    //   // this.Bet = Bet;
    //   // console.log(networkData.address);
    //   // const owner = await Bet.methods.owna().call()
    //   // const totalBets = await Bet.methods.totalBetMoney().call()
    //   // console.log(totalBets);
    //   // const team1Bets = await Bet.methods.getTotalBetAmount("0").call()
    //   // const team2Bets = await Bet.methods.getTotalBetAmount("1").call()
    //   // console.log(owner.toString())
    //   // console.log(totalBets.toString())
    //   // console.log(team1Bets.toString())
    //   // console.log(team2Bets.toString())

    //   this.loading = false;
    // } else {
    //   window.alert("Bet contract not deployed to detected network");
    // }
  } catch (error) {
    console.error("Error loading blockchain data:", error);
    // Handle error appropriately, e.g., display error message
  }
},

    async MakeWinner(team){
    this.loading = true;
    console.log(team.id);
        const totalBets = await this.Bet.methods.totalBetMoney().call();
        console.log(totalBets);

        await this.Bet.methods.teamWinDistribution(team.id).send({ from: this.account, value: totalBets });
     

      this.loading = false;

  },
  

    
  
  }
}


</script>


<style>
  html {
  height: 100%;
  width: 100%;
}

body {
  font-family: sans-serif;
  margin: 0;
  height: 100%;
}

.tournament-container {}

.tournament-headers {
  flex-grow: 1;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  border-bottom: 1px solid #ccc;
  
  h3 {
    width: 25%;
    text-align:center;
    font-weight: 400;
    border-right: 1px dashed #ccc;
    margin: 0;
    padding:1rem;
  }
}

.tournament-brackets {
  display: flex;
  flex-direction: row; 
  list-style-type: none;
  background: #fdfdfd;
  margin-bottom: 50px;
}

.bracket {
  padding-left: 0;
  display: flex;
  margin: 0;
  padding: 30px 0;
  flex-grow: 1;
  flex-direction: column;
  justify-content: space-around;
  list-style-type: none;
  border-right: 1px dashed #ccc;
  flex: 1;
}

.team-item {
  background-color: #f4f4f4;
  padding: .5rem;
  display: block;
  margin: .5rem 10px;
  position: relative;
  vertical-align: middle;
  color:white;
  background-color: #212529;
  outline: 2px solid #247606;
  line-height: 2;
  text-align: center;
}

.team-item:after {
  content:'';
  border-color: #247606;
  border-width: 2px;
  position: absolute;
  display: block;
  width: 10px;
  right: -11px;
}

.team-item:nth-of-type(odd):after {
  border-right-style: solid;
  border-top-style: solid;
  height: 100%;
  top: 50%;
}

.team-item:nth-of-type(even):after {
  border-right-style: solid;
  border-bottom-style: solid;
  height: 100%;
  top: -50%;
}

.team-item:before {
  content:'';
  border-top: 2px solid #247606;
  position: absolute;
  height: 2px;
  width: 10px;
  left: -10px;
  top: 50%;
}

.bracket-2 {
  .team-item:nth-of-type(odd):after {
    height: 200%;
    top: 50%;
  }
  .team-item:nth-of-type(even):after {
    height: 200%;
    top: -150%;
  }
}

.bracket-3 {
  .team-item:nth-of-type(odd):after {
    height: 350%;
    top: 50%;
  }
  .team-item:nth-of-type(even):after {
    height: 350%;
    top: -300%;
  }
}

.bracket-4 {
  .team-item:nth-of-type(odd):after {
    height: 700%;
    top: 50%;
  }
  .team-item:nth-of-type(even):after {
    height: 700%;
    top: -650%;
  }
}

.bracket:first-of-type {
  .team-item:before {
    display: none;
  }
}

.bracket-4 {
  .team-item:after {
    display: none;
  }
}

.bracket:last-of-type {
  .team-item:before,
  .team-item:after {
    display: none;
  }
}

.team-item time {
  display: inline-block;
  background-color: #247606;
  font-size: .8rem;
  padding: 0 .6rem;
}

table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
.btnDarkGreen{
background-color: #247606;
color: white;
}
.btnDarkGreen:hover{
background-color: #41cc0f;
color: white;
}


  select {
    width: 100%;
    padding: 0.5rem;
    font-size: 1rem;
  }


  input[type="number"] {
    width: 100%;
    padding: 0.5rem;
    font-size: 1rem;
  }

  /* Media query for smaller screens */
  @media (max-width: 768px) {
    input[type="number"] {
      width: 50%; /* Set width to 50% on smaller screens */
      font-size: 0.8rem; /* Adjust font size for smaller screens */
    }
  }
</style>