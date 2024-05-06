Return-Path: <linux-i2c+bounces-3441-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 433298BD7BF
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 00:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE2441F2268D
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 22:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA2B15D5C5;
	Mon,  6 May 2024 22:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tCfHpNiL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6A315D5A9;
	Mon,  6 May 2024 22:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715035954; cv=fail; b=YC/e077PdEt80NhIpvJ4Ae6ubFv9aysWBZi52HzSWXHD3jrd0h6S3SdcWXTvoD3FIaZAsqtnZIkPPT2sNyra9ktd+tijOFtv3PEsaSoUlzMLGEMUsAlIARXcrnZjT3mqNXN+DTi8yYBYCSTeqZeJIprbHZw0jQXPAYp5vPNzu7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715035954; c=relaxed/simple;
	bh=Kkq0y3Z2UElReYwPOoFUNOoAO3+JvI4tFshPhhZUg7A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tM+57qyVlU35wDkfAO/MMMN8FHQPjNGVDmoOElmG9Gjb++72ZLEQ6Y9FpzTCLaitom6W808iXbwbgGVXPqx68Ps5IOO0zBjNqlV3W0jG/iZ8dnAQ6pIlfSPCCagn+y0bIRSgGtuwzF1uJLDGPzv+xB6zRabbq0GwW4pKkQj/yHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tCfHpNiL; arc=fail smtp.client-ip=40.107.223.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/4JCj4S0UQv48xSIO20fAYM7pBwd3YsEgl9a5sUaOjPfw4LeRuAKFOXF76VmlYNlJhqQeiadGObATVN8gj5T9TX09OU32Uv5kKduHPHToHHAYsEPhE84kHaTECfv/D24oCHQ4ro4a/oU2AA6al21VNywntCBrvhgDzJnuVwqk7yA/S7V1Z7xF3Na6hTviNGS0/ml6llq9YcG6MumYEgES/8Y3uUdj5/AP8bUuGjdYMoBG76536kezRVVeNBiMFkUpG1E1wh7aPhoRbfH64sjGPggrgYg9TUA0J2HH5h7sMihyTx217bF7kS35WoiI6ZziczodOUa50VoegwDo+Stw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUtaoCuNX4Rx/0K+PV7JINzAsPZmH1ZYPtFIuDXviKI=;
 b=kkfLEHH5/b+Wl7Zafqi3QbR1q9i/UW7jcqR/tgUf/iA0KYzleY/X8Izwx1XU0ZMaek8VMnaUDc4VRgWmna6lMq8QXOa/nNUOsrXw5Y6XHaViExaGkExodSNWQR8s8cGelXrAN98QBKROB0qBrpokYfSTBdMiXOLg8/IBCYR1lXxP5e7apZyZSpo38eX4UHceY9OTZ82e7zUv3jiGvIVAbiKzSe2oQEOpxtCh0dEB7gCqKQwi/RsL9F8cfnBj4OU/2qMIluLtL9SjS2sFnm+CTzS3vwaaiQj/xMxDOe8nFIsBJYPtiWEm1laPxTP1Tx1HBF6GZqg0ekMPaVzp+5/1gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUtaoCuNX4Rx/0K+PV7JINzAsPZmH1ZYPtFIuDXviKI=;
 b=tCfHpNiLITv+Tl6QJCW5i00b41BmxZSvJGVlXKPjx+6GjIqrfkOYpH3daXGkCfW22yooS99Ei4TDe6g7EGuqGu1sX/yP6nDiw5WxT6KDiWID0k3MtoEbhhXPMtI/5cwo+78A8ssGxMJdj6qKBpeEuPQ4cM1MsBgj9PMIv+Sq2cq9neqCu8r2hLDcFLqjii/ySYxX5dyu2ggL9AXT8ejUA2AumruuFIiqsIcngH/lj8vFBaQ8C8zZ3JpY7HDZCGwJ8IVAFp8qDOYkyVdQ3kgW3G6nE0B0c9dGsUEMB05cf97YalIBD1XSB+wYZ4H3Wke3G6Z+vYf13Ebt3g5w75nWjQ==
Received: from PH8PR07CA0033.namprd07.prod.outlook.com (2603:10b6:510:2cf::20)
 by IA1PR12MB6580.namprd12.prod.outlook.com (2603:10b6:208:3a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Mon, 6 May
 2024 22:52:28 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:2cf:cafe::b) by PH8PR07CA0033.outlook.office365.com
 (2603:10b6:510:2cf::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Mon, 6 May 2024 22:52:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 22:52:27 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 May 2024
 15:52:15 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 6 May 2024 15:52:14 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 6 May 2024 15:52:09 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH 01/11] Documentation: Introduce config settings framework
Date: Tue, 7 May 2024 04:21:29 +0530
Message-ID: <20240506225139.57647-2-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|IA1PR12MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae6fd2f-828b-4df2-ee2d-08dc6e1f345a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|7416005|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZKoeiJR/P8/hU09cZKUkIrXpr/c3i9YlnDeBDsJCdOSNjjiOifyUd90oMGcy?=
 =?us-ascii?Q?sxKUVt3u476duZoIPWDG36MnDTd5VF/dkIVnKz7LrK4L5uASPNlVeZ3gO3Uj?=
 =?us-ascii?Q?0iUQYT8JNiXdSz2kwC72dGFEMzHh8LCy/UFdS1Bg/1K4v4tcOei4B4qP96Yg?=
 =?us-ascii?Q?BdJTysrzjkk2qjD2/CtnZqFzRkVTFtp8Rs1302M84dsR9hMDjU/03OALbdqP?=
 =?us-ascii?Q?K9BwXX3RFnsjFAK79fApum40EcXP3cDOnNFgS7rASoLa6OmzED0LehrJcbma?=
 =?us-ascii?Q?CHrsOK6LdAi2G4uDpkgeXZmDpJB3hz5vR6ZWL45u0eUU/w17JqQcWiHEjKbc?=
 =?us-ascii?Q?x0noJrRn8ZlcxYtUcU3nQaVaYC/BEAYSu86np1dYbChvAFoWgv/JEODuvsoW?=
 =?us-ascii?Q?3wRvxABw65tTwRJuTaXOQhdkoiod3jRzUQntLzRpxbLdmruv/N8Qdvp5wX3S?=
 =?us-ascii?Q?sU6ccatKs4gleXJtiHRswSOKTNHYNBxWqCk0xs3VYSCNgdPA7kTP1S4ttdc6?=
 =?us-ascii?Q?SMEyaApoym1e1CngLy+sgj4xnaMR1E1v6PhQ9GgEJ3bY645i+JiHP3NidG9b?=
 =?us-ascii?Q?HOuEJgVrNcy08X+AyIQjDixpl5P7Lf5m5+eH6OQRgEuHM73hhRHQBel9z8A0?=
 =?us-ascii?Q?DW+hR2e85KFmtNxZ49w/pFOTpdsXB9p2FnW9Os03YzldE7XDgqWjEtr6b/NG?=
 =?us-ascii?Q?AGklm15W0JqM1DNA7ztcvBrUclEeoT2nlHcMlPaqJ9pzF8Yh8W6OybykEBLL?=
 =?us-ascii?Q?tr6IKVQ3BYhLlwOz/rFaahMDiMRQvVvYlAaXf+1gcepfuLUDv/OnbmR0wnxF?=
 =?us-ascii?Q?mCgUHxB+WxzM+5EKG/b3tUMHJhw2uIbkZBUbWz9+fCD82mCI/m2DY+0n4rK3?=
 =?us-ascii?Q?v02qOvorBvRUkvLVFi13MerAmxiZLC7dayL3paCvlDwxrj2gnaxoCTs4xJse?=
 =?us-ascii?Q?Nc77vPbK/9pccbftnd1hTN7qn8G26teQ2OstRpSrIQmVVu1qb+qPUMwDxbpd?=
 =?us-ascii?Q?vo2g+6AWV2wgnaxfkuO2s2QS+EWTroBmvQlemVNWac2M+B9mbFnBaERD2rW2?=
 =?us-ascii?Q?FeCFs2HLzMNEqAiTafDJ7Z2s4OYXE+GdP+AfIAz/VoNNWtR4so5TM0wWBz2R?=
 =?us-ascii?Q?Vz3U4H8h4BgLmyc9voM9C3LkIT9mHWfN1QvYUTaXCCKUjMb9k4GUYmZNnPor?=
 =?us-ascii?Q?6jsQTM6nbgzk4I/Bp0Mu7kdGrgFTFJ9f/P62f/R2KrkqfByEjZuXxfCWAzsb?=
 =?us-ascii?Q?METpvoXawwBT5ApXwLCAn31+xYetmh6UlIF1oakydP95hhHqN+7IHkJYkQ+0?=
 =?us-ascii?Q?/HDs4WSV7MbYUCuCkE1GTHEChvAm2GUp0UA2wg9v9ia7e+HqWSasW7TpwODn?=
 =?us-ascii?Q?zSdnzvbJ8qS9rPftSW0vQWmN1pkg?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(7416005)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 22:52:27.9777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae6fd2f-828b-4df2-ee2d-08dc6e1f345a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6580

Add documentation for config settings framework utilized by Tegra SOCs.
This framework is used to configure various device registers (I2C, SPI,
etc)  with the optimal/recommended settings for a given operating mode.
For each operating mode there may be various register fields that need
to be configured and so these settings are broken down by register field.

This framework uses device-tree for specifying various register settings
for each operating mode for a given device.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 Documentation/misc-devices/tegra-cfg.rst | 128 +++++++++++++++++++++++
 MAINTAINERS                              |   7 ++
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/misc-devices/tegra-cfg.rst

diff --git a/Documentation/misc-devices/tegra-cfg.rst b/Documentation/misc-devices/tegra-cfg.rst
new file mode 100644
index 000000000000..be3926ff9a3e
--- /dev/null
+++ b/Documentation/misc-devices/tegra-cfg.rst
@@ -0,0 +1,128 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================================
+NVIDIA Tegra Configuration Settings
+===================================
+
+Introduction
+------------
+NVIDIA Tegra SoCs have various I/O controllers and these controllers require
+specific register configurations.
+
+They could be due to changes in:
+ - Functional mode (eg. speed)
+ - Interface properties (eg. signal timings)
+ - Manufacturing characteristics (eg. process/package)
+ - Thermal characteristics
+ - Board characteristics
+
+Some of the configurations can be provided by device specific standard DT
+properties like speed of interface in I2C, rising/falling timing etc. However,
+there are more device specific configurations required to tune the interface
+based on execution mode or other runtime parameters. All such configurations are
+defined as 'config' settings of the device. This configures a device to operate
+with the optimal settings for a particular mode to improve performance,
+stability or reduce power.
+
+These configurations are either static or dynamic:
+ - Static configuration which is set once during device boot and controller
+   reset
+ - Dynamic configuration is applied based on a particular condition like bus
+   speed, controller mode, peripheral connected to controller, SoC and platform
+   characterization
+
+Static configurations are provided as common config setting and dynamic
+configurations are provided as mode/condition specific.
+
+Background
+----------
+Slew rates, tap delay and other calibration parameters for an interface
+controller, are measured through characterization. These values are dynamic
+and requires different values for same property / field.
+
+Use case
+--------
+Tegra device drivers that use these config settings include:
+ - I2C uses config settings to configure setup & hold times, clock divider
+   values.
+ - SDMMC tuning iterations per speed and CQE values can be set with this method.
+
+Device tree
+-----------
+Config settings of a controller are added under a child node
+"config" of the controller's device tree node.
+Further subnodes are created under config for each conditional setting.
+::
+
+  controller@xyz {
+    config {
+      common {
+        reg-field-a = <val-a1>;
+        reg-field-b = <val-b1>;
+        reg-field-c = <val-c1>;
+      };
+      cfg1 {
+        reg-field-a = <val-a2>;
+        reg-field-b = <val-b2>;
+        reg-field-c = <val-c2>;
+      };
+      cfg2 {
+        reg-field-a = <val-a3>;
+        reg-field-b = <val-b3>;
+        reg-field-c = <val-c3>;
+      };
+    };
+  };
+
+:
+ - "config": subnode in device node to hold configuration settings.
+ - "common": static configuration that needs to be applied on controller reset.
+   Register fields under 'common' node are applied during initialization
+   irrespective of any condition.
+ - "cfg1": conditional configuration to be applied when controller is set in
+   specific functional mode. Conditional configs may override existing settings
+   in 'common' or contain settings unique to the config.
+ - Properties defined under config must correspond to a register field of
+   device controller.
+ - Properties are device specific and added to device node.
+
+Example
+-------
+Ex::
+
+  i2c@3160000 {
+    config {
+      common {
+        nvidia,i2c-hs-sclk-high-period = <0x03>;
+        nvidia,i2c-hs-sclk-low-period = <0x08>;
+      };
+      fast {
+        nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+        nvidia,i2c-sclk-high-period = <0x02>;
+        nvidia,i2c-sclk-low-period = <0x02>;
+        nvidia,i2c-bus-free-time = <0x02>;
+        nvidia,i2c-stop-setup-time = <0x02>;
+        nvidia,i2c-start-hold-time = <0x02>;
+        nvidia,i2c-start-setup-time = <0x02>;
+      };
+      fastplus {
+        nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+        nvidia,i2c-sclk-high-period = <0x02>;
+        nvidia,i2c-sclk-low-period = <0x02>;
+        nvidia,i2c-bus-free-time = <0x02>;
+        nvidia,i2c-stop-setup-time = <0x02>;
+        nvidia,i2c-start-hold-time = <0x02>;
+        nvidia,i2c-start-setup-time = <0x02>;
+      };
+      standard {
+        nvidia,i2c-clk-divisor-fs-mode = <0x4f>;
+        nvidia,i2c-sclk-high-period = <0x07>;
+        nvidia,i2c-sclk-low-period = <0x08>;
+        nvidia,i2c-bus-free-time = <0x08>;
+        nvidia,i2c-stop-setup-time = <0x08>;
+        nvidia,i2c-start-hold-time = <0x08>;
+        nvidia,i2c-start-setup-time = <0x08>;
+      };
+    };
+  };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index eea74166a2d9..c788ff0506c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21991,6 +21991,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
 F:	drivers/mtd/nand/raw/tegra_nand.c
 
+TEGRA CONFIG SETTINGS DRIVER
+M:	Thierry Reding <thierry.reding@gmail.com>
+R:	Laxman Dewangan <ldewangan@nvidia.com>
+R:	Krishna Yarlagadda <kyarlagadda@nvidia.com>
+S:	Supported
+F:	Documentation/misc-devices/tegra-cfg.rst
+
 TEGRA PWM DRIVER
 M:	Thierry Reding <thierry.reding@gmail.com>
 S:	Supported
-- 
2.43.2


