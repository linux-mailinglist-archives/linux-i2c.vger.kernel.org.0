Return-Path: <linux-i2c+bounces-4550-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB1491E3D3
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 17:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CCD9288151
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E238916F831;
	Mon,  1 Jul 2024 15:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fyZdgf79"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E030D16D4C7;
	Mon,  1 Jul 2024 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846847; cv=fail; b=sx5YlN6Y9O59flMZhjQ/nVws/kbI6i0Dq4aVhTlwnQ+SLLiVylN9rNaViQM0AsgCu5wq8Y1vZ+anUT7PuGYOcc7HRSRIE2FDFpLjQBaqtWgIxvq8KkwD6ujlo9faOclfBHxrkxLQs/teRM/0BMBSpqDB5lWjyfDwG/UT8Ajotn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846847; c=relaxed/simple;
	bh=h7UVqoGORQcYO2hDjsHiv2WxkdGfg7sYWgTpDhFlKRs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hHC9PVH10+u72E0xnoY29KDoH/PAdo7OLSbNfM08NYueL1J6RIsYWs1jAp0XL+D4PmkDRALkWbkH1HG38fbhnccjUE1LzbgcstcjpToi+hs7WgsF9mbGgn8QNU/P2/OgcfSgPUXGQgeiGTHQ3bOPu5EXYoAIsKrD1FAdjbUJM0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fyZdgf79; arc=fail smtp.client-ip=40.107.93.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jQsS08P4rh4J8q9p/aRQsqoCNj4jqsIvirQGJFRBUzUOBIaO5R6SKCb5tUOzPXXtzBrfmYGwLvruOeFry1lPHRaBK4PZyGXcEFLo50kIQU2OuXWWgu2ePa5xpqxlQaWv33kbAf4aUso0KPYjbr4Viw2STCohiPEtYUh4pGH6hxiIZCZ00/w9jLeedzpNMNJrrkf5aMFvTld381THiCXHTtq8tpMCFODwnsbQe2ky2vokRo9e8fjKpepaj+bv7St6fk5VD6BPh0d2cN71X7vVApYKt5A8ATZprArC+ost5/e4wkfzVyq9VP6Z7mBGCrdaP+k2blxdLEVS4hIWU8HdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qom37yDkR0KLoIpCblghUA7a4SAudJQrHosRPDYAEJc=;
 b=OsWlLLUwfdRLl1N0B3NS777waH8mncPoBdDlDxHZPhHFfF24MC0rVVfJ+Hlj7l2IpSwUnrdvU8UZ9V59eKgmZ5GjoNPyh/DkMCMRTTz7Jpv88AthPIoeC/vTES27htdYxpYfEXuUi8oCpHXhAZ1DWjJtQw1/+NK9XcGui/B4GyN7pNfxTpNvqkq8oeEK5kWkkoCmAR5/RWnDkQXfDJtoZYsr6CQVUwxZFqMLFb7+97Iw3yFrCO3VQH4SWYBEM3asMGR5NaY04d9VI9p5TkhoxAxXVoEpdWY5Ts207Peb30H0NpdEHUt5Xh+8SBbmIOTJS2ZQTve+0hzxv+1MmuLZAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qom37yDkR0KLoIpCblghUA7a4SAudJQrHosRPDYAEJc=;
 b=fyZdgf79i+Wp0DPwGAvj5LiIn0v5sOGk3Jf0u526ckFc0IRd0fKSMbEor5mJQwj9f8RKBFsBCrGYGnobF2c08fF7Ql7n5MjmTYbGMIWtPYj3b1fhZeKwEqugG9jZ4Vrxi20x19pnSAkJf5As6dW8tZm8XdNOBOvagt65nFVV3H4JErrsTBDtVstYPzSTvmB7xXS2pi82dM1QEG+fiUK72SJLul+0VHUlaDoW39PCIKPNSCkqkhJ226bo8NAqeusBPbKmhKUv9lzovCoeiezDegDhQ3uPNobqb02pjBWe33yKMDhWVWwOyRRP1/lKJbGCAmQrMc1w3PWtNeGqCTRovw==
Received: from MN2PR08CA0015.namprd08.prod.outlook.com (2603:10b6:208:239::20)
 by MW4PR12MB7117.namprd12.prod.outlook.com (2603:10b6:303:221::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 15:14:02 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::72) by MN2PR08CA0015.outlook.office365.com
 (2603:10b6:208:239::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33 via Frontend
 Transport; Mon, 1 Jul 2024 15:14:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.18 via Frontend Transport; Mon, 1 Jul 2024 15:14:01 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 08:13:44 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 1 Jul 2024 08:13:43 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 1 Jul 2024 08:13:38 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>,
	Prathamesh Shete <pshete@nvidia.com>
Subject: [RFC PATCH V2 11/12] mmc: host: tegra: config settings for timing
Date: Mon, 1 Jul 2024 20:42:29 +0530
Message-ID: <20240701151231.29425-12-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240701151231.29425-1-kyarlagadda@nvidia.com>
References: <20240701151231.29425-1-kyarlagadda@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|MW4PR12MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 935b4f8f-9195-4cca-992a-08dc99e07086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lmPmQ/pSfGtMd/KAZRfLLaph3igZYer27pWoZ/L6lxdwwWLMQIR+r6nmpf+Z?=
 =?us-ascii?Q?rukIF3QYlOk8P8W2E44eZiliUwjeeuvvBjn9mtPgsrUAhJYsNsR9VTA+LDqH?=
 =?us-ascii?Q?mp0kTma+bZ0Ok4d2l6yykW4jTRlBgtNyCWcBYwhm/wRPW9ptR0UzWJVo+RZg?=
 =?us-ascii?Q?2en1y/JDaQiF6maxQwbcekW3i7RBw4ABgX6iMXg2ir0TGofZhSw3bIfvdZtW?=
 =?us-ascii?Q?ZkSNHg8mGbQf4R9zKbC6voobJ8UgNQ10R/ZH+X3CPrsNkDaktFXutdIISZnu?=
 =?us-ascii?Q?y+XXh6l2o7NXDaSkfkoCS+KIH0MHHBxeVAaZn8XN6eS3HNj4n2gHZtG6Hjqw?=
 =?us-ascii?Q?BpIXYxf+RQSyRR2hC/QEvvRegtlI5jZyK4hrDjPCw2+xCAJ1NJlpuxHB1fGB?=
 =?us-ascii?Q?elSUq6ndRx3FkuT/3Z+ttXVrp/B/zHOP3wdQUgQlM1v1Gj0xumJ9DkdgKs0J?=
 =?us-ascii?Q?z8Fh3bgkx3kDdYyIXaXHXYfYjN5jdDcRtcm2TxSlnbEy6kv/oT91aJG0hYyB?=
 =?us-ascii?Q?/lbkmXfGFFLa161X0TBabP5M1zS4SAVqG50sijp8pXwWfoDpvQF2P1Xe4A6L?=
 =?us-ascii?Q?iWLvHOpZFV8ohCfk1Q2IKdMSaM1tn3js0XKTzMnm+1R8yt4RJjmpuTzazsYW?=
 =?us-ascii?Q?PblpVSIZxYuHLXkGVaCkkKroNrLJaZCHQHbT8qfMK89zquxw8CoWXej9BIFw?=
 =?us-ascii?Q?Wg4J8cwDW12Gwck7CNAJHfS5B8E+isN7ykPzcoo3mhyRqDFcUGVyzDwWnw7Q?=
 =?us-ascii?Q?UTTn+NHIth1bZ34oaFFjV+4zaYPHtOpne0vgMtHxdKFiOneH1M3K5dBekKRA?=
 =?us-ascii?Q?S/q+BMrzsWwwgENFjMVVRg4rU6b6U9H986GsOzAJ2J5Zj5KWC1woicOKJ4if?=
 =?us-ascii?Q?KUjTTHit6D4pBFR0aB7ga6D/8gV1+mGST7F2yPrrAAT8VtGVJZy4QTmwMpA7?=
 =?us-ascii?Q?3IWYdS/ljtAvoe5ng+S4QgUEJY9ITsJBPviXqbalXfMeyzytXVNjf+14bzsf?=
 =?us-ascii?Q?9OAMdD/R4bDF93qXRlsB/juJn8rryrmnjONeXOVPf9Tjbu5RXoYE53xR0nRb?=
 =?us-ascii?Q?7sKuiOJQHZXHqinBb5sMIQSo02KsDa3lIRhQsl53eDqkGMNg8ZmsDfkRl6aN?=
 =?us-ascii?Q?HyhBd9y9DzQW+qq+adci4eJm/DWkAIoCTKdda2k9dVLBOnpkVDi0iMmJr7gA?=
 =?us-ascii?Q?Y9HWeYDMByvtuCdG26UX11pFaWEitT1bCmN9BB+NO9U3ZzzDn71tXqlXcTMS?=
 =?us-ascii?Q?S8ch0xsaoZH1PJJJM3X5vhVotJagFoEkgffDqVY4JFrUkaGk/HU6Uq5q6nra?=
 =?us-ascii?Q?tCuRRXEiXBgJsNYJFJV7eAamL92QC+L2zTXvqyL4imqLyI8MH4AVns6+EidZ?=
 =?us-ascii?Q?RekZ5E3CGyu7nFokleRWhQIh4kDUjcQwhQn9l0MpobI3ayxAcD8nG+0QYNGp?=
 =?us-ascii?Q?lsJCDqbZ0uF48Z+ut6s/rKrZgMyGWEn8?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 15:14:01.7017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 935b4f8f-9195-4cca-992a-08dc99e07086
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7117

Use config settings framework to initialize Tegra SDHCI
timing registers

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/mmc/host/sdhci-tegra.c | 84 ++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 1ad0a6b3a2eb..abd664359ddc 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -28,6 +28,7 @@
 #include <linux/reset.h>
 
 #include <soc/tegra/common.h>
+#include <soc/tegra/tegra-cfg.h>
 
 #include "sdhci-cqhci.h"
 #include "sdhci-pltfm.h"
@@ -64,6 +65,7 @@
 #define SDHCI_TEGRA_DLLCAL_STA_ACTIVE			BIT(31)
 
 #define SDHCI_VNDR_TUN_CTRL0_0				0x1c0
+#define SDHCI_VNDR_TUN_CTRL0_CMD_CRC_ERR_EN		BIT(28)
 #define SDHCI_VNDR_TUN_CTRL0_TUN_HW_TAP			0x20000
 #define SDHCI_VNDR_TUN_CTRL0_START_TAP_VAL_MASK		0x03fc0000
 #define SDHCI_VNDR_TUN_CTRL0_START_TAP_VAL_SHIFT	18
@@ -74,6 +76,7 @@
 #define TRIES_128					2
 #define TRIES_256					4
 #define SDHCI_VNDR_TUN_CTRL0_TUN_WORD_SEL_MASK		0x7
+#define SDHCI_VNDR_TUN_CTRL0_DIV_N_MASK			GENMASK(5, 3)
 
 #define SDHCI_TEGRA_VNDR_TUN_CTRL1_0			0x1c4
 #define SDHCI_TEGRA_VNDR_TUN_STATUS0			0x1C8
@@ -134,6 +137,20 @@
 					 SDHCI_TRNS_BLK_CNT_EN | \
 					 SDHCI_TRNS_DMA)
 
+static const char * const cfg_device_states[] = {
+	"sdhci-default-cfg",		/* MMC_TIMING_LEGACY */
+	"sdhci-sd-mmc-highspeed-cfg",	/* MMC_TIMING_MMC_HS */
+	"sdhci-sd-mmc-highspeed-cfg",	/* MMC_TIMING_SD_HS */
+	"sdhci-uhs-sdr12-cfg",		/* MMC_TIMING_UHS_SDR12 */
+	"sdhci-uhs-sdr25-cfg",		/* MMC_TIMING_UHS_SDR25 */
+	"sdhci-uhs-sdr50-cfg",		/* MMC_TIMING_UHS_SDR50 */
+	"sdhci-uhs-sdr104-cfg",		/* MMC_TIMING_UHS_SDR104 */
+	"sdhci-uhs-ddr52-cfg",		/* MMC_TIMING_UHS_DDR50 */
+	"sdhci-uhs-ddr52-cfg",		/* MMC_TIMING_MMC_DDR52 */
+	"sdhci-mmc-hs200-cfg",		/* MMC_TIMING_MMC_HS200 */
+	"sdhci-mmc-hs400-cfg",		/* MMC_TIMING_MMC_HS400 */
+};
+
 struct sdhci_tegra_soc_data {
 	const struct sdhci_pltfm_data *pdata;
 	u64 dma_mask;
@@ -158,6 +175,18 @@ struct sdhci_tegra_autocal_offsets {
 	u32 pull_down_hs400;
 };
 
+static const struct tegra_cfg_field_desc sdhci_cfg_fields[] = {
+	TEGRA_CFG_FIELD("nvidia,num-tuning-iter",
+			SDHCI_VNDR_TUN_CTRL0_0,
+			SDHCI_VNDR_TUN_CTRL0_TUN_ITER_MASK),
+};
+
+static struct tegra_cfg_desc sdhci_cfg_desc = {
+	.num_regs = 0,
+	.num_fields = ARRAY_SIZE(sdhci_cfg_fields),
+	.fields = sdhci_cfg_fields,
+};
+
 struct sdhci_tegra {
 	const struct sdhci_tegra_soc_data *soc_data;
 	struct gpio_desc *power_gpio;
@@ -183,6 +212,7 @@ struct sdhci_tegra {
 	unsigned long curr_clk_rate;
 	u8 tuned_tap_delay;
 	u32 stream_id;
+	struct tegra_cfg_list *list;
 };
 
 static u16 tegra_sdhci_readw(struct sdhci_host *host, int reg)
@@ -362,6 +392,30 @@ static void tegra_sdhci_set_tap(struct sdhci_host *host, unsigned int tap)
 	}
 }
 
+static void tegra_sdhci_write_cfg_settings(struct sdhci_host *host,
+					   const char *name)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
+	struct tegra_cfg_reg *regs;
+	struct tegra_cfg *cfg;
+	unsigned int i;
+	u32 val;
+
+	cfg = tegra_cfg_get_by_name(mmc_dev(host->mmc),
+				    tegra_host->list, name);
+	if (!cfg)
+		return;
+
+	regs = cfg->regs;
+	for (i = 0; i < cfg->num_regs; ++i) {
+		val = sdhci_readl(host, regs[i].offset);
+		val &= ~regs[i].mask;
+		val |= regs[i].value;
+		sdhci_writel(host, val, regs[i].offset);
+	}
+}
+
 static void tegra_sdhci_reset(struct sdhci_host *host, u8 mask)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -374,6 +428,8 @@ static void tegra_sdhci_reset(struct sdhci_host *host, u8 mask)
 	if (!(mask & SDHCI_RESET_ALL))
 		return;
 
+	tegra_sdhci_write_cfg_settings(host, "shdci-common-cfg");
+
 	tegra_sdhci_set_tap(host, tegra_host->default_tap);
 
 	misc_ctrl = sdhci_readl(host, SDHCI_TEGRA_VENDOR_MISC_CTRL);
@@ -1011,6 +1067,7 @@ static void tegra_sdhci_set_uhs_signaling(struct sdhci_host *host,
 	bool set_default_tap = false;
 	bool set_dqs_trim = false;
 	bool do_hs400_dll_cal = false;
+	bool set_config = false;
 	u8 iter = TRIES_256;
 	u32 val;
 
@@ -1027,6 +1084,7 @@ static void tegra_sdhci_set_uhs_signaling(struct sdhci_host *host,
 		set_dqs_trim = true;
 		do_hs400_dll_cal = true;
 		iter = TRIES_128;
+		set_config = true;
 		break;
 	case MMC_TIMING_MMC_DDR52:
 	case MMC_TIMING_UHS_DDR50:
@@ -1059,6 +1117,9 @@ static void tegra_sdhci_set_uhs_signaling(struct sdhci_host *host,
 	else
 		tegra_sdhci_set_tap(host, tegra_host->default_tap);
 
+	if (set_config)
+		tegra_sdhci_write_cfg_settings(host,
+					       cfg_device_states[timing]);
 	if (set_dqs_trim)
 		tegra_sdhci_set_dqs_trim(host, tegra_host->dqs_trim);
 
@@ -1129,6 +1190,29 @@ static int sdhci_tegra_start_signal_voltage_switch(struct mmc_host *mmc,
 static int tegra_sdhci_init_pinctrl_info(struct device *dev,
 					 struct sdhci_tegra *tegra_host)
 {
+	unsigned int i, j, count;
+	const struct tegra_cfg_field_desc *fields;
+
+	count = 0;
+	fields = sdhci_cfg_fields;
+
+	for (i = 0; i < sdhci_cfg_desc.num_fields; i++) {
+		for (j = 0; j < i; j++)
+			if (fields[i].offset == fields[j].offset)
+				break;
+
+		if (i == j)
+			count++;
+	}
+
+	sdhci_cfg_desc.num_regs = count;
+	tegra_host->list = tegra_cfg_get(dev, NULL, &sdhci_cfg_desc);
+	if (IS_ERR(tegra_host->list)) {
+		dev_dbg(dev, "Config setting not available, err: %ld\n",
+			PTR_ERR(tegra_host->list));
+		tegra_host->list = NULL;
+	}
+
 	tegra_host->pinctrl_sdmmc = devm_pinctrl_get(dev);
 	if (IS_ERR(tegra_host->pinctrl_sdmmc)) {
 		dev_dbg(dev, "No pinctrl info, err: %ld\n",
-- 
2.43.2


