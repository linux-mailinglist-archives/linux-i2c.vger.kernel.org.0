Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC7666DA45
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 10:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236547AbjAQJqw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 04:46:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236220AbjAQJqK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 04:46:10 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2048.outbound.protection.outlook.com [40.107.117.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D451A4A3;
        Tue, 17 Jan 2023 01:46:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUgKPnFdO44mtP64JzKwgQegoSsU2lR5IR6XNDMyucr1ficNJMBJlbT8jhBHn2o8X5uFyTBQyb6IEwsxEuGm4Vx0gaJxp2BnB73DMi8gqo+eMKsycPCWsMquMmgelWn087gYGKzoyfKA6d1B4wqxCytALkpIKYWbxvG3lN5if/24I2AZe2rWDsWx7HvDZBefX+OaYt3STQbDqwDG49z/rybsLjqfMDuhCeWshlpVWY+NwhRCD42zoOBT/JWw9YApyhIe61xAoNA3uOEsqcAGCHVGFargQpSvgwslUhvIvwN+dBO5xezS+hivmuHy1g3ATQ/ZT7/hunZhpJmB7FA1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjXSD1mZ7lPHk8JqCzO5LGcork/N2WHPkTlHtsQk3KQ=;
 b=HWv2AegMitVpbCABUrPELRUR8RV0XlvgyIeQ8QhQKLtcxjkQsXnjttGq1mVe1nKIuGj4o76qoL/FqqVA3eXxXVawOIjEaBnAgXP/Zbx8LcED6CbtrQuOwxG1GNS2ikj/HGJfk2MSvnq6laFmJa5O03oqkNhua5HJtJw4alXZGaC8Fl1xwZkKQXwBl09IK5qZfvm2/3vH8XY6aaED16JIHwcODBNWhqjxEzJhRIHHeLx7MD8V6ebZWd/9ZgR03jbCjs2GeAQwsjJjy4jmXbxxXgSvRp1S+Cmg3YWlVnk4oolsR55xDy43Kt8akDm4H7iCge2xgjDM9XM7a5Qn45Rgag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjXSD1mZ7lPHk8JqCzO5LGcork/N2WHPkTlHtsQk3KQ=;
 b=XBgEvkEdFoLwB5H4wu4Jw0JyGLZ0JGjg+TdCm0HoXDZEellIM4UFkHymgLlhteCsYkI7ho2PyToESzNDvqve8fluIZzifHBh9yLYHggw/QBEFH38vd2KRxn7lBLkSVU5qW+vB1xijTbWmZEiX5qquPv32Gn962J+Sz+w8j2V9ggJqSGapc9GF2MbdKzKwnmJCPlH72TITUIhXYcf7VihyBpfb22cT1+aatsOqJH0YG8IbFsdXyv61l94fZW1Hw9zJA0Y+/8QfUGLlTg1DM+dRW1lvVG4E01mIV2+rkUCtRvEG3/9/pdnkr09646WkQYNyApkTFroF0NbpHHNnl0GOg==
Received: from SGAP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::34) by
 SI2PR04MB6619.apcprd04.prod.outlook.com (2603:1096:4:1fe::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.12; Tue, 17 Jan 2023 09:46:03 +0000
Received: from SG2APC01FT0004.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:b6:cafe::bb) by SGAP274CA0022.outlook.office365.com
 (2603:1096:4:b6::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.20 via Frontend
 Transport; Tue, 17 Jan 2023 09:46:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=Wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=Wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of Wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG2APC01FT0004.mail.protection.outlook.com (10.13.37.116) with Microsoft SMTP
 Server id 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 09:46:02
 +0000
From:   Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
To:     patrick@stwcx.xyz, Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     garnermic@fb.com, Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] misc: Add meta cld driver
Date:   Tue, 17 Jan 2023 17:44:22 +0800
Message-Id: <20230117094425.19004-4-Delphine_CC_Chiu@Wiwynn.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230117094425.19004-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20230117094425.19004-1-Delphine_CC_Chiu@Wiwynn.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2APC01FT0004:EE_|SI2PR04MB6619:EE_
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b44c03f6-b189-4abd-2d9a-08daf86fa595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f0yk4uSwf20aau3m+KPLP4o+wTNtcTURUGXoxZExEqaGg3XFxLSZRupaOPavzINOe6EDJx677Wi3P/3wySbmPMXnosIiwjk3PmMBDCNwEs3wv4SwL+UgA5iD4ic2Rt6F1WYHQZS8ZcWfopZ4rdXTAS+hvZPR9xEDMh6//Ni5+DI+CQtePoT5VMHmM5SWvY83vnu1Ne0qHT4T7AT4Cgz2J/PY8yCzcFt5+LPmXc3slscP9K+OGBIFfBn+d1NB0au4P+V3gFqzGC8O1wTs9igqZBhnTv/54E5PeZ5DyNnIByWmme7fpjGNZHUSaJKTAZ3ApyrP4+3Ms0yTsmFP3p3mU5Gozwc2g077YznlErJmCRrBRVZum7gBQejnDKRR4TyvSCJYyQg2Q0YAQrXl3H9WQVZSU/0P8whbNldiGhRQSJnuYbi4jesZESnQK1HSSf9P1CGxdTznuUdTN6jkTWhGxYKZByZ2970zpVZH1kh36f12DeocsX082JRae4yU6gaohEzqLAwMVws4FW/UqeGABrzvdLdK+tDMX33Nl9SHUQiyYVyWjH1d+fl/Ozcqs+6iup3WggOBeX2mErzxcT2MN50osAUnAyPsNeDWLNSSn7BJP1WkjbeANChWEjNu8a6cUpFbkDfxvramX1MLcNOX9KOC+kEiZt/3PJyyj9782fQ=
X-Forefront-Antispam-Report: CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230022)(6069001)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(36840700001)(46966006)(36756003)(82310400005)(40480700001)(36906005)(478600001)(6486002)(54906003)(36736006)(110136005)(316002)(86362001)(81166007)(82740400003)(9316004)(356005)(336012)(956004)(1076003)(7416002)(2616005)(186003)(6666004)(6512007)(6506007)(26005)(70586007)(70206006)(41300700001)(8936002)(30864003)(8676002)(2906002)(36860700001)(47076005)(5660300002)(83380400001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 09:46:02.0985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b44c03f6-b189-4abd-2d9a-08daf86fa595
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0004.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB6619
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for meta control-logic-device driver. The CLD manages the
server system power squence and other state such as host-power-state,
uart-selection and presense-slots. The baseboard management controller
(BMC) can access the CLD through I2C.

The version 1 of CLD driver is supported. The registers number, name
and mode of CLD can be defined in dts file for version 1. The driver
exports the filesystem following the dts setting.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
Tested-by: Bonnie Lo <Bonnie_Lo@Wiwynn.com>
---
 MAINTAINERS                         |   6 +
 drivers/misc/Kconfig                |   9 +
 drivers/misc/Makefile               |   1 +
 drivers/misc/control-logic-device.c | 443 ++++++++++++++++++++++++++++
 4 files changed, 459 insertions(+)
 create mode 100644 drivers/misc/control-logic-device.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7483853880b6..46e250a2c334 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13388,6 +13388,12 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
 F:	drivers/staging/media/meson/vdec/
 
+META CPLD DRIVER
+M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/misc/meta,control-logic-device.txt
+
 METHODE UDPU SUPPORT
 M:	Vladimir Vid <vladimir.vid@sartura.hr>
 S:	Maintained
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 358ad56f6524..21d3bf820438 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -496,6 +496,15 @@ config VCPU_STALL_DETECTOR
 
 	  If you do not intend to run this kernel as a guest, say N.
 
+config CONTROL_LOGIC_DEVICE
+        bool "Meta Control Logic Device Driver"
+        depends on I2C && REGMAP
+        help
+          Say yes here to add support for the Meta CLD device driver. The dirver
+          is used to monitor CLD register value and notify the application if
+          value is changed. Application also can access the CLD register value
+          through this driver.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index ac9b3e757ba1..6fcdd575a143 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -62,3 +62,4 @@ obj-$(CONFIG_HI6421V600_IRQ)	+= hi6421v600-irq.o
 obj-$(CONFIG_OPEN_DICE)		+= open-dice.o
 obj-$(CONFIG_GP_PCI1XXXX)	+= mchp_pci1xxxx/
 obj-$(CONFIG_VCPU_STALL_DETECTOR)	+= vcpu_stall_detector.o
+obj-$(CONFIG_CONTROL_LOGIC_DEVICE) += control-logic-device.o
diff --git a/drivers/misc/control-logic-device.c b/drivers/misc/control-logic-device.c
new file mode 100644
index 000000000000..07113dcb0836
--- /dev/null
+++ b/drivers/misc/control-logic-device.c
@@ -0,0 +1,443 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Meta Inc.
+ */
+
+ #include <linux/module.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <linux/sysfs.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/stddef.h>
+#include <linux/kthread.h>
+
+#define CLD_LABEL_LEN  64 /* label = "name:mode:offset" */
+#define to_cld_reg(x) container_of(x, struct cld_data, bin)
+
+struct cld_register_info {
+	const char *name;
+	umode_t mode;
+	u8 reg;
+	u8 value;
+};
+
+struct cld_data {
+	struct list_head list;
+	struct bin_attribute bin;
+	struct kernfs_node *kn;
+	struct cld_register_info info;
+};
+
+struct cld_client {
+	struct bin_attribute new_register_bin;
+	struct bin_attribute delet_register_bin;
+	struct regmap *regmap;
+	struct device *dev;
+	struct cld_data *data;
+	struct task_struct *task;
+	size_t num_attributes;
+};
+
+struct meta_cld_of_ops {
+	int (*load_registers)(struct cld_client *cld);
+};
+
+static struct regmap_config cld_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.cache_type = REGCACHE_NONE,
+};
+
+static ssize_t cld_register_read(struct file *flip, struct kobject *kobj,
+				 struct bin_attribute *attr, char *buf,
+				 loff_t pos, size_t count)
+{
+	int ret;
+	unsigned int value;
+	struct device *dev = kobj_to_dev(kobj);
+	struct cld_client *cld = dev_get_drvdata(dev);
+	struct cld_data *data = to_cld_reg(attr);
+
+	ret = regmap_read(cld->regmap, data->info.reg, &value);
+	if (ret != 0)
+		return ret;
+
+	if ((data->info.mode & 0400) == 0400)
+		data->info.value = value;
+
+	snprintf(buf, sizeof(value), "%d\n", value);
+
+	return strlen(buf);
+}
+
+static ssize_t cld_register_write(struct file *flip, struct kobject *kobj,
+				  struct bin_attribute *attr, char *buf,
+				  loff_t pos, size_t count)
+{
+	int ret;
+	unsigned long val;
+	struct device *dev = kobj_to_dev(kobj);
+	struct cld_client *cld = dev_get_drvdata(dev);
+	struct cld_data *data = to_cld_reg(attr);
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		goto out;
+
+	if (val >= BIT(8)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = regmap_write(cld->regmap, data->info.reg, val);
+	if (ret)
+		goto out;
+
+out:
+	return ret ? ret : strlen(buf);
+}
+
+static int cld_bin_register(struct cld_register_info info,
+			    struct cld_client *cld)
+{
+	int ret;
+	struct cld_data *data, *pos;
+	struct bin_attribute *bin;
+	size_t length;
+
+	list_for_each_entry(pos, &cld->data->list, list) {
+		length = (strlen(info.name) > strlen(pos->info.name)) ?
+			 strlen(info.name):strlen(pos->info.name);
+		if (!strncasecmp(info.name, pos->info.name, length))
+			return -EEXIST;
+	}
+
+	data = devm_kzalloc(cld->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	bin = &data->bin;
+	data->info = info;
+
+	sysfs_bin_attr_init(bin);
+	bin->attr.name = kstrdup(info.name, GFP_KERNEL);
+	if (!bin->attr.name)
+		return -EINVAL;
+	bin->attr.mode = info.mode;
+	bin->read = cld_register_read;
+	bin->write = cld_register_write;
+	bin->size = 1;
+	ret = sysfs_create_bin_file(&cld->dev->kobj, bin);
+	if (ret) {
+		dev_err(cld->dev, "%s: failed to create file: %d\n",
+			info.name, ret);
+		goto out;
+	}
+
+	data->kn = kernfs_find_and_get(cld->dev->kobj.sd, bin->attr.name);
+	if (!data->kn) {
+		sysfs_remove_bin_file(&cld->dev->kobj, bin);
+		ret = -EFAULT;
+		goto out;
+	}
+
+	list_add_tail(&data->list, &cld->data->list);
+	++cld->num_attributes;
+out:
+	return ret;
+}
+
+static int cld_bin_unregister(struct cld_register_info info,
+			      struct cld_client *cld)
+{
+	size_t length;
+	struct cld_data *pos;
+
+	list_for_each_entry(pos, &cld->data->list, list) {
+		length = (strlen(info.name) > strlen(pos->info.name)) ?
+			 strlen(info.name):strlen(pos->info.name);
+		if ((!strncasecmp(info.name, pos->info.name, length)) &&
+		    (info.mode == pos->info.mode) &&
+		    (info.reg == pos->info.reg)) {
+			kernfs_put(pos->kn);
+			sysfs_remove_bin_file(&cld->dev->kobj,
+					      &pos->bin);
+			list_del(&pos->list);
+			devm_kfree(cld->dev, pos);
+			--cld->num_attributes;
+			return 0;
+		}
+	}
+
+	dev_err(cld->dev, "%s: cannot match cld data\n", info.name);
+	return -EINVAL;
+}
+
+static int cld_parse_label(char *label, struct cld_register_info *info)
+{
+	char name[CLD_LABEL_LEN] = { 0 };
+	char *mode_str, *reg_str;
+	int rc, i;
+	unsigned long reg;
+	umode_t mode;
+	size_t length;
+	struct {
+		char *mode;
+		int value;
+	} options[] = {
+		{"rw", 0600},
+		{"r", 0400},
+		{"w", 0200},
+	};
+
+	strncpy(name, label, CLD_LABEL_LEN);
+
+	mode_str = strchr(name, ':');
+	if (!mode_str)
+		return -EINVAL;
+	*mode_str++ = '\0';
+
+	reg_str = strchr(mode_str, ':');
+	if (!reg_str)
+		return -EINVAL;
+	*reg_str++ = '\0';
+
+	if ((*name == '\0') || (*mode_str == '\0') || (*reg_str == '\0'))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(options); i++) {
+		length = (strlen(options[i].mode) > strlen(mode_str)) ?
+			 strlen(options[i].mode):strlen(mode_str);
+		if (strncasecmp(mode_str, options[i].mode, length) == 0) {
+			rc = kstrtoul(reg_str, 0, &reg);
+			if (rc)
+				return -EINVAL;
+			mode = options[i].value;
+			break;
+		}
+	}
+	if ((i >= ARRAY_SIZE(options)) || (reg >= BIT(8)))
+		return -EINVAL;
+
+	info->name = kstrdup(name, GFP_KERNEL);
+	if (!info->name)
+		return -EINVAL;
+	info->reg = reg;
+	info->mode = mode;
+	return 0;
+}
+
+static int cld_load_registers(struct cld_client *cld, const char *property)
+{
+	const char *label;
+	int count, ret, i;
+	struct cld_register_info info;
+	struct device *dev = cld->dev;
+
+	count = of_property_count_strings(dev->of_node, property);
+	if (count <= 0)
+		return -EINVAL;
+
+	for (i = 0; i < count; i++) {
+		ret = of_property_read_string_index(dev->of_node, property, i,
+						    &label);
+		if (ret) {
+			dev_err(dev, ": failed to get label for index %d\n",
+				i);
+			continue;
+		}
+
+		ret = cld_parse_label((char *)label, &info);
+		if (ret) {
+			dev_err(cld->dev, "%s: failed to parse label\n",
+				label);
+			continue;
+		}
+		cld_bin_register(info, cld);
+	}
+	return (count == cld->num_attributes) ? 0 : (-EINVAL);
+}
+
+static int meta_cld_of_v1_load_registers(struct cld_client *cld)
+{
+	int ret;
+
+	ret = cld_load_registers(cld, "registers-map");
+	if (ret)
+		dev_dbg(cld->dev, "failed to load registers\n");
+
+	return 0;
+}
+
+static ssize_t cld_sysfs_new_register(struct file *filp, struct kobject *kobj,
+				      struct bin_attribute *attr,
+				      char *buf, loff_t pos, size_t count)
+{
+	int ret;
+	struct device *dev = kobj_to_dev(kobj);
+	struct cld_client *cld = dev_get_drvdata(dev);
+	struct cld_register_info info;
+
+	ret = cld_parse_label(buf, &info);
+	if (ret) {
+		dev_err(cld->dev, "failed to parse label\n");
+		goto out;
+	}
+	ret = cld_bin_register(info, cld);
+
+out:
+	return (!ret) ? count : ret;
+}
+
+static ssize_t cld_sysfs_delete_register(struct file *filp,
+					 struct kobject *kobj,
+					 struct bin_attribute *attr,
+					 char *buf, loff_t pos, size_t count)
+{
+	int ret;
+	struct device *dev = kobj_to_dev(kobj);
+	struct cld_client *cld = dev_get_drvdata(dev);
+	struct cld_register_info info;
+
+	ret = cld_parse_label(buf, &info);
+	if (ret) {
+		dev_err(cld->dev, "failed to parse label\n");
+		goto out;
+	}
+
+	ret = cld_bin_unregister(info, cld);
+
+out:
+	return (!ret) ? count : ret;
+}
+
+static int cld_monitor_thread(void *client)
+{
+	struct cld_client *cld = client;
+	unsigned int value;
+	int ret;
+	struct cld_data *pos;
+
+	while (!kthread_should_stop()) {
+		list_for_each_entry(pos, &cld->data->list, list) {
+			if ((pos->info.mode & 0400) == 0400) {
+				ret = regmap_read(cld->regmap, pos->info.reg,
+						  &value);
+				if (ret)
+					continue;
+				if (pos->info.value != value) {
+					pos->info.value = value;
+					kernfs_notify(pos->kn);
+				}
+			}
+		}
+		msleep(50);
+	}
+	return 0;
+}
+
+static int cld_probe(struct i2c_client *client,
+		     const struct i2c_device_id *id)
+{
+	int ret = 0;
+	const struct meta_cld_of_ops *ops;
+	struct device *dev = &client->dev;
+	struct cld_client *cld;
+
+	cld = devm_kzalloc(dev, sizeof(*cld), GFP_KERNEL);
+	if (!cld) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	cld->dev = dev;
+	cld->num_attributes = 0;
+	cld->regmap = devm_regmap_init_i2c(client, &cld_regmap_config);
+	cld->data = devm_kzalloc(cld->dev, sizeof(struct cld_data),
+				 GFP_KERNEL);
+	if (!cld->data) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	INIT_LIST_HEAD(&cld->data->list);
+
+	sysfs_bin_attr_init(&cld->new_register_bin);
+	cld->new_register_bin.attr.name = "new_register";
+	cld->new_register_bin.attr.mode = 0200;
+	cld->new_register_bin.write = cld_sysfs_new_register;
+	ret = sysfs_create_bin_file(&dev->kobj, &cld->new_register_bin);
+	if (ret)
+		goto out;
+
+	sysfs_bin_attr_init(&cld->delet_register_bin);
+	cld->delet_register_bin.attr.name = "delete_register";
+	cld->delet_register_bin.attr.mode = 0200;
+	cld->delet_register_bin.write = cld_sysfs_delete_register;
+	ret = sysfs_create_bin_file(&dev->kobj, &cld->delet_register_bin);
+	if (ret)
+		goto out;
+
+	ops = of_device_get_match_data(cld->dev);
+	if (!ops) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = ops->load_registers(cld);
+
+	cld->task = kthread_run(cld_monitor_thread, (void *)cld,
+				"register_monitor");
+	if (IS_ERR(cld->task)) {
+		ret = PTR_ERR(cld->task);
+		cld->task = NULL;
+		goto out;
+	}
+
+	dev_set_drvdata(dev, cld);
+
+out:
+	return ret;
+}
+
+static int cld_remove(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct cld_client *cld = dev_get_drvdata(dev);
+
+	if (cld->task) {
+		kthread_stop(cld->task);
+		cld->task = NULL;
+	}
+
+	devm_kfree(dev, cld);
+	return 0;
+}
+
+static const struct meta_cld_of_ops of_v1_ops = {
+	.load_registers = meta_cld_of_v1_load_registers,
+};
+
+static const struct of_device_id cld_of_match[] = {
+	{
+		.compatible = "meta,control-logic-device-v1",
+		.data = &of_v1_ops,
+	},
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, cld_of_match)
+
+static struct i2c_driver cld = {
+	.driver = { .name = "cld-driver",
+		    .of_match_table = of_match_ptr(cld_of_match) },
+	.probe = cld_probe,
+	.remove = cld_remove,
+};
+
+module_i2c_driver(cld);
+
+MODULE_AUTHOR("Ren Chen <ren_chen@wiwynn.com>");
+MODULE_DESCRIPTION("Meta control logic device driver");
+MODULE_LICENSE("GPL");
-- 
2.17.1

