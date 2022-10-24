Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4C7D609BA0
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Oct 2022 09:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiJXHnD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Oct 2022 03:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiJXHme (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Oct 2022 03:42:34 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C2976113D;
        Mon, 24 Oct 2022 00:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLYcaTXAzMRO7Z1HvZe8iAZHLOw28TxjLWeUnf59GowhAfUweUdv4LdYYdc4Sootf6JABMqiA2mYdCb9p58kDAgDEcNRB+gAfuYz7AbdTfX4ttLYUOWSh9srEDsuJrbf4rcETQZSkHhvrQTwwE9FsgK2WTHcMYs3P9eMUt3JYfrwtOqqoYMaAfshhk3wMojysicwdDGu7oaRPsyR5V3BI2TVHdSib9AWer+JUvvsX3HpMRMhLsTLCGA0iAzR4Kl4FA+uTqha15FPmsxn7JDbPgZYtzcS6s/8wNMV8S5yPt/1rdS/tKq7kJYqYxO/PyxHelw28iWVKkUn2vahfoRObA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjkOC3u7gOxdWhfRjzfmFY7J20b23gqg5A/g36/PlNo=;
 b=itj+BrDU7yo4hHI5W0FIPwOEsWDlbeuFIxR/GHzK4ri9eEpxp1f2GunyS5Hr8nKRKR8tABudW7q/gSn/sUPEcmpftOdAqNOmE1LgNDm5AN7DhGxQw0vf1JDaPgVv6yjpgbF2k6NlPD8VBzdoQ4raefkO1VHBq1V2Eiqup2kXTrypGVk9gQ1wxAi3dFDvPu9oaj0KfRoLKtGXHEWfM7ozDd44yiBro6rbOKKIxAA3hbSvIaq1GZvpp5NHF41Od2KL3yAcDGryP16Lu7fcGJQUNT0Wkrv3hwGDWi0mLprXK7XZKohRt71gtX4tGLaBBaLbQc1Owbgyv7g4WoUYW6vQjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjkOC3u7gOxdWhfRjzfmFY7J20b23gqg5A/g36/PlNo=;
 b=nRuiVbgZBpBX1wIXc7KUVA5NzSouOYS+X795IHf0xXeEVUzFlS8HsfPsvSicf2oP0GZgKF/dcaaBBljFZxRqo8mlWvkBA/chQS2X/egha2roDJYLgp4iP+DtLI9zE9vYTWvyNpHD97Jzzqw7wucsgzH5Er/5sb3PPyBOu86ePm4viSnyD7GGGv6iOD4cnVGJjLzdm81O4KX/RkbJ7yA2Yr1jHzoReLxBv/kKfNZUYU0AMVhJihxbiehBq0sFYj5gujhTnu6KsSJjcFAdbBkrg5ymwTyTWs+56stUHfhphfEtCJSsYrHTb0iRNSODipcrcv/pVU1R1gKfDgF7jv5UIQ==
Received: from DS7PR03CA0234.namprd03.prod.outlook.com (2603:10b6:5:3ba::29)
 by CY8PR12MB7660.namprd12.prod.outlook.com (2603:10b6:930:84::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Mon, 24 Oct
 2022 07:42:23 +0000
Received: from DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::d1) by DS7PR03CA0234.outlook.office365.com
 (2603:10b6:5:3ba::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26 via Frontend
 Transport; Mon, 24 Oct 2022 07:42:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT015.mail.protection.outlook.com (10.13.172.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 07:42:23 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Mon, 24 Oct
 2022 00:42:14 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 24 Oct 2022 00:42:13 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.986.29
 via Frontend Transport; Mon, 24 Oct 2022 00:42:10 -0700
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
Subject: [PATCH 10/11] usb: host: xhci-tegra: Add Tegra234 XHCI support
Date:   Mon, 24 Oct 2022 15:41:27 +0800
Message-ID: <20221024074128.1113554-11-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221024074128.1113554-1-waynec@nvidia.com>
References: <20221024074128.1113554-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT015:EE_|CY8PR12MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dafc26c-4ba8-4add-7b7c-08dab59349fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ds2WlqMIfMQaeEZa/obxTxNLWfToujyF+i00BNUcOrTh/D+ASqLDkdZOOk87Jc0nNEz87Hn+Y0DUdjJk9asYhpO+XpEOsyVIKb80Y1B9nlkB6X2GZ6sWArM4Mk4HUxCS5c9aUr4qKDyDT/f+FeUscrmkFlrNXj/Vem9DVtUwpH5ATvixv8VH6tbAANsJ+YD78GqVlEp8HDK8Le8Xx+XxksMBe54zvQrOjqJw+TqxoAQdLOFiUfewzZdX33ZI363BfWY+NRhobhozbpbauNeXZWqG1tDo9aXfXkqcx+KFdZuhKBZZRNGdTUnHCtwi69KXuiGj4WXAr8AJO1IgMm/1kpWqiH5wHdXI1/Cv1BGP5mKsKVDdCiML9ixr9ABWJtBvDBJpNgGmAPl0qiWuiKFzOvkOfbsI19Uno9EpsqNp9IDwl1nJYhpxcE4NjEgCgQzdEKl1ti7yNR2EUzX9x7+m41ReM8/WfS/MysN8UsgTT2ZP0XNYshNp/MWRAAr7dRgJG09AAOMdM4IfPLlyKgrNrX+p0vJ3nWKOBxsORyXVjI9RAPSw3GiOCymNfw1GC2p8QGETINl+TpQkVe3RXwgHJyOupcQgzNgaB3/lRI1yVHFftsF/v7BVjPpfTyyN9xDTLhw3ByBzWtex7OoiPhiFag1zviBS9ooC2boUUkNz4JPYeuKt7BYuTdIR+b/Lzr+hhaH7flTGVfNfAs5IDu8IvJObIULrBQzKwfHzgtzZa/scxfkn9UNVkh6br244q/TyD7lYSfr80YFm9BLEd8Y0KtTDAjEtRNc/ucrWW7I5e+o=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(41300700001)(7416002)(6636002)(921005)(36756003)(30864003)(316002)(54906003)(6666004)(110136005)(70586007)(70206006)(4326008)(8936002)(36860700001)(47076005)(5660300002)(7696005)(7636003)(82740400003)(1076003)(426003)(40480700001)(186003)(2616005)(8676002)(82310400005)(356005)(336012)(86362001)(83380400001)(478600001)(2906002)(26005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 07:42:23.0978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dafc26c-4ba8-4add-7b7c-08dab59349fb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7660
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

This change adds Tegra234 XUSB host mode controller support.

In Tegra234, some of the registers have moved to bar2 space.
The new soc variable has_bar2 indicates the chip with bar2
area. This patch adds new reg helper to let the driver reuse
the same code for those chips with bar2 support.

The new soc variables has_ifr indicates the chip with IFR FW
loading support. IFR registers would be configured in
MB1, and FW loading will be triggered in MB2.

Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
Co-developed-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 277 +++++++++++++++++++++++++++++-----
 1 file changed, 237 insertions(+), 40 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index bdb776553826..86036eeece43 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -44,6 +44,9 @@
 #define XUSB_CFG_4				0x010
 #define  XUSB_BASE_ADDR_SHIFT			15
 #define  XUSB_BASE_ADDR_MASK			0x1ffff
+#define XUSB_CFG_7				0x01c
+#define  XUSB_BASE2_ADDR_SHIFT			16
+#define  XUSB_BASE2_ADDR_MASK			0xffff
 #define XUSB_CFG_16				0x040
 #define XUSB_CFG_24				0x060
 #define XUSB_CFG_AXI_CFG			0x0f8
@@ -75,6 +78,20 @@
 #define  MBOX_SMI_INTR_FW_HANG			BIT(1)
 #define  MBOX_SMI_INTR_EN			BIT(3)
 
+/* BAR2 registers */
+#define XUSB_BAR2_ARU_MBOX_CMD			0x004
+#define XUSB_BAR2_ARU_MBOX_DATA_IN		0x008
+#define XUSB_BAR2_ARU_MBOX_DATA_OUT		0x00c
+#define XUSB_BAR2_ARU_MBOX_OWNER		0x010
+#define XUSB_BAR2_ARU_SMI_INTR			0x014
+#define XUSB_BAR2_ARU_SMI_ARU_FW_SCRATCH_DATA0	0x01c
+#define XUSB_BAR2_ARU_IFRDMA_CFG0		0x0e0
+#define XUSB_BAR2_ARU_IFRDMA_CFG1		0x0e4
+#define XUSB_BAR2_ARU_IFRDMA_STREAMID_FIELD	0x0e8
+#define XUSB_BAR2_ARU_C11_CSBRANGE		0x9c
+#define XUSB_BAR2_ARU_FW_SCRATCH		0x1000
+#define XUSB_BAR2_CSB_BASE_ADDR			0x2000
+
 /* IPFS registers */
 #define IPFS_XUSB_HOST_MSI_BAR_SZ_0		0x0c0
 #define IPFS_XUSB_HOST_MSI_AXI_BAR_ST_0		0x0c4
@@ -111,6 +128,9 @@
 #define  IMFILLRNG1_TAG_HI_SHIFT		16
 #define XUSB_FALC_IMFILLCTL			0x158
 
+/* CSB ARU  registers */
+#define XUSB_CSB_ARU_SCRATCH0			0x100100
+
 /* MP CSB registers */
 #define XUSB_CSB_MP_ILOAD_ATTR			0x101a00
 #define XUSB_CSB_MP_ILOAD_BASE_LO		0x101a04
@@ -131,6 +151,9 @@
 
 #define IMEM_BLOCK_SIZE				256
 
+#define FW_IOCTL_TYPE_SHIFT             (24)
+#define FW_IOCTL_CFGTBL_READ		(17)
+
 struct tegra_xusb_fw_header {
 	__le32 boot_loadaddr_in_imem;
 	__le32 boot_codedfi_offset;
@@ -175,6 +198,7 @@ struct tegra_xusb_mbox_regs {
 	u16 data_in;
 	u16 data_out;
 	u16 owner;
+	u16 smi_intr;
 };
 
 struct tegra_xusb_context_soc {
@@ -189,6 +213,7 @@ struct tegra_xusb_context_soc {
 	} fpci;
 };
 
+struct tegra_xusb_soc_ops;
 struct tegra_xusb_soc {
 	const char *firmware;
 	const char * const *supply_names;
@@ -205,11 +230,15 @@ struct tegra_xusb_soc {
 	} ports;
 
 	struct tegra_xusb_mbox_regs mbox;
+	struct tegra_xusb_soc_ops *ops;
 
 	bool scale_ss_clock;
 	bool has_ipfs;
 	bool lpm_support;
 	bool otg_reset_sspi;
+
+	bool has_bar2;
+	bool has_ifr;
 };
 
 struct tegra_xusb_context {
@@ -230,6 +259,8 @@ struct tegra_xusb {
 
 	void __iomem *ipfs_base;
 	void __iomem *fpci_base;
+	void __iomem *bar2_base;
+	resource_size_t bar2_start;
 
 	const struct tegra_xusb_soc *soc;
 
@@ -276,6 +307,17 @@ struct tegra_xusb {
 	struct tegra_xusb_context context;
 };
 
+struct tegra_xusb_soc_ops {
+	u32 (*mbox_reg_readl)(struct tegra_xusb *tegra,
+			unsigned int offset);
+	void (*mbox_reg_writel)(struct tegra_xusb *tegra,
+			u32 value, unsigned int offset);
+	u32 (*csb_reg_readl)(struct tegra_xusb *tegra,
+			unsigned int offset);
+	void (*csb_reg_writel)(struct tegra_xusb *tegra,
+			u32 value, unsigned int offset);
+};
+
 static struct hc_driver __read_mostly tegra_xhci_hc_driver;
 
 static inline u32 fpci_readl(struct tegra_xusb *tegra, unsigned int offset)
@@ -300,7 +342,33 @@ static inline void ipfs_writel(struct tegra_xusb *tegra, u32 value,
 	writel(value, tegra->ipfs_base + offset);
 }
 
+static inline u32 bar2_readl(struct tegra_xusb *tegra, unsigned int offset)
+{
+	return readl(tegra->bar2_base + offset);
+}
+
+static inline void bar2_writel(struct tegra_xusb *tegra, u32 value,
+			       unsigned int offset)
+{
+	writel(value, tegra->bar2_base + offset);
+}
+
 static u32 csb_readl(struct tegra_xusb *tegra, unsigned int offset)
+{
+	struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
+
+	return ops->csb_reg_readl(tegra, offset);
+}
+
+static void csb_writel(struct tegra_xusb *tegra, u32 value,
+		       unsigned int offset)
+{
+	struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
+
+	ops->csb_reg_writel(tegra, value, offset);
+}
+
+static u32 fpci_csb_readl(struct tegra_xusb *tegra, unsigned int offset)
 {
 	u32 page = CSB_PAGE_SELECT(offset);
 	u32 ofs = CSB_PAGE_OFFSET(offset);
@@ -310,7 +378,7 @@ static u32 csb_readl(struct tegra_xusb *tegra, unsigned int offset)
 	return fpci_readl(tegra, XUSB_CFG_CSB_BASE_ADDR + ofs);
 }
 
-static void csb_writel(struct tegra_xusb *tegra, u32 value,
+static void fpci_csb_writel(struct tegra_xusb *tegra, u32 value,
 		       unsigned int offset)
 {
 	u32 page = CSB_PAGE_SELECT(offset);
@@ -320,6 +388,26 @@ static void csb_writel(struct tegra_xusb *tegra, u32 value,
 	fpci_writel(tegra, value, XUSB_CFG_CSB_BASE_ADDR + ofs);
 }
 
+static u32 bar2_csb_readl(struct tegra_xusb *tegra, unsigned int offset)
+{
+	u32 page = CSB_PAGE_SELECT(offset);
+	u32 ofs = CSB_PAGE_OFFSET(offset);
+
+	bar2_writel(tegra, page, XUSB_BAR2_ARU_C11_CSBRANGE);
+
+	return bar2_readl(tegra, XUSB_BAR2_CSB_BASE_ADDR + ofs);
+}
+
+static void bar2_csb_writel(struct tegra_xusb *tegra, u32 value,
+		       unsigned int offset)
+{
+	u32 page = CSB_PAGE_SELECT(offset);
+	u32 ofs = CSB_PAGE_OFFSET(offset);
+
+	bar2_writel(tegra, page, XUSB_BAR2_ARU_C11_CSBRANGE);
+	bar2_writel(tegra, value, XUSB_BAR2_CSB_BASE_ADDR + ofs);
+}
+
 static int tegra_xusb_set_ss_clk(struct tegra_xusb *tegra,
 				 unsigned long rate)
 {
@@ -451,6 +539,7 @@ static bool tegra_xusb_mbox_cmd_requires_ack(enum tegra_xusb_mbox_cmd cmd)
 static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 				const struct tegra_xusb_mbox_msg *msg)
 {
+	struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
 	bool wait_for_idle = false;
 	u32 value;
 
@@ -459,15 +548,15 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 	 * ACK/NAK messages.
 	 */
 	if (!(msg->cmd == MBOX_CMD_ACK || msg->cmd == MBOX_CMD_NAK)) {
-		value = fpci_readl(tegra, tegra->soc->mbox.owner);
+		value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.owner);
 		if (value != MBOX_OWNER_NONE) {
 			dev_err(tegra->dev, "mailbox is busy\n");
 			return -EBUSY;
 		}
 
-		fpci_writel(tegra, MBOX_OWNER_SW, tegra->soc->mbox.owner);
+		ops->mbox_reg_writel(tegra, MBOX_OWNER_SW, tegra->soc->mbox.owner);
 
-		value = fpci_readl(tegra, tegra->soc->mbox.owner);
+		value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.owner);
 		if (value != MBOX_OWNER_SW) {
 			dev_err(tegra->dev, "failed to acquire mailbox\n");
 			return -EBUSY;
@@ -477,17 +566,17 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 	}
 
 	value = tegra_xusb_mbox_pack(msg);
-	fpci_writel(tegra, value, tegra->soc->mbox.data_in);
+	ops->mbox_reg_writel(tegra, value, tegra->soc->mbox.data_in);
 
-	value = fpci_readl(tegra, tegra->soc->mbox.cmd);
+	value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.cmd);
 	value |= MBOX_INT_EN | MBOX_DEST_FALC;
-	fpci_writel(tegra, value, tegra->soc->mbox.cmd);
+	ops->mbox_reg_writel(tegra, value, tegra->soc->mbox.cmd);
 
 	if (wait_for_idle) {
 		unsigned long timeout = jiffies + msecs_to_jiffies(250);
 
 		while (time_before(jiffies, timeout)) {
-			value = fpci_readl(tegra, tegra->soc->mbox.owner);
+			value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.owner);
 			if (value == MBOX_OWNER_NONE)
 				break;
 
@@ -495,7 +584,7 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 		}
 
 		if (time_after(jiffies, timeout))
-			value = fpci_readl(tegra, tegra->soc->mbox.owner);
+			value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.owner);
 
 		if (value != MBOX_OWNER_NONE)
 			return -ETIMEDOUT;
@@ -507,11 +596,12 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 static irqreturn_t tegra_xusb_mbox_irq(int irq, void *data)
 {
 	struct tegra_xusb *tegra = data;
+	struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
 	u32 value;
 
 	/* clear mailbox interrupts */
-	value = fpci_readl(tegra, XUSB_CFG_ARU_SMI_INTR);
-	fpci_writel(tegra, value, XUSB_CFG_ARU_SMI_INTR);
+	value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.smi_intr);
+	ops->mbox_reg_writel(tegra, value, tegra->soc->mbox.smi_intr);
 
 	if (value & MBOX_SMI_INTR_FW_HANG)
 		dev_err(tegra->dev, "controller firmware hang\n");
@@ -664,6 +754,7 @@ static void tegra_xusb_mbox_handle(struct tegra_xusb *tegra,
 static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
 {
 	struct tegra_xusb *tegra = data;
+	struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
 	struct tegra_xusb_mbox_msg msg;
 	u32 value;
 
@@ -672,16 +763,16 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
 	if (pm_runtime_suspended(tegra->dev) || tegra->suspended)
 		goto out;
 
-	value = fpci_readl(tegra, tegra->soc->mbox.data_out);
+	value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.data_out);
 	tegra_xusb_mbox_unpack(&msg, value);
 
-	value = fpci_readl(tegra, tegra->soc->mbox.cmd);
+	value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.cmd);
 	value &= ~MBOX_DEST_SMI;
-	fpci_writel(tegra, value, tegra->soc->mbox.cmd);
+	ops->mbox_reg_writel(tegra, value, tegra->soc->mbox.cmd);
 
 	/* clear mailbox owner if no ACK/NAK is required */
 	if (!tegra_xusb_mbox_cmd_requires_ack(msg.cmd))
-		fpci_writel(tegra, MBOX_OWNER_NONE, tegra->soc->mbox.owner);
+		ops->mbox_reg_writel(tegra, MBOX_OWNER_NONE, tegra->soc->mbox.owner);
 
 	tegra_xusb_mbox_handle(tegra, &msg);
 
@@ -709,6 +800,15 @@ static void tegra_xusb_config(struct tegra_xusb *tegra)
 	value |= regs & (XUSB_BASE_ADDR_MASK << XUSB_BASE_ADDR_SHIFT);
 	fpci_writel(tegra, value, XUSB_CFG_4);
 
+	/* Program BAR2 space */
+	if (tegra->soc->has_bar2) {
+		value = fpci_readl(tegra, XUSB_CFG_7);
+		value &= ~(XUSB_BASE2_ADDR_MASK << XUSB_BASE2_ADDR_SHIFT);
+		value |= tegra->bar2_start &
+			(XUSB_BASE2_ADDR_MASK << XUSB_BASE2_ADDR_SHIFT);
+		fpci_writel(tegra, value, XUSB_CFG_7);
+	}
+
 	usleep_range(100, 200);
 
 	/* Enable bus master */
@@ -881,21 +981,36 @@ static int tegra_xusb_request_firmware(struct tegra_xusb *tegra)
 	return 0;
 }
 
+static int tegra_xusb_wait_for_falcon(struct tegra_xusb *tegra)
+{
+	struct xhci_cap_regs __iomem *cap_regs;
+	struct xhci_op_regs __iomem *op_regs;
+	int ret;
+	u32 val;
+
+	cap_regs = tegra->regs;
+	op_regs = tegra->regs + HC_LENGTH(readl(&cap_regs->hc_capbase));
+
+	ret = readl_poll_timeout(&op_regs->status, val, !(val & STS_CNR), 1000, 200000);
+
+	if (ret)
+		dev_err(tegra->dev, "XHCI Controller not ready. Falcon state: 0x%x\n",
+			csb_readl(tegra, XUSB_FALC_CPUCTL));
+
+	return ret;
+}
+
 static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 {
 	unsigned int code_tag_blocks, code_size_blocks, code_blocks;
-	struct xhci_cap_regs __iomem *cap = tegra->regs;
 	struct tegra_xusb_fw_header *header;
 	struct device *dev = tegra->dev;
-	struct xhci_op_regs __iomem *op;
-	unsigned long timeout;
 	time64_t timestamp;
 	u64 address;
 	u32 value;
 	int err;
 
 	header = (struct tegra_xusb_fw_header *)tegra->fw.virt;
-	op = tegra->regs + HC_LENGTH(readl(&cap->hc_capbase));
 
 	if (csb_readl(tegra, XUSB_CSB_MP_ILOAD_BASE_LO) != 0) {
 		dev_info(dev, "Firmware already loaded, Falcon state %#x\n",
@@ -968,26 +1083,43 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 	/* Boot Falcon CPU and wait for USBSTS_CNR to get cleared. */
 	csb_writel(tegra, CPUCTL_STARTCPU, XUSB_FALC_CPUCTL);
 
-	timeout = jiffies + msecs_to_jiffies(200);
+	if (tegra_xusb_wait_for_falcon(tegra))
+		return -EIO;
 
-	do {
-		value = readl(&op->status);
-		if ((value & STS_CNR) == 0)
-			break;
+	timestamp = le32_to_cpu(header->fwimg_created_time);
 
-		usleep_range(1000, 2000);
-	} while (time_is_after_jiffies(timeout));
+	dev_info(dev, "Firmware timestamp: %ptTs UTC\n", &timestamp);
+
+	return 0;
+}
 
-	value = readl(&op->status);
-	if (value & STS_CNR) {
-		value = csb_readl(tegra, XUSB_FALC_CPUCTL);
-		dev_err(dev, "XHCI controller not read: %#010x\n", value);
+static u32 tegra_xusb_read_firmware_header(struct tegra_xusb *tegra, u32 offset)
+{
+	/*
+	 * We only accept reading the firmware config table
+	 * The offset should not exceed the fw header structure
+	 */
+	if (offset >= sizeof(struct tegra_xusb_fw_header))
+		return 0;
+
+	bar2_writel(tegra, (FW_IOCTL_CFGTBL_READ << FW_IOCTL_TYPE_SHIFT) | offset,
+			XUSB_BAR2_ARU_FW_SCRATCH);
+	return bar2_readl(tegra, XUSB_BAR2_ARU_SMI_ARU_FW_SCRATCH_DATA0);
+}
+
+static int tegra_xusb_init_ifr_firmware(struct tegra_xusb *tegra)
+{
+	time64_t timestamp;
+
+	if (tegra_xusb_wait_for_falcon(tegra))
 		return -EIO;
-	}
 
-	timestamp = le32_to_cpu(header->fwimg_created_time);
+#define offsetof_32(X, Y) ((u8)(offsetof(X, Y) / sizeof(__le32)))
+	timestamp = tegra_xusb_read_firmware_header(tegra,
+			offsetof_32(struct tegra_xusb_fw_header,
+				fwimg_created_time) << 2);
 
-	dev_info(dev, "Firmware timestamp: %ptTs UTC\n", &timestamp);
+	dev_info(tegra->dev, "Firmware timestamp: %ptTs UTC\n", &timestamp);
 
 	return 0;
 }
@@ -1403,7 +1535,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	struct of_phandle_args args;
 	struct tegra_xusb *tegra;
 	struct device_node *np;
-	struct resource *regs;
+	struct resource *res, *regs;
 	struct xhci_hcd *xhci;
 	unsigned int i, j, k;
 	struct phy *phy;
@@ -1435,6 +1567,11 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		tegra->ipfs_base = devm_platform_ioremap_resource(pdev, 2);
 		if (IS_ERR(tegra->ipfs_base))
 			return PTR_ERR(tegra->ipfs_base);
+	} else if (tegra->soc->has_bar2) {
+		tegra->bar2_base = devm_platform_get_and_ioremap_resource(pdev, 2, &res);
+		if (IS_ERR(tegra->bar2_base))
+			return PTR_ERR(tegra->bar2_base);
+		tegra->bar2_start = res->start;
 	}
 
 	tegra->xhci_irq = platform_get_irq(pdev, 0);
@@ -1651,10 +1788,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto disable_phy;
 	}
 
-	err = tegra_xusb_request_firmware(tegra);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to request firmware: %d\n", err);
-		goto disable_phy;
+	if (!tegra->soc->has_ifr) {
+		err = tegra_xusb_request_firmware(tegra);
+		if (err < 0) {
+			dev_err(&pdev->dev,
+				"failed to request firmware: %d\n", err);
+			goto disable_phy;
+		}
 	}
 
 	err = tegra_xusb_unpowergate_partitions(tegra);
@@ -1663,7 +1803,10 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 
 	tegra_xusb_config(tegra);
 
-	err = tegra_xusb_load_firmware(tegra);
+	if (tegra->soc->has_ifr)
+		err = tegra_xusb_init_ifr_firmware(tegra);
+	else
+		err = tegra_xusb_load_firmware(tegra);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to load firmware: %d\n", err);
 		goto powergate;
@@ -2070,7 +2213,10 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool runtime)
 	tegra_xusb_config(tegra);
 	tegra_xusb_restore_context(tegra);
 
-	err = tegra_xusb_load_firmware(tegra);
+	if (tegra->soc->has_ifr)
+		err = tegra_xusb_init_ifr_firmware(tegra);
+	else
+		err = tegra_xusb_load_firmware(tegra);
 	if (err < 0) {
 		dev_err(tegra->dev, "failed to load firmware: %d\n", err);
 		goto disable_phy;
@@ -2271,6 +2417,13 @@ static const struct tegra_xusb_context_soc tegra124_xusb_context = {
 	},
 };
 
+static struct tegra_xusb_soc_ops tegra124_ops = {
+	.mbox_reg_readl = &fpci_readl,
+	.mbox_reg_writel = &fpci_writel,
+	.csb_reg_readl = &fpci_csb_readl,
+	.csb_reg_writel = &fpci_csb_writel,
+};
+
 static const struct tegra_xusb_soc tegra124_soc = {
 	.firmware = "nvidia/tegra124/xusb.bin",
 	.supply_names = tegra124_supply_names,
@@ -2286,11 +2439,13 @@ static const struct tegra_xusb_soc tegra124_soc = {
 	.scale_ss_clock = true,
 	.has_ipfs = true,
 	.otg_reset_sspi = false,
+	.ops = &tegra124_ops,
 	.mbox = {
 		.cmd = 0xe4,
 		.data_in = 0xe8,
 		.data_out = 0xec,
 		.owner = 0xf0,
+		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 };
 MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
@@ -2322,11 +2477,13 @@ static const struct tegra_xusb_soc tegra210_soc = {
 	.scale_ss_clock = false,
 	.has_ipfs = true,
 	.otg_reset_sspi = true,
+	.ops = &tegra124_ops,
 	.mbox = {
 		.cmd = 0xe4,
 		.data_in = 0xe8,
 		.data_out = 0xec,
 		.owner = 0xf0,
+		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 };
 MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
@@ -2363,11 +2520,13 @@ static const struct tegra_xusb_soc tegra186_soc = {
 	.scale_ss_clock = false,
 	.has_ipfs = false,
 	.otg_reset_sspi = false,
+	.ops = &tegra124_ops,
 	.mbox = {
 		.cmd = 0xe4,
 		.data_in = 0xe8,
 		.data_out = 0xec,
 		.owner = 0xf0,
+		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 	.lpm_support = true,
 };
@@ -2394,21 +2553,59 @@ static const struct tegra_xusb_soc tegra194_soc = {
 	.scale_ss_clock = false,
 	.has_ipfs = false,
 	.otg_reset_sspi = false,
+	.ops = &tegra124_ops,
 	.mbox = {
 		.cmd = 0x68,
 		.data_in = 0x6c,
 		.data_out = 0x70,
 		.owner = 0x74,
+		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 	.lpm_support = true,
 };
 MODULE_FIRMWARE("nvidia/tegra194/xusb.bin");
 
+static struct tegra_xusb_soc_ops tegra234_ops = {
+	.mbox_reg_readl = &bar2_readl,
+	.mbox_reg_writel = &bar2_writel,
+	.csb_reg_readl = &bar2_csb_readl,
+	.csb_reg_writel = &bar2_csb_writel,
+};
+
+static const struct tegra_xusb_soc tegra234_soc = {
+	.firmware = "nvidia/tegra234/xusb.bin",
+	.supply_names = tegra194_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra194_supply_names),
+	.phy_types = tegra194_phy_types,
+	.num_types = ARRAY_SIZE(tegra194_phy_types),
+	.context = &tegra186_xusb_context,
+	.ports = {
+		.usb3 = { .offset = 0, .count = 4, },
+		.usb2 = { .offset = 4, .count = 4, },
+	},
+	.scale_ss_clock = false,
+	.has_ipfs = false,
+	.otg_reset_sspi = false,
+	.ops = &tegra234_ops,
+	.mbox = {
+		.cmd = XUSB_BAR2_ARU_MBOX_CMD,
+		.data_in = XUSB_BAR2_ARU_MBOX_DATA_IN,
+		.data_out = XUSB_BAR2_ARU_MBOX_DATA_OUT,
+		.owner = XUSB_BAR2_ARU_MBOX_OWNER,
+		.smi_intr = XUSB_BAR2_ARU_SMI_INTR,
+	},
+	.lpm_support = true,
+	.has_bar2 = true,
+	.has_ifr = true,
+};
+MODULE_FIRMWARE("nvidia/tegra234/xusb.bin");
+
 static const struct of_device_id tegra_xusb_of_match[] = {
 	{ .compatible = "nvidia,tegra124-xusb", .data = &tegra124_soc },
 	{ .compatible = "nvidia,tegra210-xusb", .data = &tegra210_soc },
 	{ .compatible = "nvidia,tegra186-xusb", .data = &tegra186_soc },
 	{ .compatible = "nvidia,tegra194-xusb", .data = &tegra194_soc },
+	{ .compatible = "nvidia,tegra234-xusb", .data = &tegra234_soc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tegra_xusb_of_match);
-- 
2.25.1

