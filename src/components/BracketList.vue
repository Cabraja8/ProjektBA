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
          <li class="team-item">QF1 <time>20:00</time> QF2</li>
          <li class="team-item">QF3 <time>20:00</time> QF4</li>
          <li class="team-item">QF5 <time>20:00</time> QF6</li>
          <li class="team-item">QF7 <time>20:00</time> QF8</li>
        </ul>  
        <ul class="bracket bracket-3">
          <li class="team-item">SF1 <time>20:00</time> SF2</li>
          <li class="team-item">SF3 <time>20:00</time> SF4</li>
        </ul>  
        <ul class="bracket bracket-4">
          <li class="team-item">F1 <time>20:00</time> F2</li>
        </ul>  
      
        <ul class="bracket bracket-5">
          <li class="team-item">European Champions</li>
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
          <select v-model="WinningTeam">
            <option v-for="(team, index) in teams" :key="index" :value="team">{{ team.name }}</option>
          </select>
        </td>
      
        <td>
          <button @click="MakeWinner(WinningTeam.name)" class="btn btnDarkGreen">Choose winner</button>
        </td>
      </tr>
    </tbody>
  </table>
</div>

        
        
        <div class="container py-4" v-if="!connected">
          <h2 class="h2 py-3">You need to connect your wallet for betting</h2>
          <button  @click="connectWallet" class="btn btnDarkGreen">Connect Wallet</button>
          <span ></span>
        </div>
        <div class="container py-4" v-else>
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
import { ref } from 'vue';
import Web3 from 'web3';
import bet  from '@/abis/bet.json';
export default {

    name:"BracketList",
    

    setup() {
    const connected = ref(false);
    const account = ref('');

    const connectWallet = async () => {
      if (window.ethereum) {
        try {
          // Request account access
          await window.ethereum.request({ method: 'eth_requestAccounts' });
          const web3 = new Web3(window.ethereum);
          const accounts = await web3.eth.getAccounts();
          if (accounts.length > 0) {
            account.value = accounts[0];
            connected.value = true;
          } else {
            // Handle case when no accounts are available
            console.error('No accounts found');
          }
        } catch (error) {
          // Handle error
          console.error('Error connecting wallet:', error);
        }
      } else {
        // Handle case when Metamask or other provider is not installed
        console.error('Metamask not installed');
      }
    };

    return { connected, account, connectWallet };
  },


    data() {
    return {
      acc: '',
      loading: true,
      Bet: null,
      WinningTeam:"",
      selectedTeam: { name: "", betAmount: 0 },
      teams: [
        { id: "1", name: "A2", betAmount: 0, time: "14:00" },
        { id: "2", name: "C2", betAmount: 0, time: "14:00" },
        { id: "3", name: "D1", betAmount: 0, time: "20:00" },
        { id: "4", name: "3BEF", betAmount: 0, time: "20:00" },
        { id: "5", name: "B1", betAmount: 0, time: "17:00" },
        { id: "6", name: "3ACD", betAmount: 0, time: "17:00" },
        { id: "7", name: "F1", betAmount: 0, time: "20:00" },
        { id: "8", name: "E2", betAmount: 0, time: "20:00" },
        { id: "9", name: "C1", betAmount: 0, time: "17:00" },
        { id: "10", name: "3ABF", betAmount: 0, time: "17:00" },
        { id: "11", name: "E1", betAmount: 0, time: "17:00" },
        { id: "12", name: "D2", betAmount: 0, time: "17:00" },
        { id: "13", name: "A1", betAmount: 0, time: "14:00" },
        { id: "14", name: "3CDE", betAmount: 0, time: "14:00" },
        { id: "15", name: "B2", betAmount: 0, time: "20:00" },
        { id: "16", name: "F2", betAmount: 0, time: "20:00" }
      ]
    };
  },
  async created() {
   
    await this.loadWeb3();

    await this.loadBlockchainData();
    this.loading = false;
    
   
  },
  methods: {
    placeBet(team) {
    // Perform actions when the bet is placed
    console.log(`Bet placed on ${team.name} for $${team.betAmount}`);

    const name = this.account; // Assuming this.account is defined elsewhere
    const STeam = team.id; // Accessing the name property directly from the team object
    const betAmount = window.web3.utils.toWei(team.betAmount.toString(), 'ether'); // Use lowercase 'ether'

    console.log("Name:", name);
    console.log("Team 1:", STeam);
    console.log("Bet Amount:", betAmount);
    this.createBet(name,STeam,betAmount);
    // You can add further logic here, like updating backend or showing a confirmation message
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

      const accounts = await web3.eth.getAccounts();
      this.account = accounts[0];
      const networkId = await web3.eth.net.getId();
       console.log("networks", bet.networks[networkId]);
      console.log("networks", bet.networks);
      console.log(networkId)
      console.log("account", this.account);
      console.log("accounts", await web3.eth.getAccounts());
      
      const networkData = bet.networks[networkId];
  if (networkData) {
    const Bet = new web3.eth.Contract(bet.abi, networkData.address); 
    console.log(networkData.address);
    this.Bet = Bet;
    this.loading = false;
  } else {
    window.alert("Bet contract not deployed to detected network");
  }
    },

    async MakeWinner(teamId){
    this.loading = true;
      const totalBets = await this.Bet.methods.totalBetMoney().call();
      console.log(totalBets);
      console.log(teamId);
      await this.Bet.methods.teamWinDistribution(teamId.id).send({ from: this.account, value: window.web3.utils.toBN(totalBets) });
      this.loading = false;

  },
    async createBet(name, teamId, betAmount) {
      this.loading = true;
      await this.Bet.methods.createBet(name, teamId).send({ from: this.account, value: betAmount });
      this.loading = false;
    }
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