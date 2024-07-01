Return-Path: <linux-i2c+bounces-4540-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B320A91E38B
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 17:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D63B51C20DD4
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775D616CD3B;
	Mon,  1 Jul 2024 15:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o6vV0GdC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2041.outbound.protection.outlook.com [40.107.212.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733BA16CD29;
	Mon,  1 Jul 2024 15:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846794; cv=fail; b=o8a/mhoUNsiq8Iz73DeTGbDHfm1r/QAPSM+8ctWNWUBxxnVftOMJUSTyQkxtOPuIazlxXJkpAcDknybnR7z25NxBTA0QT1jqqNEITFOze883CCrQp4zYhHdCJDUexrUljplfgvXap/2Iug+8n6krvlX4/JvEncGSacGrqszNdjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846794; c=relaxed/simple;
	bh=yW4Y8MQuU8jlecl4te6Y//7A+d+g5MBxvtL9eq3yqgc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oKSZHTCp53Zf3hbta+pRQqsyixrmlLYSzeJo/wypn0wzNVfPoAWgpZTFypDPY9gUN24Aiq8e4VnFYucjHWmNK/ndKTpJQs8WoiHdnmZAPsrtMMnbEmMtOy3ZvK9DWRYt5ZaVzcEZt+if3nHOO+FMdGoLftAE3NaYEB86boacSDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o6vV0GdC; arc=fail smtp.client-ip=40.107.212.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVR9gqUNVKjgB8ujmczNzWMaOZYKEEHYxnb1uROlTZWaHpJAvvJHm2YhVAIwFl+gyCk54/REdPTyomD5x2LrmCBBTahSN4g8VjZZHILv2+jtK0NXIjpFQx++rKujAtDi0+KBIFbCPe9GtixxD0AHPdRTM7VFK4jsrUmxAsz2jmRIyiR+0qojpJLNRxgGJ1xlnIM2yt3z2/graw8cmCQFfdP7ShdYlvZj6/YGkWVzXT+Maruw+lGPdnQD5C5vSwmAIr7Jnl7dt5XeR/q9EhOMht16tGaURYbk1S4lPF3MHhJS/NlmOz9f4jDwIVbAq77Yy2oBM34xq0BP8xr0wFYU9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/xbNFYFAuh2pEJcNGT3DSCsAfI8UXgHM0H+sRgfRIY=;
 b=JYQlPxwJNNf7S3TeVWZyfmq5BgDOlfORQulD51Ej9Qqnx9wV8K0AJP3ybhy8Jz5X8gK6nHjsDmoE6yMbM13yZOtJ5G4BrtlT55J6wT15fI5GTPXbKEG0X45/dxXXMsraETkVFEqAYckQlqnHOjBn16xrRS3olLmFsxCdCSv0llT3VfhPsi397mzxtk5ooTUxhEfTbVsARujv+pumPkV7+zvkyABQMniw6hi3Xn02+RYOH3rSuFbEP/avOZKZY8x5qs97UNAkYx9Y8PMRr4qa5xh4/y7dqcVyuAhrbgh7keCpRdlGawnzVILtSUWs+sHzNSG4EvLtyYLWWbYzymzBqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/xbNFYFAuh2pEJcNGT3DSCsAfI8UXgHM0H+sRgfRIY=;
 b=o6vV0GdCJ0JNBJT2UAtwUfIVTcRpsT6xhLQ0BB64DLJ9BzdZ9fbYsvDAGbWkEygS1XyhtA8TOvX8opv30s7Bf7okuokWEt1/EuxeFa2Ym2d526D5SOVPAJgD3ZX6zEFTyBoRkTwwhmhjI24VP+1uezxpG+1FHFB+ZLaeeXCVxrN9PV089F0ocLMNoO8fRONYRsp4ogl3t8mCYLPDsr+Sf2uSV+TrQIyd9unxwC+9m6HrcJUfWpsauEm4otxoxGw2HdMxQweG9bWht2XIOLSeMnQ+Pxlys6WdhCBxSc1hYbHgdTGre3wVCKeZHW7oazQ4mWbizDoHst5TVLcaU9cBmg==
Received: from BL1PR13CA0382.namprd13.prod.outlook.com (2603:10b6:208:2c0::27)
 by MN0PR12MB6246.namprd12.prod.outlook.com (2603:10b6:208:3c2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 15:13:05 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:2c0:cafe::14) by BL1PR13CA0382.outlook.office365.com
 (2603:10b6:208:2c0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.18 via Frontend
 Transport; Mon, 1 Jul 2024 15:13:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.18 via Frontend Transport; Mon, 1 Jul 2024 15:13:05 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 08:12:49 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 1 Jul 2024 08:12:49 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 1 Jul 2024 08:12:44 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH V2 01/12] Documentation: Introduce config settings framework
Date: Mon, 1 Jul 2024 20:42:19 +0530
Message-ID: <20240701151231.29425-2-kyarlagadda@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|MN0PR12MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 933f3d12-1d11-4072-a015-08dc99e04f1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g5l05dI8t0R00fOHXSh4eetPCwiYIcAxpNlfLWX8NJewrrl+U2B+uaF/Kqe/?=
 =?us-ascii?Q?pqZsTIwXtmQo5q2v7OSX+65pVbxohRHJHbvwvba4OxEILsqw4NUYC3WBkM14?=
 =?us-ascii?Q?gWR73++a6SiaipsnSz30Et1Khbuy63BIRbQMhIWWF2RDV/4ov2n/rQzbRaTO?=
 =?us-ascii?Q?yf+j0SIyyme4rHgkeYk0JQA56Z+2WLY/EP0P3gWPhZ6kRFnU3PLeZGcx+SXX?=
 =?us-ascii?Q?V4XVpXNYvtpNcbi4JT0kKC0pQ8XXoFM3PN1rE7ewtGKsstJZ6fVGGJQCWwn6?=
 =?us-ascii?Q?ZwTmTUKpuSCd9cwp6mGtISPDr4x6XkPeRhnb9BU4A94+nZ837pNr0GhMgPHK?=
 =?us-ascii?Q?ElQJLeHNgki2hIDgVHPPTaxmVuQvHbN1cDeWGplNBwm+q2auIn7UZwlKJ8CL?=
 =?us-ascii?Q?Jou88CuasZYaHTDK/DdISWmMCsRy7ezTMkq8/Myu/PYG1PsAoVulRhxpTMyd?=
 =?us-ascii?Q?pP5fYJ1FuUYyV6H2rrmG60tapqCy2Y816nhHlttzxlfWWGX3wLLku4lYziFC?=
 =?us-ascii?Q?p8Qac6rA5mwz/YumSqpk6G7WLjNGq/cngWxu/uEygkByc3qtf1mjvVW3fr3N?=
 =?us-ascii?Q?HX684CPWdbhxYbh9nuvIhNn5hClRPh8upvjFO6vNeBEws5NZHvMPIftGeafy?=
 =?us-ascii?Q?5AOV78EDTCnHgI3cR0sZ02IjptkGd42K0XHplf8o19I2Y8HJSLUdahYVQUEU?=
 =?us-ascii?Q?Y9pzfCDArHoZOIKEkB04Xm3EmxDzKpJZJMi7aM9L3KAU9HyAqDUd+r3lRHIf?=
 =?us-ascii?Q?EFes3cQ8PHWm05UI6pYpxkcz5BkzGl8ChwdcSiUjyAvtpj9xS8VezNdM8K73?=
 =?us-ascii?Q?XXED+w7L/lOR3IeRRWq16NUFggdPgz3/5LPJCGRtysMdUCk2J23EVAAUY819?=
 =?us-ascii?Q?6E78FHe9G7pLgSDTiIORoGZLLSGOwWNnyWtnKpmnitMziIWK26D9ZTFW2Xfz?=
 =?us-ascii?Q?C/LddpxsC+EenDmnKZ3B1fD1ThsqJfH0CaGnwAWgzWk8UZN6brA+/xBwpqdV?=
 =?us-ascii?Q?nAy34FSVL+IDmtfE5vp1osc7yNCVOcRO2WZ7/IH3VDaWrLOnNITOn/U73zCZ?=
 =?us-ascii?Q?ZLc6tSS5zOoZmxMBdWulbb/ueU8KefTzcA7ioYgYj0WiFQ/zcHSQ0i8Wt+WK?=
 =?us-ascii?Q?6RltxZCBSSMLV/1bsM1IyXaFuHBegQg5BYXtpsJFNEGIDW/wUxjUIQPrbbIu?=
 =?us-ascii?Q?V/FdUQuUkFeU2VQ2khT5yj1aTcGoVyaZff9bIOMCla4AehdZSga2pBGACZzz?=
 =?us-ascii?Q?mlsqfbEm69GSKggZ0bL8bxjFPoBk/NhgDogDGeLL1PiZD7OF5ntutuDaqI9K?=
 =?us-ascii?Q?KfmWhhnrRu7N8mhxoFPCHom25JPDVjtMwWr1Fqf75KxYvauRnvmJCAckIyhU?=
 =?us-ascii?Q?YG6WpHfCBOx017y2V8L+IBwWTL7fo3S3/e8x2TJ5KsTSYFalfNZ2+0q9djfI?=
 =?us-ascii?Q?btC+jG2GP8nZRYM2RNuhbfavt7RXFjuu?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 15:13:05.6827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 933f3d12-1d11-4072-a015-08dc99e04f1b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6246

Add documentation for config settings framework utilized by Tegra SOCs.
This framework is used to configure various device registers (I2C, SPI,
etc)  with the optimal/recommended settings for a given operating mode.
For each operating mode there may be various register fields that need
to be configured and so these settings are broken down by register field.

This framework uses device-tree for specifying various register settings
for each operating mode for a given device.

Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
---
 Documentation/misc-devices/tegra-cfg.rst | 133 +++++++++++++++++++++++
 MAINTAINERS                              |   7 ++
 2 files changed, 140 insertions(+)
 create mode 100644 Documentation/misc-devices/tegra-cfg.rst

diff --git a/Documentation/misc-devices/tegra-cfg.rst b/Documentation/misc-devices/tegra-cfg.rst
new file mode 100644
index 000000000000..407e3b3449dc
--- /dev/null
+++ b/Documentation/misc-devices/tegra-cfg.rst
@@ -0,0 +1,133 @@
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
+Config settings of a controller are added under a configsettings and
+referenced via phandle in the controller's device tree node.
+Further subnodes are created under config for each conditional setting.
+::
+
+  configsettings {
+    config-ctrlxyz {
+      ctrl-common-cfg {
+        reg-field-a = <val-a1>;
+        reg-field-b = <val-b1>;
+        reg-field-c = <val-c1>;
+      };
+      ctrl-condition1-cfg {
+        reg-field-a = <val-a2>;
+        reg-field-b = <val-b2>;
+        reg-field-c = <val-c2>;
+      };
+      ctrl-condition2-cfg {
+        reg-field-a = <val-a3>;
+        reg-field-b = <val-b3>;
+        reg-field-c = <val-c3>;
+      };
+    };
+  };
+
+:
+ - "config-<ctrlxyz>": subnode in device node to hold configuration settings.
+ - "<ctrl>-common-cfg": static configuration that needs to be applied during
+   controller reset. Register fields under this node are applied during
+   initialization irrespective of any condition.
+ - "<ctrl>-condition1-cfg": conditional configuration to be applied when
+   controller is set in specific functional mode. Conditional configs may
+   override existing settings in 'common' or contain settings unique to the
+   config.
+ - Properties defined under config must correspond to a register field of
+   device controller.
+ - Properties are device specific and added to device node.
+
+Example
+-------
+Ex::
+
+  configsettings {
+    configi2c1: config-i2c3160000 {
+      i2c-common-cfg {
+        nvidia,i2c-hs-sclk-high-period = <0x03>;
+        nvidia,i2c-hs-sclk-low-period = <0x08>;
+      };
+      i2c-fast-cfg {
+        nvidia,i2c-clk-divisor-fs-mode = <0x3c>;
+        nvidia,i2c-sclk-high-period = <0x02>;
+        nvidia,i2c-sclk-low-period = <0x02>;
+        nvidia,i2c-bus-free-time = <0x02>;
+        nvidia,i2c-stop-setup-time = <0x02>;
+        nvidia,i2c-start-hold-time = <0x02>;
+        nvidia,i2c-start-setup-time = <0x02>;
+      };
+      i2c-fastplus-cfg {
+        nvidia,i2c-clk-divisor-fs-mode = <0x16>;
+        nvidia,i2c-sclk-high-period = <0x02>;
+        nvidia,i2c-sclk-low-period = <0x02>;
+        nvidia,i2c-bus-free-time = <0x02>;
+        nvidia,i2c-stop-setup-time = <0x02>;
+        nvidia,i2c-start-hold-time = <0x02>;
+        nvidia,i2c-start-setup-time = <0x02>;
+      };
+      i2c-standard-cfg {
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
+  i2c@3160000 {
+    config-settings = <&configi2c1>
+  };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index e58374b99e5e..8a60c98ac755 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22255,6 +22255,13 @@ S:	Maintained
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


