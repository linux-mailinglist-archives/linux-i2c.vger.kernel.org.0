Return-Path: <linux-i2c+bounces-9233-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC24A2306C
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 15:35:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1478E3A2BF7
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2025 14:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F111E9B19;
	Thu, 30 Jan 2025 14:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NYgg+w4J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048177482;
	Thu, 30 Jan 2025 14:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247713; cv=fail; b=eVcD22oH450M8kTtRWh0UuJ1hWEpgZVSj+fu+F2U+2eikCBzp+Naowje8xM80GPplw60wggHDWTEhT/AMy9YQ43le3vEIaYKdL1mr/mkZHdIcxQBNC9LCHlIAcOTUM9nar9SLJCWjPQGAReNd8aYJiemvi5dm/tMjjWxtdkhySQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247713; c=relaxed/simple;
	bh=jr0nZOObukCUQuVIiWqo147CeEWh/SZ18sZEB7s0Dng=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uzOMI1FJQW0L2xgYZJ9EKRs2Ftm2SevhrStH0J3/r/1Azm5SxP1TtJldLhDEV1yKBkCHsLr/kUW7bhviMm9kiAnyanXrDC2vsewn/ci1PQXOJo8m3qi10WKl+SKQOko7VYBiayq21IBwzS+RhWkcNm0Bnkc1XI0esQo0SVbYVDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NYgg+w4J; arc=fail smtp.client-ip=40.107.237.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTavaBqKIGRP0NNd7QMSNLkHIsBG9h0pTDGs69KBkoREi7m++2FbaQNe8crU3565+x2n1/S2mB3NKc3nI9MRrr7paeGUIrUXRw5gKOwqsXfYXjNHHp8Wi0bTuBkE+U7TGdManyHgPwbu5JNNIzr+2fDwFyk7xSQcqQVOw34gNTsFMlbh1ZLhnhtI/pawO8lgzxZCZMfRsVAXlqBoPCQCfsR2ALe6H0hqTy3KIe4AYoc0C8EcYnKkT51XugNZC6ib+kGa+tIg6g2LWQzbsBzURtPKnyQU8iRMoZxtZ7+zE1uO2k/Njdbvrf3oqa2K81lKWn9zFjOdzMeehSJ2u+BkQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5Zshra1zXgQq0oAMPdQjb/o41l1LvLyH+oAxgTZfS8=;
 b=wGfOxIT/dIpydvid/ZHcztuFUmu6A9eI8zzc4aGlMYPO4fG/Le+h0Hltz3ZffupV5eJkDRwnFixZ6enmNw4ULoKsUjTXtXO0m8+r2T6+l3DCTcpm6XxlIFDCWL5FsQ7V7zyXzPl0kTZHay6KHW/P6RtD4vqRxAYw66tWjY1HrLH8kmtNhkGY8io3iTUkZtvB/nnbVtOQBf9vmZZrepxVFgKQkBebul3jeahMzAPZMqbgY+iNYab8p/nkjE5/+mW7WgsVkuI/fBnFfZs3NqHOP1NBxdAj9ldZs80DCRQDP+edJBHP0JCqFe3iTjI7f89xivpz1cgljeBrcJQLTJ0oMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H5Zshra1zXgQq0oAMPdQjb/o41l1LvLyH+oAxgTZfS8=;
 b=NYgg+w4JlskSC+Emp/Uaq/xP+3jg5puwN0ZZMVyOizWsHeY5VuUU0CX73jNQhRVc1CLR3zMeTDzZTFadLW6xy9Si3N3aLZGprJ2utiLzXJNb336t+6/xtaGR9+BoMFA9ZIUMwErOM4t/tEMLJPfb66ESZsif7tom0TxaDh48/IwlvoGKxqJd+sWSrnu36bc9VaVQFrB/flk9h3E4VZWiQ/qkCqmd3MB1k/s6ccsmCCCHCdDHHeIZrEereuoTS6yCsgfEUYAP2QgFLzorLs/6jhcxlxE+7roPnU2cqpdlkk3f7ujpbp43dpQRSzP3sPqqgMLaSx1azDkZat+lf6ma9g==
Received: from SA1P222CA0139.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::25)
 by DM3PR12MB9435.namprd12.prod.outlook.com (2603:10b6:0:40::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.23; Thu, 30 Jan 2025 14:35:07 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:3c2:cafe::12) by SA1P222CA0139.outlook.office365.com
 (2603:10b6:806:3c2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Thu,
 30 Jan 2025 14:35:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Thu, 30 Jan 2025 14:35:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 30 Jan
 2025 06:34:46 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 30 Jan
 2025 06:34:45 -0800
Received: from NV-2XGVVG3.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 30 Jan 2025 06:34:41 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <akhilrajeev@nvidia.com>, <andi.shyti@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <ldewangan@nvidia.com>, <digetx@gmail.com>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
Date: Thu, 30 Jan 2025 20:04:20 +0530
Message-ID: <20250130143424.52389-2-kkartik@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130143424.52389-1-kkartik@nvidia.com>
References: <20250130143424.52389-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|DM3PR12MB9435:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c8f6b0-5252-4b5a-1325-08dd413b4ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700013|82310400026|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tHNbP+M6r/y3hs44LayYXMi9OBKZYrBVj816b9y4LPBUfIzTNhGdvLZwbEiS?=
 =?us-ascii?Q?O9n7khsV+x1lJgIqVU90M7Y9twlLNqudLvooI6+2Y10wWeYAHMAmaI0EPtU/?=
 =?us-ascii?Q?Fk+YLtGJzfRWjX5FyGz3Yf3h3wFgMqnHu8AriLEOAg8x1dcEWLrDX8SaP1QE?=
 =?us-ascii?Q?VTJaA0Im3XWwhkIBm5pqdIz1Hpksc4sN1ZYbpbf5cigY2kFhLH4lZnLQVLrI?=
 =?us-ascii?Q?aA0DDKTvLVJLDEQghC+fzjPHw/qdM+OpcR8bAfMqDsvfkeepb5h+YuHxQoHB?=
 =?us-ascii?Q?ioPJjCl/kuJG4gskuiEve9yGWEEBL/EBt/hDwU7DCDLs4BUFyzMzy63PBSnS?=
 =?us-ascii?Q?+JppyRhIvWGV6inoVwH8ZpK6X4vf7U9khgpjrsvmOeSF48uwiPT4fjkbb3+i?=
 =?us-ascii?Q?/8e8YZKMruAZmlQYwYfxOvqosPvIuY0lqgUVpOIpLCLPlyIuTyf5QAzSm20Z?=
 =?us-ascii?Q?DnqDTYu2k8WoiKDEK4XQ3r9pIDQyjkZ799yoWemb/HM8Isokbs/tYXYhq2v6?=
 =?us-ascii?Q?7p6OAQjPQZnWUY6ulZrCMpLJy8ohsvLtRdnhoFQmrOHEsn9J6GfddsdwAuOM?=
 =?us-ascii?Q?rrfPORvIbW6cP5WxDrNNNq8kPWAEiJMfXHtftpmODHYH8ZihXO4vZCgwL+yh?=
 =?us-ascii?Q?q1CkiFyimjtqlZZCcppRQOnhzn2NM2o/A2r4Ko690B6mSqZkeO/WGyltuXjR?=
 =?us-ascii?Q?Fvz7OX4tZa/PgQThbmUwTkgO4vpp5ZemJA5yLlz5QSzuXP+F0Mrur+mJjvPc?=
 =?us-ascii?Q?4oSVio3ausfb36O1I+J0dfZlrElFHSQlMdYaujWv8AQMIA7WI3IcsHKwcvE2?=
 =?us-ascii?Q?xVmnT404pGRYfkSuKPA2A5KDpTRMEnRzkQOlSPXzJT1WULn3IOVuB46eRDCF?=
 =?us-ascii?Q?zk57UHrXLvbPExC1PCbCvg+Ghx8zxg//C1d9YYp1htxVtqGXxTtyAHMOHVJN?=
 =?us-ascii?Q?p5e1KprNH/dctbxpscd1qrVr8ehP2k1b1Fz3bbb6i6E+gvScPsjZ7d7k9WCQ?=
 =?us-ascii?Q?2W8iwMmEjfIRFoNkJSdi1gcKunX4Pq0xOq5CzzFw4R+pIG8yTxuk+ZbEU5ZP?=
 =?us-ascii?Q?sCt1uQi7jLMehM1s4AZnUkR3eTRaFi87Kym1/dusKfPTW21gu9acOsCwJLOe?=
 =?us-ascii?Q?cgcQVQhZNWSkTYDy+vXKsLj+D+rLlkRsU+HJFe2F9yJW5wY+g7E3hjy8AtT5?=
 =?us-ascii?Q?aiVNop8ZbHYG1N8zhXO42ytW5LRFtcpRiwd/Dyfx/kk4LX+w52K4YHsfrDxN?=
 =?us-ascii?Q?T3bP+veEhe9Gc/Aa7iaxJ+i0fpvp436sKT+krJT/9SIpf6I39CnEUBGioUTu?=
 =?us-ascii?Q?13MR5Silv8rzCAPYQ8Z1tE6LGEu7VQ7BNQHMvnfj8fmq6oyWmX4fhZYK9hNi?=
 =?us-ascii?Q?pqTkYiDjAstMYSlVOrtkEcHnyxhteV9CQpq52EjYf6aL5jN8RZ+5D0uSOllc?=
 =?us-ascii?Q?r3YWQFzhANxNh7gxBSnt8Us+wBMS0U3ZNW5pNxs1/4IBWVGyMDvpTwf4hDzM?=
 =?us-ascii?Q?4ET3r8p6ZbhzDetEcNo2dJ8DzNVDaVQ/w9ZN?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700013)(82310400026)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 14:35:06.9164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c8f6b0-5252-4b5a-1325-08dd413b4ad1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9435

Tegra264 has 17 generic I2C controllers, two of which are in always-on
partition of the SoC. In addition to the features supported by Tegra194
it also supports a SW mutex register to allow sharing the same I2C
instance across multiple firmware.

Document compatible string "nvidia,tegra264-i2c" for Tegra264 I2C.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
v1 -> v2:
	* Fixed typos.
---
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index b57ae6963e62..89138384517e 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -80,6 +80,12 @@ properties:
           support for 64 KiB transactions whereas earlier chips supported no
           more than 4 KiB per transactions.
         const: nvidia,tegra194-i2c
+      - description:
+          Tegra264 has 17 generic I2C controllers, two of which are in the AON
+          (always-on) partition of the SoC. In addition to the features from
+          Tegra194, a SW mutex register is added to support use of the same I2C
+          instance across multiple firmwares.
+        const: nvidia,tegra264-i2c
 
   reg:
     maxItems: 1
-- 
2.43.0


