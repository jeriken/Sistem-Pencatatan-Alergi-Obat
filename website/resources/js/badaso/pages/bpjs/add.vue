<template>
  <div>
    <template v-if="!isMaintenance">
      <badaso-breadcrumb-row full> </badaso-breadcrumb-row>
      <vs-row v-if="$helper.isAllowedToModifyGeneratedCRUD('add', dataType)">
        <vs-col vs-lg="12">
          <vs-card>
            <div slot="header">
              <h3>
                {{
                  $t("crudGenerated.add.title", {
                    tableName: dataType.displayNameSingular,
                  })
                }}
              </h3>
            </div>
            <vs-row>
              <vs-col vs-lg="12" v-if="!isValid">
                <p class="is-error">No fields have been filled</p>
              </vs-col>
              <badaso-text
                v-model="dataType.dataRows[1].value"
                size="12"
                :label="dataType.dataRows[1].displayName"
                placeholder="Scan kartu BPJS"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[1].field)
                  ]
                "
              ></badaso-text>
              <badaso-number
                :label="dataType.dataRows[2].displayName"
                :placeholder="dataType.dataRows[2].displayName"
                v-model="dataType.dataRows[2].value"
                size="12"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[2].field)
                  ]
                "
              ></badaso-number>
              <badaso-text
                v-model="dataType.dataRows[3].value"
                size="12"
                :label="dataType.dataRows[3].displayName"
                :placeholder="dataType.dataRows[3].displayName"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[3].field)
                  ]
                "
              ></badaso-text>
            </vs-row>
          </vs-card>
        </vs-col>
        <vs-col vs-lg="12">
          <vs-card class="action-card">
            <vs-row>
              <vs-col vs-lg="12">
                <vs-button color="primary" type="relief" @click="submitForm">
                  <vs-icon icon="save"></vs-icon>
                  {{ $t("crudGenerated.add.button") }}
                </vs-button>
                <vs-button
                  :to="{
                    name: 'DataPendingAddBrowse',
                    params: {
                      urlBase64: base64PathName,
                    },
                  }"
                  v-if="dataLength > 0 && !isOnline"
                  color="success"
                  type="relief"
                >
                  <vs-icon icon="history"></vs-icon>
                  <strong
                    >{{ dataLength }} {{ $t("offlineFeature.dataPending") }}
                  </strong>
                </vs-button>
              </vs-col>
            </vs-row>
          </vs-card>
        </vs-col>
      </vs-row>
      <vs-row v-else>
        <vs-col vs-lg="12">
          <vs-card>
            <vs-row>
              <vs-col vs-lg="12">
                <h3>
                  {{
                    $t("crudGenerated.warning.notAllowedToAdd", {
                      tableName: dataType.displayNameSingular,
                    })
                  }}
                </h3>
              </vs-col>
            </vs-row>
          </vs-card>
        </vs-col>
      </vs-row>
    </template>
    <template v-if="isMaintenance">
      <badaso-breadcrumb-row full> </badaso-breadcrumb-row>

      <vs-row v-if="$helper.isAllowedToModifyGeneratedCRUD('add', dataType)">
        <vs-col vs-lg="12">
          <div class="badaso-maintenance__container">
            <img :src="`${maintenanceImg}`" alt="Maintenance Icon" />
            <h1 class="badaso-maintenance__text">
              We are under <br />maintenance
            </h1>
          </div>
        </vs-col>
      </vs-row>
    </template>
  </div>
</template>

<script>
export default {
  name: "CrudGeneratedAdd",
  components: {},
  data: () => ({
    isValid: true,
    errors: {},
    dataType: {},
    relationData: {},
    isMaintenance: false,
    dataLength: 0,
    pathname: location.pathname,
  }),
  mounted() {
    this.getDataType();
    this.getRelationDataBySlug();
    this.requestObjectStoreData();
  },
  methods: {
    submitForm() {
      this.errors = {};
      this.isValid = true;

      // init data rows
      const dataRows = {};
      for (const row of this.dataType.dataRows) {
        if (row && row.value) {
          dataRows[row.field] = row.value;
        }
      }

      dataRows.ids = this.$route.query.ids;


      // validate values in data rows must not equals 0
      if (Object.values(dataRows).length == 0) {
        this.isValid = false;
        return;
      }

      // start request
      this.$openLoader();
      this.$api.badasoEntity
        .add({
          slug: this.$route.params.slug,
          data: dataRows,
        })
        .then((response) => {
          this.$closeLoader();
          this.$router.push({
            path: "/dashboard/general/pasien",
          });
        })
        .catch((error) => {
          this.requestObjectStoreData();
          this.errors = error.errors;
          this.$closeLoader();
          this.$vs.notify({
            title: this.$t("alert.danger"),
            text: error.message,
            color: "danger",
          });
        });
    },
    async getDataType() {
      this.$openLoader();

      try {
        const response = await this.$api.badasoCrud.readBySlug({
          slug: this.$route.params.slug,
        });

        this.$closeLoader();
        this.dataType = response.data.crudData;
        const dataRows = response.data.crudData.dataRows.map((data) => {
          if (
            data.value == undefined &&
            (data.type == "upload_image" || data.type == "upload_file")
          ) {
            data.value = "";
          } else if (
            data.value == undefined &&
            (data.type == "upload_image_multiple" ||
              data.type == "upload_file_multiple" ||
              data.type == "select_multiple" ||
              data.type == "checkbox")
          ) {
            data.value = Array;
          } else if (data.value == undefined && data.type == "slider") {
            data.value = 0;
          } else if (data.value == undefined && data.type == "switch") {
            data.value = false;
          } else if (data.value == undefined && data.type == "tags") {
            data.value = "";
          } else if (data.value == undefined) {
            data.value = "";
          }
          try {
            data.details = JSON.parse(data.details);
            if (data.type == "hidden") {
              data.value = data.details.value ? data.details.value : "";
            }
          } catch (error) {}
          return data;
        });
        console.log(response.data.crudData.dataRows);
        this.dataType.dataRows = JSON.parse(JSON.stringify(dataRows));
      } catch (error) {
        if (error.status == 503) {
          this.isMaintenance = true;
        }
        this.$closeLoader();
        this.$vs.notify({
          title: this.$t("alert.danger"),
          text: error.message,
          color: "danger",
        });
      }
    },
    getRelationDataBySlug() {
      this.$openLoader();
      this.$api.badasoTable
        .relationDataBySlug({
          slug: this.$route.params.slug,
        })
        .then((response) => {
          this.$closeLoader();
          this.relationData = response.data;
        })
        .catch((error) => {
          if (error.status == 503) {
            this.isMaintenance = true;
          }
          this.$closeLoader();
          this.$vs.notify({
            title: this.$t("alert.danger"),
            text: error.message,
            color: "danger",
          });
        });
    },
    requestObjectStoreData() {
      this.$readObjectStore(this.pathname).then((store) => {
        if (store.result) {
          this.dataLength = store.result.data.length;
        }
      });
    },
  },
  computed: {
    isOnline: {
      get() {
        const isOnline = this.$store.getters["badaso/getGlobalState"].isOnline;
        return isOnline;
      },
    },
    base64PathName() {
      return window.btoa(location.pathname);
    },
    maintenanceImg() {
      const config = this.$store.getters["badaso/getConfig"];
      return config.maintenanceImage;
    },
  },
};
</script>
