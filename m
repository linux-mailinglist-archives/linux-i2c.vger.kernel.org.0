Return-Path: <linux-i2c+bounces-6137-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE1296B97E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 12:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CD77B2761F
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 10:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FD51D0161;
	Wed,  4 Sep 2024 10:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ha5SU5zH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5438513AD22
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725447493; cv=fail; b=eOgW6mgx9igJ9I3xOJkApOo1zMgOZb4ef0s9rA3Z0XuoDF9vriDvVb9R+iW7Pyzt5PbhqAh3RJvcK5xcthAJPhd7m49y1l9Fm5vMsOboIevUShfgVbYSvDVZQo1dFKerj1T4Pa3KhAlz0QDhCgbiPo9oqDFyeLfS9rjlgoENJQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725447493; c=relaxed/simple;
	bh=xSLoxDftYMkLGACTKvZxEXetV91Ea+CWKxIqZsSY92I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f11dcyhrSLRDjc00Tjh6W3nAmoZwptR3dzrGT2buuZ4Hi88o1RgC69FFFIFZJCTGOX6Bg6tutQkGrWx//GKM0mHx9Npagv2PyQkQm4fDYMRTJBUDxVvgqfSDAW2bH0AZOWycSV1BJyQj2IB9oFNeIzGMHC8ZPwlk7Pm2Vj+igRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ha5SU5zH; arc=fail smtp.client-ip=40.107.92.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RK+7ATGnem4VqlKi4L2f7pTPkPK2MQfQW6dlxkpLcU4cEEMBBVdMVlsXkq5ADp7wO/ehVIwwpPhIox935q9hLJy9YHY1OkGRSyvXCUi4GKa9V8ShSbg1tjaTesRAtXNf/tLDnvuPbKFqfUCaT+naa1kfHVO8o4zjpin8ennT9wlYpsBexvI8ZIqMCxoZeNI+4f286If3nUOcqlKZrgpsSTgha3NZLCBf1eRgk2IVHlkgSH7g4t025yHchP8gtpFrMlfb1cZLJBWQ52S5AB5aL5RWZcPJgHGMYSEMcoVaFcXEZoVXp9D/gmUlS5/ZKhqJCaRnwfyY47pm1gaxbxBPnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PE1TYAUKpikyzc0e5tX8AGxC13W5aQjotN8ykQ77LM=;
 b=BBqAqMd4y1JA+cSGn5vYhBgaCv1cihko8NTHih/F53fArGkKVnoASv5uvRDn5PdaWNi61sTHgy+roDDgfnyT2tONw5els75W11gITM7D/F7p3nBTGtW6Fk0sj1+PVZU1iggcM73WxcWw1R30QW6m/CAym46ZJRuyM2OLj7E5WQLNYZ49FcUppyshNVeNDPOYgBrJKOpNb6bwO60S46ESk6RP3O0rHB8Qp1MQYRpTZ3+8SQHRmu9NV48Qmp3t4luTdy2dQ7r88JzmrFGvyz7fHQZeEDnjhsOkxW1JehbiqSzs+v/Z1xGwKux9as9K7XqBmWMq498+uCvOx0eLeFqbvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PE1TYAUKpikyzc0e5tX8AGxC13W5aQjotN8ykQ77LM=;
 b=Ha5SU5zHv/DjkXANflMGslQ5KqfbVD/xoUNMyrwTLKaeZHF4IVAoPtjn2rhcF/i1K+sl72l/6vTpaK9D2fQc8QdliW23fz5ANqPocYPhHzM922OPRmWt8wlUze6T+vBvV75cnc6y58Ey/l7u4oC7tU0JwjmZJwAMpmGF6qcqhO4=
Received: from BN9PR03CA0210.namprd03.prod.outlook.com (2603:10b6:408:f9::35)
 by DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 10:58:07 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::23) by BN9PR03CA0210.outlook.office365.com
 (2603:10b6:408:f9::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26 via Frontend
 Transport; Wed, 4 Sep 2024 10:58:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 4 Sep 2024 10:58:07 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Sep
 2024 05:58:05 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 0/5] Introduce AMD ASF Controller Support to the i2c-piix4 driver
Date: Wed, 4 Sep 2024 16:27:26 +0530
Message-ID: <20240904105731.2246235-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ec69f3-3ad5-4124-e8cd-08dcccd07584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+XmlwF3BEk546Rqfkd9MvlW8jIjxZf2vANwRTGXbyw3KamXAaxPGbwI5wB4W?=
 =?us-ascii?Q?ttTNom3EY6AyaVEfqaZPZt/AwixNPM0XKKrwKCieavinU88jS9h2S3JBeQzm?=
 =?us-ascii?Q?G0+28EVTnAAoiNNk5/2TowqSHiSTachtKhuNENb/IOZSw8bUjtGec6Sl2YAI?=
 =?us-ascii?Q?syadyoouQ3s0kTv0VxThqVTIgSrSzcg6VqVeaP7z6a43lBzrBIHKAf2VUsXN?=
 =?us-ascii?Q?Ub8ecOKCJqoXVfjUiN+x+nOQH6CDUNzvF9A/EuMiTZPhdxtWajx9U53a6ZEc?=
 =?us-ascii?Q?IfrXAmf9oIKyTjXNYCFWLriA0LMwcbik3AUvye15S6NHEnXTsevT8z+SIhMW?=
 =?us-ascii?Q?LPONhuLQblPBzUFhU2jH+hbh3jS/FPwzLHQHZ+Y/XtEPAgBKfCfaEwqOyQlq?=
 =?us-ascii?Q?yjA7DwolQchwFxLAWSyS94tFqoYLx+A7RFHyBgoNVbB+9UHyDfvanF7mVYBg?=
 =?us-ascii?Q?e4yPN1OCdQIFBUUfZ1lHx5/j1sWeFJLCcr0UWV3RZpBoUruQPuybZ4epeSF+?=
 =?us-ascii?Q?v/omT1hEEEAwuJz5FQ1XL41hI8dV7RQrgjB79j6Q7tYeI0xsHGPLDsGc4sBT?=
 =?us-ascii?Q?4hUaL0hHul7eO/J9ueo7ir2Z6qnp0rSsAKgvLGA2vlgG9K4xs7jdfClFUED/?=
 =?us-ascii?Q?dT2/DuPsKb6EMJweNhYgNM0Yqir+AbhB8Nii+drnxpwvKSiVWjgOVn5MZEX4?=
 =?us-ascii?Q?0O18yD2QGW8/ipIPTGynUs2bPGNtv3d92b+p62KXpjbqXnQ+W8pEQykj50t7?=
 =?us-ascii?Q?yA8w4ll7AWkY5VO2o2S8Bh4bgcYLTIlTzMcp1QHdgboa0dg90cNig6S4SvOE?=
 =?us-ascii?Q?+9Ulty9YZxs2daxEbTvdKJZ4cOSdH1YVI5qRojLhC0efrnr1N5t/qsthrJIz?=
 =?us-ascii?Q?uE5PBIBGdncIS4v02zIGcNwrZq6iS2SWfrpESIoDtJ6tOAj/KvL3cXWe1pUw?=
 =?us-ascii?Q?UdSXNrcxT8vJyo41U7TWgOChVmbwfijjz3RUb3MJq4o4oKrOyU7w7uJ0WzHi?=
 =?us-ascii?Q?eIvlwSLcDrM04PUMw1IQ9E83q2lMjjVPh5dT19flvaYkDJRZNtMlISBYSJ7x?=
 =?us-ascii?Q?u+LEiXS6nGcW6wjppFZPdBHFUCMCFVUjCaL6dtVKidKPfLw7HS/RwyUUG6To?=
 =?us-ascii?Q?xwxt1LBmS0DCVhoFigp0MwROV8vA8ZDy2GhTZ0i1AvokqER0cMxmVOmmjkKz?=
 =?us-ascii?Q?2ovdZIl7nbVb7Gf+KO9GtQRdPwpUk5JU7vRBw2PyDGyKrMwJvbDBYhT3/XmE?=
 =?us-ascii?Q?jNZ4UsxsmeybziycAyDR7mEIwnhFLRkBNFzV6UztgKLKUfz20oCTAx5XdGnL?=
 =?us-ascii?Q?aQ9W/64YXRn6Frdf8V/LXkxIXGATNBR3+h/9qvp/w8Ciw29rTkiuAjApeUaZ?=
 =?us-ascii?Q?vxLUqC7sGeTJdkL8N/TaXLfWVkuXszvnGAkRBJ8BN/NNACIY/u7gMo/beSSW?=
 =?us-ascii?Q?jVRqOtYc2aatYgaNFiu3VDv6gqjWL4XX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 10:58:07.5738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ec69f3-3ad5-4124-e8cd-08dcccd07584
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

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

 drivers/i2c/busses/Kconfig     |   1 +
 drivers/i2c/busses/i2c-piix4.c | 395 ++++++++++++++++++++++++++++++++-
 2 files changed, 387 insertions(+), 9 deletions(-)

-- 
2.25.1


