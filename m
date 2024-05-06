Return-Path: <linux-i2c+bounces-3440-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BFB8BD7B8
	for <lists+linux-i2c@lfdr.de>; Tue,  7 May 2024 00:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F1A11C21EDD
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2024 22:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE6815B131;
	Mon,  6 May 2024 22:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k4EZJ9li"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA8A157A41;
	Mon,  6 May 2024 22:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715035948; cv=fail; b=e0bkdehEVvSpKS/FdoKti5Bjm5z9s6F9DLpaxTQYYUU6oSyCd06hkSFFQ+PUl77ypaabbK3pTfzvYCec+H8McK49QvoABg2tP0UhO0syxgh3nlmEhERk3SoN4CrH7w5NTr+jULStnOMFfPMKOcTpPool29BLvrRLi4UO5H1+zW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715035948; c=relaxed/simple;
	bh=b+99tvCSHbXGbnJ1lSkRAorqaGYxQPMPya2rdR4LCOw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WtxL9z2TJK6yiesQOElAdx9u37g37ptEBRoxYV4E+S3sQxgfzQ+rhQqwF4SJqMUgd5ccARaPVh6T893nCcrwZtWXpNiAgmtPh+vRIZ8CFA9cdx3dF13EXm/rQOuzMYfT5P0zRCmT+yRmKCoG+39kJKnxX7/aTJEN/Lg80eQrSQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k4EZJ9li; arc=fail smtp.client-ip=40.107.92.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flHaAbdBuHlZrdcl0MbDgwHdsB8JT7sspAYq0LkIiI6kwgLiziR44Re+WsLZT8sXBELNBXVwJWx3lcHVnlaYO02SiNl0SLpTQ4MvGL/oZ7K00RYJYauzXR0Niw2xbgTOhL5l1sbDHV7Lm8JwcNgvcUd7wZVlaP4ZaKp2KF8FfEQcWxAnzvT7lToE1KvoBdbJAjfcKdnVlPuy2Lu78vjsKlhkFX/cpEt2SI9P3TDKHDL4sbDloOQ5KJlnaoHoaT+IlUIgT8JYwh6shF1lKRwMdmoG0bp8N9lGFlgVe4CLY7WpqcFbJeZU+ozCTu9O8uRsiJdgrGk0gBhqgdRSPI+nuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DhTsClj88iUbBWem2ufSrJNP0Y1ndy6DTnwIHsngVHo=;
 b=UM8qY2qUnBThBCs/Go1r413PyJoU1KcBneCxOFd2ieENcf+cHzOjuBkmRXEwpF+kJx8wfGKt/qa4RF28uOpsULHezRI6X+ug/cxkgoG78JIbRWxcrU6DyqdfUqlMq8bMGQ/zC1AwEjZ1zWUaXPE42B51Cx+yDiCauHkGm/Bmeb9lq1L39iQHjlfh5HaXOJaO/Yn46Ddis/xb9pKas5vqrRAiDrmkIfWAxnontBTHmxg2LqQds85blA5E+NnEh1gIkypD3VbLfgtmEH0VtwKFYqDZE8zgx+1nPbLLzvYbWfEOW9gTM585+gBJ/67+BrAjx/z+JljxgmtPnRtot3+Eqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhTsClj88iUbBWem2ufSrJNP0Y1ndy6DTnwIHsngVHo=;
 b=k4EZJ9li8EDprol9mu9WBzVlJqsXsbZA8Ir+rTxrDvAtav7engLxvLDMm5t7LL6XIAYwBRoj8v3Lfx0oy90MqkxAXp9pOTftw1WteKKMM/FM+NLHYveh+JHq3kKWBb7QIJm/I/tk72zrowGlMcg7XofTTr9DH/K4eoYRzKHfRXFeNFiqCMO35SSE1gKKA5/YawrYzHlydbEqbrDITxhry2mcBpt4xPfZcYgW3xuybuetOayQ55QtGdWphIK/zp/mzuaXPUOpFg2k4n+eN6edhx/3I4Vn5cwOU1J8+ij5AMqOZMC5kPTVxlS231JpSz63RqgYPkJLJgJPNTe0bfuqZQ==
Received: from PH7PR10CA0001.namprd10.prod.outlook.com (2603:10b6:510:23d::23)
 by CY5PR12MB6106.namprd12.prod.outlook.com (2603:10b6:930:29::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 22:52:22 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::d1) by PH7PR10CA0001.outlook.office365.com
 (2603:10b6:510:23d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Mon, 6 May 2024 22:52:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 22:52:22 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 6 May 2024
 15:52:09 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 6 May 2024 15:52:09 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 6 May 2024 15:52:04 -0700
From: Krishna Yarlagadda <kyarlagadda@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
	<andi.shyti@kernel.org>, <wsa+renesas@sang-engineering.com>,
	<ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <digetx@gmail.com>,
	<ldewangan@nvidia.com>, <kyarlagadda@nvidia.com>, <mkumard@nvidia.com>
Subject: [RFC PATCH 00/11] Introduce Tegra register config settings
Date: Tue, 7 May 2024 04:21:28 +0530
Message-ID: <20240506225139.57647-1-kyarlagadda@nvidia.com>
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
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|CY5PR12MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: 844e0787-4542-4eee-8c04-08dc6e1f30e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|82310400017|7416005|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EhjOillNjFhkLt4WfHkHskNazJHuvtsi5jsRXvkUDZl1G8lK4yHsPRhSIUIe?=
 =?us-ascii?Q?7+j6Z8Cm+4rv0yDVDdTAIWT2AHG5psDRw6/kEHvcju1osyYmkOeKheX2GWP4?=
 =?us-ascii?Q?NHzviCTWJ/uLQsgMGw2+RxuzD6fkQovoLDwJN5R313wOwDhKEd8YQJwig+yv?=
 =?us-ascii?Q?m92DBaUAn6GxpwqRnPrBHccEj9XDcnaG6YcyQ7mKLsufbGswp23gJgPwSZqB?=
 =?us-ascii?Q?VFSYujvwr1pQ5o2C0L2UP5RivTL0s8uwtbi2VlYUFAAeLWiap0UwpSB1Nmpw?=
 =?us-ascii?Q?TVUC9w+A27O8l/qs5Gu6TQ5UgmuVEuXxWhIXVosIg1nUfrjfvJKXyKVQReit?=
 =?us-ascii?Q?Ku0AFp1eiX3nDaAP4LVXNZZNa5XMU7rmhZbuKuINEWFhZaku1mBxEaLPjtgt?=
 =?us-ascii?Q?n3KUet1oVF7pNhGnJscfdSkilo9FX0nDLJOar7k+wGIg8iWx/DsnoZMqjt43?=
 =?us-ascii?Q?ioUjFumzPMvxWNg0NxHe1NOAWyXLfZQG23j2+ky/RSsGH/HNNExVUC5nNzkk?=
 =?us-ascii?Q?azWCiLDAmpqzqNFqY9x6PpkP5EdL7QeZxitYOHwOZj0vlOidBT98iBAniv3y?=
 =?us-ascii?Q?HnreRY89shoXlaS1vYc10Eut7ft9IbJYHTbd1sKurV6EkOu27002hoc2uegH?=
 =?us-ascii?Q?eI0xhzcBiwx+B2jgw3Og+4TvSn9BiAFJTEwdil/1yvBXVhz2t82wVPnXQgdr?=
 =?us-ascii?Q?SoT5WN3DJGjLb+NinqFWjgWnrzSmO7eX4lnu9kcsflLDUX+8gJeujf0RDR0x?=
 =?us-ascii?Q?Nt4EVxiheCmdORuPoUiTAaAI6Xhqurwa1FerDO80M0K03UIHlcGVbkBZssah?=
 =?us-ascii?Q?2XJFvfavICh26Sd/PMm2ukEVaBTGRvNzNiLCGVWnpPFW/spATVx67yiy6XxJ?=
 =?us-ascii?Q?Ax0TT0/b7WvDnRfacj93HEh57GkvjVhPH0UxoTEP2eHPQ9xZwaO/xYrnJN17?=
 =?us-ascii?Q?mDG/e3NoJXSJHKj8wsGwPGIeToEil3f+Hcwvpar6y8eop+dhc+8hbPVk2nst?=
 =?us-ascii?Q?hq4Cx74qj8S4hY9ognXFc/svKbmtihG+q5BDvnwFHAtlBBN03ZVJY9qlWek8?=
 =?us-ascii?Q?8Os3zWcZqP/538ov9T4DSf47E1qX15zE36//I6TXwE4E2mZnoKj8KI7ohJE0?=
 =?us-ascii?Q?ANtE9fF9rU9CmdzIwq4f4jtYolJgSoGi479VvtlTzRYeqWamozjRH1X7wHmX?=
 =?us-ascii?Q?zWTzuNMDwRhNtKlSCOsdndA6iZmx+7nCjliwItPrE+2vZwjYWdEWz80oDfb8?=
 =?us-ascii?Q?yThgOAKe8cQ52SVcpGOTLCtOfPiUIyeigodMo8Lq++upH0VfpYsLu0kCmTFg?=
 =?us-ascii?Q?rbOYMPfyQstsbcjrzm0tF+FgVGk7vExDLJuiIYQatdsyAw48v0FmL43tlzsD?=
 =?us-ascii?Q?f8+ZipFjkiwhCjFlefXvUAQZ0MfT?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400017)(7416005)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 22:52:22.1712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 844e0787-4542-4eee-8c04-08dc6e1f30e2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6106

This is a request for comments on high level design of Tegra config settings.

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
 Patch 02: Common parser of the device tree config setting node for Tegra SoC.
 Patch 03: Device tree binding documentation for config setting.
 Patch 04: Device tree binding documentation for the I2C config setting.
 Patch 05: Avoid config settings child node to be treated as I2C device.
 Patch 06: Move clock initialization code into new methods
 Patch 07: Using config settings in Tegra I2C driver for interface timing registers.
 Patch 08: Add Tegra234 I2C config settings in DT.
 Patch 09: Device tree binding documentation for the SDHCI config setting.
 Patch 10: Using config settings in Tegra SDHCI driver for tuning iteration.
 Patch 11: Add Tegra234 SDHCI config settings in DT.

Known Issues:
 - DTC warning for config 'missing or empty reg property for I2C nodes'

Krishna Yarlagadda (11):
  Documentation: Introduce config settings framework
  soc: tegra: Add config setting framework
  soc: tegra: config settings binding document
  i2c: dt-bindings: configuration settings
  i2c: core: Avoid config node enumeration
  i2c: tegra: split clock initialization code
  i2c: tegra: config settings for interface timings
  arm64: tegra: I2C interface timings
  sdhci: dt-bindings: configuration settings
  mmc: host: tegra: config settings for timing
  arm64: tegra: SDHCI timing settings

 .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 104 ++++
 .../misc/nvidia,tegra-config-settings.yaml    |  50 ++
 .../bindings/mmc/nvidia,tegra20-sdhci.yaml    |  36 ++
 Documentation/misc-devices/tegra-cfg.rst      | 128 +++++
 MAINTAINERS                                   |  10 +
 arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi  | 478 ++++++++++++++++++
 .../dts/nvidia/tegra234-p3701-0000-cfg.dtsi   | 123 +++++
 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  |   1 +
 drivers/i2c/busses/i2c-tegra.c                | 257 ++++++++--
 drivers/i2c/i2c-core-of.c                     |   3 +
 drivers/mmc/host/sdhci-tegra.c                |  84 +++
 drivers/soc/tegra/Makefile                    |   1 +
 drivers/soc/tegra/tegra-cfg.c                 | 147 ++++++
 include/soc/tegra/tegra-cfg.h                 |  87 ++++
 14 files changed, 1456 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra-config-settings.yaml
 create mode 100644 Documentation/misc-devices/tegra-cfg.rst
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-cfg.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3701-0000-cfg.dtsi
 create mode 100644 drivers/soc/tegra/tegra-cfg.c
 create mode 100644 include/soc/tegra/tegra-cfg.h

-- 
2.43.2


