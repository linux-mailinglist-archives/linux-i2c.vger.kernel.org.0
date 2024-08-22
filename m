Return-Path: <linux-i2c+bounces-5682-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D15A095B83D
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 16:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EC531F25BF7
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A111CB15D;
	Thu, 22 Aug 2024 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="M/gm0fUs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7261EB5B
	for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 14:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724336559; cv=fail; b=R8N60aIkF56+p8oTghJPaAUWaeg3zJo0bpMZHFbylk1w0MEsiK6NS9cP+i3KfTtXcASnBy40RxvjoSAw/4C40EPaPkWTboSWoqhJdIwkGBqaOcCp4J2QbAq7xgqFJ4nf1SeVyoMwhASJYIOfBTJHu1u54y1dYRd0FLJKYmRsKGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724336559; c=relaxed/simple;
	bh=30WsL9youcQNc2gn8jNUOyzEK+3eErkD0aeJpaqJ+Xw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m6SrjT/TS/xzm7oJb9fjt8DXlhBRhwIzm2BZliVFzcxpYzw9z1yffa858Ej1I2AvCaf2dfNIWC02itQ0aQYABi+0wiQk9UrM+2U6IiNKg6d0C6VFuKwpl96ONWZR7g9EzeKW0IdW/GUPr0m00fF/IZ8UgcgrSZab40Lxu2POBZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=M/gm0fUs; arc=fail smtp.client-ip=40.107.93.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yleT+vqOSCfn1chFX2fnXgdH5o0+7o524vzM64NlwjGXhyxLberTFPVyF+Or/TWPZv4kQQwZ6D+bfphxGA5f1n4FerdwXywqXO0xpr82aNYY30ePdoAH99gwB5QdDTcWVy8R9xHqbEFPM//Q0R6V9Aurw9Qe5CWuNLzJIbokdSVJJtK9HMkhMz6ZmQTbvUd3fkz/hg7MbaUph5cWiTuiqA+RKQSk+fFTJNSHZSGPYC7W+3Vw6fh0zf8QMqP09ennkCZpLIQ1qUQUxBWqjbXPCqE8j+GyVgFsGFgFHE72ATw2QDwPWRteGtOcvUgm5N5baJnLU5e3YYgOsxnDcIih5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AH5jZcC/2qCRr0ww8YQQMJP1CYHiUb5y/7VoqhrMtHY=;
 b=Ctk7atk9DqRHBEYHpf/UH3DjSeCWWZ/dBWnxiCzmXQIkRjdF9ILCBoSt6fLIKW4ae3ZZg3evzX6tkcycDf98Kbo6DBTYQnJmLU3cT/VkdNtCIQzaNGdE94v7F8A0/i7D/unMDTnFmx+OEOwiIrtWjizkuF/v2acqc44NXl77Hk3ELNms0moxOrauq/NahJnkYeo+XUKx+r56KpcAJYUaYXRnUKtjb4X8DI4GHrZimUdsW9Lvs8lDPuOk+fHCmrT4Miwf130wZTImiTXFwLoFiDplCMcSp8YaJxQlhr5+GRhvaJS6p16IMri46lFE4rxEBjErxgp6qqfYeh3AICiORw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AH5jZcC/2qCRr0ww8YQQMJP1CYHiUb5y/7VoqhrMtHY=;
 b=M/gm0fUsl448XmrZ0eFXz1BopUzopSqGzWhAHBxqvKWvZrTw9RxCMZxfNL83y71Wcv1jUgjacoBnfCDPFjGu+nd0Klasvmno/XC1Emb3gMRZWTJ/y/wapyztjbz88vQmC5t5wd7ME6lulyTqkvxeEMsHCmLcwjTjKYvwbO2/QXg=
Received: from CH0PR03CA0334.namprd03.prod.outlook.com (2603:10b6:610:11a::25)
 by IA0PR12MB7776.namprd12.prod.outlook.com (2603:10b6:208:430::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.26; Thu, 22 Aug
 2024 14:22:30 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::bf) by CH0PR03CA0334.outlook.office365.com
 (2603:10b6:610:11a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19 via Frontend
 Transport; Thu, 22 Aug 2024 14:22:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Thu, 22 Aug 2024 14:22:30 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 Aug
 2024 09:22:28 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 0/5] Add ASF Controller Support to the i2c-piix4 driver
Date: Thu, 22 Aug 2024 19:51:55 +0530
Message-ID: <20240822142200.686842-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|IA0PR12MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 429b24d8-35a2-413b-9cd8-08dcc2b5db5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zs/Q74qlATNzpCol1LY2dA/Vr51Ifla/ZMnbK3Bt6eYry/FI6/HFha9r+kzt?=
 =?us-ascii?Q?0PTdQse8y6oksCIuTBVK5n8kcbCD9j+45p/Tbgau0m39q6qfnpOKCkFuYleP?=
 =?us-ascii?Q?l1lunkJTqtpUo2wnrstgu+/Z/zC/mMGo2JfIF6zSY/hHvnoTEkEZuIcEPopR?=
 =?us-ascii?Q?x8mf4U/KFGAUJZFPnC5mmQ1S3HanVpquPunoALk8cMVmhkuZCMnMSMKWdwsW?=
 =?us-ascii?Q?Kpgia/1RoIM95xX+bQpDtkb5Mb2yASykWZlSyYvBJL7EHS7W9eM8YfD691ZQ?=
 =?us-ascii?Q?B4biIfIWXpJkz0k/LToneEyZ906QUNbG2e2MQV0SC8YyjpVg7+uk5wmbYVgX?=
 =?us-ascii?Q?adTh9loyJNIyNAsBvvP9SDSw/RnLttCiS8qJDVVyHda+U+g1dQM2oB7eYF7U?=
 =?us-ascii?Q?otRVavjyLXMoVZjkfoErpCu5Y+FUJ3h+rhWEAaErdTLumXfzmkQqnqpcGk6L?=
 =?us-ascii?Q?a4TotaHhbInTO3mub68ylCOpFsVQpW2XUD/a0/8eazVO1/6xe4JsoQsIMKoU?=
 =?us-ascii?Q?2dLHM6XAV6ItkDFlyQJez+nGLzuERDul8aZH1OuMzd/RBheu5s2WbC2hBW0F?=
 =?us-ascii?Q?v1vrm5Pk+2BV3TVUrkfk8osVZu8UiR1f9zBhBCq9FOTpVGeneaNlZBYb7kDE?=
 =?us-ascii?Q?yHH5tq69PyCbtq8kO5OESLsjPMsLg0L5xMMpokPDGOgev7G3MHD32Csp6uav?=
 =?us-ascii?Q?slfR7TXVTWjG7fW/fJRwfKeosxZ2he2sg47hk9xka5jnBwbSbmCRu/AR3Ok/?=
 =?us-ascii?Q?dH+BjE/zKpBVAjbGP+PzQlfZMdVOV33mvxf6T4b84zJ8tZq5cnOFzLesnMDC?=
 =?us-ascii?Q?o87plmLBjuPanE+5H5aZLrP/rwe/FtQwU1kzResRV6uAIgjey657HV7qxlTL?=
 =?us-ascii?Q?AUUciXMwZKWGXi2oXW25RHvkRZwzvF6tKyj5OHe4tFEh1P44jO+ANWEO+PU+?=
 =?us-ascii?Q?3NghmabsHELEn66HLl7GicqG2N06EmRyqIcWjy6IZYm5WIVxJlQEkVvP/r88?=
 =?us-ascii?Q?RrgBHr4fe8ROyAxqEx7PbY0qmfs8xMryklIH++iLFOfsTgc2MYOy9zsAvjV7?=
 =?us-ascii?Q?T3GEBNK2pWpB6WktTndIC+Q8zdhxxX7ewn6q5xadvYfMEpOPF4hDcqFurNi3?=
 =?us-ascii?Q?/jX14c51W5fesRp/cR6A812B5z2RdbudqTbE5g83N30AhpJVqdA0DDfaAwRG?=
 =?us-ascii?Q?P8jt6LdvPXUW50xZWqsF+BKTxyzGlCle9si7ZpdBYaSZjQq9ZKQ24zamhaLX?=
 =?us-ascii?Q?gmo37kLk6K/9JTAbqhosoQZDCoI9EPEl3S6S0FHEghq9heQ2dIIkeBn4cLJQ?=
 =?us-ascii?Q?ICQqLJB0mtUSuQUteMtjr9snMxOq8xB+cIfk2/mXXm0/CayF51BvgbWzIUR0?=
 =?us-ascii?Q?53upLwfByuv75X5QSuvTtGOfn2m+hC4TIcvdfHqSAYtcfRZk6CnKxwutSVO8?=
 =?us-ascii?Q?iJt+MaLrgcteA3k9JAnhtDhke5gP2ByH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 14:22:30.2976
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 429b24d8-35a2-413b-9cd8-08dcc2b5db5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7776

The ASF (Alert Standard Format) function block is essentially an SMBus
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

Shyam Sundar S K (5):
  i2c: piix4: Allow more than two algo selection for SMBus
  i2c: piix4: Add i2c_algorithm operations to support AMD ASF with SMBus
  i2c: piix4: Add ACPI support for ASF SMBus device
  i2c: piix4: Adjust the SMBus debug message
  i2c: piix4: Clear remote IRR bit to get successive interrupt

 drivers/i2c/busses/i2c-piix4.c | 390 ++++++++++++++++++++++++++++++++-
 1 file changed, 381 insertions(+), 9 deletions(-)

-- 
2.25.1


