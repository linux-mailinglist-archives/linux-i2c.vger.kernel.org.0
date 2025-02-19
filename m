Return-Path: <linux-i2c+bounces-9499-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC60A3C143
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 15:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 740693BCB3E
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 13:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8AF1EA7F0;
	Wed, 19 Feb 2025 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ma1VFjF9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FE91E8347;
	Wed, 19 Feb 2025 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973493; cv=fail; b=nACen0sBWEmYBHOTYADESGQPzXCg7W/gi9HuqwIo6IqXGso8/fZb25Na5Sd5gMvdoOfn+wQyOjKFS9ne4w+uuzkU0MuyT4+/zjxWHAVQh9aTtl6bA18ICGHa5Ke/RpY5UQ2rwGTSPKhfQDQLFXtvkR7gV6PBVbii0iKQiWarMV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973493; c=relaxed/simple;
	bh=h8Q+mTRCs1OGaSnBlKCfx/iB+eEABS6fQIh4muEhQ0M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eNsmhJiaSNwzzdch1KGbzUgX8vvTKcCqIvM3IVezqlF6wmTtSx75CVaYG4uXqbs4UiPgV4pDGK4DNYfl76uiBOHRHhoFCE6OF97aeGh9Xrd5Xnfl2tD1HTaiBuPOgU3Lsoiy6xp3VQyh6hC/DBRlQYPbTlw5wj/T2xtBOBS2elU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ma1VFjF9; arc=fail smtp.client-ip=40.107.220.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rh9IK7AkvxrUIU2hehDFtlbMVVXVXQ7FUbZbGivOABZBmldclXLFuh43ob8kEXuZRpqMZbYCip3KZ7HeeVFD68Ikj3a518b5ht/uDEfb8HaQTGcfxDcgMm+NB0UcZM9oa2X2HMevFpfNYU8JZL9KxwjZ67wgMua+ScyzfllBUbAiKZgQ/zDjMl2RlhOUeC077i9eKFDajf7jmPnJFuchmXg4fno+4li/TyJJpPyhklke+yWItPBYAwvOHKg4f2mGJQMxb9hF1hHvWCG85Ga2z1nG1rh70WRFNbfFFkJj8K1sJxG3GCRr/PypLfgHMqx8bkvpCe47cVebdDmRrQpEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYpb6Cd6q90+sUld+Uanw9CpZzTkmMemj2E+kNKCgr4=;
 b=s6jb8Ngla37DRNT2hwCa2umFjKndzXSQMigZyLuP7PTdPTyB082CVaWAoGfciQdI5f3XP9Qx3Z2nn3ek2sFDxjjmCyQyaVwr4tn3kj7H4P8n0fto37sK4r2XsnaC1ArvAjbMe1PW5z8SIeFJ5b+kkYckPHpnPU8Jz57YDW2erzFGG0Kkz4TQrJLS+5pDw74D6/AIeB6dMOMMwDC2mFWQTcz7y13wk7gJW38skRoe9ydrV+pfZ2SSyX3TGVGxhJ206k3ZC3+U/mzBEgIhgrW23BFXS+Yk1/vgs36ZEcZ/SJp2gA7mHmOE7dpG56+EasBBXEPbpPSzeJz8TpnJr4//CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYpb6Cd6q90+sUld+Uanw9CpZzTkmMemj2E+kNKCgr4=;
 b=ma1VFjF97S5a2lg0PW/BnwAY8bJuREc8r7h4fOB9jMJwNC/9gdm39HLcKTTML85vD7Z1ciou0MMg/B3MIjuMwRF2HlaDMhzd3qFe/41kasvFYADv2rNve1ChLJN3gOGPS6wUfzFJRHRRv9UXZ1KZEODeOIMbOT++ApM+975Bz94=
Received: from DM6PR08CA0057.namprd08.prod.outlook.com (2603:10b6:5:1e0::31)
 by CY8PR12MB8065.namprd12.prod.outlook.com (2603:10b6:930:73::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Wed, 19 Feb
 2025 13:58:08 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:5:1e0:cafe::ca) by DM6PR08CA0057.outlook.office365.com
 (2603:10b6:5:1e0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.14 via Frontend Transport; Wed,
 19 Feb 2025 13:58:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Wed, 19 Feb 2025 13:58:07 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Feb
 2025 07:58:05 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v2] i2c: amd-asf: Fix EOI register write to enable successive interrupts
Date: Wed, 19 Feb 2025 19:27:47 +0530
Message-ID: <20250219135747.3251182-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|CY8PR12MB8065:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4df5f0-4035-4627-8cb3-08dd50ed706b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DqtCdWi1eFZzriVTMuMqetZo9e2KYGKouBX8vBIjlZD5GWCjMEHLOwuMpxBt?=
 =?us-ascii?Q?8haqmMXGz96ZqKPUiq72xXDnZRftGEIlX/31xOyDKOAf9duc/CYIHSBUZKDy?=
 =?us-ascii?Q?GJfGE7pG9lhm0iEgcNzuCS1/bgfHODlKEB+caO222nWtqQx+tjt9e1aefB3Y?=
 =?us-ascii?Q?BIRvXSwsi5KPyC20NdfjNBHlZmN5bOdC+FE4/D5BMZQerqMQHsqsO3aHw1iP?=
 =?us-ascii?Q?5Uginj/UoKPUDkAbgzaxEJGprxvZpCQ/hHSkVeQNF/t2wgr9zNUAq/rPB4D4?=
 =?us-ascii?Q?xsFN+6CqRJHUvZZWcn3mB3HQZ7QvebidGMbsrn8S1+7d8q1QE8UX7o9S8qPT?=
 =?us-ascii?Q?kAfLdv/zSB0duQYNp2GcD8OcaWE3DQq7QFu6c5LPSdtokn1x2PXvC/YB5A4y?=
 =?us-ascii?Q?Kr8wj7zi3+XNhh2IvPjiRKHVX4GXMbmyDjh5mvlRSg0f/eDBcBnk4zPJQKcc?=
 =?us-ascii?Q?8Ao60Vdg2mkOoqC7D5YWghStF+gdrrMuAXpXnD07gD1ec8oVQDjpWiPygKLd?=
 =?us-ascii?Q?WbYk0U46MRFho2fJIK+xBzHLVOk+sUlL8RinPnNhI8JyoyKXPb9Nj/vXIweF?=
 =?us-ascii?Q?C+nqqPaM8Y8LkhihYtjNzKwOCZTFB5Ce15cl1c6X4UQhTuJQiXoyJbjbRrOJ?=
 =?us-ascii?Q?PunqMFR0X0pb9Uo4GJ9ng/QF4Zk2zdVcm7WRPLQrHjhd+OJ/pkygNP38s4uC?=
 =?us-ascii?Q?ksCiZDAEcyZssE8DJIWBFrnMYlkgheFMklL5FbVDd6SvpOiGKPqGj0y0vO5W?=
 =?us-ascii?Q?4AEMBQBZhtwZFU6qpT/fi1ctk7YybV2CV+NJx8Z8aEVTg46v2MUDl+CIcvgx?=
 =?us-ascii?Q?Q8ddFzU8gaFrZVDSQYvkR6q81rVgJmjiOCt53JaFK5Wp4NdU0SgXnCt+zdBB?=
 =?us-ascii?Q?H44QR7HDBaQMNx7wz0ERTXgmaTjeOYJaGfCeyk0/xP44+7M4C7dHISNyyRCs?=
 =?us-ascii?Q?kI6EIJ0SUKwSDePiBGQoPXIBDfwY9Snoj92zb0VEXZrMvKFqNiVMn6I629Wk?=
 =?us-ascii?Q?dCNNUmZ5tELMC3BnlogQ6ghrJk+vJ23CZ90Rtw7IpmOju8v3FXCSxZ06qMUy?=
 =?us-ascii?Q?gKgUKmZNTT1B0ZiD/o2mIIZcBZ6TveEtvbakN6ukBH4YLLW2C4w6hK33fEfw?=
 =?us-ascii?Q?AP3HZ7dj7n+tZIN9FEcdMbgoEXo+ZFj3gGApDipuXiNpi1CNJjrtHFnLMEYn?=
 =?us-ascii?Q?p2n9Wd2VuqNJEJftkXn7t3s0aRQrasPiNdsHRnvk+yoFiawIZgAP8v/8BXWd?=
 =?us-ascii?Q?uXk3dWOyfSRBUMtlfB9DXiXE7re3UEOj4F4kvy8L27mQC8SoV+Oy5Znvkk+B?=
 =?us-ascii?Q?SMCJIJ3FfYCwYhRYSo1wBslM7HWByoPb34fHHQ0NxGPJB0C53savq6bB6VxC?=
 =?us-ascii?Q?gxdOwQsqxGsFLNbRjWh00D/UJHzVWSxhQ8Vx5SkeyCjXUHpgfqDi1Z2xwiR7?=
 =?us-ascii?Q?apAImegREfPT2wohtuSQ+hDkFx736J7AP1LQTAnmJim2j8G3k3rRoPSRlKZE?=
 =?us-ascii?Q?xLHBwB9I7dB8HWg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 13:58:07.9108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4df5f0-4035-4627-8cb3-08dd50ed706b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8065

The commit b1f8921dfbaa
("i2c: amd-asf: Clear remote IRR bit to get successive interrupt")
introduced a method to enable successive interrupts but inadvertently
omitted the necessary write to the EOI register, resulting in a failure to
receive successive interrupts.

Fix this by adding the required write to the EOI register.

Fixes: b1f8921dfbaa ("i2c: amd-asf: Clear remote IRR bit to get successive interrupt")
Cc: <stable@vger.kernel.org> # v6.13+
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---

v2:
 - update commit and add stable tag

 drivers/i2c/busses/i2c-amd-asf-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index 438db5a9d0ed..ca45f0f23321 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -293,6 +293,7 @@ static irqreturn_t amd_asf_irq_handler(int irq, void *ptr)
 		amd_asf_update_ioport_target(piix4_smba, ASF_SLV_INTR, SMBHSTSTS, true);
 	}
 
+	iowrite32(irq, dev->eoi_base);
 	return IRQ_HANDLED;
 }
 
-- 
2.34.1


