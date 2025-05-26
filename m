Return-Path: <linux-i2c+bounces-11136-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E37AC3912
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 07:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F748171F33
	for <lists+linux-i2c@lfdr.de>; Mon, 26 May 2025 05:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964561C5496;
	Mon, 26 May 2025 05:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aO9mURyV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A538A33DF;
	Mon, 26 May 2025 05:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748237185; cv=fail; b=psisBTO2DY4/e6zZL3S6rHIhQxG1Wd5HEegq4y1AedTRWDyZLRfH0AWz3qPslym3ePnqrbbX8N6/qyR9aqIDajmp29wJkAXfY2W2OKONT0CSr6wFWz9mNXEVycdumu4iNVoAAqqSGyAE75/TlEfiO2tNKyJ5h5V4Kvk5tk2p3oI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748237185; c=relaxed/simple;
	bh=sm8AA79VKWiNNvfhcx3ie4VztK4XytASfp01aRnF6co=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ryc7WoKdkpqGToDRImHmTsMFTp9qkrVsNk8LCNqTp0vRWyFucLMvpGKkxF2AwBlJIq0HxU5Ydq3N31/HqG4e1uRuk7a22ogETO8G+DWiQvFvK4NlGOA1J4LL7Pn8bEXRQptKsb3V1X0fse3toyEZosEGR7ytNhaNlkAHfc6PSR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aO9mURyV; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSvIzOddZOYUfYazE+fh8BeY/cdlmilrrCWw/R+DOWHWMwWFDZLpIWG8UE69ssnDe5eO8pKdQA1Xz4gKQX8R3KlrCF91C7bvAvo94ZH5xCDu5fA7McTSWxhqNEuq37VtoHJg2qrSHT+HnKaAfwTilF6na+HPQlm3ViU2sNpRASyHKpIdlRNnvskdP+GXz6MmeMEVfwUl7ksKFU0ZFELQS+HWg0r0D+TjKMc3UXij5B3HAEwax38bn2KrBdhWbN5imevE4DBy3ZgMYdgEcg0eGnwOZouCd6yXIdA1ZjKNyk7kJcustijWfOQwJj2cgAcNWp65pBx6XNlkE7q58TRi1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7GpbBaoL2p7kUcJTBeJ6RSVxib3TWwJqhguQFQBJ9s=;
 b=jZJMMySOKsr7IIvUa8qLqMaA/VUqK8uLesSZrTJ1BRJJTLQE+LeyVzdbdvpkV8o/GuD3bAG7PxNekdmDpyhLAhhtaUUT6Ld/l0jgdbpOoOTmOQQCSSQT7uM9vjeHh47HWbNclNCdR4u7WqOqEVObi5Mu5P/zqp+tMly/FEjCJR8Qk03ASe6l+H8uAyU+hydcE9Tnsc91LAtoJTf+gLB7hzH2bmvrcJyorelTQcQrp3pL4Mg6a9bnZ1O/PdsHC9gP/ILKUShL4R4MNUV0AuFniVbrPR/7ySwmjI/E+k8D+ObdPawDvQTovLlSvDLNRl2L+PVq3U7B3Pwbn6YI/14EzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7GpbBaoL2p7kUcJTBeJ6RSVxib3TWwJqhguQFQBJ9s=;
 b=aO9mURyVYtWP1NjDf8U0zPAPre0PWpd60IZ4sqcVzACz4li75eY9yMmxtKuQZCWfmhmiCAbqwj4cUQXV4m3sTjsB5uk6NWrvw27xB3hcLhCKGVFQFck+XT9QtlCxbHNNkrtY6RMRJ8GiXBjL10p8xEeRjR/lQJvCKaLHpay9/KqT7EbAi88zaoWzMrIcXMT7NAT5L7Pd+6q+zOS8jxD4YSuDPw0CjIylQ2Vbu4H1HXuBl3VYCnrTMt1yyzvJI5gFI7kGTn4SPZhiFfD1gT6DyT2bI6IdHPV+xBWhRXlrvodWMUFuCR4wPFFURgxsJM3ytgVzCTgDXL5ABD5RPioe1w==
Received: from CH2PR10CA0029.namprd10.prod.outlook.com (2603:10b6:610:4c::39)
 by SA3PR12MB9160.namprd12.prod.outlook.com (2603:10b6:806:399::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 26 May
 2025 05:26:19 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:4c:cafe::4d) by CH2PR10CA0029.outlook.office365.com
 (2603:10b6:610:4c::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Mon,
 26 May 2025 05:26:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 05:26:19 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 25 May
 2025 22:26:14 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 25 May 2025 22:26:13 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Sun, 25 May 2025 22:26:10 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<ldewangan@nvidia.com>, <digetx@gmail.com>, <p.zabel@pengutronix.de>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v3 1/3] dt-bindings: i2c: nvidia,tegra20-i2c: Specify the required properties
Date: Mon, 26 May 2025 10:55:51 +0530
Message-ID: <20250526052553.42766-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|SA3PR12MB9160:EE_
X-MS-Office365-Filtering-Correlation-Id: 886878ce-6b02-43f4-8841-08dd9c15d891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5X81886+0hMzMQll8Jq63Q8fOcsoRqQ6zsP8FO3e+TPBP2X6MJJdcJXSPBs8?=
 =?us-ascii?Q?b6XqKS0e6gncQKsbe2yixMMK1uE861BKtcctJ/a8fk1+IwL9OzvBP+EEKWDw?=
 =?us-ascii?Q?Dhm+OcBHyifrmNtvSFOZbVePlL6PmY0vZT8aL/OQrw7+NO2uxIQgRrwhlEO2?=
 =?us-ascii?Q?IAtafFuhapgFExnk2s75t1R3S8DM5vBOqT2haP5sbOu1P2dwnhelzXT4WC0n?=
 =?us-ascii?Q?vDyZlLxdQaicC0mmWseb1uPYix2DxIaV7P0cshHkLQMvbPFBMTfKZ1YveK9/?=
 =?us-ascii?Q?5Ey0rtZYHO0X/7UW7Fu+FglDkEbyf/8wvOKjMhYMfTpw3vaBcK1vs1wKNpQQ?=
 =?us-ascii?Q?i1+YetMITujNgYh9ZfJwrUwK5M8aA6dHVYWME9BZZhm2VwkTjJ03lRX8o2c5?=
 =?us-ascii?Q?PwZExYqftNApvUHWR5C54ZeVmiCiwhOBg5Wt1wyzGPlqIFKJOf8b4NPauLPl?=
 =?us-ascii?Q?v8LrmusQqjre21MFXUSBMPD7d8VZ7Uk/GRPctaaHnqnhhr/Fpp4LLqWZgEF5?=
 =?us-ascii?Q?4tsRRs2Us9AYsd0E61ealzr+Wq8cPRH6hlU97r8hfhcw/sIJ/bjmTNwsXCLj?=
 =?us-ascii?Q?Y99Crsqsv2HoO31cJPKxler/t9sHSkWB7eTRj24SokODX1EEa4doZNN1Vlxm?=
 =?us-ascii?Q?o8rqnNZHpZ/8Czr6F76GnI4LE0rsJ9+bZMJsGvOSExsF749PrzBJmGNnMeLy?=
 =?us-ascii?Q?nvY3l6/ndqUmQF1htvef8CpKZOt+xdj21DBQ/FPROmDIgm29TpFdLo7maZF7?=
 =?us-ascii?Q?Mzz5Uqd3Wvm5XLSdug3ctRedsacpSoooA0XGV0v/XUPuzlchQDEBq/C9kZC1?=
 =?us-ascii?Q?5UKq985Ka+RhQ1pOyHMz7QNJqtJRa3ZXcCqzM56OOo7uxHa/Urs5gdDnLgp8?=
 =?us-ascii?Q?xCMRaD08QQXG2vTZMFCQVxvU9yh4+hdJRbBSGHj9rmHCAfm2exht/Taapf7I?=
 =?us-ascii?Q?Ky1G0EfmGOWtdF7XaQwlSNNAHNfkjCV8ezOXQLKgUVLYR0vOU4HB8ov92ltG?=
 =?us-ascii?Q?B/xX30IuDGWns/m3/9rvxdUKUFzWfdJ0g71CDCwSrfxQRFma8RCCN0qy4ORR?=
 =?us-ascii?Q?0ayEfsWsOn+w1v9O4JWO1Cu/OSlBb+5j0N94hLSAGxrfHhYismJ86+oO+NnW?=
 =?us-ascii?Q?sQQ9mUF87r72yhdMHLr38ANsXoAfx4GsK6pS+8Pg7nKGHloh2RG80rB06gSw?=
 =?us-ascii?Q?PPdkrDkYhEGaPtZOUDQ2w7qo4Snuavle9hwTgxzp9sog/fvYMQ9yQGVeixqE?=
 =?us-ascii?Q?epqAcnFWnMVGsjbeKd+wEyHQG02/bH7k202v9RF+L1Xo33S6XBKnY4L+RTKQ?=
 =?us-ascii?Q?gkWqizkIn7BarDsXLrdFy6csdEwLQOWlmsvO8vk+pP/AJn4eHCL7OI3U6AaI?=
 =?us-ascii?Q?+ll4kgiMM5T4aGOKWp4NYBmCiHWS4OWYJtcp19cUvO2XoNwhKXBhuJH1SZE8?=
 =?us-ascii?Q?cOp1DKSk3Itjtt+ki682/OFxhITfWQb9N7OoJHmlnersHIbYUz5x+cPpiKJX?=
 =?us-ascii?Q?UC1QIn39kmiYf22243pX23hwBTOOn9xU8xIQQIP+fJ+/h3iRvm33d058zQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 05:26:19.6889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 886878ce-6b02-43f4-8841-08dd9c15d891
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9160

Specify the properties which are essential for the Tegra I2C driver to
function correctly. Though all the existing DT nodes have these
properties already, it was not mandated by the DT bindings.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
v2->v3:
  * Updated commit description on the details and fixed indentation
    issue.
v1->v2:
  * Added all required properties

 .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index b57ae6963e62..c1d38e6ff7d7 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -97,7 +97,9 @@ properties:
 
   resets:
     items:
-      - description: module reset
+      - description: |
+          Module reset. This property is optional for controllers in Tegra194 and later
+          chips where an internal software reset is available as an alternative.
 
   reset-names:
     items:
@@ -116,6 +118,13 @@ properties:
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
@@ -169,6 +178,18 @@ allOf:
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
2.43.2


