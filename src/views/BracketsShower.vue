<template>
  <div class="brackets">
    
    <BracketList />

</div>
</template>

<script>
  import BracketList from "@/components/BracketList.vue"
export default {

  name: 'BracketsShower',

  components:{
    BracketList
  },
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
  










</style>

