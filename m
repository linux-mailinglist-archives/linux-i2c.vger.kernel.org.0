Return-Path: <linux-i2c+bounces-14048-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A071C4C9DF
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 10:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C5154F37DD
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 09:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1028E2EDD72;
	Tue, 11 Nov 2025 09:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rYlYIxVo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011028.outbound.protection.outlook.com [40.107.208.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D702ECEBC;
	Tue, 11 Nov 2025 09:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852622; cv=fail; b=Sb4FnSk9AdO3a5qjMhQYm1xAHlbH8B7aGKRUe780qgJ4ibWl9WGYOt/+3XWRQ47sbkoNzzFc1cAxNXYmXk85F+eawkUIa7Vf1/9DWZ3w07Q+qJaWKyigyIUEJ/37nm2X3385ENWgoj4ZHCmX7mR1yP48X1ue61FOseJF8izXO5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852622; c=relaxed/simple;
	bh=W2u2FTt5kpJi7Ggx2nLMJo2EkNuTyVNgip6i1vzaOpA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f5PcWOU1tWwZCQyIAU7Rdgen5ai1cy4grBtINmek8hB3Q1SsLyctzy0UBHmCIeo8E/vkFg//6BQmv/woZc9nUfunbpmpWHbdWVXyeWGc3+AlwZfW5XaZKadzfJyDvYUwZ0Up298ACz3jQtudTMGXQ5Xc6orwfcZEIWp9FTLvhsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rYlYIxVo; arc=fail smtp.client-ip=40.107.208.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVjuPAmsDX47ViQBXHCaP7SPavvJ00NgAa9f3L4he7FUHYr5SJNuHmzlWjOWqI/RdaixIkP053GJmKI4isJwHg4itmA1vHdLZooZjAM8s07u+xbPQ7u3Bv7VO5cAsBdMaNtZ4CIVsJ0a+zLt2Vu9FNGg1gSxKEfHI3kU2tOzUMGv/mn0oMPyE1r8PcxZCEzXs3yyMZT2Cee12I6hMvu5vCK+nfT6hdg+v3BjhS5Dj5/CKFncwtg4Q/JWUwtKLhBccV9q6YdUUf/upIfFK74RTeEWcsyd0On9ycy2IbF1tZLC/iSM+Mqk+ePolqn6cLAWt/2st4TYMfTxHE0sqSPiqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s31VzoUjmtA4xZqMnpcshxOy3IOw3lgbSHUgF84cghI=;
 b=U8QNkcTVevp+/k+LFLwXfv1mHcLx+K0P1/7KNxfbZAFqzjF3B8niogXJeYYaQNf/blt6t0sDyh8+KZ9vYG5yF9zaRVU7A6AzTlPRgb8IvGSy1dqHdoHzmtCwRbeJkWNUnm1tBgWGcKwn7crWa+rJGuDaIrL+Jy+5vzdo1W5ztV+WR+qsIEMC6iU39cabT20CMkL5gO2PczuehjbQbIYUxefUAgwqWu/da55Szr9xSKtrXvgsyf/CuAbsvJNEf2vdx3WzwtghXIiY+/Mz94aAK2QjxDNs/JCoj4ghDecmW7lSsdeW8L0l+cKRSKIRa7WjzpVa8cURMTgCXHStCPbu/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s31VzoUjmtA4xZqMnpcshxOy3IOw3lgbSHUgF84cghI=;
 b=rYlYIxVo/PU2mZ4RKJ5Q0GHoJ/sdJmIa5Yzp+kCPWEa2l2GF9p6kYSM6HRtEewHNhDkm7VaHeFw3g7P7WxfW3eUov20Tff7ARNJkZyYQDkBjPuCZKuOXmeTfLlxYmpaF6sxiVhvkgo4GQBVVC+vxxvMKQdRHVQAQXudy+q5mnS2ckUSkQiBmzoKJxCytSTa31+Xc+cQcpdTY3wOPX/jOSS48G31ePjbiYMb7sqDsA/g3aGWg43oayoG16Z4aAFX9M4zXSVuhi2UTlJUjoOqd+Im6Ps9aNyH01HjDQTpUaOj8YAl1CpkHOXxraUBM4wASmZnc45/SZ9sWCw2qDzUeug==
Received: from MW4PR03CA0130.namprd03.prod.outlook.com (2603:10b6:303:8c::15)
 by CH2PR12MB4294.namprd12.prod.outlook.com (2603:10b6:610:a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 09:16:54 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:303:8c:cafe::78) by MW4PR03CA0130.outlook.office365.com
 (2603:10b6:303:8c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 09:16:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 09:16:54 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 01:16:39 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 11 Nov
 2025 01:16:38 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 11 Nov 2025 01:16:34 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v11 1/4] i2c: tegra: Do not configure DMA if not supported
Date: Tue, 11 Nov 2025 14:46:24 +0530
Message-ID: <20251111091627.870613-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111091627.870613-1-kkartik@nvidia.com>
References: <20251111091627.870613-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|CH2PR12MB4294:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3d99b4-79c9-4617-603e-08de21030e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7qfeZBpzQ2ysd6AVEuUNnLItx0c4Dnq3qsZROvEII8IWIx76aqBvdExUVXOe?=
 =?us-ascii?Q?sU9LgKCMw9nu/E0327USr5jVtqSjQlGMw9HOAtCmZD/BRHSTZJ4E37/36g1R?=
 =?us-ascii?Q?IUSufWeFFppwgB0bSxQbtewZiiOCzSmKe0GfivTFuqvwu7kMLzO/kBXwSoT8?=
 =?us-ascii?Q?sscsJ8XtLqLkff3O491gOTccnXS6EaDhxvyd25fvQr7lEtHkN06IzQBfXcPf?=
 =?us-ascii?Q?4hzokjyRyXvMT2gv7k4KOX2OHCXxpAprQv7UoAqUwVdxvg2J4iF7BsXsnN41?=
 =?us-ascii?Q?z3bNh/FALDQhGhm0p/pY1V42MaQ5xhj6avrUTHdT1tk+HRphPrd7SCsL/gUJ?=
 =?us-ascii?Q?emf3ML3KQXsrNyr3YCH/cZgSYSPoeKUOuq03Y9MY9n5g0QfdH4RurUVeBJ5x?=
 =?us-ascii?Q?7vUm3LJeKNmOWg8CBQYq+H7XxogxuWBnVBW0W5PJ4jigKKcrYcrEoWCAUoXS?=
 =?us-ascii?Q?NsfvLSKba2jeiAtLcJ7B9P0E5K+QiagayUq/+NOEJNlD9H8tD4OGpHgprNur?=
 =?us-ascii?Q?bxnJSHZQayf2IyVzBAB2a8cMLgB/jBkuD8HoEdlN8OKAwk62zGyWcXkz7ee4?=
 =?us-ascii?Q?p5nrxPCvq9WB+N/Vb5XQWq3QITSvK5XI4nZzhXLgwK6/a+qxMP43AD84KeSV?=
 =?us-ascii?Q?/F/Sbr3KbFWJ93sN7qN0h+XqUmHwM6VnmQXN0kIZN7KsdH8TAJdw6yU0vdtK?=
 =?us-ascii?Q?5CLqTIr0pYlwiwooJwhOSzHWhNq6J6b89lUrmdiAICQQJcT2MMStGt3qmdlO?=
 =?us-ascii?Q?IAxz3YfW6wSJ944QJq1e3TvLZDVsUFCllQsDgbEJ8O6YWG4tIdfN3LP2DuW3?=
 =?us-ascii?Q?sUe+9cSEOTEOGuG3/7kEljZV4wLI2VqQvnOyyYSa48Dagad2RyaoqUGnMawZ?=
 =?us-ascii?Q?BMRfL5ypkQ9yMswFJQP5fYdkqL+FOZCGekHo5XUWITwzBigEo5bl5I9KWKeh?=
 =?us-ascii?Q?4Gk4pdKBRQ4g+YXOHytD9yPmK0B350R1S7eR6Oue4aPo33qUkF2AnkmSPy1X?=
 =?us-ascii?Q?3882yvVR9IrnDcS+HiSwsYeEKqLbV6S92V5YNnSrOp5jBNd1tUAWhbdJydJB?=
 =?us-ascii?Q?gmjgixUNl/mrz40qoM1d3emKpkgloT2mTqR+LMvrBYQPeNJKCInXeMJKAALs?=
 =?us-ascii?Q?W/HEff//FSk8nRa81UqbWmQ0KvCsytR9e1IocQFbaQKKmuaCsgElIJ1AmK9Y?=
 =?us-ascii?Q?BKRhvX8qnap/AaoGPR7BknOsaFMKalCwePkEaELMMHNCeNJHdjXNSwJ1FIz/?=
 =?us-ascii?Q?7hNF3WXhSKCxX7k/MF65v6kACYGJemKbqfHnCzYAFXycmWlBGaYEywZD6zjy?=
 =?us-ascii?Q?bMFlrVU0meFHYEpRvO+uGlkz6z4NUmzw/0m1w4qaDOBkCJNJvokB02LStkqI?=
 =?us-ascii?Q?UzST0ax4sCh3lkzROi7DPazlQcvyCOVTRpcKBU4vl0A7XoAY9HHcf2AnpLG5?=
 =?us-ascii?Q?CEmWo8TzVGjQznHouY+SNkOV5xHirCz0KfoFn1zUfEJefQDTQNb8AkmVVIQV?=
 =?us-ascii?Q?LdDheLtoQuj2qk/cD3TOO3+OHFEcbcliF5BXRVmK05c77KNRgVPJOhOJqYCj?=
 =?us-ascii?Q?0YBS6yrZp6TwBIwLnLZCYKWFmLOCscXA3a5SlOs3?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 09:16:54.0145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3d99b4-79c9-4617-603e-08de21030e3a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4294

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
2.43.0


