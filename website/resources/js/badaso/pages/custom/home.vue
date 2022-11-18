<template>
  <div>
    <vs-row>
      <vs-col vs-lg="4" vs-xs="12">
        <vs-card class="widget__content">
          <div class="widget__icon-container">
            <vs-icon class="widget__icon" icon="people"></vs-icon>
            <h3 class="mb-1">Jumlah Pasien</h3>
            <span>{{ data.pasienCount }}</span>
          </div>
        </vs-card>
      </vs-col>
      <vs-col vs-lg="4" vs-xs="12">
        <vs-card class="widget__content">
          <div class="widget__icon-container">
            <vs-icon class="widget__icon" icon="spa"></vs-icon>
            <h3 class="mb-1">Jumlah Rumah Sakit</h3>
            <span>{{ data.rsCount }}</span>
          </div>
        </vs-card>
      </vs-col>
      <vs-col vs-lg="4" vs-xs="12">
        <vs-card class="widget__content">
          <div class="widget__icon-container">
            <vs-icon class="widget__icon" icon="healing"></vs-icon>
            <h3 class="mb-1">Pasien dengan Alergi</h3>
            <span>{{ data.alergiCount }}</span>
          </div>
        </vs-card>
      </vs-col>
    </vs-row>
    <vs-row>
      <vs-col vs-lg="8" vs-xs="12">
        <badaso-table>
          <template slot="thead">
            <vs-th> Nama </vs-th>
            <vs-th> Alamat </vs-th>
          </template>
          <template slot-scope="{ data }">
            <vs-tr
              :data="rec"
              :key="index"
              v-for="(rec, index) in data.lastPasien"
            >
              <vs-td :data="rec.nama">
                {{ rec.nama }}
              </vs-td>
            </vs-tr>
          </template>
        </badaso-table>
      </vs-col>
    </vs-row>
  </div>
</template>
<script>
import Vue from "vue";
export default {
  data: () => ({
    data: {},
  }),
  mounted() {
    this.getEntity();
  },
  methods: {
    async getEntity() {
      try {
        this.$openLoader();
        let response = await Vue.prototype.$resource.get(
          "/api/v1/custom/dashboard"
        );
        this.$closeLoader();
        this.data = response.data;
        console.log(this.data)
      } catch (error) {
        this.$vs.notify({
          title: this.$t("alert.danger"),
          text: error.message,
          color: "danger",
        });
      }
    },
  },
};
</script>