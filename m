Return-Path: <linux-i2c+bounces-6924-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F40297E725
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 10:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D0A51C2116B
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 08:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455744AED1;
	Mon, 23 Sep 2024 08:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ov3eYC5y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62223374CB
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 08:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727078726; cv=fail; b=mdOG4LrGqHQlOSJeykiZ/TI5dRsO2TVaM+pgpDu+p5Ra6lEKoS+cq5m/4pGn/QH8qmF3jBIxYl5X8Ii1oRTkKgvJAp85fKGZTDwGrlXS6UJgHZUysmqUqF2JFc5M2Vthyc7JOHh3qCc4LFE+VfgHw+crVNdljjiTwxhm44jT2mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727078726; c=relaxed/simple;
	bh=XA+Vd92g+Z1ZuL3dKa7jbRsuX7yK3nI/zYEJiUSNjiI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i/+vv7fG6Hc3YfTcPWDeP7f+dQk3iTLrpdYj8PCk4oLAATv1cFUH3h3WUryQyu2Ao1hn/8uayjNvinnA/R4Y8f2SdGQDSGmr+qzw0p/Ri/MJILN6yHCAHOkY00TYNrYOT146rvvJBoiR07+CX5xDb0QHUZ4w60Ds1eHZWxVhwzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ov3eYC5y; arc=fail smtp.client-ip=40.107.236.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvL85VCUg7ut25v+VTPQN7VqAZgmZLn4Gl2ryfI9dF6DFGKJ+/sQRRLtruQHXZMYnpetpGSsLbBVDPIIZkNecH5/xSHzFOeS8/g1E5/YMEzIppm2gL5Z1nr7VbRZvCfvTvvchXHqCtuw32UrtBmP6g8q+7Yu+t1oFXvj9hYUo/+XHxXBN9DIF3ykwmbc3+M/hf0hrn18DLfVpX5e35HtJ5/NmfegZgG/AC+PtZ5XFCWn7Gwo0QDtt4CTOsvCmvb3tt2GuOBhyc+hF1/kG+auc6el35UbIHKQV5tDdMT9Fdyi5QErsjYtwgVcpcen9rKcRVY2zVhzfePtP11F6QizHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fY+NDOzr9uz4TZ7VMwU+Zp6U3yvojn6cRwhk2KpidA=;
 b=eJKwOVrRp1jdSLmC1wmec0POROEn8QKqUhPJjB7lKEQ3RRDbDBfD96WIXu7lznl7S1vNnlTKZtRbBdM7pGy5P5CR44xzHpfbUzJaVtQCf6IBqumvRFuXLhUyI2Cp4xBcx9x0tIPDFi8v4jVSAjtIdveGNQkMheDKdH7wjn3mhuUwqBwaluNWXn86dWomquwb3HpCvkNjgXxKlaTklio65WrRsEFNevJ/SVQhUQqwMsyfLDS54iVIGWsvUr6jrU0YUpXVzeMdXTUUDcgxYxkORYoFj2hUDhVSlb5kBzlKoMYyBHCXeUB1Up2pNTBNPekROcDvaz+39WoyHmpsSd61Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fY+NDOzr9uz4TZ7VMwU+Zp6U3yvojn6cRwhk2KpidA=;
 b=ov3eYC5yP5o63kSTcr3U7sKvLN/5PFKytkg8V9b2Eg904W+Ih1Fwx7rvrmqKSITgAB3tjwwqQMPC/PnciT5kd6/9b1H9YDFce/TaOP1h1+patjgxq8cYOEl91sY2k5Gj77mmaJpISMUfjKRHlJHJSK7mUA+wG+fOFz9NQf9/fLg=
Received: from MW4PR03CA0223.namprd03.prod.outlook.com (2603:10b6:303:b9::18)
 by DS0PR12MB6389.namprd12.prod.outlook.com (2603:10b6:8:cf::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.25; Mon, 23 Sep 2024 08:05:21 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::a1) by MW4PR03CA0223.outlook.office365.com
 (2603:10b6:303:b9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.30 via Frontend
 Transport; Mon, 23 Sep 2024 08:05:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 23 Sep 2024 08:05:20 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Sep
 2024 03:05:18 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 0/8] Introduce initial AMD ASF Controller driver support
Date: Mon, 23 Sep 2024 13:33:53 +0530
Message-ID: <20240923080401.2167310-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|DS0PR12MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b92cff-ac42-4dfa-84c9-08dcdba67862
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cixhHIL/K6UKL4bq4g7If9jOR0XaenEgDoLu8J5j7Tm2BDFNqSZd+fzkJebB?=
 =?us-ascii?Q?EwjJm411x5bSxpNbJGT0WKwsWrbFsTdAWVGVulooJ5X/W5RNuwL35y1574rv?=
 =?us-ascii?Q?cjan41VKYPLx01w2NdPQPkODdsSQAYATxbWg2ZDnQ5H9gdu7Lx9zQmrvy9qE?=
 =?us-ascii?Q?HddGqkgj+xmJf/jXFhcPLt/OUTQTFJ0CR5fNg4hmWM8OJecluCmtNnUgjOCm?=
 =?us-ascii?Q?Plqa+JgO3bluPDWMjtVQrom81h93pCeRyZDGDLTT9Mtzq00Ueyeo/GM0jxvA?=
 =?us-ascii?Q?GUn+ISdcyd7HgVhoP4X3WrB8Vgqx++QpaxZBrZkT314HPRgZX671gsIom/CN?=
 =?us-ascii?Q?S+m4fyDHgAYvM9a+ADiJUQCIgE7yfONmCTfcJX8BC/1QbSlVldvaXTrZdd1G?=
 =?us-ascii?Q?dQiOZcilt3o+8sMSmZ1WmmHgQKmKcEhwA2yca6gkbKq95ZGAF8qnJauObWOr?=
 =?us-ascii?Q?sMkdT4CnVdO0C7UYwKHvgrtsQKT1ciPietJUe24oyA6N3Ec2XzA2vT56Vp9M?=
 =?us-ascii?Q?YKkn730jdIUv76vJMPJqptOIpQxqqLCKq8BoRef4ejOFbbWrPceMnWTg3d80?=
 =?us-ascii?Q?jNYOjQ0/EY3oR5LmsXyEddF8QjXidb+GeG95RPZnu5GqdGy73IwQa4CuGVNs?=
 =?us-ascii?Q?3fOtNl6BT4hUEHVj4AI1yniCPls1flL6iiFG5k2F/MZamvaZBJOX9dM79iwh?=
 =?us-ascii?Q?Vwa4owxoRDhyGtTP1Hf4ApQZ+nJ9fmu5sCI4qjqZdVLzGQTfduOdwtj8e67K?=
 =?us-ascii?Q?CGCYGpqBiutckiSW+DtPisVKGyeR+y5hK5lQUDudcp3EEf5at/91lEQfCO5j?=
 =?us-ascii?Q?e6m1C/tW/CT1p4BQbesXPp4+9k6569VDQcMOfMVEKJJjq1ZxWyqOMOeN2gY1?=
 =?us-ascii?Q?pyIoJaT+Vcjv1ZxeFL5mLaik9cQBlcJiFgj7oUTJWrO7Caerw/mfMy20csOE?=
 =?us-ascii?Q?7cAAdqR5ERDmYUSZDK6y02DOr1z/WBEEkuTSVvxoOTU1XfgP+ntxjTj3pKxu?=
 =?us-ascii?Q?fMNYMNQkK2PAhW3mO5rt2YZ1cYkhlXptXG42GHUGSALJaWMBksQ7I/iwnxiY?=
 =?us-ascii?Q?nkLgcNSjAu5FEx100dv9TzGBhYqgqnbGW0DTCZ/f0g1ZhUd9kBaEJov9tBWD?=
 =?us-ascii?Q?aW9H9ryNR9Uhr/iogLkNhYgK/mwn3sZ3Yjeh+0UkipSmpPwvpKyJzRqT9SRD?=
 =?us-ascii?Q?sN/R2VguIbq6TnY+l1k9+HmAeTLZ/S9/dfH9J8Itu12s4vhxLScrJpGn11Md?=
 =?us-ascii?Q?7fS8GwzW6jowVTsSNZ4n//ddmLmi+x/nvsWTO51ilAnsUdw/ZK4Fta6ZpyJs?=
 =?us-ascii?Q?VtowZ6Gwf01YlSlT3PVjCy/PsYQG+kZf+5bTC2rMbTLLbp8QG35xN+nO5Jbg?=
 =?us-ascii?Q?kuk28dYQrG4AG7mWyGl2CljgDAmVMveBFjjCpBoccVpLp+0MjEWDlzTPaDNS?=
 =?us-ascii?Q?FCvuoC1HiK5ACEiFlVZF+Uaz4bat0uP7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 08:05:20.9138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b92cff-ac42-4dfa-84c9-08dcdba67862
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6389

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

v7:
----
 - Combine logical operations
 - Add Reviewed-by tags
 - Amend commit messages

v6:
----
 - More header inclusions
 - Use _NS for EXPORT_SYMBOLS
 - use devm helpers for managing the ASF controller
 - use __assign_bit() for bit manipulation
 - Use GENMASK()
 - Add comment block to the code wherever applicable

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
 drivers/i2c/busses/i2c-amd-asf-plat.c | 369 ++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-piix4.c        |  51 ++--
 drivers/i2c/busses/i2c-piix4.h        |  44 +++
 6 files changed, 459 insertions(+), 31 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-amd-asf-plat.c
 create mode 100644 drivers/i2c/busses/i2c-piix4.h

-- 
2.25.1


