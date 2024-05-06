Return-Path: <linux-i2c+bounces-3443-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3B48BD7CC
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 00:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0311DB2480D
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 22:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A0A15D5C1;
	Mon,  6 May 2024 22:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nS2rb8h/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2044.outbound.protection.outlook.com [40.107.102.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D66215B133;
	Mon,  6 May 2024 22:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715035975; cv=fail; b=o1Logo5PnAPZF3/e0k772+qZ61nM/kwyyVY7M4w/bqqQDIoTxcOVDYvSRyFNaE+j7IbnEHNtXLCeb+idK10OL6nUiAL5LPI6jXeZtHoPXAvQFHYMeoWvsTu7BumfceZ2uzCgXE0PHwAxeA24fcZTh2T7A2dlFeYA6jX+fhhdecU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715035975; c=relaxed/simple;
	bh=Z+ceSn5c1zEMGM6W9rFL5mCCvtw6RA3NaeR54XDveT8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rAnjVQpnIVAImvF7qs1hxJQx0VIAxSzSeondgk81W/rIjrOEzPVTCbZOaoMTPsqfaU0N/7LcbcUPwJg2ch4xYTjEWM2zIIuWjWhe53ilNsi1TtIeGxriC195t+srWTtYJTAtecZXGpxdUiUqnQaa5v5N1hqCJy9c+Ml5Xifr7Ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nS2rb8h/; arc=fail smtp.client-ip=40.107.102.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ciQT+E+XnCYJIAjZT6DoTrADn0l8lnHuFE+NHNZxoP6EqxkIpXUdYjUQyYWIru3NucJiJwS3wOj1dsio2VbfWwWkYgvNX3ysCZv+Er6RXNaMTKrgytBP/VD42NuJWCVncQAvozIhmLzfd4KYVEGzHJZbe27wyVD3NnQSbwTD4QAgLjAja/u3F1lbvjkC/BfVewp1+C+y5lJvmfS1kwmBXJUnHnk0Q7G5YiIWWvjJWuYMbrty8/yYJojo8IdihimF92c0TKtRrAMG2RDNMiq5j4DDLQoCYm+k2Kr6gyFI8H4+T97sgFUUValMQm/cyECdfsC9ebvKrCk+5vu/NNHxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KuRvoty4KWkXm/UVG0NNWVGVH8+v/ZEdwh2McqxeG8=;
 b=ltRTagkCh7UIuChJ8G+8JrjcVTw7tjki5VJuMU4ZKXLaACBaDh3hmxH6HHxDxJ91srQgzU9whinZLHpcMlK7j3QUnU46ihncHf3hW6THn5E7YRZFSLw5/ECEDw4DbVVvlLUBBa3ziii2nQIsut2jDjDjSgcSBOG0ffKiyxkg24MrRP1/1sd9d9zFprL/MHTLvpWHRC+xQcudh4CVBdFrcHapbyrQfFf5ZBHckkcvyZ2A0tJqY8bLT7Nbcoa59eKP88I7jSVS0GWuYCj0Z7Xw66MeoVPb/Zlsu6tVMcaMBFOFMbVM33uBr/ZlKZdEmU65yNxt0Fs8lTELkS6Cmpe3cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KuRvoty4KWkXm/UVG0NNWVGVH8+v/ZEdwh2McqxeG8=;
 b=nS2rb8h/IgdxhOvLCFeiOnDkzU9Cn1AeB3gIkv4ls7Xc4si46WSNujz4neGI+0FDu+CkGBU7KpleuAegoVR1k4/p4XoRRN0Dc+xZs7yJywCjNymJdmHsd3TD7kqSdTLDClyVgRMDELArokCr1DH9nJcyO3DgBNkkn8Q3bDzeEJ/aUHy+WkdVIskdONqcFSv3DpodKGgw5j+3/Q1ShfCTnVEvJ1fvKt4UEC4c7fAqqCc8wMQ8fqWrGUXZ+Qd9U3HIpd59hDx+zgvsh/qurJIpg/av2dT26EW7gHsBiaAYg+8WpK9lCGxumgCGXmeMEWchZx5y3sz+rBP9oKDxx+lJIg==
Received: from CH0PR04CA0102.namprd04.prod.outlook.com (2603:10b6:610:75::17)
 by DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Mon, 6 May
 2024 22:52:49 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::e6) by CH0PR04CA0102.outlook.office365.com
 (2603:10b6:610:75::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Mon, 6 May 2024 22:52:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 22:52:49 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 May 2024
 15:52:26 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 6 May 2024 15:52:25 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 6 May 2024 15:52:21 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH 03/11] soc: tegra: config settings binding document
Date: Tue, 7 May 2024 04:21:31 +0530
Message-ID: <20240506225139.57647-4-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: be8fafb8-b1af-4f8a-79cd-08dc6e1f4130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|7416005|1800799015|82310400017|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jYXiedVG/jQYRG3reKfWZHxRXQWnd4mLyx6rqpKawQlvuoNjdPhmK+zJ3+8E?=
 =?us-ascii?Q?w7Q32fHvAhmYlfT+KY9yU4A02OeNsnuFQOBfv+DRg5S3s8gG5fSzoeGb7xvg?=
 =?us-ascii?Q?36PqOja1CgvSXRTRFVu35YulxNu8lvkOmdb0KXYQKRc/ZDO00JoaZzNVwdRO?=
 =?us-ascii?Q?RrwIW5sq0+QMtM9NUMJTsY5DHPahnbtFBLYTZQ2qaK48qX1mYREaHhMMbejZ?=
 =?us-ascii?Q?gSi/FeQqDUxoqik5zdssf9cWh7doiVSlUx7LAmhu2zUObeLN2OQFCPGKpq5x?=
 =?us-ascii?Q?d6ogRuLJowVgCQH1j8ycUgJNDPTF1sBzsf1ckrDvUyqTn65biJosVmtpdnTE?=
 =?us-ascii?Q?qavnSal3yAqEFiSS956v8QIRBtktUmGUsjYg7xT06wYtLx+wtVdUEiYArXbc?=
 =?us-ascii?Q?qFjiO4FeEJa+oiNJvVsKnEhQfEz59ZEjy54vTQqSsZq0dIGnjUWsKO6us+Ij?=
 =?us-ascii?Q?3SC5JUQ8JWuZD0XTkZRkb+tUzvl8/ty0se7MWmEjK1Tc295Eu0Q9O1lGMFmW?=
 =?us-ascii?Q?d3QihrJlTkKOt3cxxGL4MlQvCh/uTrC8Al3OT6xSjO02fp/EdZr34HTJrOzF?=
 =?us-ascii?Q?wWy387he+bUFEgS2ZDAB8kxkjsQw3aTW4fHfLfrSM/iX1IMTppi6vgfi7nel?=
 =?us-ascii?Q?4ai7OTtFB/UXOgFhLH21HePiapSV+6Zxev6KMrAGKxhr5+l5Wjw3FXc95+/O?=
 =?us-ascii?Q?ei7KXgAsOqOuAutWMuzYJynMBsxFFnbLQ1WEAQATDgXOnWs0O8l4CTCPziRk?=
 =?us-ascii?Q?N4cqfZXOET8Ntta6Gjapb/gAEGUtmNsKBZGnmSOmMf5Wz8p7i1wQOTAVE6Tf?=
 =?us-ascii?Q?C4Tm3BtuOguY+NxJckA3zu6hoGWHfkOadbx1noGfm+kgC5DQfEYgsRBazWSR?=
 =?us-ascii?Q?cl6QfO+62vnB4BrmtG7O8f7q6UPcwzM3KuqIhp8Kz4GkkYwOhoP0G2vUdNpv?=
 =?us-ascii?Q?Ect12qlqj6PuX5Kuvk+2wjnd1N9bsTzmOfTZtJvy9Ny5If8D8C68uTOp+AA8?=
 =?us-ascii?Q?voqnXDVstvp8iDxE2AaZAU+r2AZze0YF0Tqj3NyjJSjdZUP6ZBnMu7Xcw47H?=
 =?us-ascii?Q?2VgWoV2LIeR3H0UniMqxKwra55JB3wNpfTll6+i7nDfXAj8Na/psoPj1PQIu?=
 =?us-ascii?Q?FDB+o6Urb157gVi3w0qpXOS1HB9Z6VfOFMj7gP0sfsRWiBSb5JuktRvEOEnR?=
 =?us-ascii?Q?OlHD2B6jtmDnhfOqUL5K4z19iU+qg8rM8Iq1q4Kv4/CSKmskfAgn76/DrEjd?=
 =?us-ascii?Q?oC2jmpUwnAb81Ylur4um97pJYuUP6jy5P5w8bGOaHKmU0xoJ7SglSdbZeLc+?=
 =?us-ascii?Q?FlnKUzRWPlb6IcY/HihHn2+1kNdH+SkQ/KPEdQu8WleNdCsc3NxgCvJGjGZQ?=
 =?us-ascii?Q?S4Yb32fMKj/zepY7lDQgtl+7z5vn?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(7416005)(1800799015)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 22:52:49.5099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be8fafb8-b1af-4f8a-79cd-08dc6e1f4130
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

Config framework parses device tree and provides a list of register
settings with mask per mode to be applied by the controller.

Add binding document for config settings framework. Config settings
are defined as a property per field and have different modes per device.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 .../misc/nvidia,tegra-config-settings.yaml    | 50 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml

diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml b/Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
new file mode 100644
index 000000000000..e379cbd5b597
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/nvidia,tegra-config-settings.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Config properties for a device.
+
+description:
+  Config setting is the configuration based on chip/board/system
+  characterization on interface/controller settings. This is needed for
+  - making the controller internal configuration to better perform
+  - making the interface to work proper by setting drive strength, slew
+    rates etc
+  - making the low power leakage.
+  There are two types of recommended configuration settings
+  - Controller register specific for internal operation of controller.
+  - Pad control/Pinmux/pincontrol registers for interfacing.
+  These configurations can further be categorized as static and dynamic.
+  - Static config does not change until a controller is reset.
+  - Dynamic config changes based on mode or condition, controller is
+    operating in.
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+
+patternProperties:
+  "^[a-z0-9_]*$":
+    description:
+      Config name to be applied on controller.
+    type: object
+
+additionalProperties: true
+
+examples:
+  - |
+        config {
+            common {
+                nvidia,i2c-hs-sclk-high-period = <0x03>;
+                nvidia,i2c-hs-sclk-low-period = <0x08>;
+            };
+            fast {
+                nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+                nvidia,i2c-sclk-high-period = <0x02>;
+            };
+            fastplus {
+                nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+                nvidia,i2c-sclk-high-period = <0x07>;
+            };
+        };
diff --git a/MAINTAINERS b/MAINTAINERS
index 9eeb749ef234..a8c0cfd1d5a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21996,6 +21996,7 @@ M:	Thierry Reding <thierry.reding@gmail.com>
 R:	Laxman Dewangan <ldewangan@nvidia.com>
 R:	Krishna Yarlagadda <kyarlagadda@nvidia.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
 F:	Documentation/misc-devices/tegra-cfg.rst
 F:	drivers/soc/tegra/tegra-cfg.c
 
-- 
2.43.2


