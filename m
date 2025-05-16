Return-Path: <linux-i2c+bounces-11000-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C311AB9C7E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 May 2025 14:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 411964E13D8
	for <lists+linux-i2c@lfdr.de>; Fri, 16 May 2025 12:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2BE2405EB;
	Fri, 16 May 2025 12:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cfSvujKp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9A523F42A;
	Fri, 16 May 2025 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399467; cv=fail; b=A548k9ycEqu2EoC3+QmjBTqRYjRsrAcU01Smw3BBP0k9UWb5+VKI7qy7no1AgHtoEUWe9qBqwNz2YcZ6JFZFCHtzy9YUaj+ckS/II7Z+nCZyRfrkKS6Yx0Ln0g/qeYQyVHGJmisC8T5Ks6SvIKoLxMpr1w4C3snwBH477BPrzWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399467; c=relaxed/simple;
	bh=qk1RHIe9GiQTkTvdhse6geameQLJuRTaP12+wqQrDW0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D4LrXkSbscyS8CS93Fsr6/vnEhibxzBD422dM4QuWogtBTIB3IqLeD54vQdeHTWrQU34V2SZKQ8xBUp6WyO9/vx5myQvWTJNLPlkvTBfUTVo7qQaEF0dLW1zWV0QibBE7ZnIpjOo0iGRC4mrXhrZmS1DCTarU/9qyTerhCZVyVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cfSvujKp; arc=fail smtp.client-ip=40.107.236.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJtqS/G8bizaBOW5nVRa1jajF9c1GzljT/6etrhf5dThBKFrOu4vamZz+p7l8lvHtqGhjrtKTZKNxUOU+Uq52qMeRgjvHbqDCXxih1dY7K2tKKsJFOddlMIee5BuGT9U6CN7KWDCGKntVuedWb3D/lg3EuLelMZsaUzZJb4SCtAc6cBOFHsHZcJQBoQJV1WXIvXhJWhQbG7K4tzepwRPtsqS0yTFpKLOMAVze5FDA4GmaJuH9mz27yrqHEMhRmddjFR6+WE4P+3PQdm3sPgvZxsJIoEU5/JQYwU+YRHujQnuQ0QS6dqVJEOO+owxcAbKgT4QjlL8k/Em9cuzCuvEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLMiFtYUW/ZOPcf56MNwM7PHA50zm6PwsXD0qf6rM6Y=;
 b=dPyUiz5wOprwvBSSNv0L2LVSrVeNGeIO7qh2T30ihI8v/lMiXhj5cR2NH5mAzOBh6Kp90ArM9KPReq9wz3B7dxSEWWmwBoeNKs9jPukbJF+Mivfi9NMzM5uDZr8+zdwA7CPME/AtBX3iGNCbdyNzlz1azootTl1WDPGvKrumua+FhxByUYzLGDvTa46+Mdg3sttaelj3EmMady/vswwnmQDpWJSUEpMiI8Lxdzv2AtvmOqIWiPSjBR6MdWqSSzA4KZ3yxB6GDHyVG0NYAXgkWpeFuleEnfx1x3ZAya53Lv+vxx2IotlCVyHQfp7DpUvn6b7yuFALpnRaef5esTi/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLMiFtYUW/ZOPcf56MNwM7PHA50zm6PwsXD0qf6rM6Y=;
 b=cfSvujKpEwNlzHN0ibgvEQZweEvEGDr9g9GbxarQlp/5XA9CIJhqMTADk1UcgMQ6YDj7kK5ansVqy5060JZojUVZSYHHUPzKEmLuFQffq3UcvL4qIB1T3ZLV0HnLgo9280mBMAxOI7Lpip5GvEmRrhk4h0muRa39avRLiCxslYtomnLJockUnmxpK5RP9O2jy9m3ojNLOGXkh4jD9J0x2oWmF3eDwbFEst5tPQbyAdijrmPApNYaqCmHzAwllayEYQwEApdB7aB182Nx8cf7nF6k/cB3AnCmh42o/+YlQrOrVw6DeDX8WYFD9SBqpGG4y1bkXSmMZmqtluVNp47hLA==
Received: from DS7PR03CA0255.namprd03.prod.outlook.com (2603:10b6:5:3b3::20)
 by DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 12:44:22 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::1) by DS7PR03CA0255.outlook.office365.com
 (2603:10b6:5:3b3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Fri,
 16 May 2025 12:44:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Fri, 16 May 2025 12:44:21 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 05:44:02 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 16 May
 2025 05:44:02 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 16 May 2025 05:43:58 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<onor+dt@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<ldewangan@nvidia.com>, <digetx@gmail.com>, <p.zabel@pengutronix.de>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2 1/3] dt-bindings: i2c: Add required properties
Date: Fri, 16 May 2025 18:13:47 +0530
Message-ID: <20250516124349.58318-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f1dec8-d3c2-46c5-b569-08dd947761d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Z8pPDB9fRjj+lGRVmmajOIROncBx2AyiUPv/Gm3zhTGnNCjm585tqxT950Aw?=
 =?us-ascii?Q?x8qCtt4w7U06GjGLS4tJxZBWnOesg0WpVidk6md0Wo7Cy6gTBCRNT0de5cCQ?=
 =?us-ascii?Q?MCrv+QLP4SfzuMVIghVKtM6F44tdee0xbzeknDnE1XUaeQKmUICQTyXIajD3?=
 =?us-ascii?Q?5XaHrk6eT2travUNSoaWXEaQPh7sJNWH+zqnP4XpmpVx/4niM0aazJ4JOdfB?=
 =?us-ascii?Q?ncaR/+y5qYd24rFeXhS8wxMsTXmNr1oORG4cSCSAtgNy7qQBRpe7lEClhPEk?=
 =?us-ascii?Q?5zoPr3HctSphfwJYYeQKqAHk+cERb0CdvgnHJDuNCEWNu+QbJniNQqdHbkAj?=
 =?us-ascii?Q?ckQXiqQLNlaXuxi0Jn1sD8vOG8NJh+NbaJgQX1BqaL9UdlLgeTDZ3RjJI1JT?=
 =?us-ascii?Q?rujLeUh6unfCYvhDcNxbiIQUf1CO9JUdiYwUFc90iTvXqgFGLbMCnpi4MU5x?=
 =?us-ascii?Q?Akl97BjSFBeUWVj0L66euKRpfjRCzutF9i47q8aX1Sfa5wxz+/5qff+pz1U5?=
 =?us-ascii?Q?tokqObL/19VB4MsMKeoAcka20bZMfPUq9qxsbyXUUlFd1uekAEmDk5pHdqi3?=
 =?us-ascii?Q?yWyrNrkUqd40oibeYNEJila8K36TidWukzCuZUW/ZBf55UzjY+L5hCJrOT+T?=
 =?us-ascii?Q?Jdprz1kYwtHZPvluAGsTHZPryzvFiE+6tn8PPAOlJxWoVyeNnU0MgwQwd/hs?=
 =?us-ascii?Q?WPVK98j3LnhXTLfi0aPaFOQ41BlcwgEGxVf4nHHVkA6nUlmoVsGeAcncn5+O?=
 =?us-ascii?Q?M2jET9z/iua+A9SoE3MUG78L2i7ZjZAAqHBTR1wcBof9T3RAWPOPIV5nBigY?=
 =?us-ascii?Q?D/TySzaA5OtCjQwQ9VmWBdGt4c//noUj4CiCCWu6lVQaRkyQZbGhvBZzlXys?=
 =?us-ascii?Q?YXmM7nzjWXapdygXuWgqMUJiPM6IPw7LJnHMcUAYZ1O1uuKwoAQMKZkYmv9G?=
 =?us-ascii?Q?5M8jK0LzsmGOf1kX3D96oTzK58xb+pNRVVH2i+kaS+vyxpgSVPId/Xzj898X?=
 =?us-ascii?Q?qbI+8xBBqvjBSsZ592rMZ2X94Vd1p2pivIwCykCqlPXO5xIv/gihvUEvu2FL?=
 =?us-ascii?Q?BWEoy6WSYGUZleLsSUlhNs8OtF7YX8wK6Chwp0pVIyBfPOdj5zLCRPUgfPNz?=
 =?us-ascii?Q?wURBw8H+4Qqctlwy9wNudgn2qekS3//u/ITDkY1NZCm735iWcQSAbrEZ2mgm?=
 =?us-ascii?Q?eO3J3BMgef6CPw2KaOdfZ5rQSLTHxbev7we9HhMw9eLI1Lrdd55Ea7AhnDBh?=
 =?us-ascii?Q?dovCTCRWN1SaiR9ih2x3icfkLESiETalxtdweVRXbE+3RsVXAeOS/xGRbw1A?=
 =?us-ascii?Q?hLTuks0xCK5YFRXo6jcsXHoAkaNUMm4JkxgRRpvH8cOdSQb94w7qSiOREuOR?=
 =?us-ascii?Q?IQ8zsiD8H6F1Q87mS06F871zvZQQQyjhWHwbI2OCAtkNs8LSPChRS4yrwfcR?=
 =?us-ascii?Q?7osAzqlUKfg3fxjjPHCqv0llt65D1vYZW2P56gWeE9YAhFqprsnok4W8WQZj?=
 =?us-ascii?Q?8NmPVFUt3uKKAW+nitRsfrRYby/S1xstMlVXbOKX4JTHfRdkFZtim3kPVA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 12:44:21.8428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f1dec8-d3c2-46c5-b569-08dd947761d6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106

Add required DT properties for Tegra I2C controllers.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
v1->v2:
  * Added all required properties

 .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index 19aefc022c8b..0717f2304cfc 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -118,6 +118,13 @@ properties:
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
@@ -171,6 +178,18 @@ allOf:
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
+        required:
+          - resets
+          - reset-names
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.2


