Return-Path: <linux-i2c+bounces-14140-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC8BC69DE2
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 15:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B7EE04F8C6D
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Nov 2025 14:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C71358D30;
	Tue, 18 Nov 2025 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bcLBloCM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010027.outbound.protection.outlook.com [52.101.193.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8C534D91F;
	Tue, 18 Nov 2025 14:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474828; cv=fail; b=Kn1Px6tMDUmBn+KRK2KCFm7qk1V+nNkZs3ChnDHdlORP21LAsZSepVb4uf55Ur8cSTC/Ci+n3+ymK1mmsxegBXnKizXrCmWYtz0hP93vbG0CpNc6lUCjhBEk/7FbF75B2u6l8XCwoIgNzVc2b/Y2QAiFkjPp4E3ywiZ/k6J+8ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474828; c=relaxed/simple;
	bh=5KviH5TX5TXDrOh1xK54HGlfQmnwlsXiGvaREQfTr4E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mirtU0MHAC9jKXeIQHMKqb7PZOUyJFsi9GxaeVs4Pliwvjt3rpxRoRdkC72EMSFIJUZfkBRmK8Q8TwYzcJ5fWkik14incPUvUcBYNhBzqVf5hWs5a1ytufBUocInlnxpNBS4eSfoz1EV5QhggLevyfb21nPbHZaZC9s6nJgj8Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bcLBloCM; arc=fail smtp.client-ip=52.101.193.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1CfsdZgdwcjJ5xnc/2oyEloPBAui/a0ZVWJCkWvdF2hvGjwuYa7QCnn/S6DM9iKY+bUW/rOcCiFRlr0NRRk46U+2Q9nb6G/b6DJ9Nd4m2XrSb+0qBmEI3+WoIeZq2SsYP5hTNidfscGwn0B8bvmQhs73ZvMLq4QBQHCn9lE6KUrGCSWooa0BQDu31xRmk3nliv4TDiIDYFw78KUbPbRHs5ylThDuolMQCDeTBGgswT5KQxMA1ToVNRccGbWJfq+CRSEn3OcF11wDKW+dY/uqG4a0HbiwLGHlw04kFdMqX6apsSYFNKuNRmrjgImtkkjUeauPF+5VqYOei8n0RXpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrkGSN8CDfa1ksEgZ4dSdggsOVy1ZCo8TYmGwqMg7w0=;
 b=EfSvBOAMJEeDde0LjIPfa6N919GZL7bdreFEiLdWDaeix5YB6RSrMm93H68Q2GJLtOm1Xmf9/sDlO4KyhVXkdJD98PpnHwCR++3s2JZjiRT7u4jEPVVUSXdrTaod+2HgrLzsO4tc20tkfhwcsJBSpM+9xSV14w7yOFx5rBadeKGIeUk2qeL4i08CbdwKfxKrCK2iCXCAY3Um7q9jLLdVYs12QVVAiDiJ8lUO+qOQwjMPMzpUu4IzcxIWy6YHajZkU9qG5UAON/srHubeEcuoLBw89fabqNgReTb1wJG+Y+DcxgihLILUiqUxNq0ChEGNxEtZ2zg12NNZgNi+iCFMXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrkGSN8CDfa1ksEgZ4dSdggsOVy1ZCo8TYmGwqMg7w0=;
 b=bcLBloCMs8IQioLRWf3CxPqrbhaKagu4IQfqTqIG4WpKKK2SqrYR/qphM9Axdzvd6N6ZkiVtTersw/9Dh4NJIELn3QyzKsyOSTX2BiQQjHqv6X9oBRfo4ZOXM7eGO/AAg4eM+APojVBq8uw0rLhZPM30C+Bls89CdWsUL2ZKxfZhTR8F+4Rhw8GqIhHycqYz6xWy42mE6uvyIHq2o+C/wi062p8Lou62iqGr4aRZfUGd/ANPsS62v1yTaS66Cbh/pW+0ecWaqAtRtBF2/OjjGbHgSAQP2sgyJIP5nSTCCiZoxE0vGHbiMt9F9MgWMPoyiZcJRSx6ySamfkml9QKU5A==
Received: from PH2PEPF0000384C.namprd17.prod.outlook.com (2603:10b6:518:1::70)
 by MW6PR12MB8958.namprd12.prod.outlook.com (2603:10b6:303:240::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 14:07:03 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2a01:111:f403:f912::2) by PH2PEPF0000384C.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 14:07:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 14:07:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 06:06:41 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 06:06:41 -0800
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 06:06:37 -0800
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>,
	<wsa+renesas@sang-engineering.com>, <wsa@kernel.org>
CC: <kkartik@nvidia.com>, <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>,
	<smangipudi@nvidia.com>
Subject: [PATCH v13 1/6] i2c: tegra: Do not configure DMA if not supported
Date: Tue, 18 Nov 2025 19:36:15 +0530
Message-ID: <20251118140620.549-2-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|MW6PR12MB8958:EE_
X-MS-Office365-Filtering-Correlation-Id: e36b7b86-1524-4830-b527-08de26abbf5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?drJE4VD3fWQBy57Iow9NuQ2lxTd0dacz0AstozyXVHBV9sM/XJqhlGszkQuz?=
 =?us-ascii?Q?6oEPZVxf4wjTykqU/grCPS8NNLUGq5baGIIFDPkGiNgYZRnmXq7DBF9Ruoix?=
 =?us-ascii?Q?bqkZMl4t0z/+gnmLISEeAf9ri5yRbFZeYQLj5+K7Mw9SOBADlC+aHUxlbE2W?=
 =?us-ascii?Q?LNJyof6pANcDORk0Qp+MCjoIcAUVzdMhZDqsRcSh3c58gp8DrIrGoXdp0v4u?=
 =?us-ascii?Q?YeGH13zG8DIzR2aTqvuxcDk61YPwtrUo1sKleI7uhmSIT9l4PI9BS2I5zuc9?=
 =?us-ascii?Q?UWOthGyqbZobk+sVEKeunbk/heNFYAgsz/ywmbkIxh9NCGQT3TWcIa1LbISq?=
 =?us-ascii?Q?5ze6/vnWt/vIvXmcRkrEieSvaiIlmZSYhpgN29Yp1rh5k9QjzP45pFV83U3r?=
 =?us-ascii?Q?bSQ8ZlWmXcVbrpnWZ38eXz5wl9yR3f0QaGde+ognMFEOMjCeUjgNQsEuXLhm?=
 =?us-ascii?Q?Csa/TEJVEoez0Esqbu/o32b2ITojBg+j0BR/0Ud/bKZ42ojU0v0kywNRhZdI?=
 =?us-ascii?Q?3o17Sbfs4qMkstNS6PDOtTJOwyrztI09pwTQuY8UnmBgj7I8dMugsmuNwkkq?=
 =?us-ascii?Q?q7zKoH8NSnT2+pyI6RIsPcVvoLuVJMVsC+VTruGQ3BylsPKaFBERL4Fw7jnV?=
 =?us-ascii?Q?dcugEPZktCwwfiEZsIsEYLoq7NOopaHaM3FulOCy+YFUMCHsEBQtEmry7U4j?=
 =?us-ascii?Q?gN2usqw0BgCB+QBb6gXkNwKYoQbe6PCFnQJ3r30187gy6xHGy6WxRz+zV65/?=
 =?us-ascii?Q?pbilg9EBCOGJhofn4R0ERw22NKhzYX6qhxa24PKxHLXnCwDsceLrtwkMJcn4?=
 =?us-ascii?Q?vuIIaKnJBJJY3ogRkjJgS2gRxhR1sAG6KXn/LRa7ycdfTc4CQj+1M3R/IwMi?=
 =?us-ascii?Q?i+N/CG060zNReVqUVuhSwP9ceecBlLtxXSwe/5IH6NNPKh8wbX63Mvhi28nX?=
 =?us-ascii?Q?Ubpx8KDkokLoXV2HmHH0yM2MBzoCMoFyarRzWRsFEZLjkIPw+aH+82+nClJr?=
 =?us-ascii?Q?4H4G5IOnA6Xfhm5HubUJ1rvdCS7dOmbRgdmmZtnNyDDGXhm8V7yadBqWJyXv?=
 =?us-ascii?Q?8O0uV000BWSIQTnEQQEk7mEa//e9T5DOetrGegN0M6IF+lAfkn4sT6MeNSxm?=
 =?us-ascii?Q?RqYYQEN4By0KxHV0rKgbCQEnXp4TMs+LKeRUp6ByouW0ohChQBElwldICajR?=
 =?us-ascii?Q?//E5r9nro7L+j7uOHkd2IPpntTBjDRwEKlGKzKSe8/fmRI4orMNneKTp+su0?=
 =?us-ascii?Q?ykeAVmv9jBKjFrrxtKa169aVCTuoEKr0/GYPbM6kg2RwSeGHG+MH+qA/Ksqd?=
 =?us-ascii?Q?1LCFG/v+lfPrFhNddvmn51V/43j2iljxGvxonnxwzqjH7qllM3j4+RJHQ9mR?=
 =?us-ascii?Q?Cd6pjCWfrsaoWZOwSQWiWDv7McKzc9DJJq5yAFhZfj/xmTrvegKg0PBrrXlb?=
 =?us-ascii?Q?4ysYQF4MpqDIpzzngXO9k9id8WLZKF94ykEd1HobUPWe91w4xjCXSfVok1qJ?=
 =?us-ascii?Q?N7S7kX/KB65Qf1E7GAlwoe1Hte1EuR4PU5EAC7hKuaf3JgU6qNSEwwCmJ/5k?=
 =?us-ascii?Q?Hb0P2w3J59tTtHHYQak=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 14:07:02.3777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e36b7b86-1524-4830-b527-08de26abbf5a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8958

From: Kartik Rajput <kkartik@nvidia.com>

On Tegra264, not all I2C controllers have the necessary interface to
GPC DMA, this causes failures when function tegra_i2c_init_dma()
is called.

Ensure that "dmas" device-tree property is present before initializing
DMA in function tegra_i2c_init_dma().

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
v4 -> v9:
        * Moved the condition down to have all dma checks together.
v2 -> v4:
        * Add debug print if DMA is not supported by the I2C controller.
v1 -> v2:
        * Update commit message to clarify that some I2C controllers may
          not have the necessary interface to GPC DMA.
---
 drivers/i2c/busses/i2c-tegra.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e533460bccc3..bd26b232ffb3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -449,6 +449,11 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		return 0;
 
+	if (!of_property_present(i2c_dev->dev->of_node, "dmas")) {
+		dev_dbg(i2c_dev->dev, "DMA not available, falling back to PIO\n");
+		return 0;
+	}
+
 	if (i2c_dev->hw->has_apb_dma) {
 		if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)) {
 			dev_dbg(i2c_dev->dev, "APB DMA support not enabled\n");
-- 
2.50.1


