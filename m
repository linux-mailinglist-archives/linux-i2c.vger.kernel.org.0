Return-Path: <linux-i2c+bounces-4545-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCFB91E3A5
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 17:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 512CC284952
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C1916DEA2;
	Mon,  1 Jul 2024 15:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UAjgHxTp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD30316CD23;
	Mon,  1 Jul 2024 15:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846821; cv=fail; b=VCxqzkV456wMghQazaucQYK9hRfC1SePdjue6HD9n77VmXuzpWLYGgiQgjXuWj6I0vPt/vsj8W49EwOVjclnqR/qloi9nxIPHUz3SgaxAQ95ZeYVQVBsiOmRrH0l9kGOWR5i78ydLcYhOuUpTFHcydB4yJq9nK4oboU9q5mn1xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846821; c=relaxed/simple;
	bh=iBX/Ign0ibZ2cJo5H4xOwNyhcHnttHXJDUWTRrucGnk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YloDj6jj+LLG3gMJyMtTSyDV0w2XnenFyJCKHxILAIOVUz1DTMSZbsAXBx8QVDKulPnIGuk4Eu/KqSXopvhTvqtGfWRIflSIlxkyDH5arfl6vaGPIAjqanLT6NKPrQZqli7ARI7mxKjHY9/dXPyn7LxQnVMkPnJ2bIWbRruexs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UAjgHxTp; arc=fail smtp.client-ip=40.107.94.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVeY1ysOjz0f30Lke1JY5YsIJiVIHj/WEnxHyoNQJ5gL/QMypNwNV1RJm0K2t/tBQzUQvv5Zb6bmNrfY3DI0eR3nfJzHDZiJ4ATEKe41WDJTMgMTQX9LQ6lrwsiOzC6nFuBDFPGh0falHFloebiDQhxpF2QdXvbrj/lhOHd1ltavsn7SRRMQlCHvN1BeUZMceOMmy6yBb4QSlOVcR3kBJbJdrQbAPodL0ENL96FaPtpKgoHSphxqx/Adlqdr6eqA3pArCajiYihb/o1X0u74ICRJxFDJCKLnARDUAeRGI0uzY2j7EmPafCMcQfTA4cb1JEH8QQ8AUeunmt5VICBX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFZD/oaACHTDbMFEGbqUivhtJCQ+tYY8GI/iakxP/jg=;
 b=EevawNE8evsz6E28jMp22mkZRHS6AmTcHiqyU6+ptqZIUrDhbbobwLCDes9aisrJWooZs6c60zvahH3O3UA+6E7yg6WOCMnVEhrhRC5G/LrXdBpOQx4HWka68QYgPtVyWPN8DWx9ikST5qCQzcri/4W3fcq/d1hMr7i5ugPwtlrmDwLx3cMgRh8SfdIpRAwQyU6Is3ukjSFYa+pyfptPaEVQ7MIW7LJb/u7gQnu/Z/3jldQ0ASkpl2IQNCyAwqVN6iB+36YXgsEpmkPU3NLtDjfZ53kORaMLSfOanl6sNDX/mpHcLwMsPxk3dM/v+IbFmfOHxzyiZ0Vve5zcK89M8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFZD/oaACHTDbMFEGbqUivhtJCQ+tYY8GI/iakxP/jg=;
 b=UAjgHxTpL4uODQzNIgzo4nWghNHoavp5hWvzPdlhhVAvRcPMYcjpHEfO5RxD0NLrLyztF3vuWGAuC2Ud9fduRKYMWMKJTa90ZDvzAE/e+oyLfZToTXNztdcxzC7y0hd95qHQlXR07yibRCkkx+F0vtQfpY9/C8rnVq83PB+Tep1dp51D4cem/NeAnzsMVfsRJuDElr/vK9xYfq9nopMGrWShlluffD6gv7Uhp73R8u0+2HM6nWxWFxI3kzdG7ZlLIP/JzV2dDGB340CM4eq+3zmgTBlWFY+AjYTVXeWDw/boLgbQSXHkVnKDiWxqKEgpRxphVfebl1Y17QU+O2U3Cg==
Received: from PH8PR20CA0006.namprd20.prod.outlook.com (2603:10b6:510:23c::11)
 by DM4PR12MB7525.namprd12.prod.outlook.com (2603:10b6:8:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 15:13:31 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::c7) by PH8PR20CA0006.outlook.office365.com
 (2603:10b6:510:23c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33 via Frontend
 Transport; Mon, 1 Jul 2024 15:13:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.18 via Frontend Transport; Mon, 1 Jul 2024 15:13:30 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 08:13:16 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 1 Jul 2024 08:13:16 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 1 Jul 2024 08:13:11 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH V2 06/12] i2c: tegra: split clock initialization code
Date: Mon, 1 Jul 2024 20:42:24 +0530
Message-ID: <20240701151231.29425-7-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|DM4PR12MB7525:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bad22a1-d8d9-4bfa-a7c5-08dc99e05ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pSQQOqOs2t/nvwRVj94Al1+idUNNZxt+1uvlmo19XukNve3IC+NJ5Z9dzlnV?=
 =?us-ascii?Q?SJv/OGpuVDXLOMWDCQgWDs1M/7vrtn16hLeWtKP9k9n7yNecDFKc+MyNN5H1?=
 =?us-ascii?Q?HBYxnRorvJAXlmhdehe6H76ZA/AjUqjQ2V7vhDsJyZf/7J5T7URSCHb5kYMh?=
 =?us-ascii?Q?+LBFW2qhomzYaOoRScNaWM0Grce5p2vCn6kabE6Ted0GOZeYaOVfOSaWe4em?=
 =?us-ascii?Q?b3o2s9YpfznZp4KEiFwaMZ9rQ9yI/6RXPe3eM5ZK0Gvf0zbEBi0bV/ETl5HZ?=
 =?us-ascii?Q?vD3KGBAJTiS9ip1+Pfs0U3aaEPgwd3NUTzdFSqIvUT/Xd3JYMp7N1+29yOks?=
 =?us-ascii?Q?vbxOSASuyuVhfrcgffqMUolkWbxFMfcMQ3fXL0RsXQ+8AXljWc7wPKbCL3aW?=
 =?us-ascii?Q?lSnqm7b5biT5T2Pos7B0vJOmFEynxUfJXWTFsScstVzZOrzktECXDALa12aD?=
 =?us-ascii?Q?4CVhRK4DwOMDWnj95LwWUnRZqKjKib9F/3Q6Nb7KdR2Shw7d2KrVnpyIKxSQ?=
 =?us-ascii?Q?ts26EiDxADXyhYEzFII8jPYp0iXaqlG/HawnviIY8yQIYuiDCb73OgreEYbU?=
 =?us-ascii?Q?VO8BHESVPUTA245E8NMkeKGyXb0Cjysn8BjIOaqqCG0+rcfSN3GxwEswmNoV?=
 =?us-ascii?Q?nHb85LiJa2kwtvqgnrYVn2tkSbmGCy+rIbZkDUUUZEu0PZrxLJewsavGFkA7?=
 =?us-ascii?Q?3sCFTmYcqg9urZ+PbYygYW20KXp6liu5xqpaTgmVTDlEQcvrOHFQQPj1lpca?=
 =?us-ascii?Q?x3UWJ9oYAVqxEoRo7+EBMCFfkfk7kOhSI6zpR8q1L6t6Fq3ZcvPowlvdzvB1?=
 =?us-ascii?Q?iTBqrAChOvYQwdHP5iawiQVLtAOzuV7SmZ13yrkihJOkbnaBgJW5SCDNsyVi?=
 =?us-ascii?Q?J7sud01oYAsgbS2/lhugZ9fKMmLjr5IOGsLff1OwIUp3xSZWs2UnG2wfvIlv?=
 =?us-ascii?Q?2Bq1yF820rIRIElmH3PvTM15urz9qq0TXr/0wIZlhbTnkZJHm1ov3+33mkSc?=
 =?us-ascii?Q?ryLMg+AsXNo/9dYOLMYHfeqcWq/oBpN0fkBdEUda47HefQbjVQDlYY6gFchB?=
 =?us-ascii?Q?By5HsW4+71YDU5ANuOkqJNFTHuejk/t6g/tfxZbS06imBcxLcnP19et1S7kb?=
 =?us-ascii?Q?FXU+FpHXcOyPsRwi2f4w9fLlaFLyUzp/aDTKBJhaQLuCf8QN1bJxf8/km+0E?=
 =?us-ascii?Q?uB7ElRA0n/rBTGDzldAKHRv9+nZVsXDWCHaRBJPCmp0braHMXr5sdizXRqnH?=
 =?us-ascii?Q?xO8ZUuYI/9lODvhkJNvZ9FUF8Bs4IEnKfzUvh8L+wjqARsxPksMHiY4FdHmg?=
 =?us-ascii?Q?0skuATxCvUq0JE+ZhvEQJ+GtX2xPXfAf5ABBTpIIhhdLrwLzUp0r4iUTa3P/?=
 =?us-ascii?Q?U5fqfO8BTjOf5RVUvaQ6jZgHvadIC3SluzbbXLlM9+EqJHfoBAiGWQn+n2EQ?=
 =?us-ascii?Q?AzuoSXy2qVGx8D/c5YwtFx9kc+gNCPwY?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 15:13:30.5472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bad22a1-d8d9-4bfa-a7c5-08dc99e05ded
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7525

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


