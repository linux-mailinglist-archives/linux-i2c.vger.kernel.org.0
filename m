Return-Path: <linux-i2c+bounces-12097-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12438B16E3C
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Jul 2025 11:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 354AA1C2057A
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Jul 2025 09:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0522BE058;
	Thu, 31 Jul 2025 09:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZBsZBEHX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31B829E0EF;
	Thu, 31 Jul 2025 09:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753953131; cv=fail; b=VqEnN+aU75LkXktB5fRLj4z3sBK6j3AjzaWpFZ/VH8uMrMhsJvbWdNN4Gxz6p5VwyCRpwUOGzheMBH+rK65vLNBLPmiwGTXxEH9Crvq9QjefcebLt6LGxcKw3DY2jK/YyPLxwTXH1Yd/Ag689rP1vC5BNnJ/gXz1Eig6nWYHbQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753953131; c=relaxed/simple;
	bh=Fk+whfaPs4hQsyPTCjr3QzRH7YiQdPu4pWylXLK0S9s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JrKQWB8dY+LolqBEDjOJwFKBtf8Fno0d4m7f1qxPY2/qaCaRffv+H91aJ3Kh8Mve6ZwD0ysim+3H9a/QlM06p+etimUE0srL6ALv9QEonnTZKDPbY9w0bSOlh727VogEE7CQC1CVDL/8gMy85kWjUq0rwNT+SKT8QiJriDTlxgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZBsZBEHX; arc=fail smtp.client-ip=40.107.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8BAq229xKqHS2085uZZa2WUWWQlFKdUcr3uFP5Mm56aInzNww/0liDSDvHCVO65t79KJDt/iwuC9FfFHKPSUENtlymII46sdWrz6YS9VIrVyHl5JPcl1umy65b+ysxBEQHl1t9zQpo/yUldxS5hkWOv2OiscZ885dceIQFk3eocw5rwKYDvv6nSsj+bgtbjwTS+WMpTpzDdmYVbwDcE3GfRNcKMAnV3/DEmnXtrnIqtHzkDKUoCLGfuCV2gLLGgxay399W9FEhY56NCZ3ipNGdZCMkVPkxgTi986KZN96Mga4/Dx5kEwArNO81vnmF8G0RUbiDURoM54s4nnNN6WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oP/B4HZ9AH3NLpOAulK7tSrurHiwc92X7eW2TIUVWTs=;
 b=q/WhpD3e1nGSBkh2KAcssrZnTxezeKxViKUWKrmnEVxj3qcggBPmAWvfIILV3K6FhcJNJvXfwIQxDHa54kX4aaz2xR6GO9PCOtir96hJlb/XloxNpsFYyNxm19rPhXQ6bz59jvnqo3hLpVvxpw0C7K+0lh9oGTAEuueeH5P3aaOp/EMFbNFY3wIXB5H/dgCmucFDzVWGILMSwbNpxKRYp6WLpmnLJolXD+TSPUyWbuYj+ze/5Pk+lrWjI5PJCjMgFmsHoijGLdiqfdzrRp+7BP6GDT2g1j4y7YYSeOMHQL1RIPjzYMyYQ+yqEcbj1LL7aSh8zwo1jtdN8X64KpUXfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oP/B4HZ9AH3NLpOAulK7tSrurHiwc92X7eW2TIUVWTs=;
 b=ZBsZBEHXzLp5GD4D/7Lq54MxR1tvAZB6tUVXXHEGP41kcEKqfhztOWrLhd6TIhFcysLLZ4iER/unwrd951FzAVC0PQcxp2NuFVBrhgXP1s5MXxuebHjLw9nLH28VeggSMBa/KCSqqSEYllmxhz14+gcgCIYarOowrqIFuUPtOepzSGzr2uk2fIxAdNrnG3rrT0uGeCbVZNW8L/A4LBBQ5zkcDAXh72dhuQgkftUX3iPivzgUarUiZyOwkyZnmU07D/AHxc0fPI+PIwGFUBGtAgeaBzAOgQ1DesS8qDpoCUMCHvVoPA8u1kpJR577K6aFCTQDVKB8hd7wOPx2k1JsFg==
Received: from BYAPR05CA0087.namprd05.prod.outlook.com (2603:10b6:a03:e0::28)
 by LV3PR12MB9266.namprd12.prod.outlook.com (2603:10b6:408:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Thu, 31 Jul
 2025 09:12:05 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:e0:cafe::5) by BYAPR05CA0087.outlook.office365.com
 (2603:10b6:a03:e0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Thu,
 31 Jul 2025 09:12:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.0 via Frontend Transport; Thu, 31 Jul 2025 09:12:05 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 31 Jul
 2025 02:11:49 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 31 Jul 2025 02:11:48 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 31 Jul 2025 02:11:45 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<krzk+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<thierry.reding@gmail.com>
CC: <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>, <robh@kernel.org>
Subject: [PATCH 1/2] dt-bindings: i2c: nvidia,tegra20-i2c: Add Tegra256 I2C compatible
Date: Thu, 31 Jul 2025 14:41:21 +0530
Message-ID: <20250731091122.53921-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731091122.53921-1-akhilrajeev@nvidia.com>
References: <20250731091122.53921-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|LV3PR12MB9266:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a22e6d6-c701-468d-6ab4-08ddd0125199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aC4VtTuqHo8BsGlXeS1pcGVDcvr+OFLCdg8TCaUNFhf9qfu4/9ZEOZh+RkUD?=
 =?us-ascii?Q?cVMHMOkbzpf+ML712+iLDn7RJpjBhdHv3pzKHNIYLk2gcUXKpTb3+qGFh3U3?=
 =?us-ascii?Q?RXKchDxtWzqZaRwRITE3ULpTGAUi+hceuAvkYiJY/VVhA9XCiUwEJwJVxneg?=
 =?us-ascii?Q?EmS28doZD+Op359V9IfiHJVj43BhYc5ull78jZ9TR4s/SMM1D2NpMyMBOBRm?=
 =?us-ascii?Q?Oh4+u7kU2GJh8tS11lWWK422QFcPKFedF66gDIEJrPbZ4qhoMWw7wD7q7Qs7?=
 =?us-ascii?Q?z1HnXs5ObFgyiy36QQbQht3xVY1EH5ps1l15smyYsMdZK1rwjSTI1dbXo1d/?=
 =?us-ascii?Q?xkhL0mInt4trMTjTallqcUPZxOI0c42H2qQbK3ZGEhfLBx5wFkffJvqmRSZu?=
 =?us-ascii?Q?POE7cc5b1m9arKc7PldqlOJEOK1sPr3ZVVwXZ4Ya5XZ7AkwrUYEY1coqDXUa?=
 =?us-ascii?Q?cJaW8anXhxyj2aIPLCWxm5Oqy5jMfp/ycvHghGWAg8RAVM7GSFOTbLgvk3fF?=
 =?us-ascii?Q?ByyCkoiseWFSxVuiRJXeL9VDdkw4hsEvBC4zJ2stpySs/stngDYH7rlvWNMB?=
 =?us-ascii?Q?Ywpnjm2jl8oEwohVNNhwrmKI5l3DqKwuOHADZfTbMKxpuhl9WE+T4VTw0faf?=
 =?us-ascii?Q?d26z83EyZGeCOdN1qV7vjvJIx9elgmOeMKfqSqwIcZg9bYcz6AMQMRbN9cux?=
 =?us-ascii?Q?gvp518pIPvcRCiq2zwOWM3vi1vwVZWCOpzv8q1/cf5JAq8iTgsEoQswOduB9?=
 =?us-ascii?Q?49tycTWaUUMtR+i3HH3Qj+oFEwJblLhjBWSJO9cTpK0wz+kxmaUD/GjRS1K4?=
 =?us-ascii?Q?4IYtMyO2Vv5F8dEDXNxgdHnKNpCC2HfEgh0TuqUqtqCg6JhtUVzmmfTl0cck?=
 =?us-ascii?Q?hMPXVEDwJ1chzoaPI5eRKl/yph/7sh18UjF7tVxTzg7XW1bBcUI+V03yxrqF?=
 =?us-ascii?Q?cWQi2m8sc4XodkkEJmHcjY8QB44mweqUTh/oRwF3gBGBsTziWLZGt4Xvenn4?=
 =?us-ascii?Q?cIKjUAChWWg28JT5TZH164zKINweU5qX5Ab12CYacw4CG1MywhtncY88NE19?=
 =?us-ascii?Q?ONdLSuMpbfPQfBc4m/Dn/+onk+olik+81P+th8qL7iGyo0Juw7pkqh9NxQc1?=
 =?us-ascii?Q?+VIVWywYKUdJeDAy8bIAzWnLStGhPr1ysC6vd2EU/CWSe0Q/62fWhSJ679lU?=
 =?us-ascii?Q?BRlciJZIzRUpYjPkZkfjdQBsBYBUYCaAV2EbxJpT09+tZflZdtXbcEQXxNOD?=
 =?us-ascii?Q?lA3DK0oMEcGuwZDp/hM5oDR8gThA22YjI+XbUPwGq3RzPdf3Pc9BaClcBjMv?=
 =?us-ascii?Q?36YqWkjh8+5Xbbqn2jyEKNrueX04cdzcLPmxa7oREUJmQbmSm9LdTrJB+gXH?=
 =?us-ascii?Q?g4o6vyXMmVWFYXivHyX+ufFR87sObBT4cIPJrJCN/vZ85iUuigppsISpalQi?=
 =?us-ascii?Q?ujd+mY/2IYOeqmb6hMCI5fcpBEJXBkPFl/bMjsT8yexRm68vKqfoBVu0hg+F?=
 =?us-ascii?Q?HbRJgM2QC4KAfKNlGt5fNTyBhYPRbKbLk0tfhvvO5irdG3lLm63SoSmuNQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 09:12:05.3221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a22e6d6-c701-468d-6ab4-08ddd0125199
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9266

Add compatible for Tegra256 I2C controllers. Tegra256 consists of
8 generic Tegra I2C controllers similar to previous generations.
The parent clock frequency is different in these controllers and
hence the timing parameter values are different from the previous
ones.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index 6b6f6762d122..6f58eb79a7b3 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -80,6 +80,11 @@ properties:
           support for 64 KiB transactions whereas earlier chips supported no
           more than 4 KiB per transactions.
         const: nvidia,tegra194-i2c
+      - description: |
+          Tegra256 has 8 generic I2C controllers. The controllers are similar to
+          the previous generations, but have a different parent clock and hence
+          the timing parameters are configured differently.
+        const: nvidia,tegra256-i2c
 
   reg:
     maxItems: 1
@@ -186,6 +191,7 @@ allOf:
             contains:
               enum:
                 - nvidia,tegra194-i2c
+                - nvidia,tegra256-i2c
     then:
       required:
         - resets
-- 
2.50.1


