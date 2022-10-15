<template>
  <div>
    <template v-if="!isMaintenance">
      <badaso-breadcrumb-row full> </badaso-breadcrumb-row>
      <vs-row v-if="$helper.isAllowedToModifyGeneratedCRUD('add', dataType)">
        <vs-col vs-lg="6" class="pl-0 pt-0">
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
                v-model="dataType.dataRows[4].value"
                size="12"
                :label="dataType.dataRows[4].displayName"
                placeholder="Supriyati"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[4].field)
                  ]
                "
              ></badaso-text>
              <badaso-text
                v-model="dataType.dataRows[5].value"
                size="12"
                :label="dataType.dataRows[5].displayName"
                placeholder="Banjarnegara"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[5].field)
                  ]
                "
              ></badaso-text>
              <badaso-date
                :label="dataType.dataRows[6].displayName"
                :placeholder="dataType.dataRows[6].displayName"
                v-model="dataType.dataRows[6].value"
                size="12"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[6].field)
                  ]
                "
              ></badaso-date>
            </vs-row>
          </vs-card>
        </vs-col>
        <vs-col vs-lg="6" class="pr-0">
          <vs-card>
            <div slot="header">
              <h3></h3>
            </div>
            <vs-row>
              <badaso-textarea
                :label="dataType.dataRows[7].displayName"
                placeholder="Wanayasa RT 02/01
                Wanayasa
                Banjarnegara"
                v-model="dataType.dataRows[7].value"
                size="12"
                :alert="
                  errors[
                    $caseConvert.stringSnakeToCamel(dataType.dataRows[7].field)
                  ]
                "
              ></badaso-textarea>
              <badaso-select
                    :label="dataType.dataRows[8].displayName"
                    :placeholder="dataType.dataRows[8].displayName"
                    v-model="dataType.dataRows[8].value"
                    size="12"
                    :alert="
                      errors[$caseConvert.stringSnakeToCamel(dataType.dataRows[8].field)]
                    "
                    :items="dataType.dataRows[8].details.items ? dataType.dataRows[8].details.items : []"
                  ></badaso-select>
                  <badaso-number
                    :label="dataType.dataRows[9].displayName"
                    placeholder="33041707XXXXXXXXXX"
                    v-model="dataType.dataRows[9].value"
                    size="12"
                    :alert="
                      errors[$caseConvert.stringSnakeToCamel(dataType.dataRows[9].field)]
                    "
                  ></badaso-number>
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
            name: "CrudGeneratedBrowse",
            params: {
              slug: this.$route.params.slug,
            },
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
