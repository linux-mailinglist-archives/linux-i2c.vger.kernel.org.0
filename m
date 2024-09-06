Return-Path: <linux-i2c+bounces-6299-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F423396EBB4
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 09:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EA961C21416
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 07:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8CF14A630;
	Fri,  6 Sep 2024 07:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zTqZm1XQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2057.outbound.protection.outlook.com [40.107.96.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D16D13BC0D
	for <linux-i2c@vger.kernel.org>; Fri,  6 Sep 2024 07:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725606785; cv=fail; b=iAxk3L28k5Uh8JhjitkmsKZSkf99xouXdb0UlypeQIB84fX5woybUI5BLc8xVNEVa2thKGkE/yBMghlPuKm2cdTEF09uaN6nP24xzQwHTkY7FHTZuWIoEImCiIeSuR5a/9szgg99sT1f/2XNiJxzjAnfVhnsQikgk7D8hT/17B0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725606785; c=relaxed/simple;
	bh=HOmZ2aLObOgeiGt4idNTyLa+Rkfts/aHh57pRkt9yzQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hQn2H5B2n3Zfe703MTxGRsRnPgkzZcfBGtxD3irKU9zLCSce3js6bmF6cnf1Ht4P+CkKyjB64aYqsMzDqyPgeLk24VhNyTW3+/N0MEnHMV6QLXpC2eQOVCphUBPWtvs+s/3rWvJgNlesnhX0R1RqFaHUO8rTvieymWvRb286Kc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zTqZm1XQ; arc=fail smtp.client-ip=40.107.96.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQWCLfkv+OheDM8FVZ0hOqSQWNJdpZw2Hz4ZhbdoukboKmQwVVfn8tU52yuP+gD6VBV7POo8RRvY7MKfSJQuH7duHCM9fqFDC8wNp9NmEDRSVbvwLZgG4GBhKlb+UtDD71IPWvp4Zo7MZmNYlaH0nAjkQ8DA/vXGjyUd1dJmdZcOMCh5pgnuWHApnz4RjdHg1uI3Wzeyv3TYla8AXarL08X9Kd/+qfjQIhfMshCOwM1b+JcCp+jJuDgSuob37A9smYRysLedxtMevm9PKhQwIjv68M/yUJq/90LCVrGWxIroSyysCZPlzbl97ctdm0jXrwgy8GUABdzXY2YpDM3U9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CoYuz/LUq6Mys+QmtYqUYX3ZYh9EoYeJsP3urPox0o=;
 b=aqceIvySMUJdET54+WuLN1a1us2buuTf6vBkummVWbAKjVfE7J8WoOPYEv/iG8XiF/dY6XWvz82Gm+t+rVX94Kyaih9yxcn2gfvrt15s52yHfgXBW5k4tUAWT16v0d00JJBqtBZp8wzjmKFZFpU1iRhX3ybGH5As7HteTk3n8F+sycWP4ncyNivzaY9vqeP7L3tsn45A7wTciiMSSeciTqQ2rSjm/Eddpr2ckSyU8traKJXt1gdxpFsXSzhdUJrboeK0My0o2zbjVbEpmiUaWyDkmhtuB1sZel4kX4Pfounhx+Lwn4wg6+GEBHlMwD4XC77Te+t+q4iYD0bIaH64jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CoYuz/LUq6Mys+QmtYqUYX3ZYh9EoYeJsP3urPox0o=;
 b=zTqZm1XQIGz5g2pNOGeKeVadooLAgqyGo6XKZpiOAKLK+KKa7g24zgw/r/c4cN9Enq2GQG/QIez7NBjdicY+Xjzd+ZGuAkJWIMYAhPDDeI31cEdJOY5hPo+Jq1So+GH+Lld8h+BKZnZiWAe8ADRi8tYCaBnj45CFXu/zm9Hnyus=
Received: from DM6PR07CA0088.namprd07.prod.outlook.com (2603:10b6:5:337::21)
 by LV2PR12MB5725.namprd12.prod.outlook.com (2603:10b6:408:14c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 07:12:59 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::c2) by DM6PR07CA0088.outlook.office365.com
 (2603:10b6:5:337::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14 via Frontend
 Transport; Fri, 6 Sep 2024 07:12:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 07:12:59 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Sep
 2024 02:12:57 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3 0/5] Introduce AMD ASF Controller Support to the i2c-piix4 driver
Date: Fri, 6 Sep 2024 12:41:56 +0530
Message-ID: <20240906071201.2254354-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|LV2PR12MB5725:EE_
X-MS-Office365-Filtering-Correlation-Id: f5cacc5a-008f-452a-f7a1-08dcce4356ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ajT6Eo1aXKJblh/qA3kAXoGp+arDCFtL1QLRUsvBYWTlKt5PUa1pNKEASO2Y?=
 =?us-ascii?Q?HzmOiCkonSREDphEuSe6HpdAPXSduQJmIuR8GZCEZxZIlfwMQI1YFiMsDXOv?=
 =?us-ascii?Q?MSNwEDHfYb/a6cSZnlMC3PyBeQ/ZNguTR9Z4b/oBvy5ihqzw6vY24WALBMxW?=
 =?us-ascii?Q?NYr4S2nJQsMlHhU0LfTbczZ62Jaurcx/8Ha4v6shr4BYoT1b2IT0hjbvG1Mc?=
 =?us-ascii?Q?iQhG2GQdNMUVIRZk14xVwOfcdS0Ix6pW30WSk4gtCecUHuFxlVH2ih8G967R?=
 =?us-ascii?Q?LEU3P9q412m0SHV5VKXJWZgxNiVZhYgL0LQThe5Z5U2s/c9EWsjtvpqobTue?=
 =?us-ascii?Q?72M1p7DrXu/7a5x2FTMJxaD+Qfco+6WMDx2xZxsCiL7Am0sWjzGdQzNFjluo?=
 =?us-ascii?Q?v9WFZ8iqrePRH7zPd5n3lBxU/CfZnt8zpzH4ydpcMPHGt6ek9Vze0kdJwkry?=
 =?us-ascii?Q?rK9o6wK86FzRvn2ZyZm1iHnbJWEkTR6CJb0J2LcquZEBeeq7qOGHgoTa0hED?=
 =?us-ascii?Q?3CLUKtydc/yWIdaOV3HXQMkeMJ0r8FoT1VX4OGtmJ6ysMSgVU1e08zv53fbb?=
 =?us-ascii?Q?j04RjAYKIo+km0htc6CcJ3ZoU8TUDr/KnNcw2P/h5lA81LUd9vWpL8G/oMHw?=
 =?us-ascii?Q?MBa34YyGhwQkc7lklV3CxZ+3PlunbuJ9N6gIWXgj3w0IAqR9YGRFOEye9VuF?=
 =?us-ascii?Q?QesXLrEGY+elfPAqfmifS1wMRREDybufUPDZgNmxmOQ6RS7uquJlkj+u+sOo?=
 =?us-ascii?Q?i4x3oQN6rwUMGrFN7w2RT34lJmJrgJ2yR7XNuhUO50pV37boO/mMMkspI52r?=
 =?us-ascii?Q?Te8HfIJbz5L+qyKG9+c3J7OrCGDAYlnfHjSo8JjjYCSZSYrCSgebgVX2o3mi?=
 =?us-ascii?Q?TLUe/6ygk671/jeDaLMB9mkleenSoFB36SnHVehplLd8K1/PqRDOj7XShpv/?=
 =?us-ascii?Q?x1h7UFU/uQ/YqNHjMDVu1XgNzHK/sK/0ZcLNAbP/0vZLwhowybCiBNE41Hji?=
 =?us-ascii?Q?Ftc3wVboWHBZO2hg1khnyv7Cov29bcG+RkRHcyjiYeSLPSkSPoX3/BJ6nkaP?=
 =?us-ascii?Q?r+1gC+AAStDep0aE6cCZplYrUG2+Mn02ZpwA2I2aySxThp4URqjSTk+dKTNC?=
 =?us-ascii?Q?Kf4CEtOXvw05gfbXhcmFiogCGtkj2u0efKPVgIZinwXg4xs+SVaKXn38/6Wg?=
 =?us-ascii?Q?VOQ7DHwmm9wSswmBPW0E9P8ZRK5M4/+0tgjb+IW14qIpWBQmp6hDdo3dHB83?=
 =?us-ascii?Q?mn8sr2VlwKzD2B2wfgsxo7PcuxJPzVn1gGwAd1RA68FCnZICodTEyDMrPhL7?=
 =?us-ascii?Q?zkI3Q4fqkp9x6uAmKCYiK4B5BRZCqhUf4lrqyfcSIsP+1uhsAEzGripTeLtK?=
 =?us-ascii?Q?ylR9bBYkIfytBeFRtJWPTm9NGSyudQvUdpdl00q7jE/GjI1pWLheu6yTW0WO?=
 =?us-ascii?Q?Zyg7e+5Opl77/CC1nf3OAqq1d3+vYHzH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 07:12:59.4525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cacc5a-008f-452a-f7a1-08dcce4356ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5725

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

This series of updates is focused on integrating the capabilities of AMD's
ASF (Alert Standard Format) controller into the i2c-piix4 driver.

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

Shyam Sundar S K (5):
  i2c: piix4: Allow more than two algo selection for SMBus
  i2c: piix4: Add i2c_algorithm operations to support AMD ASF with SMBus
  i2c: piix4: Add ACPI support for ASF SMBus device
  i2c: piix4: Adjust the SMBus debug message
  i2c: piix4: Clear remote IRR bit to get successive interrupt

 drivers/i2c/busses/Kconfig     |   3 +-
 drivers/i2c/busses/i2c-piix4.c | 396 ++++++++++++++++++++++++++++++++-
 2 files changed, 389 insertions(+), 10 deletions(-)

-- 
2.25.1


