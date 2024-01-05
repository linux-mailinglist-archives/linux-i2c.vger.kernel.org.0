Return-Path: <linux-i2c+bounces-1153-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BE0825435
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 14:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E23A91C23103
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 13:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253452D78B;
	Fri,  5 Jan 2024 13:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="QK0Go5m2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C272D61C;
	Fri,  5 Jan 2024 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 405A3Bav024348;
	Fri, 5 Jan 2024 14:07:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=smKl2bzJ797/uoq/KRDcSxVWqL6ZJIcSzKGdwZz9+N0=; b=QK
	0Go5m2QK9hplBDlODrTYvQ01PE0C6i8zdynp49uEUnQGYqj9SQczrrkv4O8gToiY
	zMGaO1WdtrJxt80zud7y38lRLvYyeS2eYLCOTUsNoKYI5x3tPid3AgomWfmHx40f
	Bzmfto7zeOjmMqVLS1sDUDx9wz+kZHSUA5iksT3VL7WKxbIFPzQQ5OkREvF/t8yZ
	RIeImw3hwXUNhC5EA+mndPFLW6mL9yVmiB0C4+f3OoTGySkjkoxDerkDtFbNlSOb
	sYe2q7LRciMIYrFmjZgelJelZ964Xta3LfEgAFz67K1b3LXsUmAsMrRR4zNtpJYy
	D+8oCCE1lR7nechuJxpA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ve9h0j5ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jan 2024 14:07:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0325410002A;
	Fri,  5 Jan 2024 14:07:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA82E22A6C2;
	Fri,  5 Jan 2024 14:07:00 +0100 (CET)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 5 Jan
 2024 14:07:00 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <vkoul@kernel.org>, <jic23@kernel.org>, <olivier.moysan@foss.st.com>,
        <arnaud.pouliquen@foss.st.com>, <mchehab@kernel.org>,
        <fabrice.gasnier@foss.st.com>, <andi.shyti@kernel.org>,
        <ulf.hansson@linaro.org>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <hugues.fruchet@foss.st.com>, <lee@kernel.org>,
        <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <peng.fan@oss.nxp.com>, <lars@metafoo.de>, <rcsekar@samsung.com>,
        <wg@grandegger.com>, <mkl@pengutronix.de>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
Subject: [PATCH v9 09/13] bus: etzpc: introduce ETZPC firewall controller driver
Date: Fri, 5 Jan 2024 14:04:00 +0100
Message-ID: <20240105130404.301172-10-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
References: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_06,2024-01-05_01,2023-05-22_02

ETZPC is a peripheral and memory firewall controller that filter accesses
based on Arm TrustZone secure state and Arm CPU privilege execution level.
It handles MCU isolation as well.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---

Changes in V2:
	- Add controller name
	- Driver is now a module_platform_driver
	- Use error code returned by stm32_firewall_populate_bus()
	- Fix license

 MAINTAINERS               |   1 +
 drivers/bus/Makefile      |   2 +-
 drivers/bus/stm32_etzpc.c | 141 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100644 drivers/bus/stm32_etzpc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 353b68fb3477..e02ca61f2505 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20442,6 +20442,7 @@ F:	drivers/media/i2c/st-mipid02.c
 ST STM32 FIREWALL
 M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
 S:	Maintained
+F:	drivers/bus/stm32_etzpc.c
 F:	drivers/bus/stm32_firewall.c
 F:	drivers/bus/stm32_rifsc.c
 
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index e50d18e1d141..cddd4984d6af 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -26,7 +26,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
 obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
 obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
 obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
-obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o stm32_rifsc.o
+obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o stm32_rifsc.o stm32_etzpc.o
 obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
 obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
 obj-$(CONFIG_OF)		+= simple-pm-bus.o
diff --git a/drivers/bus/stm32_etzpc.c b/drivers/bus/stm32_etzpc.c
new file mode 100644
index 000000000000..7fc0f16960be
--- /dev/null
+++ b/drivers/bus/stm32_etzpc.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#include "stm32_firewall.h"
+
+/*
+ * ETZPC registers
+ */
+#define ETZPC_DECPROT			0x10
+#define ETZPC_HWCFGR			0x3F0
+
+/*
+ * HWCFGR register
+ */
+#define ETZPC_HWCFGR_NUM_TZMA		GENMASK(7, 0)
+#define ETZPC_HWCFGR_NUM_PER_SEC	GENMASK(15, 8)
+#define ETZPC_HWCFGR_NUM_AHB_SEC	GENMASK(23, 16)
+#define ETZPC_HWCFGR_CHUNKS1N4		GENMASK(31, 24)
+
+/*
+ * ETZPC miscellaneous
+ */
+#define ETZPC_PROT_MASK			GENMASK(1, 0)
+#define ETZPC_PROT_A7NS			0x3
+#define ETZPC_DECPROT_SHIFT		1
+
+#define IDS_PER_DECPROT_REGS		16
+
+static int stm32_etzpc_grant_access(struct stm32_firewall_controller *ctrl, u32 firewall_id)
+{
+	u32 offset, reg_offset, sec_val;
+
+	if (firewall_id >= ctrl->max_entries) {
+		dev_err(ctrl->dev, "Invalid sys bus ID %u", firewall_id);
+		return -EINVAL;
+	}
+
+	/* Check access configuration, 16 peripherals per register */
+	reg_offset = ETZPC_DECPROT + 0x4 * (firewall_id / IDS_PER_DECPROT_REGS);
+	offset = (firewall_id % IDS_PER_DECPROT_REGS) << ETZPC_DECPROT_SHIFT;
+
+	/* Verify peripheral is non-secure and attributed to cortex A7 */
+	sec_val = (readl(ctrl->mmio + reg_offset) >> offset) & ETZPC_PROT_MASK;
+	if (sec_val != ETZPC_PROT_A7NS) {
+		dev_dbg(ctrl->dev, "Invalid bus configuration: reg_offset %#x, value %d\n",
+			reg_offset, sec_val);
+		return -EACCES;
+	}
+
+	return 0;
+}
+
+static void stm32_etzpc_release_access(struct stm32_firewall_controller *ctrl __maybe_unused,
+				       u32 firewall_id __maybe_unused)
+{
+}
+
+static int stm32_etzpc_probe(struct platform_device *pdev)
+{
+	struct stm32_firewall_controller *etzpc_controller;
+	struct device_node *np = pdev->dev.of_node;
+	u32 nb_per, nb_master;
+	struct resource *res;
+	void __iomem *mmio;
+	int rc;
+
+	etzpc_controller = devm_kzalloc(&pdev->dev, sizeof(*etzpc_controller), GFP_KERNEL);
+	if (!etzpc_controller)
+		return -ENOMEM;
+
+	mmio = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(mmio))
+		return PTR_ERR(mmio);
+
+	etzpc_controller->dev = &pdev->dev;
+	etzpc_controller->mmio = mmio;
+	etzpc_controller->name = dev_driver_string(etzpc_controller->dev);
+	etzpc_controller->type = STM32_PERIPHERAL_FIREWALL | STM32_MEMORY_FIREWALL;
+	etzpc_controller->grant_access = stm32_etzpc_grant_access;
+	etzpc_controller->release_access = stm32_etzpc_release_access;
+
+	/* Get number of etzpc entries*/
+	nb_per = FIELD_GET(ETZPC_HWCFGR_NUM_PER_SEC,
+			   readl(etzpc_controller->mmio + ETZPC_HWCFGR));
+	nb_master = FIELD_GET(ETZPC_HWCFGR_NUM_AHB_SEC,
+			      readl(etzpc_controller->mmio + ETZPC_HWCFGR));
+	etzpc_controller->max_entries = nb_per + nb_master;
+
+	platform_set_drvdata(pdev, etzpc_controller);
+
+	rc = stm32_firewall_controller_register(etzpc_controller);
+	if (rc) {
+		dev_err(etzpc_controller->dev, "Couldn't register as a firewall controller: %d",
+			rc);
+		return rc;
+	}
+
+	rc = stm32_firewall_populate_bus(etzpc_controller);
+	if (rc) {
+		dev_err(etzpc_controller->dev, "Couldn't populate ETZPC bus: %d",
+			rc);
+		return rc;
+	}
+
+	/* Populate all allowed nodes */
+	return of_platform_populate(np, NULL, NULL, &pdev->dev);
+}
+
+static const struct of_device_id stm32_etzpc_of_match[] = {
+	{ .compatible = "st,stm32-etzpc" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, stm32_etzpc_of_match);
+
+static struct platform_driver stm32_etzpc_driver = {
+	.probe  = stm32_etzpc_probe,
+	.driver = {
+		.name = "stm32-etzpc",
+		.of_match_table = stm32_etzpc_of_match,
+	},
+};
+module_platform_driver(stm32_etzpc_driver);
+
+MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
+MODULE_DESCRIPTION("STMicroelectronics ETZPC driver");
+MODULE_LICENSE("GPL");
-- 
2.35.3


