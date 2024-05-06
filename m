Return-Path: <linux-i2c+bounces-3446-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6618BD7DC
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 00:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1E1B280CA6
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 22:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6F215E5DE;
	Mon,  6 May 2024 22:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WLtFBcRp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC5215DBAE;
	Mon,  6 May 2024 22:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715035991; cv=fail; b=iONIlIURn3mAjh0LIGo6UgObco9bJEwvOOMqL3bK6J7AWfWppl3S4DetLv6vSmb02RejDL1RuTSK9hUgJeGEZMny5FJNHBQZdQCKdsBYElwZqqbHdn6dx1jFVlxnHy/b9S0i6ky7C8B14wV9r630+xRd2/WvxsBwYT19JCSQgrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715035991; c=relaxed/simple;
	bh=iBX/Ign0ibZ2cJo5H4xOwNyhcHnttHXJDUWTRrucGnk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B9jXdO0k221XU0wjPQV+2v/ayLKT8VXB7D60f+lECGmSO8Nr7hYU5dpg74bdw2bhIn2szQDxNTy1f4uuVhVcprdlPs9E1yPNIQO0mxdwYmCJJF8E1MGgMKG05mMiIlKijLy/Eua0aaTVAvyJx/1Leb7oMNtHE7Z+4jzYBnyH9IY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WLtFBcRp; arc=fail smtp.client-ip=40.107.236.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYEoBsikzqWLXKrdP+vV1qahkV7HJ2ynJnp6Q9b7pooXdlCwr/Yideqt5FjaQFoR9YN2qZ/S573F23QJ3xZ+h4p0Jpf4tFFvhDTzVC9ZNdooQVk7Pm33JRDayzYu0zn7MpaR1ypfAfPIhuNzBMiaKCKxTFPBI5uGSvVH0Y7nzKaI0gN/3zrMqqeOtus3mIRQq+b9gymra3QZ7D4DuBXsnTo3GMg+wtj1r/xCOVUiz4W2DSowgZyNp0Om9tR4A9gd5oDrYxbrBh0wEMq/Nf9OyaJVLm5K4UCmiTXH83R4ekWuhUsFngqCbl66qPbwqGS+3pyzTgVWrgQcfFEjXmRadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFZD/oaACHTDbMFEGbqUivhtJCQ+tYY8GI/iakxP/jg=;
 b=Cwi5PHXR3Pj1Rkl17+K9MVSCBaUs7YAN7YbcPk1LxYx/DiJV6xTi5glX+A8H6CoYXXevbXTlTb+Ha8KH9rT2cB4wPSlLEps+U3EtezHTnYLrkyAsBlkCcj0ubqrg7RXhDnJQOFokn/TQjzothRyMigu7LjRgCEQoYGlvRzTPJ2/oKtEo3rdun5FNFRa2VSowKkBQbWxRVSWlHiPfaX/fJ3cUPJB7J1RhuT9oTqPLvvH21dymqRgtbZgMmbAW2Nnj3R2LYmPzhbuw/PPxiWszIt9FuEocuj0ck/CmENi7A9PrwNrfSA6ovIc52rmDavPsJawbdahmO9FER747Dfu0QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFZD/oaACHTDbMFEGbqUivhtJCQ+tYY8GI/iakxP/jg=;
 b=WLtFBcRp8SMZw1mPMHrDF903/G81ol3I3eF6WwOjMIpaS0QVF9D9NiKw4OqpJh2KBAVfNFlttJbhoOkGKBB5CtpY5E+/a9Zr1v+n14TDwkOY+pjSJ34Az5eEsBUxIfw2y4H2cc2AwtPxUPMLyX02ZXFZoiS5myaZCLvhShqj77jUoEJzjuWzd4zCpXc+8zmJgb6vubThdcP3aDpc5OS66rQ/XJDYfFkjRwzSl4phYFSlCGuwn0VgsZU/ENk25RD1yoS7VslOQWIjcEednQ/npIEr8Py+KGNSZ7NAsb4h0PNSow83v8UN2zBFI8j6EikDb7noaLbbRI9tqRxPKunMkw==
Received: from DS7PR03CA0312.namprd03.prod.outlook.com (2603:10b6:8:2b::21) by
 DS0PR12MB8416.namprd12.prod.outlook.com (2603:10b6:8:ff::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.38; Mon, 6 May 2024 22:53:01 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:8:2b:cafe::1e) by DS7PR03CA0312.outlook.office365.com
 (2603:10b6:8:2b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Mon, 6 May 2024 22:53:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 22:53:01 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 May 2024
 15:52:42 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 6 May 2024 15:52:42 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 6 May 2024 15:52:37 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH 06/11] i2c: tegra: split clock initialization code
Date: Tue, 7 May 2024 04:21:34 +0530
Message-ID: <20240506225139.57647-7-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|DS0PR12MB8416:EE_
X-MS-Office365-Filtering-Correlation-Id: 126af70d-8369-4306-2e3b-08dc6e1f4886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|376005|82310400017|7416005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?92ptHH9HaKuTXbIS0x/L73v5zyZQNI0B6B1zYiBCS3OQSdKexoWHB5uehcOd?=
 =?us-ascii?Q?gFgYOHqcsdYHUERHctHnMtfbXH7vq1CfsOyew8wQkOw0CbqPQpabO2MBlGE5?=
 =?us-ascii?Q?x5fxvldd2vdDN9vOnxoWzO0CK38XxkPANvkYTeFVmflGZdCcpGeFU8bvDCen?=
 =?us-ascii?Q?LZp0ELq70SWy0nTrBl8bOAKEcyIJmMj3a6mkr+WgGGqv+hZYZ3KadocJ1Og4?=
 =?us-ascii?Q?DHD4XV1+JhXpmiTbBezPEDEuT1/L+U5tKidjybC0mi0N4k2Gy+W8NC6s/Ftt?=
 =?us-ascii?Q?ZEjyP8lUDGl6fDXai3CZwYcV5MPmb536MJxweL5QXzmJP/5rnexWmiX2cpcx?=
 =?us-ascii?Q?EdxG9yWELqe+S082rfZgKzCa/Wymg7BT4X11KDPnrtBmTQihjkacSumkIkqk?=
 =?us-ascii?Q?HHS9VXxQGKyzY2eGnqtylJ8Bsqikjqkb/s++gOwQ1SXhzogmT/Kf+/kjuWmb?=
 =?us-ascii?Q?aDMv1KWKuzMaCDE8uzL+4eKp8ZNxzuC/JoxRkDRLArDhpE7zjoXgPfJWln78?=
 =?us-ascii?Q?5jRLB0x9buVAlxgZUzShnPTWk6qoXRY9uEtgFH5jRTIZrGDrENMDmaNjDRXp?=
 =?us-ascii?Q?sXONCnqQnJFwxVldHEVVeYL0M8xi0CoIQ/dtAUDwZU+UBJ7qCyD4Ppwch1QL?=
 =?us-ascii?Q?SbWLgvISIuBlBIWGDHJQ0ZoxfIG2qP/XfMN+gK0WbiGIG9HC4siHyn2Qu2n0?=
 =?us-ascii?Q?ZO5tAxbv8G/8rKdLdx5+HqHscDagnBTUomz23xTzkWXg6AVuvsIwXKm1LZHB?=
 =?us-ascii?Q?dAp6CONu947J9MqXgMHWTWezqot2C4U0yjkkNg9FsafygCoyioOJ8t9SE9Ln?=
 =?us-ascii?Q?FgM9SY0uebYI/es4v6j8Ir1o+fFwKnG/sgl+vihlbMTOnjDt/6B2mWeXeh0s?=
 =?us-ascii?Q?nTBh9qJGTwD3MY9ByY/8Wljb0r1uWUcFYyFcgIpbuHEJWZVfbwLW+lY3RwSw?=
 =?us-ascii?Q?a35IzpMSpLuZGiVYa5znoZPyFXcCPf0id6Da/6o7ducQysF3Lr7p+mDackod?=
 =?us-ascii?Q?zJx5Jbn5Q2Cwv478nbSVQVQUe4thhylqv5FDrTlAqSxkeOvTkhPSfNa5zHRy?=
 =?us-ascii?Q?vVupiKgTNeO4QQfFQ5IScZkQplRJhz/6s8YmbMDT8syCEs2l6ALTmkKsMnDo?=
 =?us-ascii?Q?Fu9Q2sU6WO5kwsp6mgV6GHNxY02CpedU8ueCQdfsvx0FgTlr+mK3BlqGHEN6?=
 =?us-ascii?Q?3WYo3jrWdVpXEBqli5Rmpyr5e+2VGH9NuQ2Aec/qYXj6zm4atOg1pbI/D7AK?=
 =?us-ascii?Q?nM5ZPRtiVEzn/9jPG7kwwwDewLB4wZro08l/JM8dxcDWImcjF4dtDDuArxgB?=
 =?us-ascii?Q?+3tzcx09Q4YrRtygRV+LxR4x4ilWVlAy8MmU3v/apEWruJ7oVfMFb4z6GjMV?=
 =?us-ascii?Q?1sFzon8QfmUAZKuGAm2ftGTpJhls?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 22:53:01.8000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 126af70d-8369-4306-2e3b-08dc6e1f4886
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8416

Add new methods for setting clock parameters and setting
clock divisor.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 127 ++++++++++++++++++++-------------
 1 file changed, 77 insertions(+), 50 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 85b31edc558d..b3dc2603db35 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -604,12 +604,83 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	return 0;
 }
 
+static void tegra_i2c_set_clk_params(struct tegra_i2c_dev *i2c_dev)
+{
+	u32 val, clk_divisor, tsu_thd, tlow, thigh, non_hs_mode;
+
+	switch (i2c_dev->timings.bus_freq_hz) {
+	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
+	default:
+		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
+		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
+
+		if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
+			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
+		else
+			non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
+		break;
+
+	case 0 ... I2C_MAX_STANDARD_MODE_FREQ:
+		tlow = i2c_dev->hw->tlow_std_mode;
+		thigh = i2c_dev->hw->thigh_std_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
+		non_hs_mode = i2c_dev->hw->clk_divisor_std_mode;
+		break;
+	}
+
+	/* make sure clock divisor programmed correctly */
+	clk_divisor = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
+				 i2c_dev->hw->clk_divisor_hs_mode) |
+		      FIELD_PREP(I2C_CLK_DIVISOR_STD_FAST_MODE, non_hs_mode);
+	i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
+
+	if (i2c_dev->hw->has_interface_timing_reg) {
+		val = FIELD_PREP(I2C_INTERFACE_TIMING_THIGH, thigh) |
+		      FIELD_PREP(I2C_INTERFACE_TIMING_TLOW, tlow);
+		i2c_writel(i2c_dev, val, I2C_INTERFACE_TIMING_0);
+	}
+
+	/*
+	 * Configure setup and hold times only when tsu_thd is non-zero.
+	 * Otherwise, preserve the chip default values.
+	 */
+	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
+		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
+}
+
+static int tegra_i2c_set_div_clk(struct tegra_i2c_dev *i2c_dev)
+{
+	u32 clk_multiplier, tlow, thigh, non_hs_mode;
+	u32 timing, clk_divisor;
+	int err;
+
+	timing = i2c_readl(i2c_dev, I2C_INTERFACE_TIMING_0);
+
+	tlow = FIELD_GET(I2C_INTERFACE_TIMING_TLOW, timing);
+	thigh = FIELD_GET(I2C_INTERFACE_TIMING_THIGH, timing);
+
+	clk_divisor = i2c_readl(i2c_dev, I2C_CLK_DIVISOR);
+
+	non_hs_mode = FIELD_GET(I2C_CLK_DIVISOR_STD_FAST_MODE, clk_divisor);
+
+	clk_multiplier = (thigh + tlow + 2) * (non_hs_mode + 1);
+
+	err = clk_set_rate(i2c_dev->div_clk,
+			   i2c_dev->timings.bus_freq_hz * clk_multiplier);
+	if (err) {
+		dev_err(i2c_dev->dev, "failed to set div_clk rate: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
-	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
+	u32 val;
+	int err;
 	acpi_handle handle = ACPI_HANDLE(i2c_dev->dev);
-	struct i2c_timings *t = &i2c_dev->timings;
-	int err;
 
 	/*
 	 * The reset shouldn't ever fail in practice. The failure will be a
@@ -641,54 +712,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
 
-	switch (t->bus_freq_hz) {
-	case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
-	default:
-		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
-		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
-		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
-
-		if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
-			non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
-		else
-			non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
-		break;
-
-	case 0 ... I2C_MAX_STANDARD_MODE_FREQ:
-		tlow = i2c_dev->hw->tlow_std_mode;
-		thigh = i2c_dev->hw->thigh_std_mode;
-		tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
-		non_hs_mode = i2c_dev->hw->clk_divisor_std_mode;
-		break;
-	}
-
-	/* make sure clock divisor programmed correctly */
-	clk_divisor = FIELD_PREP(I2C_CLK_DIVISOR_HSMODE,
-				 i2c_dev->hw->clk_divisor_hs_mode) |
-		      FIELD_PREP(I2C_CLK_DIVISOR_STD_FAST_MODE, non_hs_mode);
-	i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
-
-	if (i2c_dev->hw->has_interface_timing_reg) {
-		val = FIELD_PREP(I2C_INTERFACE_TIMING_THIGH, thigh) |
-		      FIELD_PREP(I2C_INTERFACE_TIMING_TLOW, tlow);
-		i2c_writel(i2c_dev, val, I2C_INTERFACE_TIMING_0);
-	}
-
-	/*
-	 * Configure setup and hold times only when tsu_thd is non-zero.
-	 * Otherwise, preserve the chip default values.
-	 */
-	if (i2c_dev->hw->has_interface_timing_reg && tsu_thd)
-		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
-
-	clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
-
-	err = clk_set_rate(i2c_dev->div_clk,
-			   t->bus_freq_hz * clk_multiplier);
-	if (err) {
-		dev_err(i2c_dev->dev, "failed to set div-clk rate: %d\n", err);
+	tegra_i2c_set_clk_params(i2c_dev);
+	err = tegra_i2c_set_div_clk(i2c_dev);
+	if (err)
 		return err;
-	}
 
 	if (!IS_DVC(i2c_dev) && !IS_VI(i2c_dev)) {
 		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
-- 
2.43.2


