Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA000627E33
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 13:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237329AbiKNMm5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 07:42:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237338AbiKNMmV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 07:42:21 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB65424F0D;
        Mon, 14 Nov 2022 04:42:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qwx+sPvmKY3JjnE3sS2hRvbTXmkmBbRCRqLHIucGTkcYA2s3NJEm835MV4OXnHSktYBHbsZlduIVlUn9M5FRtuo/O8/nrmgGldJtZz8l/ZcsJH5dKoqFDC7yN+WZfa1s74axQJldO0U9JjLgoeqzV54QbUElKjIvt+YXWvNQwWfrk9HoNBnK842ye0dt0UzcM3U3LBqwp++FQ+FgCciRASYXi2wWY2vmQ5JVWoEkj3FBUWKxy2EMMd5zUdkF/mjq66oGi0sB+qLozv31v3J1MldkAPO3xmGQP//fY1L3+Idj3U4eJrvcXIM9Gh1n9AxYEg7mc7VXes2Up3591dYEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6N4XpGeSdgX/4ipKYz8AkBEyx7Sm9kgi0aqvp7CBZSg=;
 b=SFiTiQafllPXj3YMpLrR16LLO9Igf0tkuokyS0TOWUNJW+yuY4nzkTpbVYNXyjtWjH/65fIjnzCNGwZ071P3Y6Q+w32wnlDLwtjH9K0WrqiBbHHQVL610ZxVblK3BrDuTrBMX1jyW37FLVViZ5Qyb6YUvYO68lT5cyq5xZ8mjnU5mdZBOjnUPq59xsAHmAHKnUsZP/rnlHaTfNR9/9wynGJyDHost1sugW4NnvpbFlCA9Ul8AqKc6y5QVSWVAsVa4uQDAMn2VniIiK204n5f2iB8JZqZRG+OhS7NVmLB9e3aysLH2zrOJz3T9bMl/S2QdFTOl1sT5Kt63x6s3wczAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6N4XpGeSdgX/4ipKYz8AkBEyx7Sm9kgi0aqvp7CBZSg=;
 b=uYt28TkZgSqUPM9dUaCDDkRgE3I3RURZzayxgWstY3ja/wCfYNh3XCjt1m93RoTPwcyxBH3jUOsdXlzzsrxa38r3srX7O5JVl9Hm/LOFVWYQFaEt3LWM77tM74hFF7PAJwcipzDegkfX4toqh59xOOc7uI4A5hibqHM+nKjY0cPIuVPg9HIpih8gFv24ghyXoSOpfdCrpMWLKC8IYcTvluULUAOw1z1eIJ/ZyzbT7bt2AzmVv6QnFPLsP8ZGe3DMgFm+4iMTFZsHhGZImhD2kA7VuJHjVZge2XDXcRB/NaXYypNKtC/7Zulm48z1TjUnXNEKhC80DCqqfBONSnZkkQ==
Received: from MN2PR11CA0022.namprd11.prod.outlook.com (2603:10b6:208:23b::27)
 by MW4PR12MB7216.namprd12.prod.outlook.com (2603:10b6:303:226::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 14 Nov
 2022 12:42:05 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::80) by MN2PR11CA0022.outlook.office365.com
 (2603:10b6:208:23b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Mon, 14 Nov 2022 12:42:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Mon, 14 Nov 2022 12:42:04 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:44 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:43 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Mon, 14 Nov 2022 04:41:40 -0800
From:   Wayne Chang <waynec@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <treding@nvidia.com>,
        <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
        <heikki.krogerus@linux.intel.com>, <ajayg@nvidia.com>,
        <vkoul@kernel.org>, <p.zabel@pengutronix.de>, <balbi@kernel.org>,
        <mathias.nyman@intel.com>, <jckuo@nvidia.com>
CC:     <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <singhanc@nvidia.com>, <linux-i2c@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>
Subject: [PATCH v3 11/13] phy: tegra: xusb: Add Tegra234 support
Date:   Mon, 14 Nov 2022 20:40:51 +0800
Message-ID: <20221114124053.1873316-12-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114124053.1873316-1-waynec@nvidia.com>
References: <20221114124053.1873316-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|MW4PR12MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f13f8eb-e823-4809-e6ea-08dac63da278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7UQFSbuRXIYY8FmXaplgLSl0bF9yJbRCs/uF2zctMFbCRCyCi1iizWacYUrhKTAmNCglmKjDP+Ho3lMscFu96kaXJ7dYTXMCbOtdHjfYUou3WiV2KkJdbDbLibNtadbqUX4q9n26FAtgQBe8mos+Me/nekwEUwrA01cocRS3U0gngMgJ1LlU0LO4bTzmIdHbqLdf8r+/02r6H6i/hSJjmiZx1DsvaUPN0TvoJcEtyjqpLjk0blgfF0Y234fQeMcj3bUExGkrstT8jWln6o3Os1EOt72YcJ3XubILZ2XwvqAJmqi7h3lMd0OsXfoOlm7yMyEUNJ6+29RTFw99Q1LPp4qA3Rz5QQCf0XlqqxdcXKfwtuefh8eMQohnHcvK3/uC+ireS4ObeE9WkVP2iFzxfxg2WNc65zRYMzQzj03GzbuOHAVLJqASgf1eR/p3VxFPQk5h1FKTUdpS8y/rvwD9Gd8XUsFBE3jYPTMubiTAPAIW9EKEjAgAd31+++M5zJinO6MoiC1JQXLVEG8+ra+Dyqx3+HtIXVL1I1dr8F7vrNcjHTKhdLSTgvOXmk1g6ZN8DWcfIe/nOeV5L8QZnb/9jDt2+IZF83tgzmeN9//LC68ChaNf7X1Gjv4/P2fqoIle2WEVeC7eZLY/w3BdZViHHWiHGV4eo6Ie8FoHXKmu++YSY1cI1A46bg/KmusGExD/9Y+ad9SnjdyEyrZ2ymBOSFvXEAkr9A6Hx35tPSIUrqFAbCycbRXYIm42qZPUQ2wuOWkI9BnAp5cXz/BbO1hkGqwebavW3d4thccU9s1788E=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(46966006)(40470700004)(36840700001)(336012)(82310400005)(41300700001)(7416002)(40480700001)(40460700003)(26005)(70586007)(921005)(8676002)(4326008)(36756003)(70206006)(1076003)(478600001)(6636002)(186003)(7696005)(54906003)(110136005)(7636003)(82740400003)(83380400001)(86362001)(2616005)(8936002)(6666004)(316002)(5660300002)(356005)(426003)(2906002)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 12:42:04.5608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f13f8eb-e823-4809-e6ea-08dac63da278
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7216
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
V2 -> V3:nothing has changed
V1 -> V2:remove atomic and the helper in padctl_readl_poll func.
 drivers/phy/tegra/Makefile        |  1 +
 drivers/phy/tegra/xusb-tegra186.c | 64 +++++++++++++++++++++++++++++--
 drivers/phy/tegra/xusb.c          |  6 +++
 drivers/phy/tegra/xusb.h          | 22 +++++++++++
 4 files changed, 90 insertions(+), 3 deletions(-)

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
index f121b4ffbbfd..5ae3cea19c84 100644
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
@@ -609,9 +614,31 @@ static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
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
+			dev_warn(dev, "failed to poll USB2 trk completed: %d\n", err);
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
@@ -637,6 +664,13 @@ static void tegra186_utmi_bias_pad_power_off(struct tegra_xusb_padctl *padctl)
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
 
@@ -1560,7 +1594,8 @@ const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc = {
 EXPORT_SYMBOL_GPL(tegra186_xusb_padctl_soc);
 #endif
 
-#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+	IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
 static const char * const tegra194_xusb_padctl_supply_names[] = {
 	"avdd-usb",
 	"vclamp-usb",
@@ -1616,8 +1651,31 @@ const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc = {
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
index dce45fbbd699..c2f160628552 100644
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
index 8cfbbdbd6e0c..a21826c730d7 100644
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
@@ -475,6 +478,22 @@ static inline u32 padctl_readl(struct tegra_xusb_padctl *padctl,
 	return value;
 }
 
+static inline u32 padctl_readl_poll(struct tegra_xusb_padctl *padctl,
+	unsigned long offset, u32 val, u32 mask, int us)
+{
+	u32 regval;
+	int err;
+
+	err = readl_poll_timeout(padctl->regs + offset, regval,
+					 (regval & mask) == val, 1, us);
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
@@ -491,5 +510,8 @@ extern const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc;
 #if defined(CONFIG_ARCH_TEGRA_194_SOC)
 extern const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc;
 #endif
+#if defined(CONFIG_ARCH_TEGRA_234_SOC)
+extern const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc;
+#endif
 
 #endif /* __PHY_TEGRA_XUSB_H */
-- 
2.25.1

