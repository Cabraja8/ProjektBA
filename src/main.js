import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import VueConnectWallet from "vue-connect-wallet";
createApp(App).use(VueConnectWallet).mount("#app");
createApp(App).use(router).mount('#app')
