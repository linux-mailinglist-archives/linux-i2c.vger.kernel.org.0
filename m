Return-Path: <linux-i2c+bounces-4541-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBE991E38F
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 17:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A795B283D71
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528EA16D326;
	Mon,  1 Jul 2024 15:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZRLsPF4D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2045.outbound.protection.outlook.com [40.107.212.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CED816CD3A;
	Mon,  1 Jul 2024 15:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846796; cv=fail; b=WNXyWq4DUHgx5ScQ3+/1CRcpJfriCpLyBnqibNbP3SsBkhU4v24v5MFUG1xWdjmxD198AWqHmGNFtctCNKthogYlE675KY2V8yjRcqq5ZaqecD7QIiqx1ix89DVrlIiMILgK9co/atreo2wnyKDrFLHISpN17vKjNAUrlsHKdvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846796; c=relaxed/simple;
	bh=6gQT/P/VSwOBeFGio+biaVSavkSkEqKVWVxiDBna1JM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eI8xq3NhgCEeH7tadO5WAUqrDBqvrjIsOUJJ2Ay+WNCbmmp2pSSt2SgVHC7bAedwh12Crt4btgDsvL8s/FQYsHPV06B9oyOorrA++kyJs9pD5tsBLIBU0SaBEL3204o+wEydeuUIz4zbC7MMDgQMZS+w3o2bJ1Nz85+wSA6DR0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZRLsPF4D; arc=fail smtp.client-ip=40.107.212.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAIQj31if5BoRopmVxvciwCmhnDUqMV1CPUgIYLC3plk8DXsjsbJsdChD/SU2Mu0MRLvMcqnVLmeL4mWEwPmXIJQqat5tjVb/UiPULSMOiYa6ERVuIcVfp1uBtvm9xGLO7pwJIEkkgAEVzdaX3nYEUEG9pVYK76ErSzR6uRMVwtUciT89Om7Y17bMmIaH2yS5l6XgNSVXkBAeVLSyWALllVhj8mQYEQb9lzeZ0sFMdjYow3ElxUV2ncbJ/YgkDp2M7TlVhlZtoGeVldvK6j/8eqEstjvGp9A1fllCwXXt3nmBxQYqqYhFMspZRUpWtPHRi9derWD+VPlafzYUk2mJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ARZn80MDI8ALmMhWYO2ZasUD2KxXXSpRnp2BFL5dRI=;
 b=dCHqC8rf/oR/H9+wZoXXIBoZAQmuHZ6Tj2Pd/6gfY1ytoVODoyBpAq7jVta1Ybx0fdbc2i+B4CAx8cUZlpoEg+EKeAU+axlrBl68SYyjlwoHilP8mKO/rfdjsYQcmA7ANRQksRYkGCe8z1eaxBei6fh9l/wSjJl4xswHm5JzqcUgN5VD83XBspij2I75Xty0R2teXM5hJ94eozBe/YNBXLvPbZ9pPW8LVs/V0ZaZP+GP4nA3nscIiTNUzzpS5oOZgzWhbfBtb/lGswu2J6EJDWNVLqZqXoRvSBICxuKE1ph6wrd3uPQdo2umKAvxI+1CYDNK+VlbTnFs2ZiB5ai3vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ARZn80MDI8ALmMhWYO2ZasUD2KxXXSpRnp2BFL5dRI=;
 b=ZRLsPF4DXtjZTEriJeiVOH7DHpzpXZPDQUsj4AwbFHQpLyKPEPFZuZK5zqP2IDK6n9hesSAx2f7pP5RfTjcl46mJTGMlg4shstFPfzI+6hE6uMKNMa1iVvRm/G5EtJqwubDeBeld4z2S+0W1pZPBiaDFwqbO1W27HRyTHDkhy2FQBiptm/cylDFEZ7IVcHke3nu26OEfUTBm9+4FnsdecQdanBuA3muIYPPMRfoLdrvlhK6Nj4wAjlEwyzLkRcRE6NzNbVT6JCYdMaHB74EkciZhSntKYGMaGmgsWxU47c4FbCeX3R/sCCiiTXRLhrGUGlOPQvZ1cz71WOCQz0f5Tg==
Received: from BL1PR13CA0138.namprd13.prod.outlook.com (2603:10b6:208:2bb::23)
 by DS0PR12MB6462.namprd12.prod.outlook.com (2603:10b6:8:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Mon, 1 Jul
 2024 15:13:10 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::e4) by BL1PR13CA0138.outlook.office365.com
 (2603:10b6:208:2bb::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.18 via Frontend
 Transport; Mon, 1 Jul 2024 15:13:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.18 via Frontend Transport; Mon, 1 Jul 2024 15:13:10 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 08:12:55 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 1 Jul 2024 08:12:54 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 1 Jul 2024 08:12:49 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH V2 02/12] dt-bindings: misc: Tegra configuration settings
Date: Mon, 1 Jul 2024 20:42:20 +0530
Message-ID: <20240701151231.29425-3-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|DS0PR12MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: b38aea5d-7e51-4211-d57a-08dc99e051bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pl92aCLP6gpeN7XnPKAmwafwkGjYOOqoUvAfN6+eV1h1j5iB/kdGAscTHi+W?=
 =?us-ascii?Q?GPh3LZkq/5aHQscKz8R/hj+0gzlqxhECQcshi/VlN/XZBq6ZM3Cb2HHy6Czm?=
 =?us-ascii?Q?yvxECiXdQ8cykndF4n2QlAgy7z/jX6vfHuG7fjjVnhp6zUkHP92yWrW6Hr8n?=
 =?us-ascii?Q?ChcrSm6SROFJO9GD44FDegDk4QuFyAHDXBNlCQjwFPiwZPZzeo2BZFkEcQZj?=
 =?us-ascii?Q?4Sjc27LNzaCuEFFe0e8iBDicls1wkBOZxQK/xrZOi4Ow7Q3R+anB0FKI9MMJ?=
 =?us-ascii?Q?g8vp+tY/EcQ9Epjjmbb3z3NMwTowoMya+pKReGAlA18n5QAFbolFgJVwZnbj?=
 =?us-ascii?Q?WnjsZoMcimPtqeqHhm84xfC1TjCf53xpUiwLrdBu1ONY2AQrFGu4zH+Eosu2?=
 =?us-ascii?Q?8tJ0OhBVLZvXn24xa2zUebY76JpaMNTwFiz7rJtqSc4YNpX6lfO0GTHGBIRF?=
 =?us-ascii?Q?AdE7KHg9jV3y6083s6Bx76V2tv3xuSvGz/BYasZOLUYqYoXmTcG8DqD5T77/?=
 =?us-ascii?Q?t/hVvjMnQZ1NyMv6ePY1ceqCfyWUGx5V1UeRcYyx6fZWBU4De+LBXZN2D7xj?=
 =?us-ascii?Q?1XN1Wj1c6ZrpkLr7K99He3TbpMhIrmNR1QgA8uzHMrPTfHbXN5CpV8tt+V4M?=
 =?us-ascii?Q?HolO/DYwTE76dMc3Yb3FWES0jwNEKND+ssq1TNtUznifg3alJTLfJx18x7Nu?=
 =?us-ascii?Q?cjhN9EE9T8RJylMVDXH9LN8Tanuu3Xbrkll1SX/epaZqL9BtyQvoIMjmfLEx?=
 =?us-ascii?Q?AsIjf6rkPuokC5hP/phcJsgVQ4/7sUK5rca3T69jfZSU8lUEIB0k7ECgIHYs?=
 =?us-ascii?Q?wUzfZ3Cvz5/IO5cPFrQplO4E9QPRD9Q1u/sQSg05mStGp28DUAYqJLbEtYjk?=
 =?us-ascii?Q?RTt1SQ1H2IvKpAxz0MSDJnsfK3aBD7YtexFnpijV4x/f2mX2w5w/nefm2hk0?=
 =?us-ascii?Q?s0ZC19TClhX45EL03PZPmQ2RGy7Y/TxPMdS/d608oXgFo083Q71cVaa7XwPx?=
 =?us-ascii?Q?nsCpdJ/R9R/rLjlD87mmCilEDDDg6jqIbTabXp0D7kYvW0QNimvS5DrWMbk1?=
 =?us-ascii?Q?3qYGkyktWmEHp4tNQUWbMzVtNNTFNHcrt/sL+2qbbAP4F53SzJTufSaPAVGy?=
 =?us-ascii?Q?z+eSqu+gx+pZNGI8OUJrWl+tZdjd67T+OjqdakVtjbfj5DAdyfSSlBY/Ki/h?=
 =?us-ascii?Q?MkG/8ai6vYtDcKGyNhIzykGyZZ3rh0F9F3P8ZFkgI9Rirc7esFv68DgZkU+/?=
 =?us-ascii?Q?ZgJK3envIwDjvAb1QmqqnOafHTNOhnsDM0Tf9cnNCz+LChOw4jRkPbMu1GyS?=
 =?us-ascii?Q?qN40TkwFyVVTlWOkx9CdZOqmR6j7o/+r7lrNHSa5RosPE/E0ztxquWx00IdB?=
 =?us-ascii?Q?HycotNVbnGLYkq85JHSeI76rDClvqzfQ9ZcUMfaK/k7dRdlDmsDT5aOq0OKQ?=
 =?us-ascii?Q?3sA/6/H3YMaZS4nHl6b038JVNQ6qMAMv?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 15:13:10.1103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b38aea5d-7e51-4211-d57a-08dc99e051bc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6462

Config framework parses device tree and provides a list of register
settings with mask per mode to be applied by the controller.

Add binding document for config settings framework. Config settings
are defined as a property per field and have different modes per device.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 .../misc/nvidia,tegra-config-settings.yaml    | 62 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml

diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml b/Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
new file mode 100644
index 000000000000..4e5d52504c01
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/nvidia,tegra-config-settings.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Config properties for a device
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
+properties:
+  $nodename:
+    const: configsettings
+
+patternProperties:
+  "config-[a-z0-9_]+$":
+    description:
+      Config node representing properties of a device. Properties of
+      each device are listed under a unique subnode and referenced from
+      device node.
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      "^[a-z0-9_]+-cfg$":
+        description:
+          Config profiles applied conditionally.
+        type: object
+        patternProperties:
+	  "nvidia,[a-z0-9_]+$":
+	    description:
+	      Register field configuration.
+	    $ref: /schemas/types.yaml#/definitions/uint32
+
+additionalProperties: true
+
+examples:
+  - |
+    configsettings {
+        configi2c1: config-i2c3160000 {
+            i2c-common-cfg {
+                nvidia,i2c-hs-sclk-high-period = <0x03>;
+                nvidia,i2c-hs-sclk-low-period = <0x08>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8a60c98ac755..ac8410ed421f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22260,6 +22260,7 @@ M:	Thierry Reding <thierry.reding@gmail.com>
 R:	Laxman Dewangan <ldewangan@nvidia.com>
 R:	Krishna Yarlagadda <kyarlagadda@nvidia.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
 F:	Documentation/misc-devices/tegra-cfg.rst
 
 TEGRA PWM DRIVER
-- 
2.43.2


