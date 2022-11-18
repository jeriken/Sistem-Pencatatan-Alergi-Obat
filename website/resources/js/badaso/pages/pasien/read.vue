<template>
  <div>
    <template v-if="!isMaintenance">
      <badaso-breadcrumb-row full>
        <template slot="action">
          <vs-button
            color="warning"
            type="relief"
            v-if="$helper.isAllowedToModifyGeneratedCRUD('edit', dataType)"
            :to="{
              name: 'CrudGeneratedEdit',
              params: { id: $route.params.id, slug: $route.params.slug },
            }"
            ><vs-icon icon="edit"></vs-icon>
            {{ $t("crudGenerated.detail.button") }}</vs-button
          >
        </template>
      </badaso-breadcrumb-row>
      <vs-row v-if="$helper.isAllowedToModifyGeneratedCRUD('read', dataType)">
        <vs-col vs-lg="12">
          <vs-card>
            <div slot="header">
              <h3>
                {{
                  $t("crudGenerated.detail.title", {
                    tableName: dataType.displayNameSingular,
                  })
                }}
              </h3>
            </div>
            <vs-row>
              <vs-col>
                <template>
                  <table class="badaso-table">
                    <tr>
                      <td class="badaso-table__label">
                        {{ dataType.dataRows[0].displayName }}
                      </td>
                      <td class="badaso-table__value">{{ record.id }}</td>
                    </tr>
                    <tr>
                      <td class="badaso-table__label">
                        {{ dataType.dataRows[5].displayName }}
                      </td>
                      <td class="badaso-table__value">{{ record.nama }}</td>
                    </tr>
                    <tr>
                      <td class="badaso-table__label">
                        Tempat, {{ dataType.dataRows[7].displayName }}
                      </td>
                      <td class="badaso-table__value">
                        {{ record.tmpLahir }}, {{ date(record.tglLahir) }}
                      </td>
                    </tr>
                    <tr>
                      <td class="badaso-table__label">
                        {{ dataType.dataRows[8].displayName }}
                      </td>
                      <td class="badaso-table__value">
                        <span>{{ record.alamat }}</span>
                      </td>
                    </tr>
                    <tr>
                      <td class="badaso-table__label">
                        {{ dataType.dataRows[9].displayName }}
                      </td>
                      <td class="badaso-table__value">
                        <span>{{ record.goldar }}</span>
                      </td>
                    </tr>
                    <tr>
                      <td class="badaso-table__label">
                        {{ dataType.dataRows[10].displayName }}
                      </td>
                      <td class="badaso-table__value">
                        <span>{{ record.nik }}</span>
                      </td>
                    </tr>
                    <tr>
                      <td class="badaso-table__label">
                        {{ dataType.dataRows[1].displayName }}
                      </td>
                      <td class="badaso-table__value">
                        <span v-if="record.ktp"
                          >{{ record.ktp.rfid }} ( sudah ada )</span
                        >
                        <span v-else
                          ><vs-button
                            size="default"
                            type="flat"
                            :to="{
                              path: '/dashboard/general/ktp/add',
                              query: { ids: dataType.dataRows[0].value },
                            }"
                            >Tambahkan</vs-button
                          ></span
                        >
                      </td>
                    </tr>
                    <tr>
                      <td class="badaso-table__label">
                        {{ dataType.dataRows[2].displayName }}
                      </td>
                      <td class="badaso-table__value">
                        <span v-if="record.bpjs"
                          >{{ record.bpjs.barcode }} ( sudah ada )</span
                        >
                        <span v-else
                          ><vs-button
                            size="default"
                            type="flat"
                            :to="{
                              path: '/dashboard/general/bpjs/add',
                              query: { ids: dataType.dataRows[0].value },
                            }"
                            >Tambahkan</vs-button
                          ></span
                        >
                      </td>
                    </tr>
                    <tr>
                      <td class="badaso-table__label">
                        {{ dataType.dataRows[3].displayName }}
                      </td>
                      <td class="badaso-table__value">
                        <span v-if="record.alergi" v-html="record.alergi.data"></span>
                        <span v-else
                          ><vs-button
                            size="default"
                            type="flat"
                            :to="{
                              path: '/dashboard/general/alergi/add',
                              query: { ids: dataType.dataRows[0].value },
                            }"
                            >Tambahkan</vs-button
                          ></span
                        >
                      </td>
                    </tr>
                  </table>
                </template>
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
                    $t("crudGenerated.warning.notAllowedToRead", {
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

      <vs-row v-if="$helper.isAllowedToModifyGeneratedCRUD('browse', dataType)">
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
import _ from "lodash";

export default {
  name: "CrudGeneratedRead",
  components: {},
  data: () => ({
    dataType: {},
    record: {},
    isMaintenance: false,
  }),
  mounted() {
    this.getDetailEntity();
  },
  computed: {
    maintenanceImg() {
      const config = this.$store.getters["badaso/getConfig"];
      return config.maintenanceImage;
    },
  },
  methods: {
    date(date) {
      var dateNew = new Date(date);
      return new Intl.DateTimeFormat("id-ID", {
        day: "2-digit",
        month: "long",
        year: "numeric",
      }).format(dateNew);
    },
    getDownloadUrl(item) {
      if (item == null || item == undefined) return;

      return item.split("storage").pop();
    },
    async getDetailEntity() {
      this.$openLoader();

      try {
        const response = await this.$api.badasoEntity.read({
          slug: this.$route.params.slug,
          id: this.$route.params.id,
        });

        const {
          data: { dataType },
        } = await this.$api.badasoTable.getDataType({
          slug: this.$route.params.slug,
        });

        this.$closeLoader();

        this.dataType = dataType;
        this.record = response.data;

        const dataRows = this.dataType.dataRows.map((data) => {
          try {
            data.add = data.add == 1;
            data.edit = data.edit == 1;
            data.read = data.read == 1;
            data.details = JSON.parse(data.details);
          } catch (error) {}
          return data;
        });
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
    bindSelection(items, value) {
      const selected = _.find(items, ["value", value]);
      if (selected) {
        return selected.label;
      } else {
        return value;
      }
    },
    stringToArray(str) {
      if (str) {
        return str.split(",");
      } else {
        return [];
      }
    },
    displayRelationData(record, dataRow) {
      const table = this.$caseConvert.stringSnakeToCamel(
        dataRow.relation.destinationTable
      );
      this.$caseConvert.stringSnakeToCamel(
        dataRow.relation.destinationTableColumn
      );
      const displayColumn = this.$caseConvert.stringSnakeToCamel(
        dataRow.relation.destinationTableDisplayColumn
      );
      if (dataRow.relation.relationType == "has_many") {
        const list = record[table];
        const flatList = list.map((ls) => {
          return ls[displayColumn];
        });
        return flatList.join(", ");
      } else {
        return record[table] ? record[table][displayColumn] : null;
      }
    },
  },
};
</script>
