Return-Path: <linux-i2c+bounces-12032-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6E3B117F1
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 07:23:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C12DBAA7DB5
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 05:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC5B242D9B;
	Fri, 25 Jul 2025 05:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FLsOUbgQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFEF4A08;
	Fri, 25 Jul 2025 05:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753421024; cv=fail; b=eoDrlYKc2Knyewtd/YVxrikYWdRs8ZDtZXNTJLd06d5TzvR+B8YXzh/feG1RV6vqAJ89gU7c0jdrZAs4TBieMdXyunEBN5FnvEtnlgVm+W2kfa2wNPKKlXSSow5N/jsZ2hZy7wMYeZJ2O306WWu6VuD7ZP5eS6B8KeHjqAuEe1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753421024; c=relaxed/simple;
	bh=he3mzG+fui5J5Dl2QH0JZrYx1508gDHZK1JUQAxhXKU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s/85o6zJcnzl1TtQy6kw656BQl65rSmvOkCBYjZZdRM0eojmgzWbN/2/N6Ry9UJH/6M12yPXFsE5Se7+bYSDFkvH7VyzsDbTBVNGkzz0NIEonkrwRMVLouksODbehjEJwUa9xt0rX83r3GSBoOTzbymSxn5wzApu1m0zi53tezs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FLsOUbgQ; arc=fail smtp.client-ip=40.107.236.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFGZgCwJk9x/NXVlBEZUSkxKrwj1uucGL+lLq8guNs9i0MlwXO1VVfT5LyK8Z0WFwtlzEsHoN08JMNwcnRgow8Vx5Z0QoxTL7iWDecyVO7rktXsXISI70b8bFUJHavlYi3C17z3YXATrMdezl1D4NFX3hUkp4Jn3tZ1RPg2kJlCvtENOWc+07nBnn05QUVBTm/BKQiD9uWHqe36J2F/O1BUa+Uf3oQwX05iGja85kKaWPCdhMsFxUgRAoYDV+qVaUBFJetfP5oI1vbZCdq77KjoHghL9l+VuSEFxHZ07MquZLMjc2Uc2UV14tj1L+YtnkriSdcmqfWA/3w4w+Av+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxTNebHMn6VVdFIcQFPWxUqRy3U3opi/ruGdzDEk4JQ=;
 b=rzpqIVCKtbyssIGtsnldts99MzoTe4CiLHL+9rSTvv6cp4sGxSi6p7SxyG5ecFe5wXL/I2lIFDAPkcnGLK0lci4C42fPRFHTvqpQvjQjgLrsa7B8AHrSs4WPbG54tgNi0eSMK+OzSnN80jL1GewdAtZ/0xySmUWOKxnrJIq35f+19sR6IekZIAnGFPGxEq73AOYNaFuWZfYh11onu2Kc7UotWT0SXyvFy/r0TVXM4iSxbOepeZ6abF0YRjHi+78Jx6YKwcuCMF2vsk5EJ6XyIgnP329dh2k/xiLbssSdUnkgICLD7MNtJ2kXxQCRsirC83395QdgqU+VE2MLokPHgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxTNebHMn6VVdFIcQFPWxUqRy3U3opi/ruGdzDEk4JQ=;
 b=FLsOUbgQKYzIDUjHDsdabFuQInVOFo4vIyGjkIDreSlLe+8Rul5cd90wUZZ3Yb/vFM5msJTyRfLQsFdcYMI+FhMnVzxaMafVG7GnD2XKmzYBVQ0YCD0qp51GjIrUemW1gVkJxfpdeI+OBSAuOWa6JLtMWJZl4U4aRmkFmsUDkvbEh7Uydc8SSZGucyDe1ofIMVddzE5f2Ayjv9w3gzo7rxUbNiMAHhwX1SW5fc7gayBlePLg2CxouDaDpxR3dx9rz+Kl9LNJLoiD/Zt2ErPkLJ09PLparppgce4DGcSmfHFICHfRRT/IdGOm93C90HQfQoMGXT9jlgMLV/V+4iZXMA==
Received: from MN2PR19CA0025.namprd19.prod.outlook.com (2603:10b6:208:178::38)
 by PH0PR12MB7472.namprd12.prod.outlook.com (2603:10b6:510:1e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 05:23:37 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:208:178:cafe::fa) by MN2PR19CA0025.outlook.office365.com
 (2603:10b6:208:178::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 05:23:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 05:23:36 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 24 Jul
 2025 22:23:21 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 24 Jul
 2025 22:23:21 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 24 Jul 2025 22:23:17 -0700
From: Rajesh Gumasta <rgumasta@nvidia.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <kyarlagadda@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<andersson@kernel.org>, <sjg@chromium.org>, <nm@ti.com>, Rajesh Gumasta
	<rgumasta@nvidia.com>
Subject: [PATCH V3 3/3] dt-binding: mmc: tegra: Add register-setting support
Date: Fri, 25 Jul 2025 10:52:25 +0530
Message-ID: <20250725052225.23510-4-rgumasta@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725052225.23510-1-rgumasta@nvidia.com>
References: <20250725052225.23510-1-rgumasta@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|PH0PR12MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c07602-fc65-41db-98be-08ddcb3b685b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dy2bR/2RcKb4KWNmkUgjmR1XglnCS6KpLLQ4mV8dGbP3yTh4v/I3O+lGALPU?=
 =?us-ascii?Q?R4LNydvzDUvSYquCQtd2OXmGSU4CFn7T+j0Mechwh6jQ0GojHpD9RznKT1XM?=
 =?us-ascii?Q?3uj17YqWVW+KED5ZQLP4Mi2pgF45YP6dCfNCNsQVBALl3EIk6iLwyumDWuzL?=
 =?us-ascii?Q?pES38fUlzktEOHWHL6cd2M+PrLW2HASjk/9ZaVM9d0JeW/4HBh0Sj+MWJTAy?=
 =?us-ascii?Q?t56XgRTsgVQ+3Xokb2DZSNAy5G0QiBoA3WVYW95JNyQKQ6ngO8vfGbCjndHd?=
 =?us-ascii?Q?JCATucdw1x0sS2bxHkAubQTINKaTITrp+NktDj8FMiNX8dZf3foOuuFmnYsY?=
 =?us-ascii?Q?0LhyHkDB9Ri1l2YPTZTQxXpoW2W7uHsCGxQAaEhbShV6o3qLSKLkpsIPCPRc?=
 =?us-ascii?Q?dceGw6U0vQmver5tNUPD6sVmtaEZfS6k07Pv6fvjIwhbp+XPNqUFRgtXHW8m?=
 =?us-ascii?Q?sb64l//YZARcnsezLFRYKkW2EtA3jSul29lGHVH1WEExMdLM39JsDkObEceR?=
 =?us-ascii?Q?rTzXFT5i97if0p80JDonnSgmLCXzf3LXVt7i4sp/G54GuNthtmzQjqbCkmyx?=
 =?us-ascii?Q?ErM8dRQvnpKOvZqFcLzBxnYTbYqOoEEEUvR5P8gEyQP1lwf8xydDepExnYbE?=
 =?us-ascii?Q?+G3l614dOpHAOBOXLrBSH+LMpPQdCLR4zpCGXNycca5rVnssm6h2HJ516T+P?=
 =?us-ascii?Q?6Rc/GfJAd67DNbHKiRLRKLSYD8JvlxqCEPHqKkJVimf4YGGB3ss9Im33hoex?=
 =?us-ascii?Q?nOvWSe+M7r+8iHHx+avcBobbxmpCGzZaaB0OO62ShL/FBoPxblN1OaGv5EGv?=
 =?us-ascii?Q?mU7jbpXa5RtfrLj95y4Zviy2IlaBD1ZkytI2Yqadq/pPsbIsx1MfimauQepf?=
 =?us-ascii?Q?LLSPClzX8UCBXuHnWR5OQWeZJ3Mx7Bn9VqaBJDKVL2HIWtl++TSsSVO9KLNS?=
 =?us-ascii?Q?EXJGJ9wN/cTIBXbWpvPWaqFx0wZRYDYt/8iUMdw8vzxn2Mpfm4dLZgZAL/7/?=
 =?us-ascii?Q?xKjIZN+C5avGZL8VXLDQ4AidhjwLxjhqZn9scx3aOGKYohJuOTbUDhEHQskf?=
 =?us-ascii?Q?dctnvXQc+QzVl4zP/S3/pP8e+b/ppHkJ53lfj2asHpVRQJEDkceYd7SITgyc?=
 =?us-ascii?Q?xbJbTigzGbjQqtC6lbn5ZxQvqjq+DC9DnAWY3KPCwKEG5YaR5ol5gMg2PjHN?=
 =?us-ascii?Q?MO8s0cNqK8akecPyJw43GT9OaGw4vYSymUf+xvFAooi0iGX3NgCVUYfhJbTV?=
 =?us-ascii?Q?ugLYVPpjN7LCBcYgMbsIXrJjKl0rCEmw0L4t/rmiyqwosYlHjIaLxt18wk9E?=
 =?us-ascii?Q?10sH7tzybGr4hYTro2d59ZSaoWCvJEhP15d15va1SV0cKfGUbQCwYaVIERls?=
 =?us-ascii?Q?RhyySyk+oKmfcil+irJvbHxGwWHseMo6vIie9HjkJhEaXUqqwc8e6X2LPwDB?=
 =?us-ascii?Q?5gs8SwLOKAlGE4TZoOHLex0GjCoDfCoFC+bhp7bWYsgyk86FPet6OwS9M806?=
 =?us-ascii?Q?VRq13i0bpuMbti6nl9ueznaYZrb7zcC/pVCK?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 05:23:36.8722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c07602-fc65-41db-98be-08ddcb3b685b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7472

Add register setting support for the NVIDIA Tegra20 MMC controllers. The
top-level 'reg-settings' node and child nodes for each MMC operating mode
supported are defined in the mmc-controller-common.yaml binding. The
NVIDIA specific register setting property is defined in the
nvidia,tegra20-sdhci.yaml.

Signed-off-by: Rajesh Gumasta <rgumasta@nvidia.com>
---
 .../bindings/mmc/mmc-controller-common.yaml   | 24 ++++++++++
 .../bindings/mmc/nvidia,tegra20-sdhci.yaml    | 48 +++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 9a7235439759..0bdebc6454d8 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -308,6 +308,30 @@ properties:
       sequence. To successfully detect an (e)MMC/SD/SDIO card, that
       power sequence must be maintained while initializing the card.
 
+  reg-settings:
+    $ref: /schemas/regset/register-settings.yaml
+
+    properties:
+      default-settings:
+        type: object
+        description:
+          Default MMC register settings.
+
+      sdr50:
+        type: object
+        description:
+          Register settings for MMC sdr50 operating mode.
+
+      sdr104:
+        type: object
+        description:
+          Register settings for MMC sdr104 operating mode.
+
+      hs200:
+        type: object
+        description:
+          Register settings for MMC hs200 operating mode.
+
 patternProperties:
   "^.*@[0-9]+$":
     type: object
diff --git a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
index 72987f0326a1..a78b2bd92b18 100644
--- a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
@@ -17,6 +17,15 @@ description: |
   This file documents differences between the core properties described by
   mmc-controller.yaml and the properties for the Tegra SDHCI controller.
 
+definitions:
+  reg-settings:
+    properties:
+      nvidia,num-tuning-iterations:
+        description: The number of tuning iterations to be used by tuning circuit.
+        $ref: /schemas/types.yaml#/definitions/uint8
+        minimum: 0
+        maximum: 4
+
 properties:
   compatible:
     oneOf:
@@ -177,6 +186,27 @@ properties:
       operates at a 1.8 V fixed I/O voltage.
     $ref: /schemas/types.yaml#/definitions/flag
 
+  reg-settings:
+    $ref: /schemas/mmc/mmc-controller-common.yaml#/properties/reg-settings
+
+    properties:
+      default-settings:
+        $ref: "#/definitions/reg-settings"
+        unevaluatedProperties: false
+
+      sdr50:
+        $ref: "#/definitions/reg-settings"
+        unevaluatedProperties: false
+
+      sdr104:
+        $ref: "#/definitions/reg-settings"
+        unevaluatedProperties: false
+
+      hs200:
+        $ref: "#/definitions/reg-settings"
+        unevaluatedProperties: false
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -310,4 +340,22 @@ examples:
                           <&tegra_car TEGRA210_CLK_PLL_C4>;
         assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
         assigned-clock-rates = <200000000>, <1000000000>, <1000000000>;
+
+        reg-settings {
+            default-settings {
+                nvidia,num-tuning-iterations = /bits/ 8 <0>;
+            };
+
+            sdr50 {
+                nvidia,num-tuning-iterations = /bits/ 8 <4>;
+            };
+
+            sdr104 {
+                nvidia,num-tuning-iterations = /bits/ 8 <2>;
+            };
+
+            hs200 {
+                nvidia,num-tuning-iterations = /bits/ 8 <2>;
+            };
+        };
     };
-- 
2.50.1


