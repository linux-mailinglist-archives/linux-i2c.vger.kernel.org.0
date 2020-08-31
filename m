Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2BAC2571B7
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 03:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgHaB4b (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Aug 2020 21:56:31 -0400
Received: from mail-eopbgr60111.outbound.protection.outlook.com ([40.107.6.111]:41218
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726454AbgHaB4Z (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 30 Aug 2020 21:56:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jb29GygW4lkLYaQE8xAq3LinXDeIPCIGkZ4wO/s8GdcLBCncWhtB4tzIeHLhPs1qvXUbPfNtNbysYc0GrOAg95Zfi/8ecpi71/YLxqnXYwDcoARSi8KEUH1XoIL8/Yq7RPfORIxyXcL36XnmgOynzpJGpeBGQPeMdtmu9djSlRN2Oj1mTEKjcH8bJY7TmFUdaFFADrGAd9yhA5Q+b+wRZoFnNeamfVhSL0XdCFvFFXROwl4XG37mNyyJao+zrTygs4g3zJPUzq2EdpTynL5OYmPfMqOZwruCUu+zHhayO2N9DApdN83N+g2YE0M9HY3fOlNnFrUgSXsovQNx+TLzIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8p3BOZCLpW+6Qb3cetMcLuOdztKMRymj0C5smTQxnA=;
 b=CQTxTckOCHHD6jZvs4hoPvh5+scMkOW8oeRpE1VOhbaUaV4RtBMzh+fTdTsy9XpZYPb6pL9kuJgMIr6idgVxma5gv8jwgROlg3yDLo8z9GjM0tSaLsOOUyVutsvfGpI1kE2uO2wGban4hGET7G7ySxwKNM1abXO1cQ2sWxhGHngmenSP1vWTMBIOGnpDhOVXsrzOsqYLItCjsss00EigOQuPTzDrljeKbyF1ICKDVH+crLT+lTcUHqWZtkv1eXU//DYY//3GmM3XFZcLhvEN07VUTbfAmtYwaYhZBOVZtkWiVDve4iSxZopmalWZUtFAI2NkPcNd3CFdac/TUjuYpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8p3BOZCLpW+6Qb3cetMcLuOdztKMRymj0C5smTQxnA=;
 b=gZ0eB4NJZBK1v2ZSPwIN6Q5iEhepzXVW8pfOBAgQZUFo/7kSjHTq8OLs4R2H/+lqFwipt5wBQz7Ee7jW0tTwyzONfVS5scXE8vYlUNKGO5iw3SLxvC0iwbSMp2g1T/scFRcEXQshTcE0dYsZmhQ+jD/qxooTy1NejQtBpm8ugME=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=plvision.eu;
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:56::28) by
 HE1P190MB0364.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:62::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.23; Mon, 31 Aug 2020 01:56:07 +0000
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::b1a4:e5e3:a12b:1305]) by HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::b1a4:e5e3:a12b:1305%6]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 01:56:07 +0000
From:   Vadym Kochan <vadym.kochan@plvision.eu>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vadym Kochan <vadym.kochan@plvision.eu>
Subject: [PATCH v3 2/3] nvmem: add ONIE NVMEM cells support
Date:   Mon, 31 Aug 2020 04:55:38 +0300
Message-Id: <20200831015539.26811-3-vadym.kochan@plvision.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200831015539.26811-1-vadym.kochan@plvision.eu>
References: <20200831015539.26811-1-vadym.kochan@plvision.eu>
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0201CA0022.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::32) To HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:7:56::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc60716vkochan.x.ow.s (217.20.186.93) by AM5PR0201CA0022.eurprd02.prod.outlook.com (2603:10a6:203:3d::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.20 via Frontend Transport; Mon, 31 Aug 2020 01:56:06 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.20.186.93]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61cbab44-3823-417c-7cb6-08d84d51067a
X-MS-TrafficTypeDiagnostic: HE1P190MB0364:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1P190MB03645F0B7BB20E7ADCB8B1E495510@HE1P190MB0364.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jUtRCG5aRDNQXZ9YxPCcDuEMMJosXzY7rHfsvUCjoViKjDXW5x1aOZtFIo0f97ucsa/9Fl7+guqS2nMlX0GYlhqB094VH+fO0mkV2MrvlHeoD7jxFvzkgt92R0dV8jwLnalHmHvKVVt8L5FYDMRImTjyKA+Kq/6J4WXbTtg/GNRAhElDsB3pban3ljh9Z6WrOFIJeVrsJaky41Gs3DC9oZsIieZE+9uepN2ojClJ4vPITVx5Z0yE9qgOP9rfZkO5xgqUCqmV1sgC9M7lviVsG41epp4Z6YFLz/cpRomDb/apNnVx8L/IxqlZ/yK1GfQ5Xb+G5bBOy090brCAiN6IkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1P190MB0539.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(136003)(39830400003)(366004)(396003)(346002)(36756003)(478600001)(6486002)(5660300002)(316002)(2906002)(110136005)(8936002)(8676002)(6512007)(6666004)(66476007)(1076003)(66556008)(44832011)(66946007)(107886003)(2616005)(956004)(26005)(86362001)(4326008)(30864003)(6506007)(83380400001)(16526019)(186003)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: TVUxsM3l5OBCk9/FiTcSHMcugvmLdM0/WXT+irGhfllZNMW3uQ6xI5sjh7O0Y6PU9lXKv6SrMjM9Ag4iGyhJXbcp9nq+dknEY3buiXbLkA6r4gnranLXtS4Lsjpuin3ZveSFjO8kWe0+ewe7G9i2QCE5gNG/GbDqO5N7Il2luvQjKbJt1TlxidZ+62f2ZO96K5167ndHd8j1Img/Bo2kKim71+8ykG1DYU9+JeH0L1Yi4M31YsceEZqWQMvy2sRNqXI/wKNDTBY/mUXv42FTaw736wl1ZHFIvvD/GBAKOrGL3rGMoPhyeTymruuKYv56oBMNMFEyhgy9Q1LFrA1vo2LQBHCmnG8iZO0lweQK8ShcDW/wyfqG2VyZLXDWFT/2+0j3vkF8orggb1A6j/WGXfdVfj5ciA6hPIbNQdsaLxSuQjjLl6XvNSd7mXpZ8LlYmFcJRpTQ0uynIcaNDDP5aoYctNQB1lJtuHThwxWDt8gIsg7Z5nBpRG/V+VuignF4hRWkp6dxFRMeiILcjfzASJLyv7oWDL//HFSNy6G6EtCtog+QkKyMBfqRXhfE75XBO+hry6kWw054UmjIZcYYB/f0PJofc+060Umn3TekaBqOapr+lIJySEeRuba5yfNP0antsZawrlxi13Lcuc3Zmw==
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cbab44-3823-417c-7cb6-08d84d51067a
X-MS-Exchange-CrossTenant-AuthSource: HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 01:56:07.2603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8e/tNMBVVWFHlcGlAF6nm0Eh0gRhd1kD0tLsrM5HjKvGXdDUu4fKVN/cKcxlw3PJBBwEaf5UcWECJcVYt/ESchJM7E7OGYWIYvRNmC3gBos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1P190MB0364
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

ONIE is a small operating system, pre-installed on bare metal network
switches, that provides an environment for automated provisioning.

This system requires that NVMEM (EEPROM) device holds various system
information (mac address, platform name, etc) in a special TLV layout.

The driver registers ONIE TLV attributes as NVMEM cells which can be
accessed by other platform driver. Also it allows to use
of_get_mac_address() to retrieve mac address for the netdev.

Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
---
v3:
    1) Update onie-cells.c by using nvmem notification to parse and
       register cells before device and cells are finally registered.

    2) Use subsys_init() macro which allows to probe before nvmem drivers.

 drivers/nvmem/Kconfig      |   9 +
 drivers/nvmem/Makefile     |   3 +
 drivers/nvmem/onie-cells.c | 410 +++++++++++++++++++++++++++++++++++++
 3 files changed, 422 insertions(+)
 create mode 100644 drivers/nvmem/onie-cells.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 954d3b4a52ab..922d753519f7 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -270,4 +270,13 @@ config SPRD_EFUSE
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-sprd-efuse.
 
+config NVMEM_ONIE_CELLS
+	bool "ONIE TLV cells support"
+	help
+	  This is a driver to provide cells from ONIE TLV structure stored
+	  on NVME device.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nvmem-onie-cells.
+
 endif
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index a7c377218341..2199784a489f 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -55,3 +55,6 @@ obj-$(CONFIG_NVMEM_ZYNQMP)	+= nvmem_zynqmp_nvmem.o
 nvmem_zynqmp_nvmem-y		:= zynqmp_nvmem.o
 obj-$(CONFIG_SPRD_EFUSE)	+= nvmem_sprd_efuse.o
 nvmem_sprd_efuse-y		:= sprd-efuse.o
+
+obj-$(CONFIG_NVMEM_ONIE_CELLS)	+= nvmem-onie-cells.o
+nvmem-onie-cells-y		:= onie-cells.o
diff --git a/drivers/nvmem/onie-cells.c b/drivers/nvmem/onie-cells.c
new file mode 100644
index 000000000000..bbb1e421f67c
--- /dev/null
+++ b/drivers/nvmem/onie-cells.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * ONIE NVMEM cells provider
+ *
+ * Author: Vadym Kochan <vadym.kochan@plvision.eu>
+ */
+
+#define ONIE_NVMEM_DRVNAME	"onie-nvmem-cells"
+
+#define pr_fmt(fmt) ONIE_NVMEM_DRVNAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/kref.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define ONIE_NVMEM_TLV_MAX_LEN	2048
+
+#define ONIE_NVMEM_HDR_ID	"TlvInfo"
+
+struct onie_nvmem_hdr {
+	u8 id[8];
+	u8 version;
+	__be16 data_len;
+} __packed;
+
+struct onie_nvmem_tlv {
+	u8 type;
+	u8 len;
+	u8 val[0];
+} __packed;
+
+struct onie_nvmem_attr {
+	struct list_head head;
+	const char *name;
+	unsigned int offset;
+	unsigned int len;
+};
+
+struct onie_nvmem {
+	struct platform_device *pdev;
+	struct notifier_block nvmem_nb;
+	unsigned int attr_count;
+	struct list_head attrs;
+	struct kref refcnt;
+	const char *nvmem_match;
+
+	struct nvmem_cell_lookup *cell_lookup;
+	struct nvmem_cell_table cell_tbl;
+	struct nvmem_device *nvmem;
+};
+
+static bool onie_nvmem_hdr_is_valid(struct onie_nvmem_hdr *hdr)
+{
+	if (memcmp(hdr->id, ONIE_NVMEM_HDR_ID, sizeof(hdr->id)) != 0)
+		return false;
+	if (hdr->version != 0x1)
+		return false;
+
+	return true;
+}
+
+static void onie_nvmem_attrs_free(struct onie_nvmem *onie)
+{
+	struct onie_nvmem_attr *attr, *tmp;
+
+	list_for_each_entry_safe(attr, tmp, &onie->attrs, head) {
+		list_del(&attr->head);
+		kfree(attr);
+	}
+}
+
+static const char *onie_nvmem_attr_name(u8 type)
+{
+	switch (type) {
+	case 0x21: return "product-name";
+	case 0x22: return "part-number";
+	case 0x23: return "serial-number";
+	case 0x24: return "mac-address";
+	case 0x25: return "manufacture-date";
+	case 0x26: return "device-version";
+	case 0x27: return "label-revision";
+	case 0x28: return "platforn-name";
+	case 0x29: return "onie-version";
+	case 0x2A: return "num-macs";
+	case 0x2B: return "manufacturer";
+	case 0x2C: return "country-code";
+	case 0x2D: return "vendor";
+	case 0x2E: return "diag-version";
+	case 0x2F: return "service-tag";
+	case 0xFD: return "vendor-extension";
+	case 0xFE: return "crc32";
+
+	default: return "unknown";
+	}
+}
+
+static int onie_nvmem_tlv_parse(struct onie_nvmem *onie, u8 *data, u16 len)
+{
+	unsigned int hlen = sizeof(struct onie_nvmem_hdr);
+	unsigned int offset = 0;
+	int err;
+
+	while (offset < len) {
+		struct onie_nvmem_attr *attr;
+		struct onie_nvmem_tlv *tlv;
+
+		tlv = (struct onie_nvmem_tlv *)(data + offset);
+
+		if (offset + tlv->len >= len) {
+			struct nvmem_device *nvmem = onie->nvmem;
+
+			pr_err("%s: TLV len is too big(0x%x) at 0x%x\n",
+			       nvmem_dev_name(nvmem), tlv->len, hlen + offset);
+
+			/* return success in case something was parsed */
+			return 0;
+		}
+
+		attr = kmalloc(sizeof(*attr), GFP_KERNEL);
+		if (!attr) {
+			err = -ENOMEM;
+			goto err_attr_alloc;
+		}
+
+		attr->name = onie_nvmem_attr_name(tlv->type);
+		/* skip 'type' and 'len' */
+		attr->offset = hlen + offset + 2;
+		attr->len = tlv->len;
+
+		list_add(&attr->head, &onie->attrs);
+		onie->attr_count++;
+
+		offset += sizeof(*tlv) + tlv->len;
+	}
+
+	return 0;
+
+err_attr_alloc:
+	onie_nvmem_attrs_free(onie);
+
+	return err;
+}
+
+static int onie_nvmem_decode(struct onie_nvmem *onie)
+{
+	struct nvmem_device *nvmem = onie->nvmem;
+	struct onie_nvmem_hdr hdr;
+	u8 *data;
+	u16 len;
+	int ret;
+
+	ret = nvmem_device_read(nvmem, 0, sizeof(hdr), &hdr);
+	if (ret < 0)
+		return ret;
+
+	if (!onie_nvmem_hdr_is_valid(&hdr)) {
+		pr_err("%s: invalid ONIE TLV header\n", nvmem_dev_name(nvmem));
+		ret = -EINVAL;
+		goto err_invalid;
+	}
+
+	len = be16_to_cpu(hdr.data_len);
+
+	if (len > ONIE_NVMEM_TLV_MAX_LEN)
+		len = ONIE_NVMEM_TLV_MAX_LEN;
+
+	data = kmalloc(len, GFP_KERNEL);
+	if (!data) {
+		ret = -ENOMEM;
+		goto err_kmalloc;
+	}
+
+	ret = nvmem_device_read(nvmem, sizeof(hdr), len, data);
+	if (ret < 0)
+		goto err_data_read;
+
+	ret = onie_nvmem_tlv_parse(onie, data, len);
+	if (ret)
+		goto err_info_parse;
+
+	kfree(data);
+
+	return 0;
+
+err_info_parse:
+err_data_read:
+	kfree(data);
+err_kmalloc:
+err_invalid:
+	return ret;
+}
+
+static int onie_nvmem_cells_parse(struct onie_nvmem *onie)
+{
+	struct platform_device *pdev = onie->pdev;
+	struct nvmem_device *nvmem = onie->nvmem;
+	struct device *dev = &pdev->dev;
+	struct nvmem_cell_info *cells;
+	struct onie_nvmem_attr *attr;
+	unsigned int ncells = 0;
+	int err;
+
+	INIT_LIST_HEAD(&onie->attrs);
+	onie->attr_count = 0;
+
+	err = onie_nvmem_decode(onie);
+	if (err)
+		return err;
+
+	if (!onie->attr_count) {
+		pr_err("%s: has no ONIE attributes\n", nvmem_dev_name(nvmem));
+		return -EINVAL;
+	}
+
+	cells = kmalloc_array(onie->attr_count, sizeof(*cells), GFP_KERNEL);
+	if (!cells) {
+		err = -ENOMEM;
+		goto err_cells_alloc;
+	}
+
+	onie->cell_lookup = kmalloc_array(onie->attr_count,
+					  sizeof(struct nvmem_cell_lookup),
+					  GFP_KERNEL);
+	if (!onie->cell_lookup) {
+		err = -ENOMEM;
+		goto err_lookup_alloc;
+	}
+
+	list_for_each_entry(attr, &onie->attrs, head) {
+		struct nvmem_cell_lookup *lookup;
+		struct nvmem_cell_info *cell;
+
+		cell = &cells[ncells];
+
+		lookup = &onie->cell_lookup[ncells];
+		lookup->con_id = NULL;
+
+		cell->offset = attr->offset;
+		cell->name = attr->name;
+		cell->bytes = attr->len;
+		cell->bit_offset = 0;
+		cell->nbits = 0;
+
+		lookup->nvmem_name = nvmem_dev_name(onie->nvmem);
+		lookup->dev_id = dev_name(dev);
+		lookup->cell_name = cell->name;
+		lookup->con_id = cell->name;
+
+		ncells++;
+	}
+
+	onie->cell_tbl.nvmem_name = nvmem_dev_name(onie->nvmem);
+	onie->cell_tbl.ncells = ncells;
+	onie->cell_tbl.cells = cells;
+
+	nvmem_add_cell_table(&onie->cell_tbl);
+	nvmem_add_cell_lookups(onie->cell_lookup, ncells);
+
+	onie_nvmem_attrs_free(onie);
+
+	return 0;
+
+err_lookup_alloc:
+	kfree(onie->cell_tbl.cells);
+err_cells_alloc:
+	onie_nvmem_attrs_free(onie);
+
+	return err;
+}
+
+static void onie_nvmem_release(struct kref *kref)
+{
+	kfree(container_of(kref, struct onie_nvmem, refcnt));
+}
+
+static void onie_nvmem_get(struct onie_nvmem *onie)
+{
+	kref_get(&onie->refcnt);
+}
+
+static void onie_nvmem_put(struct onie_nvmem *onie)
+{
+	kref_put(&onie->refcnt, onie_nvmem_release);
+}
+
+static int onie_nvmem_notify(struct notifier_block *nb,
+			     unsigned long val, void *data)
+{
+	struct nvmem_device *nvmem = data;
+	struct onie_nvmem *onie;
+	int err;
+
+	if (val != NVMEM_PRE_ADD && val != NVMEM_REMOVE)
+		return NOTIFY_DONE;
+
+	onie = container_of(nb, struct onie_nvmem, nvmem_nb);
+
+	if (strcmp(onie->nvmem_match, nvmem_dev_name(nvmem)) != 0)
+		return NOTIFY_DONE;
+
+	switch (val) {
+	case NVMEM_PRE_ADD:
+		onie->nvmem = nvmem;
+
+		err = onie_nvmem_cells_parse(onie);
+		if (err)
+			return NOTIFY_BAD;
+
+		onie_nvmem_get(onie);
+		break;
+
+	case NVMEM_REMOVE:
+		nvmem_del_cell_lookups(onie->cell_lookup, onie->attr_count);
+		nvmem_del_cell_table(&onie->cell_tbl);
+
+		kfree(onie->cell_tbl.cells);
+		kfree(onie->cell_lookup);
+
+		onie_nvmem_put(onie);
+		break;
+
+	default:
+		return NOTIFY_DONE;
+	}
+
+	return NOTIFY_OK;
+}
+
+static int onie_nvmem_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct onie_nvmem *onie;
+	const char *nvmem_match;
+	int err;
+
+	err = of_property_read_string(np, "nvmem-name", &nvmem_match);
+	if (err) {
+		dev_err(dev, "error while parsing 'nvmem-name' property\n");
+		return err;
+	}
+
+	onie = kmalloc(sizeof(*onie), GFP_KERNEL);
+	if (!onie)
+		return -ENOMEM;
+
+	kref_init(&onie->refcnt);
+
+	onie->nvmem_nb.notifier_call = onie_nvmem_notify;
+	onie->nvmem_match = nvmem_match;
+	onie->pdev = pdev;
+
+	dev_set_drvdata(dev, onie);
+
+	return nvmem_register_notifier(&onie->nvmem_nb);
+}
+
+static int onie_nvmem_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct onie_nvmem *onie;
+
+	onie = dev_get_drvdata(dev);
+
+	nvmem_unregister_notifier(&onie->nvmem_nb);
+	onie_nvmem_put(onie);
+
+	return 0;
+}
+
+static const struct of_device_id onie_nvmem_match[] = {
+	{
+		.compatible = "onie,nvmem-cells",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, onie_nvmem_match);
+
+static struct platform_driver onie_nvmem_driver = {
+	.probe = onie_nvmem_probe,
+	.remove = onie_nvmem_remove,
+	.driver = {
+		.name = ONIE_NVMEM_DRVNAME,
+		.of_match_table = onie_nvmem_match,
+	},
+};
+
+static int __init onie_nvmem_init(void)
+{
+	return platform_driver_register(&onie_nvmem_driver);
+}
+
+static void __exit onie_nvmem_exit(void)
+{
+	platform_driver_unregister(&onie_nvmem_driver);
+}
+
+subsys_initcall(onie_nvmem_init);
+module_exit(onie_nvmem_exit);
+
+MODULE_AUTHOR("Vadym Kochan <vadym.kochan@plvision.eu>");
+MODULE_DESCRIPTION("ONIE NVMEM cells driver");
+MODULE_LICENSE("GPL");
-- 
2.17.1

