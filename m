Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F285627E38
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Nov 2022 13:43:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237288AbiKNMnC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Nov 2022 07:43:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237359AbiKNMmY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Nov 2022 07:42:24 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0736624974;
        Mon, 14 Nov 2022 04:42:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNJm/Fu30v7qsZPMFlhjCUV2gFFQ5fJz14lKlxxjEuxCPC4tkzDx/tcd+9XgPa7QN2Gm6L2Cay8m1kJFGGCqH5JTaCzzpZ2juw3zeoDq4p3B+A6W69QVxel6yHRNtYmKh7UOpycvjvGFfgSgYSe9eIPY+f8u8mfZOfZXnSDnGr64cjWYqwrQd7pHW1hfzlhlJUYHxtmuNJwwt3Ug8oATikSovw/w6AmtKTJv61FsFD6DIlv5vfPtnC26yr8qYQiNmwUKq+NKqAnRWnbbDjETT7xH6ex3yr3CmLV/ZG+IVAhFGBavJ0bbB/dz6Bcey4vJ7VBE90xGsKDnwQJ4sfigow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhXYkb2fHAoOwnfIiR3VYugHraiFFbPneMvZpJiQaAs=;
 b=SRaxDA4H47zxYaPmG0xez1QryrZzp82gGMp1IUpNuYGH8WUDnZLeHMxsnSaDrpLvae3wSvi7OkKJ+9scETl4XwGV3djWb4bpgMUC1qQrVkb3VJF1HcBiAe+GtLIAiYE4YvBhSn2Cu4+DygHlahZyezPoWP9WrCA6wkHOVQiPDw8+lKvmHnezjeGe4lpIy1137cO2JXWlTdkjURWWWepjuKuCJASryR1g5pFE29N57Dqb6NdzLvObyDpGcqd+J5cCvt0fO7Dzqb3V0XqfNdZtEsQLj4StAP6HvP21LJCeKQP31KIQl/xDDvo005VcfGzX/OoAc9vIRqUJCtiWF9KhYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhXYkb2fHAoOwnfIiR3VYugHraiFFbPneMvZpJiQaAs=;
 b=acCLI1XxFmGi/JzqPOPAuzZOT/rTdxi6MPXk1MrTqFgU7fGta1kSD9t2B9uI6hnqhBIFVhCm8kwLMLj7QHJSDBCATWLjn2d/y6DzKL73iCvdA5riM+EqcYruTUqVolel58Z91fFq+Vhn7cNpyuaOaURfmyzgu/+50xlnx9t816h/O6rXcu+zj1cacWiGgwJ4ah1Q3ZNyGflAt4dAv99ty3qmOzwvP4Pv2/f/zN8f7CjGauB+zsr9twe+V0GGcWJ/WinWv/mjF3Dv+VQpBzagDcjgL0jTxuh97N6qUqcuFClOd/6J4WHQNxlmMHC/hhoSLb1fzSfC0GvmnYHG6UIY5Q==
Received: from BL0PR0102CA0012.prod.exchangelabs.com (2603:10b6:207:18::25) by
 MW4PR12MB7117.namprd12.prod.outlook.com (2603:10b6:303:221::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 12:42:06 +0000
Received: from BL02EPF0000EE3E.namprd05.prod.outlook.com
 (2603:10b6:207:18:cafe::ca) by BL0PR0102CA0012.outlook.office365.com
 (2603:10b6:207:18::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Mon, 14 Nov 2022 12:42:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0000EE3E.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.11 via Frontend Transport; Mon, 14 Nov 2022 12:42:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:48 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 14 Nov
 2022 04:41:47 -0800
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via
 Frontend Transport; Mon, 14 Nov 2022 04:41:44 -0800
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
Subject: [PATCH v3 12/13] usb: host: xhci-tegra: Add Tegra234 XHCI support
Date:   Mon, 14 Nov 2022 20:40:52 +0800
Message-ID: <20221114124053.1873316-13-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221114124053.1873316-1-waynec@nvidia.com>
References: <20221114124053.1873316-1-waynec@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3E:EE_|MW4PR12MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a35276-6d18-49f5-3c69-08dac63da34d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8XUJXP16zTUvCjFqAU+g/6XsUCY/z4L/XCt91J5EvgdnH6W+quMigMK/Qnbj5Zdy4sW1+S+s+L7gGk7hmYay3BSD4sgS9RrEjLUzPyeP1mMZXOE9E0SzaittjaU083peCYUWlNJtdY7PnEJFACvbr64YHvkNEFVJI3V3jTjjaHLQT2/8rRSMkVpvKF5Xi61Mh7ZQO7M1AGN6rol18CHmooJzX5tsMYDm0YfyXQhKSqBWLBb/tpIj2u7E8HbeZVXgZ8PyJswBHheCmdqClNcAArsgNAPI16n/JbtM3Jyf6fceILhyktVhtbc7ptPG0kVXoOCQAA0/zjb3dPdBysQjz5TizK8WQ+uM49mYUDw0/S6IGAsNXu5GGgJzJE48dyMpULrOHS7ljZLYKoaBYO4f0gcNA01yD1KgPBH8UfkWqwMrupU1+eD3XqBvKgZ5ET9UaMKtpTnP1Hlf49zjifgMc0+xmVYDU4OWloVgMjBp6otPn4kjQ4Z/CGv/S18n9rNXznViyi2do7npJy2dAS4hwTDk6vYgGhj5pKl9ZCfxNWotLxVxTDCTdKM5XPUd3YXRV6B5FpLStYwVNvW70WUNtBWSQ/7m6GWRthouV/7g4yl0K9r3TN7uzPoy9Y03hRW7ER0OzMUnZvEVzfuxNxeXskIDjAF3oEZA+/EWLCM3c1T7p4KFJKOBuqRzfm2ClXvc3/Sw9nvj5G7ucPokqUnYX1SKsl4LB3byfI18KYbBQvQB1Fab10Fz/+9HDcf/lRevlCQ9Ho+RualTm92lw2iJie58iBBuXewEXPSTRxqKauk=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199015)(36840700001)(46966006)(40470700004)(86362001)(2906002)(6666004)(478600001)(26005)(7696005)(5660300002)(41300700001)(30864003)(40480700001)(82310400005)(36860700001)(70206006)(4326008)(2616005)(1076003)(70586007)(186003)(8676002)(47076005)(336012)(82740400003)(110136005)(40460700003)(7636003)(356005)(921005)(426003)(7416002)(83380400001)(8936002)(6636002)(54906003)(316002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 12:42:05.9524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a35276-6d18-49f5-3c69-08dac63da34d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7117
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

This change adds Tegra234 XUSB host mode controller support.

In Tegra234, some of the registers have moved to bar2 space.
The new soc variable has_bar2 indicates the chip with bar2
area. This patch adds new reg helper to let the driver reuse
the same code for those chips with bar2 support.

Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
Co-developed-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V2 -> V3:nothing has changed
V1 -> V2:fix some issues on coding style
extract tegra_xusb_load_firmware function
refine has_bar2 and remove has_ifr/firmware on Tegra234
 drivers/usb/host/xhci-tegra.c | 270 +++++++++++++++++++++++++++++-----
 1 file changed, 232 insertions(+), 38 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index bdb776553826..b2f07eae2c93 100644
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
 
+/* CSB ARU registers */
+#define XUSB_CSB_ARU_SCRATCH0			0x100100
+
 /* MP CSB registers */
 #define XUSB_CSB_MP_ILOAD_ATTR			0x101a00
 #define XUSB_CSB_MP_ILOAD_BASE_LO		0x101a04
@@ -131,6 +151,9 @@
 
 #define IMEM_BLOCK_SIZE				256
 
+#define FW_IOCTL_TYPE_SHIFT			24
+#define FW_IOCTL_CFGTBL_READ		17
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
@@ -189,6 +213,18 @@ struct tegra_xusb_context_soc {
 	} fpci;
 };
 
+struct tegra_xusb;
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
 struct tegra_xusb_soc {
 	const char *firmware;
 	const char * const *supply_names;
@@ -205,11 +241,14 @@ struct tegra_xusb_soc {
 	} ports;
 
 	struct tegra_xusb_mbox_regs mbox;
+	const struct tegra_xusb_soc_ops *ops;
 
 	bool scale_ss_clock;
 	bool has_ipfs;
 	bool lpm_support;
 	bool otg_reset_sspi;
+
+	bool has_bar2;
 };
 
 struct tegra_xusb_context {
@@ -230,6 +269,8 @@ struct tegra_xusb {
 
 	void __iomem *ipfs_base;
 	void __iomem *fpci_base;
+	void __iomem *bar2_base;
+	struct resource *bar2;
 
 	const struct tegra_xusb_soc *soc;
 
@@ -300,7 +341,33 @@ static inline void ipfs_writel(struct tegra_xusb *tegra, u32 value,
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
+	const struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
+
+	return ops->csb_reg_readl(tegra, offset);
+}
+
+static void csb_writel(struct tegra_xusb *tegra, u32 value,
+		       unsigned int offset)
+{
+	const struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
+
+	ops->csb_reg_writel(tegra, value, offset);
+}
+
+static u32 fpci_csb_readl(struct tegra_xusb *tegra, unsigned int offset)
 {
 	u32 page = CSB_PAGE_SELECT(offset);
 	u32 ofs = CSB_PAGE_OFFSET(offset);
@@ -310,7 +377,7 @@ static u32 csb_readl(struct tegra_xusb *tegra, unsigned int offset)
 	return fpci_readl(tegra, XUSB_CFG_CSB_BASE_ADDR + ofs);
 }
 
-static void csb_writel(struct tegra_xusb *tegra, u32 value,
+static void fpci_csb_writel(struct tegra_xusb *tegra, u32 value,
 		       unsigned int offset)
 {
 	u32 page = CSB_PAGE_SELECT(offset);
@@ -320,6 +387,26 @@ static void csb_writel(struct tegra_xusb *tegra, u32 value,
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
@@ -451,6 +538,7 @@ static bool tegra_xusb_mbox_cmd_requires_ack(enum tegra_xusb_mbox_cmd cmd)
 static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 				const struct tegra_xusb_mbox_msg *msg)
 {
+	const struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
 	bool wait_for_idle = false;
 	u32 value;
 
@@ -459,15 +547,15 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
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
@@ -477,17 +565,17 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
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
 
@@ -495,7 +583,7 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 		}
 
 		if (time_after(jiffies, timeout))
-			value = fpci_readl(tegra, tegra->soc->mbox.owner);
+			value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.owner);
 
 		if (value != MBOX_OWNER_NONE)
 			return -ETIMEDOUT;
@@ -507,11 +595,12 @@ static int tegra_xusb_mbox_send(struct tegra_xusb *tegra,
 static irqreturn_t tegra_xusb_mbox_irq(int irq, void *data)
 {
 	struct tegra_xusb *tegra = data;
+	const struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
 	u32 value;
 
 	/* clear mailbox interrupts */
-	value = fpci_readl(tegra, XUSB_CFG_ARU_SMI_INTR);
-	fpci_writel(tegra, value, XUSB_CFG_ARU_SMI_INTR);
+	value = ops->mbox_reg_readl(tegra, tegra->soc->mbox.smi_intr);
+	ops->mbox_reg_writel(tegra, value, tegra->soc->mbox.smi_intr);
 
 	if (value & MBOX_SMI_INTR_FW_HANG)
 		dev_err(tegra->dev, "controller firmware hang\n");
@@ -664,6 +753,7 @@ static void tegra_xusb_mbox_handle(struct tegra_xusb *tegra,
 static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
 {
 	struct tegra_xusb *tegra = data;
+	const struct tegra_xusb_soc_ops *ops = tegra->soc->ops;
 	struct tegra_xusb_mbox_msg msg;
 	u32 value;
 
@@ -672,16 +762,16 @@ static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
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
 
@@ -709,6 +799,15 @@ static void tegra_xusb_config(struct tegra_xusb *tegra)
 	value |= regs & (XUSB_BASE_ADDR_MASK << XUSB_BASE_ADDR_SHIFT);
 	fpci_writel(tegra, value, XUSB_CFG_4);
 
+	/* Program BAR2 space */
+	if (tegra->bar2) {
+		value = fpci_readl(tegra, XUSB_CFG_7);
+		value &= ~(XUSB_BASE2_ADDR_MASK << XUSB_BASE2_ADDR_SHIFT);
+		value |= tegra->bar2->start &
+			(XUSB_BASE2_ADDR_MASK << XUSB_BASE2_ADDR_SHIFT);
+		fpci_writel(tegra, value, XUSB_CFG_7);
+	}
+
 	usleep_range(100, 200);
 
 	/* Enable bus master */
@@ -881,21 +980,36 @@ static int tegra_xusb_request_firmware(struct tegra_xusb *tegra)
 	return 0;
 }
 
-static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
+static int tegra_xusb_wait_for_falcon(struct tegra_xusb *tegra)
+{
+	struct xhci_cap_regs __iomem *cap_regs;
+	struct xhci_op_regs __iomem *op_regs;
+	int ret;
+	u32 value;
+
+	cap_regs = tegra->regs;
+	op_regs = tegra->regs + HC_LENGTH(readl(&cap_regs->hc_capbase));
+
+	ret = readl_poll_timeout(&op_regs->status, value, !(value & STS_CNR), 1000, 200000);
+
+	if (ret)
+		dev_err(tegra->dev, "XHCI Controller not ready. Falcon state: 0x%x\n",
+			csb_readl(tegra, XUSB_FALC_CPUCTL));
+
+	return ret;
+}
+
+static int tegra_xusb_load_firmware_rom(struct tegra_xusb *tegra)
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
@@ -968,30 +1082,55 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 	/* Boot Falcon CPU and wait for USBSTS_CNR to get cleared. */
 	csb_writel(tegra, CPUCTL_STARTCPU, XUSB_FALC_CPUCTL);
 
-	timeout = jiffies + msecs_to_jiffies(200);
+	if (tegra_xusb_wait_for_falcon(tegra))
+		return -EIO;
+
+	timestamp = le32_to_cpu(header->fwimg_created_time);
 
-	do {
-		value = readl(&op->status);
-		if ((value & STS_CNR) == 0)
-			break;
+	dev_info(dev, "Firmware timestamp: %ptTs UTC\n", &timestamp);
+
+	return 0;
+}
+
+static u32 tegra_xusb_read_firmware_header(struct tegra_xusb *tegra, u32 offset)
+{
+	/*
+	 * We only accept reading the firmware config table
+	 * The offset should not exceed the fw header structure
+	 */
+	if (offset >= sizeof(struct tegra_xusb_fw_header))
+		return 0;
 
-		usleep_range(1000, 2000);
-	} while (time_is_after_jiffies(timeout));
+	bar2_writel(tegra, (FW_IOCTL_CFGTBL_READ << FW_IOCTL_TYPE_SHIFT) | offset,
+			XUSB_BAR2_ARU_FW_SCRATCH);
+	return bar2_readl(tegra, XUSB_BAR2_ARU_SMI_ARU_FW_SCRATCH_DATA0);
+}
+
+static int tegra_xusb_init_ifr_firmware(struct tegra_xusb *tegra)
+{
+	time64_t timestamp;
 
-	value = readl(&op->status);
-	if (value & STS_CNR) {
-		value = csb_readl(tegra, XUSB_FALC_CPUCTL);
-		dev_err(dev, "XHCI controller not read: %#010x\n", value);
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
 
+static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
+{
+	if (!tegra->soc->firmware)
+		return tegra_xusb_init_ifr_firmware(tegra);
+	else
+		return tegra_xusb_load_firmware_rom(tegra);
+}
+
 static void tegra_xusb_powerdomain_remove(struct device *dev,
 					  struct tegra_xusb *tegra)
 {
@@ -1435,6 +1574,10 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		tegra->ipfs_base = devm_platform_ioremap_resource(pdev, 2);
 		if (IS_ERR(tegra->ipfs_base))
 			return PTR_ERR(tegra->ipfs_base);
+	} else if (tegra->soc->has_bar2) {
+		tegra->bar2_base = devm_platform_get_and_ioremap_resource(pdev, 2, &tegra->bar2);
+		if (IS_ERR(tegra->bar2_base))
+			return PTR_ERR(tegra->bar2_base);
 	}
 
 	tegra->xhci_irq = platform_get_irq(pdev, 0);
@@ -1651,10 +1794,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto disable_phy;
 	}
 
-	err = tegra_xusb_request_firmware(tegra);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to request firmware: %d\n", err);
-		goto disable_phy;
+	if (tegra->soc->firmware) {
+		err = tegra_xusb_request_firmware(tegra);
+		if (err < 0) {
+			dev_err(&pdev->dev,
+				"failed to request firmware: %d\n", err);
+			goto disable_phy;
+		}
 	}
 
 	err = tegra_xusb_unpowergate_partitions(tegra);
@@ -2271,6 +2417,13 @@ static const struct tegra_xusb_context_soc tegra124_xusb_context = {
 	},
 };
 
+static const struct tegra_xusb_soc_ops tegra124_ops = {
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
@@ -2394,21 +2553,56 @@ static const struct tegra_xusb_soc tegra194_soc = {
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
 
+static const struct tegra_xusb_soc_ops tegra234_ops = {
+	.mbox_reg_readl = &bar2_readl,
+	.mbox_reg_writel = &bar2_writel,
+	.csb_reg_readl = &bar2_csb_readl,
+	.csb_reg_writel = &bar2_csb_writel,
+};
+
+static const struct tegra_xusb_soc tegra234_soc = {
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
+};
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

