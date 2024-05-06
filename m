Return-Path: <linux-i2c+bounces-3449-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 227A38BD7F0
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 00:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC7552819C4
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 22:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E459215ECF1;
	Mon,  6 May 2024 22:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fRVn/Zaw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D9F15DBCC;
	Mon,  6 May 2024 22:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715036003; cv=fail; b=KjkV79A6lsHCo+viQyAiyafZssv05Q98/n6q7vueDyUKOcqewXGJWoBMQBwu8WEyyByuO756/iTPrXrjaMfiesPVYi23oeoPL9VPVx7/BFGBG9vr2y0Akp8zU0fOL61yI0XW4cprovtQh9YkTNzGIs3HYd1pLN0xRIpNQEABBQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715036003; c=relaxed/simple;
	bh=4TFk0u/A0TeZesqnRHpNftOznPAwvR5iNnJIIWmQp2U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wc9Puq9CCiDUGWe6E0Kb/VmpCh6PuFW26JcPzBY97X5PHiPrG0mdghOI8gkQLPoymCUBIySudGT3XK0JB+I3ARghYRmaIkVQ5JuSBW88lDXC19DhqSgSeovHuT/KFRPxmVTZcDtJT/Z4Nlj/sojqo/w1qt+rXVBaBK1C8JCGwbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fRVn/Zaw; arc=fail smtp.client-ip=40.107.92.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwmZfltuJsE+jaR6m/Bj8/WcqMN0c1ZfujD9vlMSRDeneyofoYaLeG/lEmq0+SDEoPv1xr92uqqxSDMMBjKPu4XVqIWywDwOoal26u9sbs2Uu2tC4Acwe782nDLPrJVH/VHfzJYPDe+EKrynq8CiReUEnImi9XIwQ2DHTyod4GpZrJJ0yz5mbUqZ1p0an2qyaozB9NjLfMN1x0BKdmIIS4ijBVq0USJKKu/jqxzmDbvKCm0XesOxrfbHQ1ybA3ExZcafbR1FzXFEpkoRAa99UyjNcS3OcuGbjINIdGYFMeR0Xhfa0ZTE0pErZsgn+odIkfPH9plzjZFIXodOetyS8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E89wNX7QMImCvT2JhkGzDnT7Sk3uU1oi2vU94qoB3JY=;
 b=CoEXNnaJRRcVTy0OdrTGX2q/tc2xYhkvyftCg/KzZmQGxmBVrb5PgUJ2WF6UASBpKiInQJroFeQKJF7T2Fh1fcIZMXQ+kqu1z25wMivdLLqVmr177ygJ/uDr3rk4uA1s9+KtzBkmIN/FEdkkOSexAtQEYDY//oxXraBYTloxtsW+qVF+AELIXLu53INm9iVhgicfiCBdn+nOk9cfMyeA8VVlzguvgHhssuzxk8Ex+OKNZaKa6zHXS1vW3s7p/LdTtz+i+Jt/8TqfW8i5ZhqT5zPisKOQvPSb0isLkXWlZAq8LjynOlDHaX0hWipJcrjquPX4wveD8saHOoUIu+DCJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E89wNX7QMImCvT2JhkGzDnT7Sk3uU1oi2vU94qoB3JY=;
 b=fRVn/Zaw5Sz3qJxPg7r6Yv/20JFqI1NVCdM7RylRqC3oWU8AMsg/gGZ39gwYHTCgi7TPgOfb6MI5xwGiKdQABV/ORrETkJwKocHrBT9D67ZhVHaRlfxecwCG7v5D0EzIBnnrCgputcQqgiS1nTx8yzmUPZy2Me46F2tWeTIrWI6mx/oD+4xd2NHm4d47Td3Dh7eTRdq0rKfIN18cn8Y5eBA4mICx7ARVDsxj+VM7nx5CGH0Jr3l28Oj5kG9R3O9McgHv/EgvpR3IJbOP8MeXxER9f/HlHdF/BSwotoCmfyDa/LJwhXlvDEheqUYlLeyS08JheMHia0JCpiotT4THoQ==
Received: from DS7PR03CA0329.namprd03.prod.outlook.com (2603:10b6:8:2b::33) by
 DS0PR12MB8293.namprd12.prod.outlook.com (2603:10b6:8:f3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.41; Mon, 6 May 2024 22:53:18 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:8:2b:cafe::3e) by DS7PR03CA0329.outlook.office365.com
 (2603:10b6:8:2b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Mon, 6 May 2024 22:53:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 22:53:18 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 May 2024
 15:52:59 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 6 May 2024 15:52:59 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 6 May 2024 15:52:54 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH 09/11] sdhci: dt-bindings: configuration settings
Date: Tue, 7 May 2024 04:21:37 +0530
Message-ID: <20240506225139.57647-10-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506225139.57647-1-kyarlagadda@nvidia.com>
References: <20240506225139.57647-1-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|DS0PR12MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 257c4beb-e129-40cd-0f8a-08dc6e1f5282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|7416005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jf9e23SryRl1j7cNNnjnl+1qyMgm6dbbu4jj9fgZuvfc2Gql2dWtnoKQ6n/w?=
 =?us-ascii?Q?fidgHfakWg0x5iIGBImPwbk6mJVQ2og2PXe5vqGlXLlIYrtZ9wpaygPJJuDu?=
 =?us-ascii?Q?GBDM2x2EcLJr3ESBGfC/uZYnaM/dJE1MizJkp7sAwlUdLUsOS68iBcaO8w2Q?=
 =?us-ascii?Q?SXEHIBgRz9Nb9ycsYF699BWPS+iHP8WpxxSqd+p4j5pJCn+7r4PXHkYITyxo?=
 =?us-ascii?Q?KOCSSW1kyE53ijxnyvaSkKK0kJyWlBX6Ix8+QYi4VDg4FVOFqPyCBZY82+Jc?=
 =?us-ascii?Q?IWYSHZKExDtr4hELPhJHfuwWS4DIiAuYGe2YBlFmwxxBtjJiPlt12R6uz6ag?=
 =?us-ascii?Q?PuIAP71lh2CXwV06hFAHPBcPuS/JB2TWFZYyPA7YXil++6IHPTBry71Y5Pss?=
 =?us-ascii?Q?ufGldjnfvW6mAI73m23AYviYKYp3psZxE6SMYfNIWwAfFDiSUMw6Ebd1+8ct?=
 =?us-ascii?Q?tm4pXwVuERM0Pr9Xy57zrahXpcvkDRB/K6p4AaOJx44AlcqiQ1qNIQPaeTcH?=
 =?us-ascii?Q?WidD0TD7OETT4gCFNnSE9eEHhJshLDQpMs6qMbKyySEn7wqDzKT5jefVbuE2?=
 =?us-ascii?Q?qf4lQfogHg70Ry/nZsT3+VAM3ANVF/vDMQKIMtoJaVYXPgPFu6zb8CgLPxwD?=
 =?us-ascii?Q?gKwgcem0ryllh/AW5it8TJZoJeOPkceeUt6vT7+wJ5Nw/KHSqrembXPMcTHl?=
 =?us-ascii?Q?MQT4RZKstuXotg1L0Vc2/PFsa1Q7hxk7qbEjUy2fXHwYslc4Y4u0gZ6aSp1b?=
 =?us-ascii?Q?El0WzwmnMpQmG56OCHOO0K0zQr+2Aeq7Jp+ZtNNE1L1d5rc4PUm9l/rlkEFB?=
 =?us-ascii?Q?Z0tJT/dmBpQab/MfbWreFS7yra1Smo6nKwjrdoBrFHcpmPoqy7LwhWBzaNJR?=
 =?us-ascii?Q?mALge8g6cmwkbfXp9ivAdHWoByusoIxB0pR3D1h7Our+u5/FMh/K/odtj80z?=
 =?us-ascii?Q?KBgD6x3gJwy8ssEfrgfsl7x+UCv87S0fOGWIMoarRlacpiDf3qYV3ZRChEUq?=
 =?us-ascii?Q?0lqPlSjKklO6dZ1MZSVzoiqHyGYLZqw9mJ7VdK1MRH6X14tYkpB9lfnd75nL?=
 =?us-ascii?Q?sPFoHKPFOzqq8ZDn1eC1NQ7azedyM28CfBBiOOq9tVTNLB1m+20zx8bIzh7B?=
 =?us-ascii?Q?ku8bKdPOzFEox7zsJqvrPEkAtfUC4xVKu9VtqAMOLRU4IpTtDKaEQV3J0IGx?=
 =?us-ascii?Q?6jOlrHzVs9KhafRs0iHKXeLbFXWVJRQZR5gDn5zU9BaDDsAEpdvPZq4jk9qk?=
 =?us-ascii?Q?RnXoO47gBGVyD2Dt8bKI1BMnsSZ6KRl9IszDT7WS7am1agcH6G6kXVro+OHz?=
 =?us-ascii?Q?r32pkrMjaDBimVw+n/WUz6OleKow3n3gP1NHtvqqkmEd6aMSjiTHZcXFpuRM?=
 =?us-ascii?Q?JpaytKY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(7416005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 22:53:18.5658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 257c4beb-e129-40cd-0f8a-08dc6e1f5282
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8293

SDHCI vendor tuning registers are configured using config setting
framework. Document available config for Tegra SDHCI controllers.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 .../bindings/mmc/nvidia,tegra20-sdhci.yaml    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
index 72987f0326a1..002bc1ffc156 100644
--- a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
@@ -177,6 +177,37 @@ properties:
       operates at a 1.8 V fixed I/O voltage.
     $ref: /schemas/types.yaml#/definitions/flag
 
+  config:
+    description: Config settings for SDHCI devices.
+      Config setting is the configuration based on chip/board/system
+      characterization on interface/controller settings. This is needed for
+      - making the controller internal configuration to better perform
+      - making the interface to work proper by setting drive strength, slew
+        rates etc
+      - making the low power leakage.
+      SDHCI has configuration based on device speed modes.
+      - common is set on all speeds and can be overridden by speed mode.
+      - List of speed modes and their config name
+        "default", /* MMC_TIMING_LEGACY */
+        "sd-mmc-highspeed", /* MMC_TIMING_MMC_HS */
+        "sd-mmc-highspeed", /* MMC_TIMING_SD_HS */
+        "uhs-sdr12", /* MMC_TIMING_UHS_SDR12 */
+        "uhs-sdr25", /* MMC_TIMING_UHS_SDR25 */
+        "uhs-sdr50", /* MMC_TIMING_UHS_SDR50 */
+        "uhs-sdr104", /* MMC_TIMING_UHS_SDR104 */
+        "uhs-ddr52", /* MMC_TIMING_UHS_DDR50 */
+        "uhs-ddr52", /* MMC_TIMING_MMC_DDR52 */
+        "mmc-hs200", /* MMC_TIMING_MMC_HS200 */
+        "mmc-hs400", /* MMC_TIMING_MMC_HS400 */
+    type: object
+    unevaluatedProperties: true
+    properties:
+      nvidia,num-tuning-iter:
+        description: Specify DQS trim value for HS400 timing.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 0xffff
+
 required:
   - compatible
   - reg
@@ -278,6 +309,11 @@ examples:
         wp-gpios = <&gpio 57 0>; /* gpio PH1 */
         power-gpios = <&gpio 155 0>; /* gpio PT3 */
         bus-width = <8>;
+        config {
+            mmc-hs200 {
+                nvidia,num-tuning-iter = <0x2>;
+            };
+        };
     };
 
   - |
-- 
2.43.2


