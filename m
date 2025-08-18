Return-Path: <linux-i2c+bounces-12318-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BA6B29831
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 06:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 711E720178A
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 04:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978F125D1F5;
	Mon, 18 Aug 2025 04:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tcQZJfhR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD10D1990C7;
	Mon, 18 Aug 2025 04:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491666; cv=fail; b=QAgKGq+NNWQyMQWY7/B4tReh44Y7VIgpYH1cXITGF0NI66AuYEp4nyaD87Je33EkKTC8nlsIiqcwLzunQ7ugd1XzArSoFpPlcCcTz6+9pSLiKzJZtrfTvPNDtXfS8NM49sEl615gLOTs1jbt4slqwBWcuikRbF+nBy3C31z1VV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491666; c=relaxed/simple;
	bh=hW6w9MS2J6SFy85Itw8N8VrLUgQLoKG4sf+Ymk6uzjE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p+nZN0wH++ueDyVhxlKqKqCKI9mcbm/+ofyRpA6GTUrscv2A6PPy2OMpKyGDG15Z9NY79+11eaIMgNOKOLLDuBPKU9TH5WR+blFL7OeEXqDrRZiywCzlKie9HRNijHjSSsID7bX4h9pUtR8JXi923KOjYVQIqWsDSZz9eJnZBkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tcQZJfhR; arc=fail smtp.client-ip=40.107.236.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9wePd/oMMhesuevyb8t6Q3AJT40H4/EB0PxeJprLjyuIbK4dSp8cUArk0HT5MrI/nYsWT04eEaNxmOnGVKgq7dxyOapEGTP/tV23/rsOcOBSO+wh3T4TrbaWW3UjGBBLTfyzJ587AfnG5mdZrXJ3iC27ZUIOP1v9HpvPN9ipJUNvkV6DTwodzn7wjRE36bLRrOVN569FY0l1PB0YWRxszwaZbutxKuyAhmOOmIt9DANfyI2/GtzcV/x+H9T1seyKUJvwlrDiTzaVKd6bQklFecobqcQKpdwUuhyEWzr73XxNFY6wyVfaulscdyX5/1qG5qFC14Na4vK6B2LmPDW+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIuOgGKcWD8UdiL7Qb5Igb/H+I2DD0hlafIdTNumxOw=;
 b=Fv35dT/SnoErBZG15K44uWqGoV5CrGf5cttKCTOHbs9vwrQpgQNExYo56RGvAC1jPSXbWKL39ZqF+IKw6/3DtIGTU9iBEeUXbU2NFRe67Jsl6Q7RN+6u6bXZBqqQrTrIlBiyv7vI0PXegG+DgAa+05Pfn0FTsn6Pe02DR5G/8ywcwRpZg2xjsFoWCqH4pmE/Mu23gZ/7S7Q8+WVUv8JL+YT0DeenQPSMDpvZG+Kg42TntMgWV8v2zWN6CQXzlIffNc1aWTBRMoJqPuYU5XQQsfifXs/9K2XsmUxl+7LUgLK8VR86BqOrkPZxPdU4IUkKcLUK5dIafL+J44nPE9VVrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIuOgGKcWD8UdiL7Qb5Igb/H+I2DD0hlafIdTNumxOw=;
 b=tcQZJfhR6rqlax1XRwnpef/tjvVfghXMQmC92uPSFm4aG4t5vWiKdOb7KePZIM3vtpjP/8YHaQrGs9+97/G9wdVdz6tDYcr8XvEqyH1aV/vPvreyOVQWfZoQdRUx2x6m9t4jllle2b8FSKCdWOfTUWjuQVue6tpop5aB+6Mx0WGTvH2h69EtsPo7TCxzM6+YpZ8jC73P0Oe9nRPi20CIoosGV5506MpNcR20vr2Pgyq+nBlTyN/3oZEeanOsIrTLm/1Fpzg/OhQWlma20KN4S3aX4g3/u5rYkFwlPD14sQ8MgQvGbvLUprsBKQuZIk1DPaejn3mOheTCXh63cHd9Tg==
Received: from BYAPR05CA0038.namprd05.prod.outlook.com (2603:10b6:a03:74::15)
 by CH3PR12MB9169.namprd12.prod.outlook.com (2603:10b6:610:1a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 04:34:21 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:74:cafe::b2) by BYAPR05CA0038.outlook.office365.com
 (2603:10b6:a03:74::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.12 via Frontend Transport; Mon,
 18 Aug 2025 04:34:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Mon, 18 Aug 2025 04:34:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 17 Aug
 2025 21:34:10 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sun, 17 Aug
 2025 21:34:09 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sun, 17 Aug 2025 21:34:05 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <digetx@gmail.com>, <jonathanh@nvidia.com>,
	<krzk+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: <akhilrajeev@nvidia.com>, <ldewangan@nvidia.com>, <robh@kernel.org>,
	<thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
Subject: [PATCH RESEND 1/2] dt-bindings: i2c: nvidia,tegra20-i2c: Add Tegra256 I2C compatible
Date: Mon, 18 Aug 2025 10:03:44 +0530
Message-ID: <20250818043345.65899-2-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818043345.65899-1-akhilrajeev@nvidia.com>
References: <20250818043345.65899-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|CH3PR12MB9169:EE_
X-MS-Office365-Filtering-Correlation-Id: bb35f783-d843-4377-a72e-08ddde108078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lpRfyMAyG00fS7Bkr5Ix96GOhdI6aMv/+iEFBckeRh+nC2cZWiDE2M5d3j7a?=
 =?us-ascii?Q?Oyfdzy9c5MkiQfx9gOqbuxG0B8KiqYcgDYmAU61oxMImBeo5SuiH3so/CEIp?=
 =?us-ascii?Q?Ti1rxT2ilDTA3wSvzjIGD9D0i4W5V3/KZaRNq63qyxytFiVCT/lnQJFJck7x?=
 =?us-ascii?Q?MQZJvIR9taaYPrcEpsm1YmculwgMOHFjo1AykA0lMJ3WT81OlUJNrROXfEmp?=
 =?us-ascii?Q?jYHZSStD9kq9hmTEn/RkaYLLHTfX+cN+jf7pZ8oi/0QgPsTxyk8TGgo3K639?=
 =?us-ascii?Q?HoFqVBh2rgqA9GUiYgy/Kt9c09Jk+66PCTUWYSmQJIVJewZioLMHwuaFdISN?=
 =?us-ascii?Q?7BJi3yKXnPmi1unDOuNlqCZpX5I+qgmhYaQEcXJE9ONDjXWTs/vNozgBm1uJ?=
 =?us-ascii?Q?8iwxGBpSM9wwtYFu0iWto/wwtL2N1sJhOiYUeMmYiXcM7mWcJvqojbvHa+vh?=
 =?us-ascii?Q?HXva/i3/rO89QAj1DA1Dx/YOBtJA2+CdQDEbXKQVFxddtmmdTQvT4LU9EQ0D?=
 =?us-ascii?Q?FLNgmB9X9FNjtlJrRrX34GcmDndFUvrnrJNvIf40MS+lMQ2h3tn1WI+wd1sH?=
 =?us-ascii?Q?25eSdfRxZb7qO4E/zJY2cOQ+lvxH960VFvtZCakLRKGr4Q3QQfaCur5tp7qk?=
 =?us-ascii?Q?yW4Kc1/XnbmUaDI2GQah9u2afyGHeuGAqJvtRgUdH2rVvjFuEi6/7omMvYDt?=
 =?us-ascii?Q?E2rENtl9yFguYH+gHZfLDYy2SmLAUpIdEEqpi5s0BubvypqSUMBfP7PqrO+f?=
 =?us-ascii?Q?Q/zyE3u0dvKGn8JadLoOnQvV9n1+LnWsL/mK6JpXTpbHWaIZPLywL9wYwR7o?=
 =?us-ascii?Q?H5+b0yOy+F+iv0ackURMZlDtyU0sVCzT3KdROstlPAMGqCp8/fE/pDM3LF+7?=
 =?us-ascii?Q?xLDf5YxkUV2Ky0AB7DnVl9HQCJAm2RilxexP9MAOcbGeJkepG+jMYtjEJAbL?=
 =?us-ascii?Q?iIgHZjRz+j01V7Uwn9KBIqztni7NUoASHlPacdTnBkrhUQdlQP83er7CvhrL?=
 =?us-ascii?Q?+Kjbml/c5fYTCbIacHI2F7evdb9xpZb6/tDODteSaQp+9tE65q126zWXrueI?=
 =?us-ascii?Q?HuuUWhvI1XCWC1Dz/edz089jdOaQ737qp3nUPeKehaPVqSmFNNFDj2OfXQUy?=
 =?us-ascii?Q?4fSwAgN8VmcGpkr+elLovWELybQTq62KqlsvcZP/zzGx1JIbkA6+bGAaPaVl?=
 =?us-ascii?Q?6rC3emoVDpzuqdR+PdiUjL9H5oSTEm+Uh0rOXT/izKpUALkuz6KeB0leOv9W?=
 =?us-ascii?Q?/ePdmnts6V9xIvuRprkI2izmTHSXVaKWRvGDj+XYlilw/xriwgYZelmcPyj4?=
 =?us-ascii?Q?tm25IJanP6AXqS2ye7uMvp4toWlpuZS0zhxECpEW9bI+zSw1JMxgdre/V4Lo?=
 =?us-ascii?Q?2YcS43Sgt6If8ek11mYWswZ4Do025HFsLiFmuJX6xcvkUowJUSWklZbOPZns?=
 =?us-ascii?Q?tzIVkIz7LJcsImwS2co8EV+REA/mBcp29A66alDRVgn7olW7C35sr6/JbmSk?=
 =?us-ascii?Q?DUzbLeAGLpTRaSRrU2UeQjpLVSzwvmihGCK7?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 04:34:21.2260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb35f783-d843-4377-a72e-08ddde108078
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9169

Add compatible for Tegra256 I2C controllers. Tegra256 consists of
8 generic Tegra I2C controllers similar to previous generations.
The parent clock frequency is different in these controllers and
hence the timing parameter values are different from the previous
ones.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Thierry Reding <treding@nvidia.com>

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


