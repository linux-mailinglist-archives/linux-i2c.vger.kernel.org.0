Return-Path: <linux-i2c+bounces-4549-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B991791E3CB
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 17:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FB46287697
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030C516F0D9;
	Mon,  1 Jul 2024 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I6PS3vNC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5258B16D4C0;
	Mon,  1 Jul 2024 15:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846844; cv=fail; b=YRxlbOsKlVhqeabtf/OOyyEEZqz3LbA32+ldwrAynN1kt5xR13Dhi01mht4cpleO+jg4oY8aWHSNskCvHZxldAbB/1obxAmFCzQ2YooNSHYnpl6L+p8THDBkWq/YiYBqn1qfevjE9wkRdd+4rT0udyNtkYWu8lOmimcv8fBvY3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846844; c=relaxed/simple;
	bh=OW40ogSE1nK+6GyBTZvqWoHgZTNKai77LP3930/9vE4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rYKXbZMe8Ely41HLv7fT0WF3BouHCpCFGOtLyHX55MbcfY3wj+05tB5FIdpBDBV0nlHTzyaxNX7qr8Od2zDrgk/PDBCKCPeHY3rEEbKrq+R6Oe80eNbSdAJILTQoiFX+nFK1jIRpuBoVe8HtD+M2vb7X+QbLKYXfjJJUtX+jBcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I6PS3vNC; arc=fail smtp.client-ip=40.107.93.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gz6thvVZH1xsTdBT78HEZUg7KfVhlAD6ijJDHS2ST9FWCbpJqjLiRVw19VqBB0XfbYcTKrFg0YKvvzVLcMgFByuGR0cKG+4MmPlp5IjvFhAmwi+l6Irtz6eHI+93VEE0RvYn6rfwkAyZDa1dKKZq80ZWuV+TCjy7/qJ3TAmw9EmAD1KslkrG2p+37ms7c8tiMQKlSeg5Gj3Tgnj4j6j+h1a1WPP5IVI/BPfg99T9b49m1pKXuK8KW7V9eXulE4seNZ4qaQhNnX0x/eJeQteyt6tzWuCPiB8rN90f8vTXmlTM5omG4oCYwLzCG4unfhOCeo0lWmpsYD6SwHMSS9nfuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8MmBcG6p5veTatA5jYc17PKVm6PDOVnskR2/JevhJs=;
 b=UzufAnIWQiRhP9uioqm9uAQwbowQusRwKyO9W3efL5x6FVfmLNU4Kb27eX/2oNHQAouMttXTxNchDSTG4hnWngWSyvx2mD0BS5iHpCpdkasb/yyhZqUHDM9X8hK7vFWY/88JK4ekbpo/x50OD13Mv/dgHZWd7GNoavZqPRBaP28ft3M7eChpPTUB0zhdClkVTokIQlzf4aali4+UpynvhDVfQeGjM9N4Ta8yVwF9gE0lmxzeuwet2MXwtihhYDSRWWB4xLUvy4r7LjRFICxsUiG8ZLBOvksVORYYJbkThsjpA436WVT0vneqdGNuvxcS+37nuGRZ0tW3lL3jQ6SoHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8MmBcG6p5veTatA5jYc17PKVm6PDOVnskR2/JevhJs=;
 b=I6PS3vNC6qUbmexjEMVxGYjQtl8KbaK/hGJ7Sre/SC7WHFvwFaS4ARGEE+4JLJK9bRhcmHeX6TCPxKkKc3woBVPO7tZx9N+LrIHtdqG9R7oTOHYMxY1k+Ns4nueYcJCJSIKdfFKEijAppbj79wJ0SYXo0v9lgubdzuK/dMLv4kIFXl37X7ZqRvbFOm6kwGxSKbkDXPdGYDpS8kBuhVSHQEP5R4luDFZXngGbvZgJp/T8sHSkJyqjYk+IWeQOZ8LTxyPllrNqdwfPD3c7cIdNDkOGnbpxfCYLyEc85j5erTzjwOnwNhRyKSj0MVH7cyKfqTKnXzTzgGjLDTqjAtkEOQ==
Received: from PH8PR05CA0018.namprd05.prod.outlook.com (2603:10b6:510:2cc::21)
 by PH7PR12MB7938.namprd12.prod.outlook.com (2603:10b6:510:276::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 15:13:59 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::49) by PH8PR05CA0018.outlook.office365.com
 (2603:10b6:510:2cc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.22 via Frontend
 Transport; Mon, 1 Jul 2024 15:13:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.18 via Frontend Transport; Mon, 1 Jul 2024 15:13:59 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 08:13:38 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 1 Jul 2024 08:13:38 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 1 Jul 2024 08:13:33 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH V2 10/12] dt-bindings: mmc: tegra-sdhci: reference to config
Date: Mon, 1 Jul 2024 20:42:28 +0530
Message-ID: <20240701151231.29425-11-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|PH7PR12MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e297bd-0fd1-4561-eaf6-08dc99e06ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SLQ0QZtQchyx8NDqJ4SH/Hhde2tK5mffRGlKJKfi/+eoKpVk732GcVXG3rnU?=
 =?us-ascii?Q?RgxC2Jlyz0+/63wUgw0A582+BCcYqKGZggaVz70eSrSplGym8ecxPkl6nnf/?=
 =?us-ascii?Q?0yvGWpAn/yoHhS1qIfZfYBHB0u5Up6v61+qASo1+YCDBZkP/6sd7JeTW3z9r?=
 =?us-ascii?Q?bgPBBsMvwYBW6GoH6Pf4Od9Vfo6UhQyNLaOpLlWeM4+6fAYEkps8tIuUldrd?=
 =?us-ascii?Q?3EqLUI7D1sGF5xahcJdHMbCRKgnPFHf5x9Vxtbdwc7FQRGWCjqgU0jTmVTGH?=
 =?us-ascii?Q?LxutVTYZBN9ZT56v0UYpOMIGAMHz97+jIO2ESNW6BCucEpuDvrHv2PBb3hTR?=
 =?us-ascii?Q?F30ypfhX5bhKtT4fhoCDRYlLtuAkbC4fbRskZBJq1uwH8CM4Ny1vpwyd6l0L?=
 =?us-ascii?Q?kY0ZDgfrlfmXGdiBYGHQaw3OEZuH4UkTn2hMzyQLOYXnPz4uzsE4XlKRMulL?=
 =?us-ascii?Q?UHWmN5xy4gQLJLVu3/7TRp7zE+c2YVd349g8O0tn4Bg9vglsFdCxMAe/5VOn?=
 =?us-ascii?Q?x2QpvtDL1O+rnxkqgPuUebWEm5inm4s/z0/semAZoju5FSxE/tIGIB8Xdg4+?=
 =?us-ascii?Q?8x0tskh9iVHfZihVPp6dz+FhQgqiDyMe81zd9cPmtRRe3auoxpbFo4PCx7z9?=
 =?us-ascii?Q?R1BeUY2sGAaKnfF0v8PlVsZVkwdMVU+bwEEpHeKTYXdlAaPoVJpBhvGUfmq1?=
 =?us-ascii?Q?2Mp3dRMebhnamW8b55UsSXT1uBuq6IKxQT1Kan3PdUcQqf0QjF+kubEiA/Qv?=
 =?us-ascii?Q?Bfryw9fNRAfFWBputJe/a9CwTPooItmu7r0YRHivSikdn7Q8q8+ZxbaMN24R?=
 =?us-ascii?Q?YdpT7Bfr/wvxsYhD/RfEr/U7l3zYjdA/l63aXR7bHc9+X9OLI1NLo2BmhYVl?=
 =?us-ascii?Q?ttjNq5N6+49SVdM6QIJm0w1jN1So/nYRI6/KixG+leGd2VRjpuy3z6GdMH6z?=
 =?us-ascii?Q?/bR5NvUqUhTH1JE0LbjUOR31uRf3VPqHvxou9Y9N16Jt0X1uQ3Egad9BXyrF?=
 =?us-ascii?Q?K+oN2XIhYU/aMWXYzaYXeO1XRv3zuQjGWdh1X0SwyJZmvV5nDyrnOFoJuktu?=
 =?us-ascii?Q?vy0V9SLoQdQBc5Glckvg1jbYR59ZsyepHMJJrvsLBFq9qFM8ezWzDYFMbgDH?=
 =?us-ascii?Q?2e8luXxzr0T1perzsjqo0uJpqRtE+8trx+yipp3rKtplvJpck99CE09gD3pa?=
 =?us-ascii?Q?6ztMPX6+DUrKAuqxt1TsG0K4N3Fom7N6ZBAK/6V3ALq3VwqmgOoYGoZKxJNX?=
 =?us-ascii?Q?dEBfnBLvA71Sp92ejS71TNFYcR09rMT8d86E9TrLHMApRXf1of8UyKkmlIJk?=
 =?us-ascii?Q?CJytGZOITCnOaFF2FaQcPaRh96DlogAILPpHUdb+2Pm2eCfFbzrTUUq7S32X?=
 =?us-ascii?Q?MIZYkh7wMS26pg5+3B+ak7ronslO1rkvWw2i4EwXES4SRqPW8baeDfZgeb1B?=
 =?us-ascii?Q?F6y2t920bMSIGQN1kLNpe5jozNgC4P86?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 15:13:59.0067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e297bd-0fd1-4561-eaf6-08dc99e06ed5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7938

SDHCI vendor tuning registers are configured using config setting
framework. Add reference to SDHCI controllers config settings.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 .../devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
index 72987f0326a1..39bda6ce1e50 100644
--- a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
@@ -88,6 +88,10 @@ properties:
     items:
       - description: phandle to the core power domain
 
+  config-settings:
+    description: phandle to the sdhci configuration settings
+    $ref: /schemas/types.yaml#/definitions/phandle
+
   nvidia,default-tap:
     description: Specify the default inbound sampling clock trimmer value for
       non-tunable modes.
-- 
2.43.2


