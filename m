Return-Path: <linux-i2c+bounces-3450-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 545568BD7F4
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 00:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D75E01F22651
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 22:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52C115EFB3;
	Mon,  6 May 2024 22:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aMCW+6vP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09CE15ECFB;
	Mon,  6 May 2024 22:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715036006; cv=fail; b=Wm2oPLLS2mNkyy/UOhIV+jeGWsnK4NQDMVmg6vQWTUMGHCfQkN8WM1Ghmz2eqv7DPKVD1fgiTJCgSAjNVyBWsEVEZqiP0WEm3QZvdlK3vnPNAYI19A6iTBOQldFmtVVeOuB3FnNkM9lXqtAO+ybyZNs0D3VcZGvg/H6MXxALwQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715036006; c=relaxed/simple;
	bh=ZeI9XqjCSfK9WXMGKx6v6jplqyejYpRlrad9i/2p/bQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WS+eCBIwcPXd2Ga9jSBLGA0O5lsvuIXNIpVlD73PdMlEe/ATeKLDfpyDE/kFu0XbnAJjiqxkylv05dQEsAFH4CLaUWEgpVv0OEhHIawlpSD67x4gODwhJxclQhfxEaROrvSx2V7M+48S8AmUrCRoTpLi/a/c+YjEqhN02mU8O7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aMCW+6vP; arc=fail smtp.client-ip=40.107.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1Cv5ETl5Ttp4A+2ynftxf8djVjnogWNWMJ4B879w72ApgP17O10NYWsPbsCY6zonfyT4JHe6yXmx72Vf6iFcLPLQzA8qGfdc9HqNnpwvqx4qn8m29NwfUlQuvZIYviRAMWau3YvnsYpsezNVsPXCkICO7WVSgbG7fovtY4qhIu4m+pYQtBXRktrF0p/f+0v2kNWPYKCAEI+MICTaUfF8vwOZ7O+W1x1y+vz64OTnQF8HqahSH22QxEsyaIrtlqzbnb6qP9kv8vQrFHRaYCygWRnfsQ1omuXAw418x3AU3ILT9d9Eq0T/HPS8HdUqhx5Ycg1xGIS9pCGjvu3LJgPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mb6M2vwJVq9iUqseSEHpaC3Cuy5stf4/lv68f4kNEZM=;
 b=kaHv9eLv7f0mkx4MjOye091iRQP5jpXB2ZVT4XvPwlhwyH35JpryaHtMLnJzWcoJ/nSro/vptuzSBrwdA6E8ArgiAtCct1u9LmTB1HREnCCbaASZ4RUy5ybuPbGXtkwhtmBlxRj4t1OIQFqR4rn64wtfuLSXCJA8zWI72U7ZV30Xw5599KEwrRN0967Bv4eSLMVi9hJzgFJKJXjOdE/5CSW1yqB55/M8YEb7KFGDb4zbM+qCtOPuQDiiSFOj+YfAk9u1lU+qCr/eEdeOTXPZF2EUwWZyEnUc8sr7Aq7NfBV2damas9C7IzIGIvf15as3eUUW7hlKEtR81uom2Yampg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mb6M2vwJVq9iUqseSEHpaC3Cuy5stf4/lv68f4kNEZM=;
 b=aMCW+6vP2gPiDXHzraS8ooRTWJ+1Mq/hCUSfe4TUmBaiNcvH3NBaTFy113KIlj563Ef/peTtZ0pTBY5Kdi7gx4cL0fVFTCPPW+5yE9sG5K3rk+lYVE+HPob+c/3MiE8GUOhQG1y8dCEuozeEVs9BS5RxWSO5PoMdly2cR5VYol7P8SYr8EmACigzRxst7jztlCPCcNRdXJAmASmvNmRoWY7wEKdSZUF+p/Gf5+CGBd7/OfyuyXLXSjV5aHDQM902tDzBruIJGl6cJFl/bgDV8e9jHcMOGdv617gf4MZUAkyn5KcOyXjow7+W0WJs92CAc1lb5F5eJKCJCt0DT15bxw==
Received: from SA9P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::11)
 by CH3PR12MB7593.namprd12.prod.outlook.com (2603:10b6:610:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 22:53:20 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:26:cafe::cd) by SA9P223CA0006.outlook.office365.com
 (2603:10b6:806:26::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.40 via Frontend
 Transport; Mon, 6 May 2024 22:53:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 22:53:18 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 May 2024
 15:53:05 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 6 May 2024 15:53:05 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 6 May 2024 15:53:00 -0700
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
Subject: [RFC PATCH 10/11] mmc: host: tegra: config settings for timing
Date: Tue, 7 May 2024 04:21:38 +0530
Message-ID: <20240506225139.57647-11-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506225139.57647-1-kyarlagadda@nvidia.com>
References: <20240506225139.57647-1-kyarlagadda@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|CH3PR12MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: ac4e33bb-829e-4383-5947-08dc6e1f527e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|7416005|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ey+5dbLuP0jav4Z8IGP0PRqGvjPTPCqcrYmY0z9zivHgNkOGjxkva5n6XKLk?=
 =?us-ascii?Q?uhk824Ka+Ip9L8bIy7RgD5l04mVPLCHrtVZik6fnkyl6bA22yiS/gTWC1yL2?=
 =?us-ascii?Q?UP2IPq+fRFBTqNjfL+VzDBf3zjkN1J15E5IhXWfd7DZEhJZ0pqBrpqDE8EKc?=
 =?us-ascii?Q?UkhAN9PHI+yaHadBUPgovYi6zmy3vRGleLqb+R1vuKwbN46dzAqW0lDyvuFT?=
 =?us-ascii?Q?PVVyFCeVyraeWibsa9JkmdC4nQ3DzADDm7Fe3Yx8UOgQz+KlKYmYfxxHuwp1?=
 =?us-ascii?Q?M4onJ0UeU3CKo7zOwDBuj7fjvW+5pE/o9qId96r5zvF2AVzGDJ4eCeQbM/O5?=
 =?us-ascii?Q?1OdPX6g8jRJbZR48VWLp/hNr+e3xQ3tuovnlfohCSpZPh5ZbNfO5ibOyIWw0?=
 =?us-ascii?Q?ZfIaNL6obAMn9ND+mr7//pYWFY292rtE3g5dWm4V0tf+f7WWPNBbKChxqSP5?=
 =?us-ascii?Q?yJ8IMsYch68TU9kkpRGz6KxvGzbzS1jPKXwbWWanLcZcdA5zN2lOmRqahRN3?=
 =?us-ascii?Q?QO05YzxXmQs8Xix89Zkxuis1V49NUnONkMwnAPff7RoOW3tJwy5gy7qmxvFu?=
 =?us-ascii?Q?00695OTZuQQ/K3nwANbJq2B31JNc2Xs37suq52vaHiP9+uHyiNnzMllGhzsw?=
 =?us-ascii?Q?Zs+QwWJzSXM3IgH8U6GzCWrTUh5N7+0ewHgS60Ux5VmqWux8MdpfwsgrCM1Z?=
 =?us-ascii?Q?Aanj9UMXaevAwgq++vlFFTSGl4tX5JWpYBwXBaNYODeGZWBafuMGPS6HPH43?=
 =?us-ascii?Q?8ZSlcYsTMfzVuprgXqUclej9cMD0asIuZeUGiAME+w8xfCRAxv5twnGQm6vo?=
 =?us-ascii?Q?m7agOIMHr2f35BujRoVhBa3QSx+s8A9BucGLSMPHoEbS+srWh37GdbznK3+Z?=
 =?us-ascii?Q?ds0eMTC2HkX6bvy+f8levd3Dm5GtrJJjX52Swh98bCV/JZGLdatPuivHLpeP?=
 =?us-ascii?Q?dCY4KBMnR1i15zuGfoDrDZOcBlthUdvMtae4Ni6QTQTzsBaOTrRqzaV9/NU5?=
 =?us-ascii?Q?IxGz24Ja6ObkGdGB4yJV+G97INxHT+rQ10Wp2vL7dU6izYbQNHZOB7qrNriy?=
 =?us-ascii?Q?+5LjeCuGQzy+a0Y0hS7gKZyKzXrlzz6GH9xtE+IBZtwDO8kD0wDQ5U5nnX15?=
 =?us-ascii?Q?peIWegkUl262YbXybp8qq01PU/ainOvwQKpuE8aQjIt7d+AqefPW1lAqhuWP?=
 =?us-ascii?Q?TrEYdkMfjir2Iplttt6fAK14ToyZ59sSBk/W2VUZus5DeTVVKsVgM3BIyDzY?=
 =?us-ascii?Q?U/atVveVuKtfQ6Vn2Vhd9y2ErQKVeSUyRr63rrnYIVuF5Y0ZRjXXeZQgWZsm?=
 =?us-ascii?Q?2V9c77OpCAi2dxKT79GjV1uC5pcqmzgX7swfUTdE93tlpLFtMFyobYE3kE5B?=
 =?us-ascii?Q?+/q2xC4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 22:53:18.5571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4e33bb-829e-4383-5947-08dc6e1f527e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7593

Use config settings framework to initialize Tegra SDHCI
timing registers

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/mmc/host/sdhci-tegra.c | 84 ++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 1ad0a6b3a2eb..87fe85991617 100644
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
+	"default",		/* MMC_TIMING_LEGACY */
+	"sd-mmc-highspeed",	/* MMC_TIMING_MMC_HS */
+	"sd-mmc-highspeed",	/* MMC_TIMING_SD_HS */
+	"uhs-sdr12",		/* MMC_TIMING_UHS_SDR12 */
+	"uhs-sdr25",		/* MMC_TIMING_UHS_SDR25 */
+	"uhs-sdr50",		/* MMC_TIMING_UHS_SDR50 */
+	"uhs-sdr104",		/* MMC_TIMING_UHS_SDR104 */
+	"uhs-ddr52",		/* MMC_TIMING_UHS_DDR50 */
+	"uhs-ddr52",		/* MMC_TIMING_MMC_DDR52 */
+	"mmc-hs200",		/* MMC_TIMING_MMC_HS200 */
+	"mmc-hs400",		/* MMC_TIMING_MMC_HS400 */
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
 
+	tegra_sdhci_write_cfg_settings(host, "common");
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


