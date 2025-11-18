Return-Path: <linux-i2c+bounces-14145-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7B4C69E13
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 15:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B26054F7540
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 14:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B92335BDC4;
	Tue, 18 Nov 2025 14:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VTabbOaC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011058.outbound.protection.outlook.com [40.107.208.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B53F35A943;
	Tue, 18 Nov 2025 14:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474880; cv=fail; b=polavNv7+CxvuowskPUaV71uFXv9AWa3oEUHk4/f0y5ol7xlTkVrDCgAJ4SCL8eGGCoAr/ke4A9Xt5BIW3MnuHD2QI3mLOxg30vdgThJZMC4mlZ5+t3z6rya3+nqQoGRm6+mBID9K5u/A+D+PUEC74TUDvRvNtO+qiCJ/oHlkfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474880; c=relaxed/simple;
	bh=jF6iFangv8G8VyLVQql5nEHz4n316Id/0Fft0BD/66E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nqf8CwkqeUukXUbza/vBdGbCQkjSg81E5SJfFei1hGT0iIKMU0uVA0CSqqjNXfq/5BoYzb7Jq1bRqca/yO17mfyXAcunw4Zq/2yLNSZA3hseK63MfPvmcYKJATQjK59opLMTNLULyYhL0kaOzzux5ou+eudlGvmnLzKz0IufjZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VTabbOaC; arc=fail smtp.client-ip=40.107.208.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeASzysxk9OUxauzgf6RIElvIvB3S8smNEfr158MjaC/N4phhxdl1cbsKEgAnaGRSaGVEh0euNfJ3N1lGOrUP4S+deok2nBz4mNRdi2Zud+wzUGSrFlR4h+IHvWaxJlqOKxNzpd1nuJhb8vysiHmlqC7JOZhfE0STPogZq+45JOgcBXTf0WMU0X3N+CsHDE6fEOsTiwDxMG06iIgEl/8eyZmnTFhnsbp5PqU0CUr33KfTGNZW2+putag6Ne7muswdHViDqHCN4czAGRMahnIGPzoBkyB5Fcn4ELbzlx8ncKJgsyjENE9IPDILz8lmrNCR9Wo8/t/YxZz1ZcG29Yoyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jixEFeJSSx9hJDAdaTFKvCuIvaBIj0p3fYnyDFAG0s0=;
 b=bjTeF7zTr58+YXF4/p3+YpccqetxqVgYaF1B08qpCb99WWxInEty71V8KvG2yWrRDzWeaug+l1g1E5Bps6chfRuSZo0r0uEKLa9a6CiTSQOvnyirKXuiMRR1fXj4MndKXgGfB/P2DDwdjyARifRnHJ1wiGg9+X/QDC57Xw3MLg/fUMKNbH5Cv0/ihEVqLKV9wLBTmwXnbp5leBXN7dofQP38WegrHENVArthyetjRMNu3oIpWATocVepfkc0+bzWcOXy6Qg3roJapNANHavIKJSHFbgzvyBLvvpAQpy8gYd/9XWkzfwSlMfUcoYqaOduENIsS8xYDni4nUYzhLLEUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jixEFeJSSx9hJDAdaTFKvCuIvaBIj0p3fYnyDFAG0s0=;
 b=VTabbOaCF+FvnaXkuJWlhMnCBEL45mK/4gHxXawWdGyIut2Bk27KOjDgmcuCNAXYsaglj03rsn3IsGGb2b81qPbJfX1rJGsUbawkCbArSxJE81dcnVoDktwm3R2te4PVuIaGRI46TdnaNRZalo9212oNQ0kYTumXyAL7Jsdrrzzkapq9cZ4vQiMG5mCxxTuvzQalcX0ta3uRPJU4o2VkRrmHdtzyQ7wiwAlIssedOalJJnPLcR82r8cVJgG5W5NRATyeniTyVsToZiG3MOTC9lRpowEqY4W5ue02B59pQhbkRsyQ/SzfWsf5Rt6MJZ3qQXFICIvaAnyfglpHwho4DA==
Received: from BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::12)
 by IA1PR12MB8079.namprd12.prod.outlook.com (2603:10b6:208:3fb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 14:07:54 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::7e) by BY1P220CA0025.outlook.office365.com
 (2603:10b6:a03:5c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 14:07:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 14:07:53 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 06:07:36 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 06:07:36 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 06:07:32 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
	<wsa+renesas@sang-engineering.com>, <wsa@kernel.org>
CC: <kkartik@nvidia.com>, <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>,
	<smangipudi@nvidia.com>
Subject: [PATCH v13 6/6] i2c: tegra: Add Tegra264 support
Date: Tue, 18 Nov 2025 19:36:20 +0530
Message-ID: <20251118140620.549-7-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251118140620.549-1-akhilrajeev@nvidia.com>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|IA1PR12MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c1ba48-5eac-4215-d9bf-08de26abddfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?33n0FFVpd3hsI3AVFY+cZuQFjZa9ZUIAh4vPwg+gC87+vJqWlbLeCNZeFwTk?=
 =?us-ascii?Q?h2u4eZg++cs1VKgJJU8R1h/vr8iyBn5JcNTnS/Pu70Q59I0kehQGoFWyiB+/?=
 =?us-ascii?Q?PAtMQGlVx2Fg1ep9gXyBveXFAzu9HlnvRAHGVufxYtkHFoUj8wtq56HGa4/S?=
 =?us-ascii?Q?sXM3XwJstJuthbRDDJ2GBI09DUpMKVLv8EICCzqfbX6/j98+tYJErNS/Q7+f?=
 =?us-ascii?Q?peCHQSgZ4XeEiNOILpykRqoYgcWTpSCkHMi+WeDo5jfTe8fqyI5P2ozd6hnv?=
 =?us-ascii?Q?b57OAkRTTpeSu3vIGzrBXYdAgFIP7g0HnRj9FuT86wv48hdYgcJj4+XSmaxQ?=
 =?us-ascii?Q?MKbAZqlrJ9sDI6jLcKzgoEWXhng+F1QrXZTAZMcRYaOV4BMEmQGob/D+p9SY?=
 =?us-ascii?Q?K60Hjrm39nQwKqa//cyzJXGhTaf+pKSdg3nGbpkFcmuHbDubH4uQpda4I+yW?=
 =?us-ascii?Q?mqrRpY5jj4+zOlxd/wsYcX2HlzOgN1N2Nk+u+6+pUbMI3GfZiSzgr09Q/MDl?=
 =?us-ascii?Q?9lr67hq/SQbCMhcYdJjLLGrHEsJTioCE6LrDT4jziasHJxrXqHMcv3IjPY+k?=
 =?us-ascii?Q?vWhNOl0spVEQvDYxjVBh/IcpfCVp1QqGI3fFEC/TGj2wTV1G/+k7px6TAxU6?=
 =?us-ascii?Q?0KnycMZx3tREAwKsJ9S6Dp3QXaEXk1gHc1xuzDn8jjCQD/FvaPWSHty40K9B?=
 =?us-ascii?Q?GuecAcbv79yMIZIgfvAA5sCY/BTi27CcUjBjH8wYVK6cnM1sQ5W5qqaTA4nK?=
 =?us-ascii?Q?uaB/0R9ilPsmaWjTfsRCCENXqqz97YgJ3JH9+wqhdqtG3TdlRYOls9/8V3FT?=
 =?us-ascii?Q?eXFlzcMUOJmDrawKZWFhyoKiVmrdna4klesZ2ntf+rCUPhI6wFJcSLkpc7kG?=
 =?us-ascii?Q?MDArLfyjnOWBEsbCIAXPjvoTIyq4aQhQl5ekfxV1mpChlWrSfGWFatr/B9lD?=
 =?us-ascii?Q?1vxTzv5xOzdmtSRZBm1FDYvPuDsmzTxbgkmjTUruogdgqqi5J2E7JqfgejqX?=
 =?us-ascii?Q?WNXZgbdYkGvRf5JvngILoP8mrMIOO/Li//jQGvQU4YhhJK7SskMSjcd2TeoB?=
 =?us-ascii?Q?8hhFMeWZSJ7hISleMopSBi61yYI4tWaJeWc3VhY+6gSPZyl/7K1NCccnAyUz?=
 =?us-ascii?Q?b6nAoET7+FOxPLvgWu/4PdWgyMO9Sk8A168wUHmvHVuBkr6L2cWyJvsOy+Vw?=
 =?us-ascii?Q?yxtu7EIRqsUgS1PxvxiGyuobMfEdPdXvYQKxFvDTYotCBfDVzCBbe+eWpfSY?=
 =?us-ascii?Q?q21/2w6gPjADQVv2qfxhm8sv9hQIU/bBl2ctGtgnXmRQ00AqDGkMtn/xXVHv?=
 =?us-ascii?Q?KiFx0TSuOa6AK2SSLEIs05YKZppI35zKxfnS1nJDemyflPG/mpJqv7ubsPGW?=
 =?us-ascii?Q?M9nvS5vIQBCP1rM9qdjsTsiXVZ3qhdtsg2gfcDRZhwIjRG3GfAbdERCydPue?=
 =?us-ascii?Q?Lj8G+hcYTkt0n7BQ63M/7tB2ECCnSvRgzqrwWhAZDtEl5v6puwKnRdE75gZt?=
 =?us-ascii?Q?DhhqfGZIznDA0crvi8wFVk5K+BuI+f9unKhvNiyrkfR9qom8xnw9+F1S9y5v?=
 =?us-ascii?Q?vV5KJGaVd2wED18doI4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:07:53.7473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c1ba48-5eac-4215-d9bf-08de26abddfb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8079

Add support for Tegra264 SoC which supports 17 generic I2C controllers,
two of which are in the AON (always-on) partition of the SoC. In
addition to the features supported by Tegra194 it also supports a
SW mutex register to allow sharing the same I2C instance across
multiple firmware.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
v4 -> v10:
        * Set has_mst_reset = true for Tegra264.
v1 -> v4:
        * Update commit message to mention the SW mutex feature
          available on Tegra264.
---
 drivers/i2c/busses/i2c-tegra.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 51af857d44d6..0638ccdef313 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1853,7 +1853,40 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_mutex = true,
 };
 
+static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
+	.has_continue_xfer_support = true,
+	.has_per_pkt_xfer_complete_irq = true,
+	.clk_divisor_hs_mode = 1,
+	.clk_divisor_std_mode = 0x1d,
+	.clk_divisor_fast_mode = 0x15,
+	.clk_divisor_fast_plus_mode = 0x8,
+	.has_config_load_reg = true,
+	.has_multi_master_mode = true,
+	.has_slcg_override_reg = true,
+	.has_mst_fifo = true,
+	.has_mst_reset = true,
+	.quirks = &tegra194_i2c_quirks,
+	.supports_bus_clear = true,
+	.has_apb_dma = false,
+	.tlow_std_mode = 0x8,
+	.thigh_std_mode = 0x7,
+	.tlow_fast_mode = 0x2,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x2,
+	.thigh_fastplus_mode = 0x2,
+	.tlow_hs_mode = 0x4,
+	.thigh_hs_mode = 0x2,
+	.setup_hold_time_std_mode = 0x08080808,
+	.setup_hold_time_fast_mode = 0x02020202,
+	.setup_hold_time_fastplus_mode = 0x02020202,
+	.setup_hold_time_hs_mode = 0x090909,
+	.has_interface_timing_reg = true,
+	.enable_hs_mode_support = true,
+	.has_mutex = true,
+};
+
 static const struct of_device_id tegra_i2c_of_match[] = {
+	{ .compatible = "nvidia,tegra264-i2c", .data = &tegra264_i2c_hw, },
 	{ .compatible = "nvidia,tegra256-i2c", .data = &tegra256_i2c_hw, },
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
-- 
2.50.1


