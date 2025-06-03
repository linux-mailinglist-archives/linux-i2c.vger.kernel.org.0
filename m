Return-Path: <linux-i2c+bounces-11204-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 724A0ACCA2F
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 17:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BC191683C0
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Jun 2025 15:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C947D23BD06;
	Tue,  3 Jun 2025 15:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MBySpgW5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076D0239E6A;
	Tue,  3 Jun 2025 15:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748964667; cv=fail; b=uedHKKc0aGH2b35ft4WUuCoyyviNkYmqHo4inAbIKSBqAQvutCcRjooBeADOvm2/AOfzF05PRly13GPUn0zfWn0d7HgrrBnWTf2mCEVo9GOMB6FyuGCtEqMF+oVol/mgyeKJSBseq6zgTEUmwRAGynSDezlVFDaf1uyV/Nsc2CA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748964667; c=relaxed/simple;
	bh=XQRefeeFgEbj1MgdZVHWcV0Uv0/czAZrFReQtTCxoC8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UY0AmA0J8jPDp14kJTDGjE9cZyl2uguyZzkRx7Nevx0E4PEC27ZWwEs3Rhg2vJycPTNWt0P/A01xEtaD5uQmyUqMq3dTzY/iM7A/b7oeAlhM+VIU9n8DSf6L25OkNOqABCdRUwR2XfGHx7MBUnnqqDLWePreGQb3rstHO6XaFf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MBySpgW5; arc=fail smtp.client-ip=40.107.223.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iU/sHcmawxTVXuOGg5z5TTBFQUdhm0Am/GubizxWY89CtW0fp51LNzhPAYWZMq80Hj+YoaHzJ0jrYnki7w/XOpcvwIAZS596oOW3u8YixsZh3U6G4Dom88vwlBSVuT70fjBqzJ9CqnwgnrxnehSP9KAIGkYx2XSUPVJE4e4n2Y0R73oesuv7Blv3Hyn6CHXGlJfUjrFrHl4YgFK6/d56h8/Opk3juRh0MMmu7FKOQjsIPvB6Svp/lHc8+DFA9VrxUAZBiqPLnNvtuAHV4SN4H/E3sSQ/4S9EvG+ek3zksKapP+jyyAdaWZktyAkKijVg1k5ve0T5zJrIPh8dvIdayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cki1GS/my+rFBliluvulsG29pM44Fe9SqWSA+4869Gg=;
 b=uKO1uOCb2o6K/FngUFWhTjuon6FH1YJtzDWouS28HHU6uo/U0XCgQ4Bxqfnu4aMMrHVTB6qCpX5bqL8Br5r0hnQAMaqXKfUz1ahrNJ2mAsQPtLIII+nWxBeHZVA497dmkRzOrABXASYcE/V7XZqvz3QeYYbmxI/R0Ia1YWL6ewVqQ32ir4vPS1Hfqgd2AYWHTwVegqsdVCYAc6FJtp19ytVwFtaZYu0z8JHBgY6lql7LP1kWgI8VFwmGARNNCQ11QrMz5rOz8brefysnZ6ZMBoLbRsVr8XjlsQWxzOlMQ5mj3r8MYPI+2p4RqJ7zSJz4xlhcW9x0XU+wtrK2K+DW2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cki1GS/my+rFBliluvulsG29pM44Fe9SqWSA+4869Gg=;
 b=MBySpgW5ZMOFeQIMRHAj7/MJrzj95LMKmopWzTveSnKpRq+hyyEK4Q45JDGWSgSNijMp7AqxC1PrCo7/XeDoBjMC2tcb3qapAmgsRebo8tBHjtgF585NVmVO6srzFAQnobiaBtctaJi1N5vQ30FKOAvf1oyS9uDE7RSnTQ4hwiM3/QYmw+mQQH/jEEA9+3xvf122JFunKee1nApWoTtcTp5IsHr4PczEWa54mCqonGzKiTfI6zWkJ9EsniMMiqi+0zqfgDg2rd/OFIVX0D9frcApNVAMluOnLG6FwZiPIkyrkkejY7gD4T7yE51c3HILGlPaN2cx9XGsG81dL5sTEQ==
Received: from BN0PR02CA0050.namprd02.prod.outlook.com (2603:10b6:408:e5::25)
 by DS4PR12MB9681.namprd12.prod.outlook.com (2603:10b6:8:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 15:31:01 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:408:e5:cafe::df) by BN0PR02CA0050.outlook.office365.com
 (2603:10b6:408:e5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Tue,
 3 Jun 2025 15:31:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Tue, 3 Jun 2025 15:31:01 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 3 Jun 2025
 08:30:43 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 3 Jun 2025 08:30:43 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 3 Jun 2025 08:30:39 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<ldewangan@nvidia.com>, <digetx@gmail.com>, <p.zabel@pengutronix.de>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v4 1/3] dt-bindings: i2c: nvidia,tegra20-i2c: Specify the required properties
Date: Tue, 3 Jun 2025 21:00:20 +0530
Message-ID: <20250603153022.39434-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|DS4PR12MB9681:EE_
X-MS-Office365-Filtering-Correlation-Id: d69b17c1-d7e4-4736-6d52-08dda2b3a572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1NkenAzRlM5Mlo1dFkwdnZJTFd5VEwyZTZycklKNzNmajA2T1puYXgwNElF?=
 =?utf-8?B?MktqelV4eFRSRkl3L3Q3MDAzazV4SXhvZTVCQWZldFNLdDZ2Ym9vRStIYitn?=
 =?utf-8?B?OXZjM0VST2hQditqVnJBSmcyZDhmWURWSHpqVlMyaXloQy9LSXRpT2VFa04z?=
 =?utf-8?B?Z29GaTdIY0JFVGdzOXVHb0REblhQeDRmMkl6VU4wMnl2U0YwTjRCaXpIWjdY?=
 =?utf-8?B?OVBRTGg3VkdNdEFibmRtdmdIK2swTHE4cEI4Yk1oWlE4Ky9jcE16Q2h5dGVj?=
 =?utf-8?B?TXNuOUFoYktVeHVUbmpIMUoyZ051dC9rd1dqR0VLZWsveVR5cEdHTWo4dHIz?=
 =?utf-8?B?ZlV4a2tOVWl0ejdFSzZCejJQVkF1eE42TXF3WnN1eWZkNlhBQTArdGxKYWtU?=
 =?utf-8?B?eTREZnN3NmdqaFdCaUxaRFVraURUK1lnSSsxMGNGN1BOMWxCMUFENUhBODcv?=
 =?utf-8?B?eUpOTUZza3p3Z1lOS1dSaWVEcW5JUDBqNEFQbTVqSE9KTWc3TXJTTzdEQ205?=
 =?utf-8?B?N0ZtYlRCME5HNU5JWXlmZUphcDFvaGNaa29hN1Y2ZmxlWURQSlFLM2JSRUFP?=
 =?utf-8?B?MVA3Sm1KWUhQL3FsaHFiKy9lSVM4a1FCSnBPQ3Yzc1REbEVoWXhpVnMvSG96?=
 =?utf-8?B?bXlpaW9PUCtZV1B1SWVqRFhmbDZnWktkQkJsd0hmTzliMEJhYWE1Q1N2eW5K?=
 =?utf-8?B?M08wNk0xRkxsUGMwUDd3VERPUXFRYmNNQ1VsRm80WlkzU0VWTUpRL0dLb0I4?=
 =?utf-8?B?S0g4aThjVE9SYUhsZXlQVk9Kc01SWGdTUUdEL0dBcVZ4MUxJV3NEWXk4L2Yy?=
 =?utf-8?B?VUkzZnE3MmdLaFIzQWdvL0V0cjVWWjZFWEduSEt3RURybDdKZWE0Q2NkdmhL?=
 =?utf-8?B?ZkFlVlAxQWlBUzBvWTVETDNYNjdzeUJaWS9xYXVqdDhZUDZUSXJtZURIQmNv?=
 =?utf-8?B?RWpiZ05LclhJVDhrWk5YVlJiVGMzSmo0Y0wwTnhDcnR5cFZkTDQxY0RHNTAy?=
 =?utf-8?B?TUYvd1YxU0pINktMcGtldjQxN0hia3BPUjgzZXozY1pDcTlYUWZKd25IU3ZH?=
 =?utf-8?B?Qzd5NXNEaTh1YVl1bVBaWm4wZGc4RWQxcjJkSmZaY1JBYXpuSEZNMkMyV2pL?=
 =?utf-8?B?R29pb0twKys1czIxcXBaU0sxZ2haRVFybDhaZ2tjZy9jNjhqOEcyL3FOZjBy?=
 =?utf-8?B?V0lvaVMwZXpxdVA5N0llczVqL1VXaUxHUFAyYjRnQXlpa1VoTUgxbStxZ21Y?=
 =?utf-8?B?MytsN1IvN0Y5dUtsbk80Si83cE5yQXJrbnEvTWQxMVZlTHQxS05maXZyeWpi?=
 =?utf-8?B?RTIrS1QwWitXT0ltcXFGWmVqRUtNT3lEOG92eFBWVWR3Wk5IK3oweHRicmhD?=
 =?utf-8?B?UDBoVEdvWkhBZ0RJM2lxejRlVE1BU1E1andIdkNXTDJoTmRTNHZqOXlONWtF?=
 =?utf-8?B?L0pVVUZEWitScDEvb3pmM2tVTVh2REZVZ21HTDlKRkZ0RWhqajc2SWozVy9j?=
 =?utf-8?B?OXpmR2U0cko2djQvSVJLQjF3S3kwQ1hzM3krYk9vTU1EeDlET3VNUEQ5OEFr?=
 =?utf-8?B?L2Z5bU8xY21OU3o5bSs5QTVhSlUvQTk4Q2pSOWhnTUdwNDdaQXBLMlNHVEVq?=
 =?utf-8?B?S2FtOHRlRnRlYVVKNGI1akFIb0diYXg5bnI3aGNTbnB1ZEpGam1ES2h5MUJo?=
 =?utf-8?B?d3JRK0x3QndBYVY4ek51K3pxcko3MzVkaHFKYnFWWXo4UE9CN0J0QUFUeVhu?=
 =?utf-8?B?U1N4WmIzN3daNzdsUm5vN3ZSaGIxR0xaVDRqTU5pUTBscDFXbkR2TldUbHZV?=
 =?utf-8?B?cy9nUzd0b0lndmMzc1lsQWZqMFliaUlPVG90Mk5FWk1yKytPc09TWitzZUtn?=
 =?utf-8?B?OEhWU2txRytyMmlHWWhMNDVQeHFTaFc5L1JRemFPTnp0a0RTRHF3V2E2TUlP?=
 =?utf-8?B?NnpuN05rU21WVHloMXF5ODVodXNDR0pibW1uTEdGOW53VlJ4U0xrWkZHb29i?=
 =?utf-8?B?MXZXRHEwUTh0M0VyblVwQkZYSFZEZk9aMHk3MWYxcmppcEpKNXgzbU9vUmc1?=
 =?utf-8?B?UVpwMmUwY0YvVXRKa2JCVkprK2pTSXB2ZjZBdz09?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 15:31:01.3665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d69b17c1-d7e4-4736-6d52-08dda2b3a572
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9681

Specify the properties which are essential and which are not for the
Tegra I2C driver to function correctly. This was not added correctly when
the TXT binding was converted to yaml. All the existing DT nodes have
these properties already and hence this does not break the ABI.

dmas and dma-names which were specified as a must in the TXT binding
is now made optional since the driver can work in PIO mode if dmas are
missing.

Fixes: f10a9b722f80 ("dt-bindings: i2c: tegra: Convert to json-schema”)
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
v3->v4:
  * Updated commit message, and "description" section.
v2->v3:
  * Updated commit description on the details and fixed indentation
    issue.
v1->v2:
  * Added all required properties

 .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index b57ae6963e62..10f30d6a1fad 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -97,7 +97,10 @@ properties:
 
   resets:
     items:
-      - description: module reset
+      - description:
+          Module reset. This property is optional for controllers in Tegra194,
+          Tegra234 etc where an internal software reset is available as an
+          alternative.
 
   reset-names:
     items:
@@ -116,6 +119,13 @@ properties:
       - const: rx
       - const: tx
 
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml
   - if:
@@ -169,6 +179,18 @@ allOf:
       properties:
         power-domains: false
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - nvidia,tegra194-i2c
+    then:
+      required:
+        - resets
+        - reset-names
+
 unevaluatedProperties: false
 
 examples:
-- 
2.49.0


