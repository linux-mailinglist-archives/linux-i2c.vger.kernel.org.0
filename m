Return-Path: <linux-i2c+bounces-6874-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D297197CD60
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 19:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 913EA28503F
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 17:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CA011A0B08;
	Thu, 19 Sep 2024 17:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="x+L6Kci3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC711A256B
	for <linux-i2c@vger.kernel.org>; Thu, 19 Sep 2024 17:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726768794; cv=fail; b=CUcyrURY2GpM102xKVSFk5oCsF3hD6wjHKvWEXgJqt5lxOUMIgCJ+vM1E6Pl7Q3n++6mRcsoxWJ+nk/XI/4Cu6SUYj3IwWEm+EKVgZDzYVBVr+iI390yaRZhrLsfhx1YetDXaCVsy55UUTpd37SdZBAJrx6g/s8VG9VCS/3/rpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726768794; c=relaxed/simple;
	bh=4IG/HYlqIo9OCbKVPHD6uEy+HEKmnrzToW3u626PEtk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tlQHqdWAaFfOnDsZDOSQ5fJFfIZ4YwT+W3lQM1BD5XQPrksLyx8yH50ZPJpwDiHBRGdBAhl+k+nX8cY83MRdRbZUa1+Z7NuSHGjl4RNtqIX5aBUli3pwwzWNRIFsZ136yqz0CzokyKdWuwvLhMgltjR+9qFRtwaOrX5u8ixz1dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=x+L6Kci3; arc=fail smtp.client-ip=40.107.236.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXZtufy8GWF3O1gQ7TuuRt07zj7ECqEZBj/p/34Hfm9OLKsi3XGE6YHiljBk3opSkZ1ih6PfNMJN7hCjojj7yhr4mrNvsncWfFr6vJ6EQ7LS35sJb0UoHuTrixaND62oVZul7JVGFB9UBuyNkaMqtUiqeffPPIuCcaS8K3cMz/AUssoU1fn2P3K+xcAzIRB2vqSlIwc3DJOqyZMgbC/Q0Vej06itmaIkd3ToSI9i8c+pwp23cT22eBscM6wxigrQHE/fBXLN1qDy8nufPSUz7q3pE5zI5BMkonx5v8HctOI2RpCYp1bV+9P7Eao/slOY4bhZ69qPjp2S187rjM7QjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZPxwRVldVQzXJ2qS+IMzHwfrSKxh7+GI5ubwnyrLhs=;
 b=YdCD+K9wvjX0eLyLDKfkvmFvARRGJDggGvjVGcH4lFz7CvHYRS4L+50HVFEypycJ42HUJMU9gjovRdpPyHwG25g3oTcw+q/zd71NtITgDhs4uJONtHoa0W3eaTkgLsR0CuQprvh79b98p8M9GOk3t9KjxuShd/OvpFkPF4oG8haoRT32kXj880iM3PL+zg0RxemIG+WA8NHylV9a8hs/0vATJ1RAp489YMXQSAu8J9L+vBpjoqfj/nPsN0v4wTwhLrOeEG8ESKOyw61VvjagAnhgpo3I4lQN1CrG3LTsH+laEioyyXzzJTCdiMY5oHrMdwbpW5xQzflB4WSr/3+gyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZPxwRVldVQzXJ2qS+IMzHwfrSKxh7+GI5ubwnyrLhs=;
 b=x+L6Kci3w0pJkO3ZW095lSQOFkufgTBH/c8zIgMo2OOaIKWQvkv9U2de6doOmSTmm1Fqg13EpWZuMn8An1jpX9LfYEPRpTQN+Lf9f2Qv/7+f/NxesXIpydgsRicU99YxIqSD9tuBVP0bpLHHgMCMf2NldZJe4/HIHr/Qm9/Itj0=
Received: from SJ0PR05CA0039.namprd05.prod.outlook.com (2603:10b6:a03:33f::14)
 by SN7PR12MB8819.namprd12.prod.outlook.com (2603:10b6:806:32a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.27; Thu, 19 Sep
 2024 17:59:46 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::ba) by SJ0PR05CA0039.outlook.office365.com
 (2603:10b6:a03:33f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.15 via Frontend
 Transport; Thu, 19 Sep 2024 17:59:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 17:59:46 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Sep
 2024 12:59:43 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, <Patil.Reddy@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 0/8] Introduce initial AMD ASF Controller driver support
Date: Thu, 19 Sep 2024 23:29:05 +0530
Message-ID: <20240919175913.1895670-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|SN7PR12MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 215368e3-ea98-4846-8fb8-08dcd8d4d8e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bCLXK19wSPjol4qIW+bR2+N26+xp46TRgpuvs5+V0YD+bSV1U9BVgbjlqPvW?=
 =?us-ascii?Q?rKr3VYAdRxrOtpqEi9ueQW/GPRkUX5h6zyJ95NRXWIgDILZuvVktLF46Gjxj?=
 =?us-ascii?Q?LztMTlfKH4qywi5GhefZS/6vJH3lNAMpiMrMzssavfbOlPjfFTnuC3nmO+1w?=
 =?us-ascii?Q?41YQPi4m+qZ/YqqK4f4fhY4EWLZGBCpbDrbeYd9VAy4Xqrf8U7MDkstfSiB/?=
 =?us-ascii?Q?fQpdHwaTFBp4uK3U/uD5DO4C6e6RCXe7G9jDvMH/wTqhbVMge8HgXIANXYQf?=
 =?us-ascii?Q?y3VFJ8b4VTQ4YxCvpQIDlCg0E6znyn6GFZHXjSosM86RVTS6qmUTSjgqw6WS?=
 =?us-ascii?Q?3skeNvMoZC/VsrJ+RxSYmqp0ofvTKNqJW/72lSR63K/rVk1fn2jLJVX8QUgV?=
 =?us-ascii?Q?hL9yiBAbZIXOneLTJkGGtkbjFX3Qk4G8q9H8arTmLAFpLspqhncusAkg1RsZ?=
 =?us-ascii?Q?b1inO5heRREgf5qwj1fAN1a0epSEo7zoHJxCUht7+iFFgcq8O/y7t51SqxH6?=
 =?us-ascii?Q?Lg61r7Ct40xvlsMzwz5FKTZGD/lD2q2bMDJ2WBwAdEfIR2Mwe+Gax4++OSk8?=
 =?us-ascii?Q?S8D4JDAAZ8sq7/7ZGmzl7tSsY5D+3253fbAnLp3fsw9d6OLoW8kXZroX44du?=
 =?us-ascii?Q?Zv8MZ3ZYe/45pFmt7QDqia3EuQgZWXHmEWocJ3bteCH3YT1u2LSa8UzMiIXg?=
 =?us-ascii?Q?sgML1OQBYsXyAvQTfGjwni4ICAioTwIVDUQlIhqy9Zz7MR+h/Q5vB9CPpkBg?=
 =?us-ascii?Q?nw5YN1z8VSj/+KEhEii0heaPmhjTdodoeqpsmztTOGBhFkFpCnx+oGYTlTpX?=
 =?us-ascii?Q?hwiloWGI4uD84U8iGw1jhizn5UMtiwCZMtBL6q0kFcb0VDNGTu0UHo/eb6z+?=
 =?us-ascii?Q?K9yoPVCpwa8zxLUcWdEqLpF9PA0Zk1pgeC5/dQCxqPWujlNDL5sc2hJj5mJL?=
 =?us-ascii?Q?DEctjmS2Df/wmlgdf8OI4+r2NkNXZRSgTbTmfXk/FoLW64JGCCeZLhddLCwR?=
 =?us-ascii?Q?wBaRZSxQtIFiW6O/pfVKpiycvzhESx+tWTcSIiyOSr4xgxbD5X6wl1Y+i7Lo?=
 =?us-ascii?Q?caEOEIwYiuMF4lUgtGDrEIncL3mBXxrYM7gbEQdNtBt9r9Oek1sObDLoJjVO?=
 =?us-ascii?Q?6crruWAKybeh2da/pCKWF1mv0oT/ewGNiJPX/jGxSyhHVkG+IshRIkRWpKFs?=
 =?us-ascii?Q?PdvX1ArGBsc63b8Tf4mJPUxPqZ0TjbMRw14so8+c0mMswBtOWgiP0jXfs+C9?=
 =?us-ascii?Q?yyARIzTzchyFIvg31fjfRdo/Mf8BbDdFM90+0vCB2KIeGiBdMlbvY4z2wmuv?=
 =?us-ascii?Q?1okyahg5Eb/JWj3AmGShp6THGi5iRATAHThyg5NHCtEsAciVn30HYIg0wKWs?=
 =?us-ascii?Q?6Cr7doLCV4BRosgulazAqdn8rzPIPDXSqa4Wzv44tDjNI9rHcsCxHfquvu39?=
 =?us-ascii?Q?OOAwcDvpXo6JZXds80MB3H/4np42supw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 17:59:46.1704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 215368e3-ea98-4846-8fb8-08dcd8d4d8e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8819

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
 drivers/i2c/busses/i2c-amd-asf-plat.c | 370 ++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-piix4.c        |  53 ++--
 drivers/i2c/busses/i2c-piix4.h        |  44 +++
 6 files changed, 462 insertions(+), 31 deletions(-)
 create mode 100644 drivers/i2c/busses/i2c-amd-asf-plat.c
 create mode 100644 drivers/i2c/busses/i2c-piix4.h

-- 
2.25.1


