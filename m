Return-Path: <linux-i2c+bounces-3387-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D86598BAA0F
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 11:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DCE1282CC4
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 09:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D097D14F9CB;
	Fri,  3 May 2024 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AYCZDhK9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AA214F133;
	Fri,  3 May 2024 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714729346; cv=fail; b=KwWowYoV25eaoLZgkw1GqBtmeKfblkedJuAK5ruIttwLRKp0fIaJdSt1pwm7ySilzBtHIta9JIkw/ENXcreyONVEp8te04ahClsWyW0l3YOzGdPt+5db4wRCHFSAUMFWkdcvf/VljK1PsS+KFPh+YVBi5ti0b3YjilGoyYS1lCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714729346; c=relaxed/simple;
	bh=3akHtITxj/VzSt9L+6TeWeNolyLCZwwkcxMnq14dspY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bfHi6WP55xrDXLG4UkdbVTSwABe9UdtuqmJxyQeLoEsr5ojuADB4kCAtJEo6NvGQcf6KqKX2/s92RbSFvgRi1RehhXE8n5IRxRMJIch447yLpnYVgwmklydple78Flna2JiT6nNBELHh+t4tQUTc+NlZlw1vR+DXI3POQLWHNU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AYCZDhK9; arc=fail smtp.client-ip=40.107.236.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F9qQ6E2Ydf5M9TxEs/gZYFk/eO8tIBX3HJLd6FQmNMJHIiIEZPlKGo2VQFj2rYMpOjq4oPRPT8D02nCnd1Jy60XPMhLML2b1suihs2cHS3+hNZ7DZGhDyhVQsPxboYzuiYsAItHtQaCtX5D+X23o+KkGPQDLj8jRR8eLdoaRUyOgKQalgo7F87WTY/KBytYJtDDonHH3l1jx3N96bTMn755E4lu1n8L1xVUCEUtBBOV2q9B6e9GR6a5n/nC0/twmeHkp2AX8NX8XnbEYflq8px4mc9GOujfzPOFW2CxTCxkFoGgWGqsPIoHpkmMRZFzyMa9ljOLYX5t8PzYoXV/imw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h87GIoUzMAMiPdoTA71NfKITgGso5m4KaVw0yKqnSXk=;
 b=S8y0wHKHaAQyKlVYKy3lQHw8+dhD97E6cRUyRwZxQa77vkyB/I35KOEqNxfRAgidcM5R8HUVfk0vZoP+t+AOz6IQ2TRi8EunU504ngxCgQZgKpvIo3cyN0LNpqaJdO8ZJIyz9PMnL5mlnwSaIGDwE9vvaaY6QRwOcbabWKK7eEM+Fd7filgjfL3kzmZ3/5T/XzSHGPBI3bTvd3vMJsyD/thnxB2JIvRScE49CG/q0UllOpvZusWN1kS34l53aaDkiukO7c6TbnZTnQjfnZYUrkW8KjmMf08zPAtymuuueS1S9SPT0JHP+1L++2e9d4wqP99XW+CPw1/4ihufs4Gs+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h87GIoUzMAMiPdoTA71NfKITgGso5m4KaVw0yKqnSXk=;
 b=AYCZDhK9IgvQaQYHeDqbdmLBi5zkeVzYoYqn+7b5ixiKWyRmHJ58BQpC1s2Ixdarhy3pAsV/FpHn1JcVfQNLaIMGf158FP/OCSjQUmeQLCENyePm2+30+cO1Y8FxiVBIvmlUwVO59XB/BfrGTcQhJNqxf+PWmNdtn2B3puKf2m0=
Received: from SN4PR0501CA0098.namprd05.prod.outlook.com
 (2603:10b6:803:42::15) by PH7PR12MB6539.namprd12.prod.outlook.com
 (2603:10b6:510:1f0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.32; Fri, 3 May
 2024 09:42:21 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:803:42:cafe::7f) by SN4PR0501CA0098.outlook.office365.com
 (2603:10b6:803:42::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30 via Frontend
 Transport; Fri, 3 May 2024 09:42:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Fri, 3 May 2024 09:42:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 3 May
 2024 04:42:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 3 May
 2024 04:42:20 -0500
Received: from xhdvaralaxm41.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 3 May 2024 04:42:18 -0500
From: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2] i2c: cadence: Avoid fifo clear after start
Date: Fri, 3 May 2024 15:12:08 +0530
Message-ID: <20240503094208.296834-1-sai.pavan.boddu@amd.com>
X-Mailer: git-send-email 2.37.6
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|PH7PR12MB6539:EE_
X-MS-Office365-Filtering-Correlation-Id: d01d14eb-40dd-4a44-baf5-08dc6b5554aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZVw6xPjK70yjEOg9BFTi0RdpG6IBqx4NDKWYolHu8J2tND+PeBC0Rx9m05rb?=
 =?us-ascii?Q?fe4UWzQ/l9XmkJ1sGBlTJZaqRFuZS7TY+UmRp2EhofBESONV5an9TN3IBBxk?=
 =?us-ascii?Q?+HQiD3HYYj0u/4ttBf1Jb20ndxUOqlI31M5THRWJchFGDW0i54n4eBlQjQAn?=
 =?us-ascii?Q?oFtwwPokCPIIm3+FeSQTW3AmGwx941IL6ZBi/clb6tDZdXZOYacQg/BkMSt8?=
 =?us-ascii?Q?F3weNB8lQgWOtcqLqVMH+jbfaz2sF486xEyBz1xA0qggoS0Vrrr1m6hcZMm+?=
 =?us-ascii?Q?8DV+Wh+fYg3Ind3KqCnBjJyrNaIedVVY8O170DAFx4hrRVmVWJ4oHP5cad6U?=
 =?us-ascii?Q?iDFZOOvhXd6MSGBQTBuW4XFO2UowF4eQw1YF1XXespjbG6wiQawXsdhXhRBO?=
 =?us-ascii?Q?aNuOCDY/QVHmeO7GcqyKUVh/vpcx3dao8edpzSGkrWz3WtcCUJSi1CYs3kV/?=
 =?us-ascii?Q?B45Y09jYMYJeDDwlcq/K6Pi1LFvFU7I9uYU1t3QeQT1yrPaEP61PfjcPNQUJ?=
 =?us-ascii?Q?DXHzg0BF+rE1YeaAhPAM3/aKHDqGOXSz4DiOO9L/c0YFN4Mmz/KzesL6ItKk?=
 =?us-ascii?Q?nrpDS4ZZrQJ3x8dyqAkCbDhZJhTiG9957WLskFsmi8fgUcthbPrrmZa9cU6U?=
 =?us-ascii?Q?Zs+nktPA4e7ONGyTz0pg5suRvLvzb5yEhiKifexYnX7OBC/0r7SEQzt5Tyep?=
 =?us-ascii?Q?fh07xaQsqxXdtWGmohXyJkjzFQkkq3NJMuG+9+7ZezDLmvlS7mz1VEb1sVvn?=
 =?us-ascii?Q?D5FFVJpOwtaE22UZuH/0mV22/AG4ZQmM+3jHMJzNWk5F+v0UD30oCimyeOqa?=
 =?us-ascii?Q?ZxHT3qWdg19xz/YGEP917SOJlOyzxiszjC62qMGudP6GCFZSYjZO56gJCSQ2?=
 =?us-ascii?Q?te3m8xGVDlAkd+MJJn5r3KgM9a98fdT5GvtaI7NhifKmCx/5zOvHhG2KFU4J?=
 =?us-ascii?Q?hiFDPAwliShKHpyCkNtp+IW7mdDeHQYC4BBUpFF8pDygkItt59yVss4uotD6?=
 =?us-ascii?Q?04ipMb59fPqMYT0c9BBMPZQRiu3TKwhYgyI69PF9WosuW7LvVc6Iy+DaXEB4?=
 =?us-ascii?Q?HciC5oZVfEla2w/3guEHnScA0hgMCyU0yM5rGB3JAhPFTnudfp9wBUayeQKo?=
 =?us-ascii?Q?+o3h2kWt1bDZVahFOlZKcPyVlQGq3s0q12dVB1r5v1wy6tPCGvX7cSrxchvF?=
 =?us-ascii?Q?2x9u6CWkQig37Ca68jqsS/dxbLoVbKkwUQ0RQ2k6U3NX1wNd8XhLWxbldBHk?=
 =?us-ascii?Q?YoytcGRRjipzElyPokSOpJ3gMCivSMP1bdWqXMH1AMAZAgmR+s+DrbYTTGix?=
 =?us-ascii?Q?PrElMK3sgEtJ15HQHZdilzBvRzAH570tbW+1zS/FFydfQRsKb8/OSy0L6kEA?=
 =?us-ascii?Q?JomECpZCxBIdkIwyqSpCfRiPWOiT?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 09:42:21.6010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d01d14eb-40dd-4a44-baf5-08dc6b5554aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6539

The Driver unintentionally programs ctrl reg to clear the fifo, which
happens after the start of transaction. Previously, this was not an issue
as it involved read-modified-write. However, this issue breaks i2c reads
on QEMU, as i2c-read is executed before guest starts programming control
register.

Fixes: ff0cf7bca630 ("i2c: cadence: Remove unnecessary register reads")
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Acked-by: Michal Simek <michal.simek@amd.com>
---
Changes for V2:
	Fix commit message.

 drivers/i2c/busses/i2c-cadence.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 4bb7d6756947..2fce3e84ba64 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -633,6 +633,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
 
 	if (hold_clear) {
 		ctrl_reg &= ~CDNS_I2C_CR_HOLD;
+		ctrl_reg &= ~CDNS_I2C_CR_CLR_FIFO;
 		/*
 		 * In case of Xilinx Zynq SOC, clear the HOLD bit before transfer size
 		 * register reaches '0'. This is an IP bug which causes transfer size
-- 
2.37.6


