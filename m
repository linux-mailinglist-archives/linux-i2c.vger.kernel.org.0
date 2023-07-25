Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C989A761F36
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 18:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbjGYQqN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 12:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbjGYQqD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 12:46:03 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC7B32696;
        Tue, 25 Jul 2023 09:45:31 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36PDS97S010561;
        Tue, 25 Jul 2023 18:43:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Gigknf/mhA1u/uET1gyId2DnPQNiOv40D33cx6scQfg=;
 b=gPvcoqnTKaHrFgYNWssYK09nXZQJexGGfUWtuiDwPCVy8MkVLGe5Nsp+jxHBpUnWJ/3R
 tUSmSchvKUWn1Y9Kx2aFFqatYCOPCFGaCAHL/lf6wb+AMYU76q5bFgAifG6QVKaLaASy
 baPF2OqMdtH0tTZBvgz4a8zcqS0pefnc+W0Qg3P/pKhheeB1CrOQcywruAXZtP6Pyk2H
 sgYCAHIiqDGIWH8cIL2dmXUnacy/SAScm2cYWr/aeeN0B0HSqhV07oRwNHu1VCCaoebb
 2fp5mE42yLdov4Losf+DjSgMQb0mpws+lxC+Psa9+IJ/NDrIBkf6pO4Xl6Lv6Cz+Ejfc gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s2bkbjqrd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Jul 2023 18:43:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C9381100048;
        Tue, 25 Jul 2023 18:43:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BCF9C27FAB5;
        Tue, 25 Jul 2023 18:43:56 +0200 (CEST)
Received: from localhost (10.201.21.121) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 25 Jul
 2023 18:43:56 +0200
From:   Gatien Chevallier <gatien.chevallier@foss.st.com>
To:     <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <vkoul@kernel.org>, <jic23@kernel.org>,
        <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
        <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
        <andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
        <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
        <hugues.fruchet@foss.st.com>, <lee@kernel.org>, <will@kernel.org>,
        <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>
CC:     <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-iio@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <linux-media@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH v2 09/11] bus: etzpc: introduce ETZPC firewall controller driver
Date:   Tue, 25 Jul 2023 18:41:02 +0200
Message-ID: <20230725164104.273965-10-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230725164104.273965-1-gatien.chevallier@foss.st.com>
References: <20230725164104.273965-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.21.121]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_08,2023-07-25_01,2023-05-22_02
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

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
index 9dcf69a9e30c..a55fa36e25db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20140,6 +20140,7 @@ F:	drivers/media/i2c/st-mipid02.c
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

