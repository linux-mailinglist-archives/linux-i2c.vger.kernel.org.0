Return-Path: <linux-i2c+bounces-6708-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 350EA977F54
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 14:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 900B61F22AE9
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 12:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0C51D9355;
	Fri, 13 Sep 2024 12:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rXqMjUMT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2078.outbound.protection.outlook.com [40.107.95.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EFF1C175F
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 12:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726229512; cv=fail; b=Lq6w1URkahSKVBZ7cy4zT9Scfgw25LteObd+4PvwlRHsbxxpuVjsQ9tyKkGIfxqE2bPvdCAlOOuG4ly6NBIUsZguuCdJTke3iOwrqhAy9nuh+NRs0EN2rYWXdChfm9GTkW+bmiwZ5qeUBnstsuO3/zmZQpjEySDHg1KsBF1sl4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726229512; c=relaxed/simple;
	bh=dx4gkYaKMHMeekUp2rdiJohERuPvZcYr8cHbQEUkwRQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lLih5IoOGcHbRzbU4/qMg+jUVjtlZ8o1UwRl51GoC3TW2EAAxq4uB7c8ECAX9Of6zjaFlgUOTOEWvH1KzWYr24D0asQFjflt5Rqz97NXNdJ/LGcAeDUdD8xZ6EQlGfO+KAZVz9GjBM5mRkGB6Rojb68MdZ7Kjj/ypK8bFnNhtzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rXqMjUMT; arc=fail smtp.client-ip=40.107.95.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDs8j7FPJOx2scwYd0l4JH7uOcTrrsMERogo5m6IoCHqGG1NELeAakJDOsiNZEsE0T7HWz0J8AAzh23h7moq13RTH2OuZsCEz6KnssSuinOJXdwxiZL9zd9D2f0rvIERtGRzwpn3DepSandMpoA6GuImzU3SGdVMVUr2aLUClu7wRtcIgfkTzmef7ELvCA4U3IGDDHzWftQHPpuaAdTFyVPxoMHEZiQcz/DTQS3e3ZLUESZBYkUIdeDOslfZImSWI3AttRKp0UbMzkEfyvfQyssfmKgGuplnJZsrZwoPKnQO+X1SUGPrkwOxL4BjHJYpTmcVBXP7tcoN0vdyxDGPyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4btE/AuPUcIj7GEWXE3ECBpCDzIyI+HYHWAxVCnRs0=;
 b=glcbacGgLNhciyq7ot2Muny/HtjLl/+jisKFf4HrAflGFMOSuQzMg83IifBuGxH7MsnB9SrXHpkpcdZxXxidLyqexj73S0KmkLo4U50v2Bp5UQcpDFBRMCDC4F1v0Y8e2PaRLdsdhe4yxFyjsbQ4htt0UlWnXYp+hSpiDnG5cUZSeKQODt4bh1DsjVSEfMlKNWtGlXWtvDkZc8mvAQDqvBvf5iECl+B3j+AqdMdQZ6VQR1MwKAvsrJtf/bC75f4cZb4iYUZd7tnYtzp22bkIAB4HjrV5LawpYqYP4PUOiv4CrPCO2bqZ+f5HH8ALC1PDqoOLAg/M3H5X0MhoUxmevw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4btE/AuPUcIj7GEWXE3ECBpCDzIyI+HYHWAxVCnRs0=;
 b=rXqMjUMTSNXf5xymDhAgc5kN/dhxaBp1Zjp3hA6DlfRlyIKpWjKGD/8QCW90WYWa7r6jtY/hZMw6v7cJAG9cfR422tOF9V3yrKYbGAY/x0b7UHOIMaSKLZuUPFUVlL9eUP/9l0mt2yZLC8b1dmvRcefZqRMHfJrJ/Xenz1ezYj8=
Received: from CH5P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::28)
 by IA0PR12MB7723.namprd12.prod.outlook.com (2603:10b6:208:431::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 13 Sep
 2024 12:11:47 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::b2) by CH5P222CA0010.outlook.office365.com
 (2603:10b6:610:1ee::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26 via Frontend
 Transport; Fri, 13 Sep 2024 12:11:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 12:11:46 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 07:11:44 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 0/8] Introduce initial AMD ASF Controller driver support
Date: Fri, 13 Sep 2024 17:41:02 +0530
Message-ID: <20240913121110.1611340-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|IA0PR12MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: c4965a65-f127-46e3-3ae2-08dcd3ed3d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qLGIcWYHg8QSMCzYXilY6XSA/j1IBXq82D4GYPy/vNqV6jetu6jIkzQriQy+?=
 =?us-ascii?Q?4XbeWMh49LunljgjPv9VX9ytfZTqe7npjuhwbB1pHcK7mMS0Fzy29or14K6W?=
 =?us-ascii?Q?yYbeRcUsHAlArShdFYAupCZxKlOJGJfN/QuNvUTpGsHd23h4zQXZF+xitqPh?=
 =?us-ascii?Q?s8ZOJ+MXJ29kzNDX58L9oYGlaEhucsBCdRSCFohv3d/cbv8qxhzpeWWx2Jyr?=
 =?us-ascii?Q?2sNoPiJLxxzvsJvuB7mQ/SUGmrqaYvQZHoVsFbT6Wdd9O4Xm1Pse+b7u23eT?=
 =?us-ascii?Q?x/Sfhgl2G20kAOB76Gu1kQRp4IvIO+wevczhjgo04uXmf8KiudpOO3YGEYSs?=
 =?us-ascii?Q?sSrDyQR1QS1WX4yK89SlSqYvkTkKeZWRBPvpYi4iFX5cqNkHOXSodVehWQne?=
 =?us-ascii?Q?wSEhOM57iW7Syk6BB5IHSWwCP2RWjZkdYFwO+0adMxGJqFNeV8vqsfu8voGE?=
 =?us-ascii?Q?L41T8a+4QmkQBwvZBstjWVdp/dMuoePYollZ9xgBFLx/qTOnPVw/No6SUoyX?=
 =?us-ascii?Q?BdPk4Tmj47b9rfnWvhH4O4CMj7ZTy+UZ5EC9VkyXv6ZFRuUwE1RsgbhiOM8u?=
 =?us-ascii?Q?Ar9eu0H33iAI4iH2p1Mgmk3uG7Hq+hjaUkk28dv+Pzij6JS4JnX97oHhKjvh?=
 =?us-ascii?Q?bOT9zyHTw/Si/OZA6M3N4HrG0DWGpPuS4087PZt91zGE8Zwww+CmYPELOFtc?=
 =?us-ascii?Q?7jCZusSVcW6VIF5PKy0lM84bUkPG6fLw/kDz+ED/4I6FUIDJhfQ8yrx2q6/T?=
 =?us-ascii?Q?0stlyPNsNp8IXp27Pr9Yg6IIC7hn8//VE3iv2zl9us77Mz3hkcR4j0Wc7yAf?=
 =?us-ascii?Q?N4NIFzip6HzifPHj1kGLgi3p+XsMMaFYs8YMZDhsxLsBa5Ys3ua9ybxksPi4?=
 =?us-ascii?Q?POv0WxxZXR9rxa10kRemnIkqQIcIl8CMAmcB/6ni95hVCLdSZqZkBCcAgbVB?=
 =?us-ascii?Q?ufFRIbAVWdmfla0is1HIoh7AqcdvoomPi17VQMeQlhMqYRmaMm5PI8Qiuuxe?=
 =?us-ascii?Q?VjiykUebrVBIbW4DKweV58LSaB4JF4WzNKlzeke5TdfdYWtj1uWyg6p5/F+X?=
 =?us-ascii?Q?SzitFlK5TlWYt7Ybrc7/Rc7hfMNshGu9ZkJDrg7YT2kkM5dUTfAz+ExMhOkp?=
 =?us-ascii?Q?YwVfAlgWRKyPht0or1B6IduceRwZkV694ItUtkHabrsDdYbSqAWLKAnCLCkg?=
 =?us-ascii?Q?XQZ5gmFAGaZGUani5jmqj92WcuYXwqUcx1FnpjR5s9P5ALrHTQkJdcy5+Fh+?=
 =?us-ascii?Q?JRg52B2wk3LmpuK6mM2e+5dbIo/FUwuVLaPPRrQfM3eT7ea8WQ1jezxi5GYK?=
 =?us-ascii?Q?3XBn3JXqKB8WElSvT4xa391syAXU17hioRDbHnE3wWDn97TZuOF6VlF3AmdO?=
 =?us-ascii?Q?DeX3aWUgxti9hB0YLuLFccF4P5S8Z9tEoXO/B6w4jT7VTDsKTxVbAGlErROz?=
 =?us-ascii?Q?F2AmzXmEwylCZAUJ/VQksOWxEw2vNfIb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 12:11:46.8561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4965a65-f127-46e3-3ae2-08dcd3ed3d53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7723

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

v5:
----
 - use platform_get_resource to the ACPI resources of ASF device
 - add relavant headers
 - remove unnecessary headers
 - use devm_* wherever applicable
 - update commit messages to patch 1 and 3 in series v4

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
  i2c: piix4: Change the parameter list of piix4_transaction function
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
 drivers/i2c/busses/i2c-amd-asf-plat.c | 372 ++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-piix4.c        |  56 ++--
 drivers/i2c/busses/i2c-piix4.h        |  45 ++++
 6 files changed, 465 insertions(+), 34 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-amd-asf-plat.c
 create mode 100644 drivers/i2c/busses/i2c-piix4.h

-- 
2.25.1


