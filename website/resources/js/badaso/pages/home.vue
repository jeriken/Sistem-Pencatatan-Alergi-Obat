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
        <vs-card class="widget__content">
          <h3 class="mb-8">Data Masuk Terakhir</h3>
          <vs-divider />
          <badaso-table :data="records">
            <template slot="thead">
              <vs-th> No </vs-th>
              <vs-th> Nama </vs-th>
              <vs-th> Rumah Sakit </vs-th>
              <vs-th> Tanggal Dicatat </vs-th>
            </template>
            <template slot-scope="{ data }">
              <vs-tr :data="rec" :key="index" v-for="(rec, index) in data">
                <vs-td :data="index">
                  {{ index + 1 }}
                </vs-td>
                <vs-td :data="rec.nama">
                  {{ rec.nama }}
                </vs-td>
                <vs-td :data="rec.rs.nama">
                  {{ rec.rs.nama }}
                </vs-td>
                <vs-td :data="rec.tglCatat">
                  {{ date(rec.tglCatat) }}
                </vs-td>
              </vs-tr>
            </template>
          </badaso-table>
        </vs-card>
      </vs-col>
      <vs-col vs-lg="4" vs-xs="12">
        <vs-card class="widget__content">
          <h3 class="mb-1">Persentase</h3>
          <vs-divider />
          <p>Pasien dengan alergi</p>
          <vs-progress
            class="widget__progress-bar"
            :height="6"
            :percent="getPercent(data.alergiCount, data.pasienCount)"
            >success</vs-progress
          >
          <p>Pasien dengan data KTP</p>
          <vs-progress
            class="widget__progress-bar"
            :height="6"
            :percent="getPercent(data.ktpCount, data.pasienCount)"
            >success</vs-progress
          >
          <p>Pasien dengan data BPJS</p>
          <vs-progress
            class="widget__progress-bar"
            :height="6"
            :percent="getPercent(data.bpjsCount, data.pasienCount)"
            >success</vs-progress
          >
        </vs-card>
        <vs-card class="widget__content">
          <h3 class="mb-1">Pasien tiap Rumah Sakit</h3>
          <vs-divider />
          <vs-row>
              <vs-col vs-lg="8"> <b>Rumah Sakit</b> </vs-col>
              <vs-col vs-lg="4"> <b>Jumlah</b> </vs-col>
            </vs-row>
          <div :data="rec" :key="index" v-for="(rec, index) in rs">
            <vs-row>
              <vs-col vs-lg="8"> {{ rec.nama }} </vs-col>
              <vs-col vs-lg="4"> {{ rec.pasienCount }} </vs-col>
            </vs-row>
          </div>
        </vs-card>
      </vs-col>
    </vs-row>
  </div>
</template>
<script>
import Vue from "vue";
export default {
  data: () => ({
    data: {},
    records: [],
    rs: [],
  }),
  mounted() {
    this.getEntity();
  },
  methods: {
    getPercent(value, max = 100) {
      const percentage = 100 / max;
      return value * percentage;
    },
    date(date) {
      var dateNew = new Date(date);
      return new Intl.DateTimeFormat("id-ID", {
        day: "2-digit",
        month: "long",
        year: "numeric",
      }).format(dateNew);
    },
    async getEntity() {
      try {
        this.$openLoader();
        let response = await Vue.prototype.$resource.get(
          "/api/v1/custom/dashboard"
        );
        this.$closeLoader();
        this.data = response.data;
        this.records = response.data.lastPasien;
        this.rs = response.data.rumahSakit;
        console.log(this.data);
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