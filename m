Return-Path: <linux-i2c+bounces-12029-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3176FB117E5
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 07:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BCBE16FC60
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 05:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791E923C50A;
	Fri, 25 Jul 2025 05:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BC97su/1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2086.outbound.protection.outlook.com [40.107.101.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E5C7464;
	Fri, 25 Jul 2025 05:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753421008; cv=fail; b=CSCUaMS11/IJAXPBntU2TXzYyRL7rHxDc5Xdr/5pGYrLk2+y3tJ/ZJDNVkdTCofkU0ZpD069H5d03CI9pewfSSpdxX1HKm3digAauV0Zs2nCJp0W8mwR2jaVqSM7a2X9Tjaqaj+TcM9ApQzRycnBSq8ujMwZ7hOM1m9fjL3ena8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753421008; c=relaxed/simple;
	bh=mUyLiFBAA7X48ah9V91LlnuEvJiVWxIhJgN+SNk5Gnk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rgn58IZ8SnGByjaYWbrK6iZO+CL1qgXjQOgMgYTDgjVePCA69hfPbc2djkbGrXDfGQl+N9ro7mXMnKSXre6pMPq5SxAbBMQz9HuI2uHaHJgZ1f9MXATEKp8prXCyen6saocZ6T8jC3oZVwi4nB0gbsWmT1Ti0csNa6wrBlyH+GU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BC97su/1; arc=fail smtp.client-ip=40.107.101.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUC59ZDCIWOBMzkanoU/lwJhcObB+dz0VBKWOdzntQ1uuJoPTiGivIERNuPE2ISpC8Rpq+H36WGDpmaMKdHL5nbpz3/acsxn9WjjpZDZ0SMEJ5K6AoCWL6m6QQR5omMgC2BulXs+nQT+/JmidmTzN9zQPWrMNuGW4P+Ust63cCNAeZgaGpQRsyB8yw4m6oLkCRtfjd/1lATYs4ED8Sq8FeteNAEPQNu+jbxzL2Oxv5sun9tZ2pCH4X6ZQKXV54A2xp5bNw3IrhCxg6c3D4Dbh3lQcu46fPt8fGIF2E155VPQwvFdzCoan+ZJtfcHgeC087CEIfUAvj0N6vdIK5CJTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8RNcnBN1Kjp18vaADIUEpRFnLpL9x16CnuaNLj7e8jA=;
 b=O4Kmhh+SnpNxInJ9zY37jb23HmG+peNopnP/tHXxB4Phd89YLSfr/W77hznwijYMbsuE86hwyh+bkI+H15w7Tn5MXZxRwMIz+k4lVYHIoOK8LyhHr9haoigiS+Z9o2ZonDtaTOfAFbkrVB2DBZpshF+P3Z6M/WAtslksITDFPDEx2cVna/Y5iXCz2g/Aw3AnmDz/BrVqJP4FbrHeXCYHv243ya+8KVzt63yYTxfBJwDPVrs7VBRE70a4U3j+3YyYIvrmdiu2lnmmVsud6cPvZK0215irYhzSu0oJTa7W1zGVyyLMNRc01RyA/5v2Z02rK8zrmOJJooQgYJTj3yTYZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RNcnBN1Kjp18vaADIUEpRFnLpL9x16CnuaNLj7e8jA=;
 b=BC97su/1CFsSJKmECT/2Ou3qb+mYdUASnNTywShZXmwFVLeN8fCbOUWQ23p+e0ihJ9F2vjRGIXf88Wh5NbcGXC19WIwOqDavJqZh1EGl4PDA5N5/UmlWO3tgLvY7qfWxRsQsJYHY1tF1hYcPRyjkMPRhIQKE48FLakSmrdgJxb4DaNsE8DSTFWkFyNJsURLs4uY+zqm2UogIx3Z4/NPDHD7+LTR8+mDYXmUXJl2RKn6cvuUBIu3U2TtTZ8vjVJRBxl/RDq7up21KmGN9oQcV1lindWDDUbX1BEGE9m3VOZDFOkOx+8dXoWnRh6tyhuznYEGJt4xRVaX//neA62O4qg==
Received: from CH0PR03CA0229.namprd03.prod.outlook.com (2603:10b6:610:e7::24)
 by DM3PR12MB9286.namprd12.prod.outlook.com (2603:10b6:8:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 25 Jul
 2025 05:23:22 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:610:e7:cafe::f4) by CH0PR03CA0229.outlook.office365.com
 (2603:10b6:610:e7::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 05:23:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 05:23:22 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 24 Jul
 2025 22:23:12 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 24 Jul
 2025 22:23:11 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 24 Jul 2025 22:23:06 -0700
From: Rajesh Gumasta <rgumasta@nvidia.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<andi.shyti@kernel.org>, <ulf.hansson@linaro.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <kyarlagadda@nvidia.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<andersson@kernel.org>, <sjg@chromium.org>, <nm@ti.com>, Rajesh Gumasta
	<rgumasta@nvidia.com>
Subject: [PATCH V3 1/3] dt-binding: Add register-settings binding
Date: Fri, 25 Jul 2025 10:52:23 +0530
Message-ID: <20250725052225.23510-2-rgumasta@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|DM3PR12MB9286:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f029d0-3cc6-46aa-a548-08ddcb3b5fcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TRppZEVkNcrSgyJJI0ZuPaut0kt1yi2iOhQMQiRLq4zrRVo+micnC6zWYflR?=
 =?us-ascii?Q?spr63WK5+FyXBvvbRWhXVK5rQkAcIhChOoOte5Z8cCnOQVx6yf4e0lLnZcdI?=
 =?us-ascii?Q?hDCgbfFymWjDY1lnAZBOMSiz+fK+F/NxSEq3ar+B/nwkF9sHXWaiGcNW4znt?=
 =?us-ascii?Q?f/pp5xpWAqPLwivw3+4+cMv1WrmIqKxSzdPOUNybdBd29N/NJv3GW6GXYMei?=
 =?us-ascii?Q?2cBXW3Qdh3wvnJ6fx7kKphWPCFWpCDKFuKlAEZlEFCU5obao2okpA7ofeAsG?=
 =?us-ascii?Q?GsnKn/4BBMSCes7PfhwnnzcqMLVySitO0ZGv9srZfKD3xOW1ENoKOydQIeGS?=
 =?us-ascii?Q?GOZEIRCyiVD5WS41W/sCbKc5T7L93b9yZRDdf1QDqL6sn7wjw4Jgu1tsRG+X?=
 =?us-ascii?Q?cUSzf6lUouNbxB8fFq/q4YNqnUPXsbkH6yu4h0dbYfwCWYfwllprCjRgYN4Y?=
 =?us-ascii?Q?H2O3+djrSq4uO4ziYerzjZDvP+QVS8W7rFJI7IRdM2vqJYZHPxYVf4ZI/GbD?=
 =?us-ascii?Q?yyqe3B3Gao3K9H5G9oCl5oUwip2pFlVe3A/7yka796RxX3/72lVPezNXfkNa?=
 =?us-ascii?Q?EIKU697lnARSM21VqVp1qCKSzjLNNNkgBhHd+MM/VJ0S4BvkvpppzPniDQFD?=
 =?us-ascii?Q?hwUNe/2/kBCwG8riRcf4GXLh/LbjKO+LKjaOkeLwQ9Cjgkwe+5NsbsBAy5qT?=
 =?us-ascii?Q?whtZ4pAHGnDzTtf+yeajBXP7KEONBrP4F9/hnTGUqFElt5t96tl4nLxV8Zrn?=
 =?us-ascii?Q?14fqhLwOSiI6Zt9MvwklewFnDhDBTWNAmPq/ccJB3oCnOFsbXnvlk25lTg7A?=
 =?us-ascii?Q?ZjaKTKq4MJ/ceM6pQvK2yVFzuxOiMkDWyl8fRQxMoAM4SJ+f9QmjXKx6wn48?=
 =?us-ascii?Q?ZWqjKhIjEqcxiYEYV/U/7NRgnUGkcF5dl594UjWeeGauLrrMCQOEXiOwTCpB?=
 =?us-ascii?Q?Ua8FQ29NmOlS+i8PDc/D+x7lMxcycq5UYdj5V5uJvIABWmTvnfi5PqQfstOB?=
 =?us-ascii?Q?gb7+gAh0Zza+pVf0xu1kISXpBOYJlEpjQuC0/uAQGuVftWuoTXF2jF4FQ1cR?=
 =?us-ascii?Q?Ol4bBH02J0ICJv9la8xbwCQnkrIUD6B7isriKnyAspD736g+py0Zx0qEH8sP?=
 =?us-ascii?Q?pmANss6wPWpDgmDTpq5x/72yffocownZXB/evNIIH9I4jZYsf6dYQuk2Ak5v?=
 =?us-ascii?Q?FDJj4PUfQyieqpiwKO5nN67UaN6IK6VrzmFD/X/qqiErnGiuiARoo5zx519Y?=
 =?us-ascii?Q?awL6lpMQAIbNG4mQFeesR40J7+OqPARqXQetyn3CyS33d/83qz/SIx9jljoA?=
 =?us-ascii?Q?RrZXOD6bxun92KtTpHtcY76AM4rEEjluiUBblNjEbmexyNpMXm6TjPEvU/UP?=
 =?us-ascii?Q?6wY65MBBAxsLCH6npayZSCSGH6oaGas8tL4vqwE5jC0gIuWaJjuw7AcZFhH1?=
 =?us-ascii?Q?zLsId0GPsV1IWAU+v9OWqIwfhzs6e2/CX3qHvu8zRjyWNNAnuUSa4bGtkhfh?=
 =?us-ascii?Q?U8ugex2juMV9IxUn+OxaXlHISLva6+sB72/o?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 05:23:22.5957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f029d0-3cc6-46aa-a548-08ddcb3b5fcc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9286

Add a new device-tree binding for a 'reg-settings' node that can be
added to any device. This 'reg-settings' is used to populate register
settings that need to be programmed for a given operating mode of the
device. An example usage of the 'reg-settings' node is shown below for
the NVIDIA Tegra MMC controller which needs to program a specific
'num-tuning-iterations' value in a register field for each operating
mode:

  mmc@700b0000 {

    reg-settings {

      default-settings {
        /* Default register setting */
        nvidia,num-tuning-iterations = <0>;
      };

      sdr50 {
        /* SDR50 register setting */
        nvidia,num-tuning-iterations = <4>;
      };

      sdr104 {
        /* SDR104 register setting */
        nvidia,num-tuning-iterations = <2>;
      };

      hs200 {
        /* HS200 register setting */
        nvidia,num-tuning-iterations = <2>;
      };
    };
  };

The 'reg-settings' child nodes are defined according to the operating
modes supported for a given device. Properties within each operating
mode are then defined by the bindings for the devices that require them.

Signed-off-by: Rajesh Gumasta <rgumasta@nvidia.com>
---
 .../bindings/regset/register-settings.yaml    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regset/register-settings.yaml

diff --git a/Documentation/devicetree/bindings/regset/register-settings.yaml b/Documentation/devicetree/bindings/regset/register-settings.yaml
new file mode 100644
index 000000000000..4366cdd72813
--- /dev/null
+++ b/Documentation/devicetree/bindings/regset/register-settings.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regset/register-settings.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Register Settings
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Krishna Yarlagadda <kyarlagadda@nvidia.com>
+  - Rajesh Gumasta <rgumasta@nvidia.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  Register Settings provides a generic way to specify register configurations
+  for any hardware controllers. Settings are specified under a "reg-settings"
+  sub-node under the controller device tree node. It allows defining both
+  default and operating mode specific register settings in the device tree.
+
+properties:
+  reg-settings:
+    type: object
+    description: |
+      Container node for register settings configurations. Each child node
+      represents a specific configuration mode or operating condition.
+
+    additionalProperties:
+      type: object
+
+additionalProperties: true
-- 
2.50.1


