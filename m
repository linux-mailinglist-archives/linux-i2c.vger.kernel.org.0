Return-Path: <linux-i2c+bounces-6548-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC46975135
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 13:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A65DA1F28228
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 11:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BF218661C;
	Wed, 11 Sep 2024 11:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TWOi911u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EAA1865E2
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 11:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055690; cv=fail; b=dLWDXxEiTG6/FdwmVN4EgQi28xkoLvlCTtcEKQpA2z3cKGUTie1DHfhloMF0O/A9sVN732xCFxkZWh6ocZHIHLFGI6X2xnm3mjZQbu/XOn5bbZra9dmpD1+b0dvci3qPhGY6Tkd0L4EXhQADZfkAd6qhGfudFg+mPQgUvs7WWaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055690; c=relaxed/simple;
	bh=HUMGZbNFlrGGDk76q03T5dP5T1tmxDdKKSUauMjFuyk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NNgAB8q5WuIyVCDsL/vwc26dhpdRwJo3RDi98J9KISGz5EIXAKJpf9hBT6Ijp7k9LYZVwGDrOXaEAxNBf5H3NiBhiJnbrB9vmBOO06XpMSfAEoTIKqPIsSR8egu5uIph+umFzmemlACdEqVbQv1FyRynRZOew/i2iotEjxnu9Pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TWOi911u; arc=fail smtp.client-ip=40.107.237.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YbO7ziwsnk8LrCPrL3M+Vusrm+NLc8yv30NZsm8+kvwyKGvjRncqq98tx1tSbzoWJjvq4492xMdViTc5mvx4rX/z7o3hUSt492okugdjvvPeItS7lTvND3OrmrPA2fcwAYd+7D1UygndRKx/umowndoADhJeIpfHdZ0TwuMSCkuuGNUFLzI3AgwjHSnHZ+TU6rmMgU8aUTBEavyLIx5GSbGPqW5dwzAT8vDNrxbEQT6T8i5oO8IFanlxX2Cf/GJ0XJLsK8Zx14wypxFPYiR14vgEK0YGx284q9dCiPrJX7CKkMo+grOnJR4WQOsmIYWe4lHvm0Y51zw3xo35pVXjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfCMs2OWerD5mULAPc7t1wTXiyxqLYFLWRBtR6ECoQE=;
 b=I+nNcSv8pBb2Ihi5Jbs/cl0f/Yisfq46TYl/+YgnJDo648rzgYcAFgSduPxThH8g+HDcfM1SOzKqQYgmSD/bh3saXFWBYZvVnSPBQ541XPKZGrfaB32MpuAUDxZ8Yw3JYdHGer9tbPDWWH9ryAdEJI9C1fXeaFUHNa03c18G/rmE76jNo3i55d48w5BOMFPopypi8jHd1cDa8QwvM95IYSGPUNsXef6gE1mnSH7w6s8Sa8j+0JSEx+11JH5L/EckKeS7gDBcmhtaQoDym/ACRDxhJxV/Sgu4z2osQV8Pj2RTrAQGdkRXx6ct9mwHAfp7sUShGkQ+gyGPpumFdMD/Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfCMs2OWerD5mULAPc7t1wTXiyxqLYFLWRBtR6ECoQE=;
 b=TWOi911us1jAewsrREpJBM6Pb7IHBCkSSe6mcFM2PrLZjmM3BgVdEc6Ibjwf4Y6XQwS5r9v/W0gRg1qv3oyFMc6M9wP+wAwsaGxL2rBh6tP5ZgN2QBg0pl2XWOS5qMU+AKFI4zyJXs4Vu6XelmxiNNB8xaC8ODoq5j0XM7kpq4k=
Received: from BY3PR05CA0047.namprd05.prod.outlook.com (2603:10b6:a03:39b::22)
 by MW6PR12MB8708.namprd12.prod.outlook.com (2603:10b6:303:242::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Wed, 11 Sep
 2024 11:54:43 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::3c) by BY3PR05CA0047.outlook.office365.com
 (2603:10b6:a03:39b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Wed, 11 Sep 2024 11:54:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 11:54:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 06:54:40 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v4 0/8] Introduce initial AMD ASF Controller driver support
Date: Wed, 11 Sep 2024 17:23:59 +0530
Message-ID: <20240911115407.1090046-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|MW6PR12MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: 47afafca-7548-473c-6850-08dcd258862b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RrnGxT0DgzJ22X3hcJVQTi55eHm3KBPU81A3gw0rRL6zLVjY02Kw8KEViW+v?=
 =?us-ascii?Q?Lwnbq9In86kPiBiNRfKBlV9kb/jr2yKz1nN2mGChFETY1W25sEtR+SAi4L/a?=
 =?us-ascii?Q?Li75wSbfeTCSwdut9OO43BmFPercGqnskoHJRNOGdvlXMyO+e6XX846biQXd?=
 =?us-ascii?Q?yMZ8Xe3Rqjxf9yD02nWTywUACiZpFi9ykmcly0TJS1z3DR4MX5ey6yvFfunH?=
 =?us-ascii?Q?FNdZvjXZm1tjn2kS+DaZIgNBRhYlGyiFEFhZfi/4g89BaccpR3yEyeCY6ckD?=
 =?us-ascii?Q?HlRKbvrTLVtz5PkxsGwnvnF1Jhnv/i32OdlC2rH38ij8L33I58Iqkiob03g5?=
 =?us-ascii?Q?dZPf5K/NJmJxzstAXgFYn2Xn25N/+eC2zPICxUdNy9TERuFbUSC5NhlUx+rC?=
 =?us-ascii?Q?V8vPYqo7ar6NDFLICBWMn7dyFJBXvhBmZO9giX5k3Roziq6At2VdoGyD2IHU?=
 =?us-ascii?Q?B5hNyelYDDR90lrI3F5v2uB48qt8oS/azNQrncjWUjsgQyo47khnKf8yWhjM?=
 =?us-ascii?Q?Yh7cWLW999zVOMW3hNKrXWi15u3GKJo12RGUyNxejqwycBMa9vZTFmTJcNX1?=
 =?us-ascii?Q?G4FSgEM9hpfD0Hoq1NT76/Tw8ZfnxGhg6UjNdyalV6e1iK5W3I2H96j2aHhl?=
 =?us-ascii?Q?37vIDPnnV9iEVKiDDqB41DUsA7qHb+W7v1LuRRY4/dSIbK9u3JxjHy7wH9Ii?=
 =?us-ascii?Q?54z193UoHwOaJ7xxRqNlSs12nYmEv+roMgafNget6ve6cnOSs9fAwj4eIShj?=
 =?us-ascii?Q?JGKbC9uFjd5cn4QcEp8YCBSt2EzIHJSxNhV8WI0lTq6+Gy6tX1SjnQ1zZPpD?=
 =?us-ascii?Q?H68p3C1wdOqZ7fihrJusH402mtPNX0A6Z7ajvsZmWEvxPcY4jNA8ctL5PEjG?=
 =?us-ascii?Q?C5tpg29VgGpu5Hp/vNL1o2sjEzPwh9TiAeqsRWFQzwW+3mH081ZSp6vT8ls2?=
 =?us-ascii?Q?0bg0e1IjdMSolZfqjejVYH9z5dGt8W5f00n3qS3fgkPkNY9XoiBEwIVZtCw8?=
 =?us-ascii?Q?oqxTDSbMQo5OAQsX5PYSlzgRcbHdj+UTEqZaFIydO6ozJZh0y/STl+vNFAjg?=
 =?us-ascii?Q?d7Xcg/x5xXkcIOpkOmcEFiifrTDYxUpLQr6c1OfGrApYIwXql2ei+DVuT5rm?=
 =?us-ascii?Q?p+Op9FVl0vgtwHkKAc6p4LxoOlGOHg7cVvoyrrE219Q0jDIrFbACGB1WnHHf?=
 =?us-ascii?Q?zhcSpTTpeQtaJqZ4FISEpMz2eEgzsN/mU2DJoDoKqy8yFqhLeHUJevxDbERE?=
 =?us-ascii?Q?LLomxMkzysA68lugUW8vKgffnHG43uhW/KgrWI35aLOj0HzOuR8SI44APQmB?=
 =?us-ascii?Q?4RZoVU3kRcWe1FJFIEzYYhbBySVzO7251IjvUtjWWJwfLRxqnWDP1z1Uzsbu?=
 =?us-ascii?Q?ATirkU0MSm9lBQAWiEuQcqVnFjJWcnJCm/zBPAvKf7Nocy6xWUUhovKq7CM6?=
 =?us-ascii?Q?irNhoy7tckwS8IFVXixxV0Jl60uZy9vD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 11:54:42.7839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47afafca-7548-473c-6850-08dcd258862b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8708

The AMD ASF (Alert Standard Format) function block is essentially an SMBus
controller with built-in ASF functionality. It features two pins SCL1 and
SDA1 that facilitate communication with other SMBus devices. This dual
capability allows the ASF controller to issue generic SMBus packets and
communicate with the DASH controller using MCTP over ASF. Additionally,
the ASF controller supports remote commands defined by the ASF
specification, such as shutdown, reset, power-up, and power-down, without
requiring any software interaction.

The concept is to enable a remote system to communicate with the target
system over the network. The local network controller, such as an Ethernet
MAC, receives remote packets and relays the commands to the FCH
(Fusion Controller Hub) through the ASF. Examples of these commands
include shutdown and reset. Since ASF uses the SMBus protocol, this
controller can be configured as a secondary SMBus controller.

This series of updates focuses on extending the i2c-piix4 driver to
support the ASF driver by exporting several functions from the i2c-piix4
driver, allowing the AMD ASF driver to leverage existing functionalities.
Additionally, this change incorporates core ASF functionality, including
ACPI integration and the implementation of i2c_algorithm callbacks for ASF
operations.

v4:
----
 - Carve out a separate _HID driver for ASF
 - Export i2c_piix4 driver functions as library
 - Make function signature changes within i2c-pixx4 driver
 - Use dev_err_probe() in probe()
 - Address other remarks from Andy.

v3:
----
 - Fix LKP reported issue by adding 'depends on X86'
 - Drop callback when using acpi_dev_get_resources()
 - Address other remarks from Andy on v2.

v2:
----
 - Change function signature from u8 to enum
 - Use default case in switch
 - Use acpi_dev_get_resources() and drop devm_kzalloc() usage
 - Fix LKP reported issues
 - Address other minor remarks from Andy and Andi Shyti

Shyam Sundar S K (8):
  i2c: piix4: Change the signature of piix4_transaction function
  i2c: piix4: Move i2c_piix4 macros and structures to common header
  i2c: piix4: Export i2c_piix4 driver functions as library
  i2c: amd-asf: Add ACPI support for AMD ASF Controller
  i2c: amd-asf: Add i2c_algorithm operations to support AMD ASF with
    SMBus
  i2c: amd-asf: Add routine to handle the ASF slave process
  i2c: amd-asf: Clear remote IRR bit to get successive interrupt
  MAINTAINERS: Add AMD ASF driver entry

 MAINTAINERS                           |   8 +-
 drivers/i2c/busses/Kconfig            |  17 ++
 drivers/i2c/busses/Makefile           |   1 +
 drivers/i2c/busses/i2c-amd-asf-plat.c | 398 ++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-piix4.c        |  54 ++--
 drivers/i2c/busses/i2c-piix4.h        |  45 +++
 6 files changed, 489 insertions(+), 34 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-amd-asf-plat.c
 create mode 100644 drivers/i2c/busses/i2c-piix4.h

-- 
2.25.1


