Return-Path: <linux-i2c+bounces-4548-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D237A91E3BA
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 17:16:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 012E91C216B7
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1149E16E89B;
	Mon,  1 Jul 2024 15:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RG4xgRog"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAF616E87B;
	Mon,  1 Jul 2024 15:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846830; cv=fail; b=vBV3PAPMH1bKbKDTlD/y4TNjMCoUvQETQEEdxCeAFmrgLx95izWRl2Gsmx/+Jw1Kn08LmV/i+tZF5jYzACGGvbxBj0YxlFJbUAQyqRWL5zaIEM/kum1DBue6tyxYw5AC3Vc05FQUBGzj+lQufSpL8udLdk1L1aZho5CaGWFbTy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846830; c=relaxed/simple;
	bh=sr+e0zELZ1ohfIllOX/kYbzwIXCuL4Cr8D3hU8XMivQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JmYStilc3olr0pqjHlmAecKLHRN9DlAHemtxYm1/N86wFpWVyp2QOkwhV4sBnWAkfo/k3PzjC6BDnglRqq7yG0Qmo1mSrK9XpTuMN6ummbe9LA4Tib3jqxEWRHvHUEFuHXC7RvWEzF8z6s7nxYcwV+lanlxDVd7A5j65btLC8/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RG4xgRog; arc=fail smtp.client-ip=40.107.94.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfwuQWeJiapWXhByrIIKL9D5prILfrY+r7ylawsL9wD+XJCEyHZ+4ATlS6e/1+fzQM5gR+dH9hsIkN2zF6zSnwF0tOw1NiSn1tLyK46+KLTOCKo0hRAHazxdOlEjB9bhgIJZMjexQK/n+4Ggf+UPkzcN7x+1DQPY0ZEf8H+Ia8oj+PVrPWty0doCt4U6MCYiCuyY79OS0ll89jlmqFaU89xwq9HKny2ziQ3iKVw0Z8N1VvwORVgZylwlaMMTrD6oVTvyS+4rYqadUeEAo6EGFW5Lc7kuhkGIe1EdEouUuIhKg9a0ikfi2/yLOTmTKY/aoMaPoeXmhn4QU4vGamBkFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiZq6AI25H0VZLOjJEX6kyw2DMqiDhv5yTTIyrIgAHI=;
 b=NmjsFVylOazandBi6Py72vcs6BSRne27pYChgrH7efkldMOeih1c/UBXLji6eSwCQAlyMljJO+st0axS4gAH5kbB3yGgM+4fpW9fA3pztkXWma3p/5dWz47DxCaw16NjinQ95ptt6qjNr6TG1s62zFGk7eoqUsbD2ZL/aBurgOc6KPeiifs0bLE9EQq9QVJrmoKxxMw92YCSMcKVnkPxRG31MDywNNPwdGalVd3VWLtryrF17vFPtZbrHsc4WmNCQSS11SK5QODEVwW8/INzwSz1Qdq9+WQizqwQDhWz1XyJ2abZtTrZI2TnEy4UqT2CJQy9HwyzG8oQOxsY8o7EYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiZq6AI25H0VZLOjJEX6kyw2DMqiDhv5yTTIyrIgAHI=;
 b=RG4xgRogQOL7PaxRaQRZYLt3KdIcguXU5Jaoog1vKohTBWKjXgw9ASCjf8a5NTN9EvDwhEGQMTbopDtyzs6ylhbIMqT1YxQGCYPBrH0xdnUugYTv8kslWqXsyFpXUehD9zrUBetAVTdBOpL+Q+yV4AoR6j2Z9vPOHzju5UlaVxRkAJGEw/doXe68vBz+11U053HWzzrlyiZ4r99SBG55jg56Km7wMfhepwYONozenjfEAzrOjAlG57s0SO6q48i0yEtpurXBg+bB+6CyabTyJJHuzsTjIvBF6qnuftTMriAxRrWtFIObWMCnaTzqMHNhn3SMYdwISkGitall+5q9ug==
Received: from PH7P220CA0137.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::22)
 by BL1PR12MB5898.namprd12.prod.outlook.com (2603:10b6:208:396::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 15:13:45 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:510:327:cafe::dc) by PH7P220CA0137.outlook.office365.com
 (2603:10b6:510:327::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33 via Frontend
 Transport; Mon, 1 Jul 2024 15:13:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.18 via Frontend Transport; Mon, 1 Jul 2024 15:13:44 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 08:13:33 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 1 Jul 2024 08:13:32 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 1 Jul 2024 08:13:28 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH V2 09/12] dt-bindings: misc: tegra-sdhci: config settings
Date: Mon, 1 Jul 2024 20:42:27 +0530
Message-ID: <20240701151231.29425-10-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|BL1PR12MB5898:EE_
X-MS-Office365-Filtering-Correlation-Id: 55cb9556-631a-4ff9-2d32-08dc99e0664e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+XoaABpTx/We/bH+iVYULkWwf7ZBTEhgTTHtdbCH9JKZ0vRljVf5aGGALFq8?=
 =?us-ascii?Q?kzJJgn7beJHtSgyCL/yxCs8Z/Bpxsf7d/tKowDWXJVbgElDkPt61ROu8/YFQ?=
 =?us-ascii?Q?WKEu7Jq7wGBZQZ/IKnGpXNaWbO7GcUZVWs4jzvLmynZlvvAKtwyjSqqA18E7?=
 =?us-ascii?Q?r6qsmK9PJzwQBeG1wYlHHgHtI3iJNAi3HKSGA4Sp5MeVlp5XvmeaG8lSO97j?=
 =?us-ascii?Q?NJMRX0wjpZ5SLaXdC43s8UBtYL4Jm9GPqL47xfNPQvLdBTytNUfRH8ZYYTcV?=
 =?us-ascii?Q?MsfSWwCjkvE6VbB1MSRwdIPEgNlFFJ+pxp0e8vfc+w7ApQA52LjGAJsdSQW2?=
 =?us-ascii?Q?Ho449mTp8HKwW1WDiDwEM1dmyPqgYK9xRgVM0YQE3bZwKtElLvUwv/+BMQZw?=
 =?us-ascii?Q?Sr2tBi+61JaTQJmUwcesH/3lXqGQtbZS/NJI2edWe+oxNsm1nCjzehADFr8D?=
 =?us-ascii?Q?XRbv3IApT8s3XmcXswv9WeVB7oR4562MeJyEMRFXVVomvqpUOUdtKduxErH7?=
 =?us-ascii?Q?+sIcVMxkAVU5TQndh6vWXIBtV0waUyeDK6O93xzeQOeMmadBgf2bMya5bWZX?=
 =?us-ascii?Q?rFJrthP5mJZSVNpj6olYaWUBI2X8baWUNuugLpfrlqBJT6Nz7sdlKb32vd3N?=
 =?us-ascii?Q?85RlG8qGwMlQ4KebRwKsY7cuuyT0qlu0day54vmZyPCzjKrN2CXGqjKesEbE?=
 =?us-ascii?Q?swqD3yoCcns4/tuGn1TkxKeK8bw4md4Eb6djILKJh3mn4i0P5WykhvrN5Sb/?=
 =?us-ascii?Q?SWKDUKcmN7NkffOQ6peNTFSaTC6T3pq/lF3k5+f3JfEmUEJNh0ZBU6qKja1I?=
 =?us-ascii?Q?bYNTmFzsZsZw3miECJsxY0Lit+abkFDmms2+k+RE9XGagaIpjaFLIyC/FzJw?=
 =?us-ascii?Q?UzexN3zTaHGuuwLUbA3emBoiTor7qgTQ6LBh5WYMImaDe/Hp3PcfAQbH3Fht?=
 =?us-ascii?Q?Ff6PU0ItN1IAPfmyveN/XpLPHPl8P9YmInb7g3XxYsGLWYhFB5hiMOWByGIh?=
 =?us-ascii?Q?QGx1dfPrbMu3g8pS0uizR8+YYQRGJUIZ5iVpR8RtnfkcuK+PyPLAFpT9N088?=
 =?us-ascii?Q?SHMxk7WflzcCPFYlnr2rwf39wptWMgQR4AaSvX6zuL+cTyhNwIJzHNzLLukh?=
 =?us-ascii?Q?4qfecdNDV4HrtYCF3LgR3yfIdF70iTHAoRgXW4ZfXBSEzRstCk70rn1qde4X?=
 =?us-ascii?Q?Rz5A0ExcV/NS114EHZSsKkdJdNETQmw3Sgt1OUB26Lqr1eW5kxOjVOFACEmD?=
 =?us-ascii?Q?jtyaWBQ0VAhw10B8AGV2SSOVMZb3HaRrkEOele26rV004tYGSRass3aIAn5e?=
 =?us-ascii?Q?1Bbl1jXwsRR4nhcqv/8HoCQmHHR2sN3anZZpCPRL0VwhJ/IWVE/Ad3InJAHW?=
 =?us-ascii?Q?VyGa852GzQXJVbZvumyQgWZOsSmag48dJHypVWlH1c0JntvenjTu6vDDyKDW?=
 =?us-ascii?Q?0TUBFaN9znCK9xaLsCzc+KLMBJnIvJ/h?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 15:13:44.6953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cb9556-631a-4ff9-2d32-08dc99e0664e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5898

SDHCI vendor tuning registers are configured using config setting
framework. List available field config for Tegra SDHCI controllers.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 .../misc/nvidia,tegra-config-settings.yaml    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml b/Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
index 5f4da633e69b..f4440cb6286d 100644
--- a/Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
+++ b/Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
@@ -38,6 +38,32 @@ patternProperties:
     additionalProperties: false
 
     patternProperties:
+      "^sdhci-[a-z0-9_-]+-cfg$":
+        description: Config settings for SDHCI devices.
+          SDHCI has configuration based on device speed modes.
+          - common is set on all speeds and can be overridden by speed mode.
+          - List of speed modes and their config name
+            "default", /* MMC_TIMING_LEGACY */
+            "sd-mmc-highspeed", /* MMC_TIMING_MMC_HS */
+            "sd-mmc-highspeed", /* MMC_TIMING_SD_HS */
+            "uhs-sdr12", /* MMC_TIMING_UHS_SDR12 */
+            "uhs-sdr25", /* MMC_TIMING_UHS_SDR25 */
+            "uhs-sdr50", /* MMC_TIMING_UHS_SDR50 */
+            "uhs-sdr104", /* MMC_TIMING_UHS_SDR104 */
+            "uhs-ddr52", /* MMC_TIMING_UHS_DDR50 */
+            "uhs-ddr52", /* MMC_TIMING_MMC_DDR52 */
+            "mmc-hs200", /* MMC_TIMING_MMC_HS200 */
+            "mmc-hs400", /* MMC_TIMING_MMC_HS400 */
+        type: object
+        additionalProperties: false
+
+        properties:
+          nvidia,mmc-num-tuning-iter:
+            description: Specify DQS trim value for HS400 timing.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0
+            maximum: 0xffff
+
       "^i2c-[a-z0-9_]+-cfg$":
         description: Config settings for I2C devices.
         type: object
@@ -124,4 +150,9 @@ examples:
                 nvidia,i2c-sclk-high-period = <0x07>;
             };
         };
+        configmmc1: config-mmc3400000 {
+            sdhci-mmc-hs200-cfg {
+                nvidia,mmc-num-tuning-iter = <0x02>;
+            };
+        };
     };
-- 
2.43.2


