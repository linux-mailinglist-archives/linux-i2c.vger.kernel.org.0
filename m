Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70592609BA6
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 09:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbiJXHnE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 03:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbiJXHme (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 03:42:34 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D88E4DB3A;
        Mon, 24 Oct 2022 00:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+mA+FVDRGnCBlSwMQFJriTXpEzpn6qJBNjkwBpWu+QkuX2evWYGcsxd3c56+eI/ZJhhV9/FtfC/124/k3KlrDaSQl9BnYIfV7ZB+p4Y0qZMtti61vxNmVlwOcBnjY3AXt05YMasSKzjFSHgK9WefiVlOCiFWCa8HUWXu0uN0aLVChjSawIkta9Nt3vD7VNmgk89sHZAvFh5TChunV8d0/bR///2WxE3+AYRAq0e3PL6TleqSVTyVf4bylNuwo3oq6/zl4ZFeLF2Unj4Tr6LkKLxhOnaR5izO2bbBn/7sPA8GNzRmRqgrQp+3ulc0qsUM/lmctRHNmvZWcc8FADPtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8cf9GVdx5sRqGXNt6fGcCPxZa/EL1AS2tqtVZPD/co=;
 b=EafJK0POdPXsbNj1riEV3i5OTGmqACgFLSMG+CC5urPuejgpAYZYBqrbXwaIvCLeZr3wS+l2q0TZ++CaWwOsq3WOTCr5byZuPDRpiMFgQfj7xSBUSAIV8cnjIopehnzvXow0aJOLuyV8eGf2G5W8+mP8Yts9lcSMo2IP5un0/VpexhAe1/ACpSZ/0n7q1Vh04JXu/U5niB9SG7RN7mxRZnz8WZQDeem7FOl4HSLgD9iiBdrGdPwqTlvBLdoZ70BvzaFfMcpaT7ibQD38iI9jHOPqf9rLL0z+lQ7w++1+7HBlsCI6GH8nP8hhbzzqntmaybOOOVIaLQjmCYIBTS39bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8cf9GVdx5sRqGXNt6fGcCPxZa/EL1AS2tqtVZPD/co=;
 b=LeDNpRKJdG/WCZOIRFR7+YzwJNedQOxS/zkbONLmWyqkOSB4G4ehowMS69NCobL8cl2Gc99Xm3ydtnCue4JX2ubNmR8c0TmM9jvStNJPqmjyLJurjj4pEbQsO3Wthdr0mzZ1koHwLo03op8kteFCf83tocanwdo8VcwTx/UG/WuFikn8D9EhNPLlZax96AYMHOGUB4qk0FI39tYBwDkn0ZZc9c27h7pijomz6e6I7Sd2hxGGSnno9WRXjjAJeH5FwxL7s/cbvcz6+8UcNEroFBl03ZxCOd6Y7Qhay9Q9cvD9TfMGaj5N6usWBmNq5MruPjRq/s/rxZrfSPtO0YHdTg==
Received: from DS7PR03CA0237.namprd03.prod.outlook.com (2603:10b6:5:3ba::32)
 by CH2PR12MB5020.namprd12.prod.outlook.com (2603:10b6:610:65::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.22; Mon, 24 Oct
 2022 07:42:22 +0000
Received: from DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::78) by DS7PR03CA0237.outlook.office365.com
 (2603:10b6:5:3ba::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27 via Frontend
 Transport; Mon, 24 Oct 2022 07:42:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT015.mail.protection.outlook.com (10.13.172.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 07:42:21 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 24 Oct
 2022 00:42:10 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 24 Oct 2022 00:42:09 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.986.29
 via Frontend Transport; Mon, 24 Oct 2022 00:42:06 -0700
From:   Wayne Chang <waynec@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <treding@nvidia.com>,
        <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
        <heikki.krogerus@linux.intel.com>, <ajayg@nvidia.com>,
        <kishon@ti.com>, <vkoul@kernel.org>, <p.zabel@pengutronix.de>,
        <balbi@kernel.org>, <mathias.nyman@intel.com>, <jckuo@nvidia.com>
CC:     <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <singhanc@nvidia.com>, <linux-i2c@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH 09/11] phy: tegra: xusb: Add Tegra234 support
Date:   Mon, 24 Oct 2022 15:41:26 +0800
Message-ID: <20221024074128.1113554-10-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024074128.1113554-1-waynec@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT015:EE_|CH2PR12MB5020:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6e61b6-4eb1-48e9-2657-08dab5934920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NVLixrIzIppHSasxMK9iD8GLgNcrzZP7v2V/aYF9yNuYzQK5YZQsg68z7oX2XDo0nRAcPTSBlK2VOTNtAs5bXcsSVE/cQmjKo2HZM+Cr3sAkuZnRn/njipBIg+61gDSE4FixFviTnR8F4r5B1uuw1SzqRnGlj39NDNQlaV5loxTLG/SclZkPAEJgBhbeSgz7JWezvrao0MqNaTY/6/3KxkDviegF/B9X9j8hqt42mxyGpzGNPTDhkyO0cAdeROK8U4gDpVCk/Ym1SVWjJTBCFCrIUAe7hZ6yvnPgAyV5nTRBXtcqtArEFoHF0v+pOf6Wt/+WnBhC2T5xpOjaE2EoHozzcGfSjrambDVAYPWI9N8Bp3XWdnDJ03iHzH3kWgzYpRtBkoaPcLXHPzl4rMHAKSkbQOX5kylunWCh4uIDXE+EyXfUIhwRDCiyiHfnuKs39HBTTAyaWfSqBuUR/CI4ekU6kwPgEtzGOHidUKPqAlutGDGKsJu4XeYcZKZqUk6GW+qkFkbTNbK8OSUEt1972VjLtHd7JkGUYBWoGaUa1z7VFg9k6FPTvArI92zEMIpqMICmnHYB1Q7XIqQYRUXfBuf3m8dkViLKNMQK56cGyW3cslZXmVBGQRpE54GpFtzU2yzCTBN9iExMWOwzSuF5KAC1VMslZH6/1ZIRiu0+ZiiQzF0FpvyZ6YsEnVf5Nt51a3fwdsdtyNFpP8XhOLHtRTOkBlst2qerEMuB2u2C+75ByF7kkoAIWB1ldOyB4m+npjtneH1rQwuFzEcqxNXUlxZzZOtN8pxeBNQflO++5EA=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(47076005)(426003)(186003)(1076003)(336012)(40480700001)(6666004)(2906002)(86362001)(356005)(921005)(7636003)(36756003)(40460700003)(82740400003)(82310400005)(83380400001)(7696005)(26005)(4326008)(36860700001)(2616005)(316002)(8676002)(478600001)(6636002)(41300700001)(110136005)(70586007)(5660300002)(7416002)(8936002)(54906003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 07:42:21.6604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6e61b6-4eb1-48e9-2657-08dab5934920
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5020
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Sing-Han Chen <singhanc@nvidia.com>

Add support for the XUSB pad controller found on Tegra234 SoCs. It is
mostly similar to the same IP found on Tegra194, because most of
the Tegra234 XUSB PADCTL registers definition and programming sequence
are the same as Tegra194, Tegra234 XUSB PADCTL can share the same
driver with Tegra186 and Tegra194 XUSB PADCTL.

Introduce a new feature, USB2 HW tracking, for Tegra234.
The feature is to enable HW periodical PAD tracking which measure
and capture the electric parameters of USB2.0 PAD.

Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
Co-developed-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
 drivers/phy/tegra/Makefile        |  1 +
 drivers/phy/tegra/xusb-tegra186.c | 65 +++++++++++++++++++++++++++++--
 drivers/phy/tegra/xusb.c          |  6 +++
 drivers/phy/tegra/xusb.h          | 23 +++++++++++
 4 files changed, 92 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
index 89b84067cb4c..eeeea72de117 100644
--- a/drivers/phy/tegra/Makefile
+++ b/drivers/phy/tegra/Makefile
@@ -7,4 +7,5 @@ phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_132_SOC) += xusb-tegra124.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) += xusb-tegra210.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) += xusb-tegra186.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_194_SOC) += xusb-tegra186.o
+phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_234_SOC) += xusb-tegra186.o
 obj-$(CONFIG_PHY_TEGRA194_P2U) += phy-tegra194-p2u.o
diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index f121b4ffbbfd..cc02cea65a21 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -89,6 +89,11 @@
 #define  USB2_TRK_START_TIMER(x)		(((x) & 0x7f) << 12)
 #define  USB2_TRK_DONE_RESET_TIMER(x)		(((x) & 0x7f) << 19)
 #define  USB2_PD_TRK				BIT(26)
+#define  USB2_TRK_COMPLETED			BIT(31)
+
+#define XUSB_PADCTL_USB2_BIAS_PAD_CTL2		0x28c
+#define  USB2_TRK_HW_MODE			BIT(0)
+#define  CYA_TRK_CODE_UPDATE_ON_IDLE		BIT(31)
 
 #define XUSB_PADCTL_HSIC_PADX_CTL0(x)		(0x300 + (x) * 0x20)
 #define  HSIC_PD_TX_DATA0			BIT(1)
@@ -609,9 +614,32 @@ static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
 	value &= ~USB2_PD_TRK;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
 
-	udelay(100);
+	if (padctl->soc->poll_trk_completed) {
+		err = padctl_readl_poll(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1,
+					USB2_TRK_COMPLETED, USB2_TRK_COMPLETED, 100);
+		if (err) {
+			/* The failure with polling on trk complete will not
+			 * cause the failure of powering on the bias pad.
+			 */
+			dev_warn(dev, "failed to poll USB2 trk completed: %d\n",
+				err);
+		}
 
-	clk_disable_unprepare(priv->usb2_trk_clk);
+		value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
+		value |= USB2_TRK_COMPLETED;
+		padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
+	} else {
+		udelay(100);
+	}
+
+	if (padctl->soc->trk_hw_mode) {
+		value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
+		value |= USB2_TRK_HW_MODE;
+		value &= ~CYA_TRK_CODE_UPDATE_ON_IDLE;
+		padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
+	} else {
+		clk_disable_unprepare(priv->usb2_trk_clk);
+	}
 
 	mutex_unlock(&padctl->lock);
 }
@@ -637,6 +665,13 @@ static void tegra186_utmi_bias_pad_power_off(struct tegra_xusb_padctl *padctl)
 	value |= USB2_PD_TRK;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
 
+	if (padctl->soc->trk_hw_mode) {
+		value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
+		value &= ~USB2_TRK_HW_MODE;
+		padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
+		clk_disable_unprepare(priv->usb2_trk_clk);
+	}
+
 	mutex_unlock(&padctl->lock);
 }
 
@@ -1560,7 +1595,8 @@ const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc = {
 EXPORT_SYMBOL_GPL(tegra186_xusb_padctl_soc);
 #endif
 
-#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+	IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
 static const char * const tegra194_xusb_padctl_supply_names[] = {
 	"avdd-usb",
 	"vclamp-usb",
@@ -1616,8 +1652,31 @@ const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc = {
 	.supply_names = tegra194_xusb_padctl_supply_names,
 	.num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
 	.supports_gen2 = true,
+	.poll_trk_completed = true,
 };
 EXPORT_SYMBOL_GPL(tegra194_xusb_padctl_soc);
+
+const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc = {
+	.num_pads = ARRAY_SIZE(tegra194_pads),
+	.pads = tegra194_pads,
+	.ports = {
+		.usb2 = {
+			.ops = &tegra186_usb2_port_ops,
+			.count = 4,
+		},
+		.usb3 = {
+			.ops = &tegra186_usb3_port_ops,
+			.count = 4,
+		},
+	},
+	.ops = &tegra186_xusb_padctl_ops,
+	.supply_names = tegra194_xusb_padctl_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
+	.supports_gen2 = true,
+	.poll_trk_completed = true,
+	.trk_hw_mode = true,
+};
+EXPORT_SYMBOL_GPL(tegra234_xusb_padctl_soc);
 #endif
 
 MODULE_AUTHOR("JC Kuo <jckuo@nvidia.com>");
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 95091876c422..23d179b1a5b5 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -71,6 +71,12 @@ static const struct of_device_id tegra_xusb_padctl_of_match[] = {
 		.compatible = "nvidia,tegra194-xusb-padctl",
 		.data = &tegra194_xusb_padctl_soc,
 	},
+#endif
+#if defined(CONFIG_ARCH_TEGRA_234_SOC)
+	{
+		.compatible = "nvidia,tegra234-xusb-padctl",
+		.data = &tegra234_xusb_padctl_soc,
+	},
 #endif
 	{ }
 };
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index 8cfbbdbd6e0c..ec0b5b023ad1 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -8,6 +8,7 @@
 #define __PHY_TEGRA_XUSB_H
 
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
 
@@ -433,6 +434,8 @@ struct tegra_xusb_padctl_soc {
 	unsigned int num_supplies;
 	bool supports_gen2;
 	bool need_fake_usb3_port;
+	bool poll_trk_completed;
+	bool trk_hw_mode;
 };
 
 struct tegra_xusb_padctl {
@@ -475,6 +478,23 @@ static inline u32 padctl_readl(struct tegra_xusb_padctl *padctl,
 	return value;
 }
 
+static inline u32 padctl_readl_poll(struct tegra_xusb_padctl *padctl,
+	unsigned long offset, u32 val, u32 mask, int us)
+{
+	u32 regval;
+	int err;
+
+	err = readl_poll_timeout_atomic(padctl->regs + offset, regval,
+					 (regval & mask) == val, 1, us);
+	dev_dbg(padctl->dev, "%08lx poll > %08x\n", offset, regval);
+	if (err) {
+		dev_err(padctl->dev, "%08lx poll timeout > %08x\n", offset,
+			regval);
+	}
+
+	return err;
+}
+
 struct tegra_xusb_lane *tegra_xusb_find_lane(struct tegra_xusb_padctl *padctl,
 					     const char *name,
 					     unsigned int index);
@@ -491,5 +511,8 @@ extern const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc;
 #if defined(CONFIG_ARCH_TEGRA_194_SOC)
 extern const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc;
 #endif
+#if defined(CONFIG_ARCH_TEGRA_234_SOC)
+extern const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc;
+#endif
 
 #endif /* __PHY_TEGRA_XUSB_H */
-- 
2.25.1

