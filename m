Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF3C7BFC70
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Oct 2023 15:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232603AbjJJNBU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Oct 2023 09:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbjJJNAt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Oct 2023 09:00:49 -0400
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CD2E136;
        Tue, 10 Oct 2023 06:00:34 -0700 (PDT)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39ACkbUR026208;
        Tue, 10 Oct 2023 15:00:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding:content-type; s=
        selector1; bh=GBsvVyAccDkeabKOXkZLRlVBzq21AYCLF+rd6+Bf4gQ=; b=z2
        yOVCcb+6lAQSYWCqNhLUJdi5QJZ69pw5N0m2fv0av1XsYCV39DV61OnzX4zMvUE7
        rkQjkVk4xxdetwArd8GFAKd3QHVFNmqM03p9T3gaM3KUNTiAzrLPH2DGkjuwpYpQ
        ThdPhMaz5vzWfvkux/2OqU6vqkQfDMEst30zRINSBZJFCRMQ9N6i014dx1IRR4u4
        wXWYBWhJcKJ/+THF1Cf9aUUY4OzjOH7JSUvkSRgjdERlzyI2zxiAkW2p+u/EHlUd
        PUWE/rwQhhzC8fe6YUjGLkSH/ndufiCr6C5oS4ZY4jnxb+bYA/5E0zwY5ufk94tj
        5qZQjZJGBPWsVPK8lD8g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tkj9gt2dw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 Oct 2023 15:00:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D76B10005A;
        Tue, 10 Oct 2023 15:00:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0EE7823150B;
        Tue, 10 Oct 2023 15:00:04 +0200 (CEST)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 15:00:03 +0200
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
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <peng.fan@oss.nxp.com>
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
Subject: [PATCH v6 07/11] bus: rifsc: introduce RIFSC firewall controller driver
Date:   Tue, 10 Oct 2023 14:57:15 +0200
Message-ID: <20231010125719.784627-8-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010125719.784627-1-gatien.chevallier@foss.st.com>
References: <20231010125719.784627-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_08,2023-10-10_01,2023-05-22_02
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

RIFSC is a peripheral firewall controller that filter accesses based on
Arm TrustZone secure state, Arm CPU privilege execution level and
Compartment IDentification of the STM32 SoC subsystems.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---

Changes in V4:
	- Fix incorrect use of __set_bit() in
	- stm32_rif_acquire_semaphore()

Changes in V2:
	- Add controller name
	- Driver is now a module_platform_driver
	- Use error code returned by stm32_firewall_populate_bus()
	- Fix license

 MAINTAINERS               |   1 +
 drivers/bus/Makefile      |   2 +-
 drivers/bus/stm32_rifsc.c | 252 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 254 insertions(+), 1 deletion(-)
 create mode 100644 drivers/bus/stm32_rifsc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 70da7e1a2058..d6935b462c89 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20297,6 +20297,7 @@ ST STM32 FIREWALL
 M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
 S:	Maintained
 F:	drivers/bus/stm32_firewall.c
+F:	drivers/bus/stm32_rifsc.c
 
 ST STM32 I2C/SMBUS DRIVER
 M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index fc0511450ec2..e50d18e1d141 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -26,7 +26,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
 obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
 obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
 obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
-obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o
+obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o stm32_rifsc.o
 obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
 obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
 obj-$(CONFIG_OF)		+= simple-pm-bus.o
diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
new file mode 100644
index 000000000000..4cf1b60014b7
--- /dev/null
+++ b/drivers/bus/stm32_rifsc.c
@@ -0,0 +1,252 @@
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
+ * RIFSC offset register
+ */
+#define RIFSC_RISC_SECCFGR0		0x10
+#define RIFSC_RISC_PRIVCFGR0		0x30
+#define RIFSC_RISC_PER0_CIDCFGR		0x100
+#define RIFSC_RISC_PER0_SEMCR		0x104
+#define RIFSC_RISC_HWCFGR2		0xFEC
+
+/*
+ * SEMCR register
+ */
+#define SEMCR_MUTEX			BIT(0)
+
+/*
+ * HWCFGR2 register
+ */
+#define HWCFGR2_CONF1_MASK		GENMASK(15, 0)
+#define HWCFGR2_CONF2_MASK		GENMASK(23, 16)
+#define HWCFGR2_CONF3_MASK		GENMASK(31, 24)
+
+/*
+ * RIFSC miscellaneous
+ */
+#define RIFSC_RISC_CFEN_MASK		BIT(0)
+#define RIFSC_RISC_SEM_EN_MASK		BIT(1)
+#define RIFSC_RISC_SCID_MASK		GENMASK(6, 4)
+#define RIFSC_RISC_SEML_SHIFT		16
+#define RIFSC_RISC_SEMWL_MASK		GENMASK(23, 16)
+#define RIFSC_RISC_PER_ID_MASK		GENMASK(31, 24)
+
+#define RIFSC_RISC_PERx_CID_MASK	(RIFSC_RISC_CFEN_MASK | \
+					 RIFSC_RISC_SEM_EN_MASK | \
+					 RIFSC_RISC_SCID_MASK | \
+					 RIFSC_RISC_SEMWL_MASK)
+
+#define IDS_PER_RISC_SEC_PRIV_REGS	32
+
+/* RIF miscellaneous */
+/*
+ * CIDCFGR register fields
+ */
+#define CIDCFGR_CFEN			BIT(0)
+#define CIDCFGR_SEMEN			BIT(1)
+#define CIDCFGR_SEMWL(x)		BIT(RIFSC_RISC_SEML_SHIFT + (x))
+
+#define SEMWL_SHIFT			16
+
+/* Compartiment IDs */
+#define RIF_CID0			0x0
+#define RIF_CID1			0x1
+
+static bool stm32_rifsc_is_semaphore_available(void __iomem *addr)
+{
+	return !(readl(addr) & SEMCR_MUTEX);
+}
+
+static int stm32_rif_acquire_semaphore(struct stm32_firewall_controller *stm32_firewall_controller,
+				       int id)
+{
+	void __iomem *addr = stm32_firewall_controller->mmio + RIFSC_RISC_PER0_SEMCR + 0x8 * id;
+
+	writel(SEMCR_MUTEX, addr);
+
+	/* Check that CID1 has the semaphore */
+	if (stm32_rifsc_is_semaphore_available(addr) ||
+	    FIELD_GET(RIFSC_RISC_SCID_MASK, readl(addr)) != RIF_CID1)
+		return -EACCES;
+
+	return 0;
+}
+
+static void stm32_rif_release_semaphore(struct stm32_firewall_controller *stm32_firewall_controller,
+					int id)
+{
+	void __iomem *addr = stm32_firewall_controller->mmio + RIFSC_RISC_PER0_SEMCR + 0x8 * id;
+
+	if (stm32_rifsc_is_semaphore_available(addr))
+		return;
+
+	writel(SEMCR_MUTEX, addr);
+
+	/* Ok if another compartment takes the semaphore before the check */
+	WARN_ON(!stm32_rifsc_is_semaphore_available(addr) &&
+		FIELD_GET(RIFSC_RISC_SCID_MASK, readl(addr)) == RIF_CID1);
+}
+
+static int stm32_rifsc_grant_access(struct stm32_firewall_controller *ctrl, u32 firewall_id)
+{
+	struct stm32_firewall_controller *rifsc_controller = ctrl;
+	u32 reg_offset, reg_id, sec_reg_value, cid_reg_value;
+	int rc;
+
+	if (firewall_id >= rifsc_controller->max_entries) {
+		dev_err(rifsc_controller->dev, "Invalid sys bus ID %u", firewall_id);
+		return -EINVAL;
+	}
+
+	/*
+	 * RIFSC_RISC_PRIVCFGRx and RIFSC_RISC_SECCFGRx both handle configuration access for
+	 * 32 peripherals. On the other hand, there is one _RIFSC_RISC_PERx_CIDCFGR register
+	 * per peripheral
+	 */
+	reg_id = firewall_id / IDS_PER_RISC_SEC_PRIV_REGS;
+	reg_offset = firewall_id % IDS_PER_RISC_SEC_PRIV_REGS;
+	sec_reg_value = readl(rifsc_controller->mmio + RIFSC_RISC_SECCFGR0 + 0x4 * reg_id);
+	cid_reg_value = readl(rifsc_controller->mmio + RIFSC_RISC_PER0_CIDCFGR + 0x8 * firewall_id);
+
+	/* First check conditions for semaphore mode, which doesn't take into account static CID. */
+	if ((cid_reg_value & CIDCFGR_SEMEN) && (cid_reg_value & CIDCFGR_CFEN)) {
+		if (cid_reg_value & BIT(RIF_CID1 + SEMWL_SHIFT)) {
+			/* Static CID is irrelevant if semaphore mode */
+			goto skip_cid_check;
+		} else {
+			dev_dbg(rifsc_controller->dev,
+				"Invalid bus semaphore configuration: index %d\n", firewall_id);
+			return -EACCES;
+		}
+	}
+
+	/*
+	 * Skip CID check if CID filtering isn't enabled or filtering is enabled on CID0, which
+	 * corresponds to whatever CID.
+	 */
+	if (!(cid_reg_value & CIDCFGR_CFEN) ||
+	    FIELD_GET(RIFSC_RISC_SCID_MASK, cid_reg_value) == RIF_CID0)
+		goto skip_cid_check;
+
+	/* Coherency check with the CID configuration */
+	if (FIELD_GET(RIFSC_RISC_SCID_MASK, cid_reg_value) != RIF_CID1) {
+		dev_dbg(rifsc_controller->dev, "Invalid CID configuration for peripheral: %d\n",
+			firewall_id);
+		return -EACCES;
+	}
+
+skip_cid_check:
+	/* Check security configuration */
+	if (sec_reg_value & BIT(reg_offset)) {
+		dev_dbg(rifsc_controller->dev,
+			"Invalid security configuration for peripheral: %d\n", firewall_id);
+		return -EACCES;
+	}
+
+	/*
+	 * If the peripheral is in semaphore mode, take the semaphore so that
+	 * the CID1 has the ownership.
+	 */
+	if ((cid_reg_value & CIDCFGR_SEMEN) && (cid_reg_value & CIDCFGR_CFEN)) {
+		rc = stm32_rif_acquire_semaphore(rifsc_controller, firewall_id);
+		if (rc) {
+			dev_err(rifsc_controller->dev,
+				"Couldn't acquire semaphore for peripheral: %d\n", firewall_id);
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+static void stm32_rifsc_release_access(struct stm32_firewall_controller *ctrl, u32 firewall_id)
+{
+	stm32_rif_release_semaphore(ctrl, firewall_id);
+}
+
+static int stm32_rifsc_probe(struct platform_device *pdev)
+{
+	struct stm32_firewall_controller *rifsc_controller;
+	struct device_node *np = pdev->dev.of_node;
+	u32 nb_risup, nb_rimu, nb_risal;
+	struct resource *res;
+	void __iomem *mmio;
+	int rc;
+
+	rifsc_controller = devm_kzalloc(&pdev->dev, sizeof(*rifsc_controller), GFP_KERNEL);
+	if (!rifsc_controller)
+		return -ENOMEM;
+
+	mmio = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(mmio))
+		return PTR_ERR(mmio);
+
+	rifsc_controller->dev = &pdev->dev;
+	rifsc_controller->mmio = mmio;
+	rifsc_controller->name = dev_driver_string(rifsc_controller->dev);
+	rifsc_controller->type = STM32_PERIPHERAL_FIREWALL | STM32_MEMORY_FIREWALL;
+	rifsc_controller->grant_access = stm32_rifsc_grant_access;
+	rifsc_controller->release_access = stm32_rifsc_release_access;
+
+	/* Get number of RIFSC entries*/
+	nb_risup = readl(rifsc_controller->mmio + RIFSC_RISC_HWCFGR2) & HWCFGR2_CONF1_MASK;
+	nb_rimu = readl(rifsc_controller->mmio + RIFSC_RISC_HWCFGR2) & HWCFGR2_CONF2_MASK;
+	nb_risal = readl(rifsc_controller->mmio + RIFSC_RISC_HWCFGR2) & HWCFGR2_CONF3_MASK;
+	rifsc_controller->max_entries = nb_risup + nb_rimu + nb_risal;
+
+	platform_set_drvdata(pdev, rifsc_controller);
+
+	rc = stm32_firewall_controller_register(rifsc_controller);
+	if (rc) {
+		dev_err(rifsc_controller->dev, "Couldn't register as a firewall controller: %d",
+			rc);
+		return rc;
+	}
+
+	rc = stm32_firewall_populate_bus(rifsc_controller);
+	if (rc) {
+		dev_err(rifsc_controller->dev, "Couldn't populate RIFSC bus: %d",
+			rc);
+		return rc;
+	}
+
+	/* Populate all allowed nodes */
+	return of_platform_populate(np, NULL, NULL, &pdev->dev);
+}
+
+static const struct of_device_id stm32_rifsc_of_match[] = {
+	{ .compatible = "st,stm32mp25-rifsc" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, stm32_rifsc_of_match);
+
+static struct platform_driver stm32_rifsc_driver = {
+	.probe  = stm32_rifsc_probe,
+	.driver = {
+		.name = "stm32-rifsc",
+		.of_match_table = stm32_rifsc_of_match,
+	},
+};
+module_platform_driver(stm32_rifsc_driver);
+
+MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
+MODULE_DESCRIPTION("STMicroelectronics RIFSC driver");
+MODULE_LICENSE("GPL");
-- 
2.35.3

