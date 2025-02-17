Return-Path: <linux-i2c+bounces-9467-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C21AA37DBE
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2025 10:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 617B0165C9A
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2025 09:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB09155316;
	Mon, 17 Feb 2025 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QAA0XwA2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2058.outbound.protection.outlook.com [40.107.95.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888C21922E6
	for <linux-i2c@vger.kernel.org>; Mon, 17 Feb 2025 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739783008; cv=fail; b=S7JRNg6o0u7e9AwB1ndwS7J9uU1npaAj9IRPMac7360P+mtM8dUetbk6c8/K7n8KF4Hf6325qESpGJf86cinFNyAJwcOld3qS4FY+l3NqDkAO3K5qs7z/Hsits8yaSykLodsvAjPm77x3WbSk56cuQFvb0a6zcLIi5j3PAWYPDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739783008; c=relaxed/simple;
	bh=i8M7NriqowG7o4HRv2yxgItvYVbPSOJh/cDS1qf/4Z0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ac4FxYkfTeuwobQ2jiA8tFpS0cIZ0++m0lKr+ZKtpNJuCtjlxEBL9a9XO2FcGiJbTk7q1J5j0cifL2hiMNWwZIUiQturX6VaYvbmXlPCudpbvAbupue+CrJJ0yriaoNeMOqi60I6OYvRx/2l7lmE4o4aJhh+MNSw5VouBhrR5dI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QAA0XwA2; arc=fail smtp.client-ip=40.107.95.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHY2nw1QmxEwo4Bl6wtI0j5sz1o4FvNgkQwUkEVU6Wl/WSj9VjltIVGE9rUwvXpWUftMui235hvas+PZS+T+L0Pwhe7Yt72nPTzT1sQ37gnQ7WYWhEY9cYMdlxfX+sAMdZQUjL/fHNYE7Xmee4NAJ08pDBzvdNrQ9WGpRO6IJQP6vr6H2gNBkTB2OwdhsReOegW/IaTtVThMm4PEThfq3vYQjRcwZwGyYRWuKmalOMq3o4XoKjCySsVWtOTY72KoKIMuds8ddHATR+csvkh3/KzJd0FJQw8mGeUsFDEsVgZuWRCoMcbCWGJsMYPyzPhL79Wo3WLfiAxMR8xkrnbTLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pD6MHqXcldQu3477LZ2L86RnK0MZ/UUNBM1IJ2r5WzY=;
 b=E+jUMp05r87yDMYRfEKV3GMPOSUpWh2nznugMt+Rtkgk+1xV7/3crPhE1x+jyvev3g2POQ6wRvyDssgbjx2BMixEM17JtoSNsjRAZfFxCV+SFmswyR/65BkFt1wPvQvQBXhjHoSbrv7Fjj7/SDXYV5K4qMm0RgtRe8xu4d6cuvb5gvzKdKDxp86LPvTS3+BYRtPfdHrFjL1qPspHQcOb1Zjhxwtgk3jydJOWUk39xED/7XPuXu3rJFDT5KSe20I1GChMuSwh2MKHP0ha8RIMj7i1mMEUduvJzF+zSZYUdEHOG0bUfttS76FDdK3hkQLlKUyhYp57IQZxfyVswKBQGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD6MHqXcldQu3477LZ2L86RnK0MZ/UUNBM1IJ2r5WzY=;
 b=QAA0XwA2cHL78Y3jNuCuCR5LRjGagZggUHpgSj3dwt5qOec3ZTiq0aIz3T16co1XKNSsPJnRKp6RYpHYTJZylspL7eUFLlzQPxdJxx1IFD9vy2fTe+HDeC+Y2KPUeAX/X3TLnzO2XrAywC8B2L5/rKDbdjk4tj8FZxew5sDtwV8=
Received: from MW4P223CA0001.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::6) by
 SN7PR12MB7452.namprd12.prod.outlook.com (2603:10b6:806:299::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Mon, 17 Feb
 2025 09:03:23 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::ff) by MW4P223CA0001.outlook.office365.com
 (2603:10b6:303:80::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.14 via Frontend Transport; Mon,
 17 Feb 2025 09:03:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 17 Feb 2025 09:03:22 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Feb
 2025 03:03:19 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
CC: <linux-i2c@vger.kernel.org>, <Sanket.Goswami@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH 3/3] i2c: amd-asf: Clear remote IRR bit to get successive interrupt
Date: Mon, 17 Feb 2025 14:32:58 +0530
Message-ID: <20250217090258.398540-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217090258.398540-1-Shyam-sundar.S-k@amd.com>
References: <20250217090258.398540-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|SN7PR12MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 17327b68-1c15-4988-500f-08dd4f31ee56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZINt5Nbc1Uq8qty1r5aVn6PCUoSvwMDOTSZDgErkwNKTSlBmuDO7AQCj8P38?=
 =?us-ascii?Q?UnOdvVjLUpSx6NjVkNxol0e5K6WESp/Gxfgeo+CmDvDheeV6I9Ma/DcRhK29?=
 =?us-ascii?Q?QogSjpoaRLzSViUmWrTuBVSk/1QwZ8ixlOyRTJSa0U8HGr9U9/NdSECA5QRk?=
 =?us-ascii?Q?ix6NaT2KSXaTFyF9uZdfUHo11cTxnbSAbHntLtuUEwGoPSD7ObGRjNA+tQCK?=
 =?us-ascii?Q?MJDHOzNO6E8LNksV+3VZnL+ozN+oy+7W3AWKv2K388srqiT3xcgK21e6y607?=
 =?us-ascii?Q?396m1CX1YTR/QQIzdxhDL6tsZK5iWFvhu5UwJu2P3gKY8l8/AlY0egpYJ1Cq?=
 =?us-ascii?Q?asSUaADEFhLmBmSSFHKzLQOgw9VM62cUwLRh0CZG4wveojWKpncyVq4Pfbcv?=
 =?us-ascii?Q?32XQGA4LKiJOBAWvI/s+uo02ilVzsgpn9TvwW73yRfuHD5GoBGUehBeHYyRI?=
 =?us-ascii?Q?oN6ryXxzUNd5ufK4Kf4PxgJFOqYgm9bIkbsOFHeqrNs7OAqUnItYFGV4Ot5u?=
 =?us-ascii?Q?fL1kQyVHlqhaz9A6Ptfgay0qqKuNbYBy38ISvVFaMBr4aVIy17IgPy+RLghU?=
 =?us-ascii?Q?RfG7ZYLJqtjkop67kgoDj+DHiw28Um6PcF6NO5aYH1/d1iVnRX+lUAMXIyu/?=
 =?us-ascii?Q?Lcf3JDIFpUD+oqcmiM2BHflid9ghzUsRxhlZ2n2nNKU8n5nkw/q/Cr3mOzDR?=
 =?us-ascii?Q?60VU6Svr8nZa23iZ1uFROh1TtX7m2YCrrv6QA9T0SitPPxix4AI36nYrwyfz?=
 =?us-ascii?Q?q6zBmky0sqD6q4BZKI/5A8EN6NKsqHz71FoQHMIyCYf5LX9wMNSCpoO/G2Dp?=
 =?us-ascii?Q?XEn9Kq7LQK+lmvxkPbbzB8JL//2RgTJ9We5EjfSEPhNuah7Xph98TZqqwuV9?=
 =?us-ascii?Q?MTKUX9ZlDZOXrhRz7R6a3wul0yGjpCRSKVJaZWW/HzFS0B5aEWtZ5Oa9oicg?=
 =?us-ascii?Q?f7Q44f8Wj2MqMEtPbXmovNsS1GrbRyE7kPnE9sLkHekNAaaYip+7PXPfrKsW?=
 =?us-ascii?Q?1TzC8rI3W0StQNNZmJkclkb5OzJWPXucymxBBriyQ/JOK2G9cSfdTfw3cAqC?=
 =?us-ascii?Q?kKv6TWaK4x7jKrB4VlWo7/xU+ZBOKiJPc2IcvPmGqYQ1+sqOT21Y7PmebauT?=
 =?us-ascii?Q?pY/2ubMiBrip3HoS/SYI6Do8IGK2FOHgG4CcPc2i/dxgSJ0te/P0dXUQx4B3?=
 =?us-ascii?Q?GwYEIJCSXUVA75e/ZrDtkyW8ZGqeODZcQjWvav1T8Rzz/f8E07b8kQx5uZZl?=
 =?us-ascii?Q?PlYWA1MkT4ASZaACi7luCpweid2H1EWDHSLnLMQjDFPn5d2KvU42TZbzL7BI?=
 =?us-ascii?Q?l4OaxB1jObnUiJVuRaVdbNpTe/pBNBOiCOWVwLNasabN2OSSWIq6FK2JJpMV?=
 =?us-ascii?Q?b4Ah5E/kWwvmzhb44WSZfo1a8GX1OSEM+3k2pUJh7VYEJFZlsfz+Rn4LZ2bz?=
 =?us-ascii?Q?SRquDlwWGaURA490ruKUJ752vRrY0nsAEuh6WUdYzCxHe64QeeZAF0yCsQ6o?=
 =?us-ascii?Q?4E0nqmgLYiBeT+4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 09:03:22.5541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17327b68-1c15-4988-500f-08dd4f31ee56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7452

In order to get the successive interrupts after receiving MCTP packet,
it is necessary to clear the remote IRR bit by writing the interrupt
number to the EOI register.

Fixes: b1f8921dfbaa ("i2c: amd-asf: Clear remote IRR bit to get successive interrupt")
Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
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


