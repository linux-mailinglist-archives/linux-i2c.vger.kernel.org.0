Return-Path: <linux-i2c+bounces-4539-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7197D91E386
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 17:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94A6D1C218BF
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 15:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABE016C86E;
	Mon,  1 Jul 2024 15:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qmmaXEjP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1055828F1;
	Mon,  1 Jul 2024 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846787; cv=fail; b=k8/t79suV4legF9d2dW5KrbHMzuVV5iEPH788xc5Jqj8tZYXRkR3AkuCfWT5sMYR15YNh1Uh2dOIxGYp36s5Cz/C/xCtdr2KEMH6hEmVCHvYPXAi+nisCR71ORZZuRHt2RA6tULgiLwb1LVKRCVhq7DIvhaVlcDYN/CB0wXXxr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846787; c=relaxed/simple;
	bh=VzsrYVXigtjIrSguaul1Jv0jA7NwtHHUT5gVwhXmW74=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eSDhAcISg7Urv7gWD91etE0mXZM8ettSeHpJKns22kfyf6JTCGFsmRGeRCskW49WHrdh83pX3Qne3xSuhUvzmNM7xC4L0BZQKPoeUqdUdePyaVH22gvv+1KIGLR/6tFQH0HIRGLoNQWyiODuqGBs8ubh1Rh1BVsyH8oR0Ox0eAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qmmaXEjP; arc=fail smtp.client-ip=40.107.243.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vgj0cTAwSCfY55ip56KhyIXyeX8rA/Rony2YKFxp8grHPyCAi31w0rnczTWuXob35BQhbyoolAtQSLMbYRLGcLBBgcPbfEhwfNYRGqN4PUEqlz3Yx+AZWfr82u1M7IAk99tBlAB5t7BQFwe+JtKMniibPUXX2HXgix2le2xhUu0CIot9YQtU8MZRRXn+sHg1TKsrpdQayMmvKPl9hkubvnpQSFOTSSFEA8EVoMvd3rgKoOzdMl/pfqA93+xx8CZtnzvxk9Oxs2FmPW16OSp7LVj/qxoDNRFkp17gCkaH1YApBj3vIxRkEBBpaxuwnGNCRdv5B0krYieBKO7arSHjXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8vSOII11PeDEwyafZW00PUFtAiuMLKXJbl28oxROgE=;
 b=cqxnjXIN7AMdk1Xeg7Tqel7bLzH6CKleexc73oG3D27mMvm8wg/etWX9qz01gSKDY3gxjtukaBPWRxDN3d7a/FL7WpvBCf8vaNJpXrUwHMYIg4uL8it+QdF3yCj7G+OWsLdIL5mD8NG+xpuUA2dxZMd1Iw2Qi0Sn6gUk240M79trfG3NIBW+AQZK39OoLRO4USgire/c4b7Ye1ZKbjyk9f47XvdpTaYfIuBVDgOCG5b6Wl8heY/GkQs78QqXCUzgTlU5ncHmNk4u/Z3DObRgvH3i+l/U47jvzOxZ4j8mMtEY3b7Dt/Y4+qskV6xA683wHtf+OzKtRfUxlK7ff/zdlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8vSOII11PeDEwyafZW00PUFtAiuMLKXJbl28oxROgE=;
 b=qmmaXEjPrrTx2ffeRTtWFInS2ODYtxf2z4DKOK03sL5fGEO1nu/z09nz4T9kKm8j0rwtp6rElsBfxD+WrpSNEn5soI0uv89nECZ/4XDeeMgpfrBVSbGPWV6IdWUBaetV7sBfDb+3PC0StRBshR2HxA9NR8Wb154x3k+bjtEjWLLC60sJnK/BwS0Ptrhpw49IKSeYAhod3eZXk7FePPmENFgFqaTNmpylRiPC+I29SIl08dO6vm7cjcw5FIYeGqhf4JAaJ0ee8iAN/tGqSvrgOYkNpvhgXMhTQJTxT6xDOdmY/HB/dvoX6F853xrtXHrpzKDbhKkJDsFRSQaouzrgXA==
Received: from MN0P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::29)
 by DM6PR12MB4217.namprd12.prod.outlook.com (2603:10b6:5:219::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Mon, 1 Jul
 2024 15:13:03 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::60) by MN0P220CA0001.outlook.office365.com
 (2603:10b6:208:52e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33 via Frontend
 Transport; Mon, 1 Jul 2024 15:13:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.18 via Frontend Transport; Mon, 1 Jul 2024 15:13:02 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 1 Jul 2024
 08:12:44 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 1 Jul 2024 08:12:43 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 1 Jul 2024 08:12:38 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH V2 00/12] Introduce Tegra register config settings
Date: Mon, 1 Jul 2024 20:42:18 +0530
Message-ID: <20240701151231.29425-1-kyarlagadda@nvidia.com>
X-Mailer: git-send-email 2.43.2
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|DM6PR12MB4217:EE_
X-MS-Office365-Filtering-Correlation-Id: cd69193a-a603-461c-52d8-08dc99e04d4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ThGk3DPzK4fsYBRST2UB52I67/dOYFKS7TTYVNMahwYNmy/vw9/EH+x6LOIn?=
 =?us-ascii?Q?YKy2aNKuWQ87wqRezrj1R7vKWnKa7/dl+WAB+nhjexlf66h6yLRyrKjr2jFd?=
 =?us-ascii?Q?73T1GR44mcNoxs2Vzj8iBfBPYSyyyTENuuaWA4pOShvOVUyAExdkPx+DUWAl?=
 =?us-ascii?Q?Cff8sXx7sZbKJKN5uMIY+S9EJBw8KlTCQ2LUgYMv1vNtywjG5iT1r+fmmMBR?=
 =?us-ascii?Q?uq4mwGAL2f679ECkdobYNb62mvzvXFe5SueDrAOoFcUyUnF61C7F1Gf3UlSb?=
 =?us-ascii?Q?WxVeGoMNPWr0c5f4Tr0/vs6sRsM7xFofanZvDOWuQVk7WN0M5Ib1cM6uypVT?=
 =?us-ascii?Q?hYhCoMSXzCWJ6w7e7TP1fW9a16iNLLfcixrJ7Rl8uU4PraHOYFImptmikdWE?=
 =?us-ascii?Q?2zG6Ulddf4It/KzIY/2fsnBxWr3ZJXSYJOW9R+YCs+euHaHHvO6EjlcQD3wY?=
 =?us-ascii?Q?X8dJ3VuSgvRpcwJT132cTGp1QbmTA0GCSJjun69DrH+YSeahOiSrJ5lo098U?=
 =?us-ascii?Q?viXVWauTYmZfH9jBPUkkwHrgb9HnIuo706JqxtqlMAANkOGkCHTvOYFojGK9?=
 =?us-ascii?Q?bt07LxtbOWVby2p6wztGc1eAzgpKXv/j5pjz2ZWOcdNtkI4Ne3jhq114FwSW?=
 =?us-ascii?Q?zWt3OV318kbX9KICh5NGRDlS/l75M+Dv9U9lFYZqJo4ioTjfD4Jv1p75Yutq?=
 =?us-ascii?Q?Ni9P1tWyjxcjRA6NZu72N5OSd4t/uRuJNd/UD+sPClg59WwEgdXLDWRfLSUb?=
 =?us-ascii?Q?kvedYo4sNK1XMRebMxx/LTda0r+meVEiFGli0C5fZDlbbcSSTP2utktB/0QZ?=
 =?us-ascii?Q?2GaT6cEdU3LEUBcMUISkwFu6rzfjx9/rp39kVM8WYbjf7taUVKpluQCM+5rK?=
 =?us-ascii?Q?KsC3oPd3EdvSra9Yc+IhWFQM4nHMKFpzkN+XNp5ZdXQTyLTUbvPo/hz5saMM?=
 =?us-ascii?Q?2hPxQLnz73aGDObYscxRKmu3iccV7rGqk3NfK+OK6nXCfq8nVsFnABuK0jjs?=
 =?us-ascii?Q?IcbWnAQwdwlejlStjaKCAApkewU+vc/ZZeiTDL/eIvhZyoilI3GabMwB5Pci?=
 =?us-ascii?Q?j2g++3V7PTxfsrJxFmU50FxfDJg5qHElGyeTo6fO1cRfOlBfRyAVS1C/Nw2Z?=
 =?us-ascii?Q?WWkrURfiTgXVXzGKhJZVCNAvUWxbsMpScfunpU6jBQ9K/UG9I0eudPayDrBO?=
 =?us-ascii?Q?TI0Ij4QPe2k5z/AzmG8pdHIrbPMEWIVjkv47K09kTlklxz/75b7JI+1XA+5J?=
 =?us-ascii?Q?NdGgwsvJ3QFs6YGSt8PDuy3JcnG26kHkkov0DMhDXE+1SNl/NMskn9sDMfDE?=
 =?us-ascii?Q?eaS6yraPswWuGScithmTBbFsriv5gxEhQeA9DMWPw9h/NJlRQ/btrxgNnrW6?=
 =?us-ascii?Q?ixLWEg1UCy7ns1Nb9JoNLE3avLtV8MpGvBSOAJGkLTjARzRXcw4/Lq8oxd4u?=
 =?us-ascii?Q?kFaSQG+kCESFKpXkNxkuxQBxTsxX5TIn?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 15:13:02.6373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd69193a-a603-461c-52d8-08dc99e04d4d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4217

This is a request for comments on high level design of Tegra config
settings.

NVIDIA Tegra SoCs have various I/O controllers and these controllers require
specific register configurations based on:
 - Functional mode (eg. speed)
 - Interface properties (eg. signal timings)
 - Manufacturing characteristics (eg. process/package)
 - Thermal characteristics
 - Board characteristics

Some of the configurations can be provided by device specific standard DT
properties like speed of interface in I2C, rising/falling timing etc. However,
there are more device specific configurations required to tune the interface
based on execution mode or other runtime parameters. All such configurations are
defined as 'config' settings of the device. This configures a device to operate
with the optimal settings for a particular mode to improve performance,
stability or reduce power.

Add the mechanism to provide the configuration parameters from the device tree
called "config setting via Device Tree".
This series capture the device tree details, common parser code for Tegra SOC
and the usage in I/O controllers I2C, SPI.

 Patch 01: Documentation about the device tree binding for common config framework.
 Patch 02: Device tree binding documentation for config setting.
 Patch 03: Common parser of the device tree config setting node for Tegra SoC.
 Patch 04: Device tree binding documentation for the I2C config setting.
 Patch 05: Add phandle reference for the I2C config setting.
 Patch 06: Move clock initialization code into new methods
 Patch 07: Using config settings in Tegra I2C driver for interface timing registers.
 Patch 08: Add Tegra234 I2C config settings in DT.
 Patch 09: Device tree binding documentation for the SDHCI config setting.
 Patch 10: Add phandle reference for the SDHCI config setting.
 Patch 11: Using config settings in Tegra SDHCI driver for tuning iteration.
 Patch 12: Add Tegra234 SDHCI config settings in DT.

Changes in V2:
- Move config settings to a new node
- Use phandles to refer config settings in device node
- Update subject of dt patches

Open to review:
- All config settings are field (bits) entries and input in hex format.
  This would allow parsing and updating registers easier.

Krishna Yarlagadda (12):
  Documentation: Introduce config settings framework
  dt-bindings: misc: Tegra configuration settings
  soc: tegra: Add config setting framework
  dt-bindings: misc: tegra-i2c: config settings
  dt-bindings: i2c: tegra-i2c: reference to config
  i2c: tegra: split clock initialization code
  i2c: tegra: config settings for interface timings
  arm64: tegra: I2C interface timings
  dt-bindings: misc: tegra-sdhci: config settings
  dt-bindings: mmc: tegra-sdhci: reference to config
  mmc: host: tegra: config settings for timing
  arm64: tegra: SDHCI timing settings

 .../bindings/i2c/nvidia,tegra20-i2c.yaml      |   5 +
 .../misc/nvidia,tegra-config-settings.yaml    | 158 ++++++
 .../bindings/mmc/nvidia,tegra20-sdhci.yaml    |   4 +
 Documentation/misc-devices/tegra-cfg.rst      | 133 +++++
 MAINTAINERS                                   |  10 +
 arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi  | 501 ++++++++++++++++++
 .../dts/nvidia/tegra234-p3701-0000-cfg.dtsi   | 107 ++++
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  |   1 +
 drivers/i2c/busses/i2c-tegra.c                | 257 +++++++--
 drivers/mmc/host/sdhci-tegra.c                |  84 +++
 drivers/soc/tegra/Makefile                    |   1 +
 drivers/soc/tegra/tegra-cfg.c                 | 147 +++++
 include/soc/tegra/tegra-cfg.h                 |  87 +++
 13 files changed, 1442 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
 create mode 100644 Documentation/misc-devices/tegra-cfg.rst
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3701-0000-cfg.dtsi
 create mode 100644 drivers/soc/tegra/tegra-cfg.c
 create mode 100644 include/soc/tegra/tegra-cfg.h

-- 
2.43.2


