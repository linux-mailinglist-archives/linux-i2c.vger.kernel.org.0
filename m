Return-Path: <linux-i2c+bounces-11001-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5D5AB9C7C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 May 2025 14:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D66E2A0362F
	for <lists+linux-i2c@lfdr.de>; Fri, 16 May 2025 12:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A1923FC42;
	Fri, 16 May 2025 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Uz60bDkI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CED323814C;
	Fri, 16 May 2025 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399483; cv=fail; b=nhP/jPlShGSH+84g9pqPeKOQWD2Ohkn21njoau6c0QtnHlSbBKp8+V6LBIyO6BIY3iTcTGfMij0nHQJkc7iVcpPDrcb4ia8sjPAMNrDBzOZMRcNtUnB1XIe3HmJCqVPdlnPOvNiYZDWCIcIXcfMUuSx0Sht2HuZbPrid2nCmquk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399483; c=relaxed/simple;
	bh=jX1NoEaJJ4g2HsyS6Pocrp0iTF0yUYrx68vrXMANafs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BzMJPm+VyFPTdTk4qqtWbttRzkqmWY89kIgdZuaTmJwTl2+Y5jTxOWyN/c4K+xNF5HmJUHEzLVZGU1r+8Q03Gwe7zpcHSOkc30Gy7Moy9TEoA05kv5RcrZjXVPl3xr3iJMI2sfShRyImLGh1qWBPYGzVy/IkcfVsvJDytBjzFzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Uz60bDkI; arc=fail smtp.client-ip=40.107.243.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLWw57tmurDcufr1Hqr5xZ8qAvTgCyN2W7JXKvpaPwS9nHpiT68fbJuQDZyaGeIosyjU/o6BK6G/x7ForvsZvWhm7uuInSePrKyfem7TYqexR/k+KhpAWOhhRn7zUYGY0J/o5cUUZ+NnAgXbNCzR9zv8Rr4TUYyQFh4U9g1FJe3j+Bt4GoKyCAAaTuNjW/y40GI0vpk6x75N0+Qor3DUiyfUf1KCdlBltz4XU967KHjlQSu9GN/n+VmswmNP0ema05Traj+bsqksRySKOVnyS5Fk/fKyct4gPVRXaannxkNn2l+mjlQtY/NWTd90jCNuLqgHMNChXrlMJjwhj4khXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltABqdxW8zPtXz8RZ/arWrztqmywRZ1T1u3RcCk3u8E=;
 b=NENW8GST7t7iY3UopWuVrDV0LvbaluHbpxOzOqYf8uGozYvyWFbSc1BbPzfErzexyo3HX5QnwxK6LL1Ejf7fpjncUFHQfDMMKgBjIIiG3AnbOj1/W9nGz8YQ5RVMcWsyxOgrj4WK4Lg2Urlg8isHptRQ3aW5+GXOkAcZQJ/xMJue//pIstwpnU4JS63rko7fhKKxwFqCZbnpJbhzazJK4W+zBbtEUd98wPeetQov+DMiYBqQdqWJwe0pEzo+e7LrZ3QBNwBxjjIUpf1RUUekl1Lt3GqT4P8GO0AmxWpGWrKjZ7GO5gjk5jVg3fiRJky71YN1lOHZj4Nc+puC/LvKrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltABqdxW8zPtXz8RZ/arWrztqmywRZ1T1u3RcCk3u8E=;
 b=Uz60bDkInmyitphcSInFGgpg/xkiLkLDlya7FhzUJdsCD2pMjTEH737XUM/XeaIx9aivLX+KA0GsUD9NvgrI03Xfl7GyoAnC+ib7621huq49ngd+CWBYkhGgTffCEHP9vQIuFKlHj1aidnAZiNOtvNtaI8oCvIJYJXpvj0UvoyL8p5f0fEzrjYESHW9RyGtkgxAK7+QK5bMZWUk8k4aqmQSx+39zTbB9S1xGUkuhg/lq0py5CT8v9tbJ9YuF+LAad4xmHvUx2JwCpnhiBx8wi1DB1TK402go8umC7tKm38W6KK7RCutLm2riB2Cr58PSbDkNw2sAuTuZ1VhMeiNiqQ==
Received: from BL1PR13CA0375.namprd13.prod.outlook.com (2603:10b6:208:2c0::20)
 by DS0PR12MB7993.namprd12.prod.outlook.com (2603:10b6:8:14b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Fri, 16 May
 2025 12:44:36 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:208:2c0:cafe::15) by BL1PR13CA0375.outlook.office365.com
 (2603:10b6:208:2c0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Fri,
 16 May 2025 12:44:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.1 via Frontend Transport; Fri, 16 May 2025 12:44:35 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 05:44:21 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 16 May
 2025 05:44:20 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 16 May 2025 05:44:16 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<onor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<ldewangan@nvidia.com>, <digetx@gmail.com>, <p.zabel@pengutronix.de>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2 2/3] i2c: tegra: make reset an optional property
Date: Fri, 16 May 2025 18:13:48 +0530
Message-ID: <20250516124349.58318-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250516124349.58318-1-akhilrajeev@nvidia.com>
References: <20250516124349.58318-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|DS0PR12MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2a079b-396b-4035-dc1d-08dd947769f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nbmRF11kYSzTDsgI3r0jjIrzLxTXNYmmF7tgfuNdXYXOG25Fv1oMQ1hAEml8?=
 =?us-ascii?Q?gxqksQ0jVlw2xBE60Sq5Z77hlEuYwxYWRczO9+mfKYjrBjAWbpEHQTt1PW1l?=
 =?us-ascii?Q?t3YqmNSYwNDvDqMTzX5OzK4l8rQRMJCf5FJ7eQ29pwpymO3SEMkJwZ3x0Tgg?=
 =?us-ascii?Q?jthCYUAgax4OeyS8H4F1GXNEl09hg/y1og6eSEHxyHRBlgN8coAjBTn2K0en?=
 =?us-ascii?Q?O2aaWDAsR/3iagfnbSxsq5K7RdHnNZ8UHjEZmkzcRj0AodZRCVSbTJK5q+iR?=
 =?us-ascii?Q?7hMfj9KL0bivy90b4CQLEhA8XY5WDueeiz41ZDGmbAG134Q1xsvAlS48sglw?=
 =?us-ascii?Q?pG4WhJXoLylwzoW5p45C2KJdVgsu4hA9kJkuIJnLbvE6OBCvXHrHRxUPWFaA?=
 =?us-ascii?Q?F8QXQt+DAz9IHHoR/lRRNfqP+jx2Z7Kwx+xF8IN/gM1iFRTOpovYGoVKkboV?=
 =?us-ascii?Q?Vk2bzXQcd4ZglOkh0A4+jZH5ddIVEGem0dTNMGIrLISseebdjfGwB3L2M22q?=
 =?us-ascii?Q?3KtVdCTQZ1QTyAyKVKsEwV+reCpx8AKeT+Pne+mk58lnXTT2gf0urftiX+4D?=
 =?us-ascii?Q?RKS1B9A07JKWe/nHNMhLIZxshekvVD1R9UD2o59i3HWjauwZihw5/IwXvUQm?=
 =?us-ascii?Q?V9Bn/5gLoiMpTcywmXl3xlSGVhBEgsB8i5Df5OFHfK8ZayBGIFOrdfvLQnU4?=
 =?us-ascii?Q?oppG0sZqVG1P1driYrc3KrOhFpPGWHLSIY+/whEPrtrc35CIe2m11t7FyGkP?=
 =?us-ascii?Q?QBIS7hSQecLfDpCBpWCeY8pQR40+g+N2HZ+yYVfVX8ydqTbMQ0Tr931oDMeW?=
 =?us-ascii?Q?Kru5CYNaNbgBmOHLpYZX8+u7jyDlC3xdRFJoIt1J50m/jBP9k8wH+romxiN0?=
 =?us-ascii?Q?q1qPtWHG5vkFnkpD+e0G6FWnYsjDfvAaMViZTk90dkrlJ6vhZHJ5rYIljzm0?=
 =?us-ascii?Q?0dA8xLrSGidVxW7ElkZ6N0dPxuRkigLp2Fyarkc+OCHfm9yFefthZEpDkNl7?=
 =?us-ascii?Q?hW5d0mI7vx0l2mLnSezea8KQYE5SErgtDCIZiAyQIER2Pjw175teyVw8OTYT?=
 =?us-ascii?Q?OU8apXGMfMHbtFQ2ezwyrl0+fJWrsYT2HO/bpTi6u8Uax46ZDfMAVXfApy67?=
 =?us-ascii?Q?1ww0+jHjB8u+Rv0h8ZkvJr/OW5Hk4JgsyIIrA81adUKg/hfX10+liXOnFx0u?=
 =?us-ascii?Q?p3vqrE9mPpy5lYi5x/+aIicdxlZDZOIHCu0U+aLqqULMUssDeAAi/IT8ao0L?=
 =?us-ascii?Q?isvZ5j/Rf2neU/O0V5H0IoXs3cFpZCvYJzgsM6NdkQcLDT98d+EvjtuqfFne?=
 =?us-ascii?Q?s0/j5iPNqHmYUx0xVmj4nms9asE+nRbdNwqj0jI5GS8DzZyikq1upLxm6Ok1?=
 =?us-ascii?Q?BpOLgbLO/nirlF3ln043Z3ilaaS1Vz1ljbiw8yaSG6anT2uCZqAW0C+ZyR2J?=
 =?us-ascii?Q?c/0lUKZ2UCNP9fqVoaMN/qS6+bkMKZM0/U15/C/Lkq5ljooMatiCXwwrerfo?=
 =?us-ascii?Q?wa7s1N2pagmbxOlt1tHkR932GFy2Ul4UHyFh4+MgJL5f84U24Txhxo8lxA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 12:44:35.3999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2a079b-396b-4035-dc1d-08dd947769f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7993

For controllers that has an internal software reset, make the reset
property optional. This is useful in systems that choose to restrict
reset control from Linux.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
v1->v2:
  * Call devm_reset_control_get_optional_exclusive() unconditionally.
  * Add more delay based on HW recommendation.

 drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 87976e99e6d0..22ddbae9d847 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -134,6 +134,8 @@
 #define I2C_MST_FIFO_STATUS_TX			GENMASK(23, 16)
 #define I2C_MST_FIFO_STATUS_RX			GENMASK(7, 0)
 
+#define I2C_MASTER_RESET_CNTRL			0x0a8
+
 /* configuration load timeout in microseconds */
 #define I2C_CONFIG_LOAD_TIMEOUT			1000000
 
@@ -184,6 +186,9 @@ enum msg_end_type {
  * @has_mst_fifo: The I2C controller contains the new MST FIFO interface that
  *		provides additional features and allows for longer messages to
  *		be transferred in one go.
+ * @has_mst_reset: The I2C controller contains MASTER_RESET_CTRL register which
+ *		provides an alternative to controller reset when configured as
+ *		I2C master
  * @quirks: I2C adapter quirks for limiting write/read transfer size and not
  *		allowing 0 length transfers.
  * @supports_bus_clear: Bus Clear support to recover from bus hang during
@@ -213,6 +218,7 @@ struct tegra_i2c_hw_feature {
 	bool has_multi_master_mode;
 	bool has_slcg_override_reg;
 	bool has_mst_fifo;
+	bool has_mst_reset;
 	const struct i2c_adapter_quirks *quirks;
 	bool supports_bus_clear;
 	bool has_apb_dma;
@@ -604,6 +610,20 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	return 0;
 }
 
+static int tegra_i2c_master_reset(struct tegra_i2c_dev *i2c_dev)
+{
+	if (!i2c_dev->hw->has_mst_reset)
+		return -EOPNOTSUPP;
+
+	i2c_writel(i2c_dev, 0x1, I2C_MASTER_RESET_CNTRL);
+	udelay(2);
+
+	i2c_writel(i2c_dev, 0x0, I2C_MASTER_RESET_CNTRL);
+	udelay(2);
+
+	return 0;
+}
+
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val, clk_divisor, clk_multiplier, tsu_thd, tlow, thigh, non_hs_mode;
@@ -621,8 +641,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	 */
 	if (handle)
 		err = acpi_evaluate_object(handle, "_RST", NULL, NULL);
-	else
+	else if (i2c_dev->rst)
 		err = reset_control_reset(i2c_dev->rst);
+	else
+		err = tegra_i2c_master_reset(i2c_dev);
 
 	WARN_ON_ONCE(err);
 
@@ -1467,6 +1489,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
 	.has_apb_dma = true,
@@ -1491,6 +1514,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = false,
 	.has_apb_dma = true,
@@ -1515,6 +1539,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1539,6 +1564,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1563,6 +1589,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = true,
@@ -1587,6 +1614,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.has_mst_reset = false,
 	.quirks = &tegra_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = false,
@@ -1611,6 +1639,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_multi_master_mode = true,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = true,
+	.has_mst_reset = true,
 	.quirks = &tegra194_i2c_quirks,
 	.supports_bus_clear = true,
 	.has_apb_dma = false,
@@ -1666,7 +1695,7 @@ static int tegra_i2c_init_reset(struct tegra_i2c_dev *i2c_dev)
 	if (ACPI_HANDLE(i2c_dev->dev))
 		return 0;
 
-	i2c_dev->rst = devm_reset_control_get_exclusive(i2c_dev->dev, "i2c");
+	i2c_dev->rst = devm_reset_control_get_optional_exclusive(i2c_dev->dev, "i2c");
 	if (IS_ERR(i2c_dev->rst))
 		return dev_err_probe(i2c_dev->dev, PTR_ERR(i2c_dev->rst),
 				      "failed to get reset control\n");
-- 
2.43.2


