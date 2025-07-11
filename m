Return-Path: <linux-i2c+bounces-11910-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91451B01C4E
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 14:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A1501C266F2
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Jul 2025 12:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CC22BDC0F;
	Fri, 11 Jul 2025 12:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CQprz97R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CF3211C;
	Fri, 11 Jul 2025 12:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752237924; cv=fail; b=UI/a35EJWQSEiENib518sDTXvdvQKVQbuPZY8/YoX4zbs9P+J/CCzQhcHQb7N6zGiGMA+vfQ6ePWwm+WgAZg+h0IoWbmk1UU1Hpc+PzHtFjp6DeRVcS/DoS/Q+ADRD+sCOSu+JtRMzhWq5MCX6ExX1fMyfpRxNnzP1Fbbm4Kons=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752237924; c=relaxed/simple;
	bh=zpYStXs8TDM5jep1+ukdTaIyMNJx1e6Lsmfzvi/hTVE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UT9vNc1yWzD3w9Fb2xVpPNMmxG0aus15cfTxKD9FsLpApjGZV8mIrwmF1n3dZzEsqZs8SNEu4zwxeKT4ZmXYLZ+DD9Plq/GzwXtXE9Meijmb82f4Mw242rUXdYKFJQECYtKpNkITqFFQqtehBupbs/m9sC/5okk5TAsFyfGQnaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CQprz97R; arc=fail smtp.client-ip=40.107.94.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApPI4/4Qr1HBox/3Uq9oi2bxM/OCqLUv1ijtieOr/Mt0U+0n9ihtmz0j+YLhvKsF5KCj748feiyOwuYvTqjTerQOycNP5KPlMX0UY0/6hM4fQxzOKKjaPKPHWiTmHV15t8BG1tc654SCcOZaUn8kb2704gNVDGLWJRbkLhd0+Erninti/dqPEa8ry2qykHOeL2kAMfCj8MNmIoxdCWuLIGIuWCCUoXOQlwSLyD/v+kuy4nK3Jx6kqMkLKoyRiCX1wflB5V44JBuzvXBsZ38lW8AHWu22T1WOFpVo0H/pvtzqX7V+tEs9O8U8H5Ch+vaYR9raYN796eBDs5x2bJqUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQUHguiM32DP+hJjATD5gP4u6V6PrPtqC4FbPEpWaFw=;
 b=PXT8ByNza2Dnw3aooAnnoZt230ve82ZW5JNzChGeR+FOGDnj+fznNHMOx5oJvU9kKGxZYW75QzPhxa2QX6VVq+FwRbzn21W+e5rLfns8fDnk792CnygVEft7XYjnjTxlrFiDPdmFpPbwB5TAnHRAYWgwevdPysqxhARORheAlpKaR9Gqe/Kcy668XcA70fbu6c1IbxHX3dWE075VIYPjFmAT3PHcr0zJdPcIXIiDiGw+PBlhmWTpCwcj87Bwrfb9UjtTNZDQ5+qsYE9debnsxmMjXV6SFNhu21ePuDVhZEy0rPVTilMwhjjzb9DXVteu8R9k81H5XdqHEitcTmwbDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=axentia.se smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQUHguiM32DP+hJjATD5gP4u6V6PrPtqC4FbPEpWaFw=;
 b=CQprz97RCuGnMQIeyv6PyUxWgzmhBwfMWbLu1+0D0auHugOJwxEIrn5Etbo9ziydPKn9LSOM32WS7qeBiH2ZWXq3eynGansODwI9nNouAE1U0lfQw5EimkbT/9xMrA56PLc3tx3QMNwzSlzlsPXZgfATZh7omLokLVd0M5S1vhg=
Received: from BN9PR03CA0625.namprd03.prod.outlook.com (2603:10b6:408:106::30)
 by BY5PR12MB4291.namprd12.prod.outlook.com (2603:10b6:a03:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 12:45:19 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:408:106:cafe::99) by BN9PR03CA0625.outlook.office365.com
 (2603:10b6:408:106::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.27 via Frontend Transport; Fri,
 11 Jul 2025 12:45:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 12:45:18 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 07:45:15 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 07:45:13 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Jul 2025 07:45:11 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <peda@axentia.se>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manikantaguntupalli09@gmail.com>, "Jonathan
 Stroud" <jonathan.stroud@amd.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>
Subject: [PATCH 1/1] PCA9541: Increase I2C bus arbitration timeout
Date: Fri, 11 Jul 2025 18:15:03 +0530
Message-ID: <20250711124503.3390451-2-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711124503.3390451-1-manikanta.guntupalli@amd.com>
References: <20250711124503.3390451-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: manikanta.guntupalli@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|BY5PR12MB4291:EE_
X-MS-Office365-Filtering-Correlation-Id: 10393004-2327-4faf-3acb-08ddc078cace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0aEIN++K5vaqXl1iF/I9aeMl687DpdaoXoAHJszTdUvB5dUcfHh5yNMRaKCO?=
 =?us-ascii?Q?7AcykvcE07YhuciheX4/fEqD3hzyFmKT7dKNzxKfT4EIOh7oagZ5K5ztQ02R?=
 =?us-ascii?Q?te1AUjDwU9J7gk/kWfALctFrmRIdzXgihLSvEIDjmZtNSbksOJTogUKh/+BL?=
 =?us-ascii?Q?S1QvCBPzmAKM23+D6Y9XgqiFdRpuckOM+FyBaLtt6hyuQnvUcFTCqrmLX/JN?=
 =?us-ascii?Q?8P3pkPo+qTFTw5m431Adj499VYS0VPjsRabPzHHHZ5dIewahv/bu+e9O8hNs?=
 =?us-ascii?Q?jK+hJRwnOYZSTqpjOVX3f3e+8bRt+Nuz60xUy0/7YswfxxvcHaKvlApROF9D?=
 =?us-ascii?Q?uDI1/y1xv2YLZcBJ0w7WTQi20a8SwSLlLN/puAEC8WLz+A3JuWeaFYLR/5WN?=
 =?us-ascii?Q?3i0eiT83FX2ccW9sOVtvUWtBNkwfO3xyqH2eEh5quEO89NaNyCZpYu/1UFj3?=
 =?us-ascii?Q?WYxdorkiNcPwKR5/54KA85blyIIJD5j3HWXgJhCyrzWt6TFmeRbQ/CCcr66h?=
 =?us-ascii?Q?JTkIy0qAelZjmmOgct9iQI2SQ2CA62eTOtZxrusfjshVPlpvgrYYoMlJ2bWQ?=
 =?us-ascii?Q?GU4GMn/hpb+18CHZSN6+G81sZNse0qSKYx8E7MzRCNC92FFD05MomqKHYIay?=
 =?us-ascii?Q?JhoTfm0xAKL1A7TZdYUSBlCpfBqJZs5p+bEFXK1lArtq+NRHiQgOgYso2W4J?=
 =?us-ascii?Q?GxYL2avGJ2xWjUxhQwPhk/wpEbkixLvpecuP1uqzQhu1BeCm5DwDtEGkDOBO?=
 =?us-ascii?Q?0UvAIYEiYd31OHk8WXpVBfa1NqWkarjqnX5jSeZXOW3PQ0kpdhDfu4UwVK9Q?=
 =?us-ascii?Q?VglO9vFKNzVBp8WQFHT6EL0MluItdG4+PypBvdrSy0sNo8xX0n2GrmXrJ1Cc?=
 =?us-ascii?Q?6qnXjSDL/W0v3hTKQAFI39HuKBR9aESbyL65RF6Buvw9p+QX6VzwJMZn8+0m?=
 =?us-ascii?Q?oTDotMhHWwNvTjAa4A2M4ZXnH1w2Z42ofOgSsTx3k+Jry825jo9lubiyMiO7?=
 =?us-ascii?Q?gkRnL75BlqGktyjWl0cNNT2zOlhQaLu4Ouz9sSJhz+IsOEFN/yfFyNS9JEA8?=
 =?us-ascii?Q?NiBXYEIWKoGoMnMoB6WbXfeHkjT2M1vhnEvrF6Db3Ae5N1JXZr3EPcRGw+ro?=
 =?us-ascii?Q?HvzoPg1SpXYnRwpv1KpKUGLTDQoTwODnQVJq1ne9YBn/X16QeSi3JBLv0TXl?=
 =?us-ascii?Q?o5ipdZNmbFI925BaWBQPy16LtDjCJyA3YYAkU9SpYJq2thSSK1/SJ50XqFfp?=
 =?us-ascii?Q?ocpKGu6Re7IAP7Mrv97RVgqAIM130+hJL3tzIks0C8WSDydHdO7s/2+01VPF?=
 =?us-ascii?Q?sFvXz7DATCCN8e9nSoFSsufxdEx2k4Xo/LFuz5Z0Ks721NsVZsA71XAWmEG2?=
 =?us-ascii?Q?VNFX/LYiMP6tR2Q8L0P4J2IX2FsgnOmN0owbZ3JpmhoA57xCpLVGL0JDeU2x?=
 =?us-ascii?Q?ILYXw+z5yOh3cd3Yv+heISUwtrmCV3Q1iKGGWXdvw3CUQz/2Rk8WlrEjd7ub?=
 =?us-ascii?Q?bEyytS1D6klaQlS0ozB9lQlK436PwyxPMiC+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 12:45:18.7164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10393004-2327-4faf-3acb-08ddc078cace
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4291

From: Jonathan Stroud <jonathan.stroud@amd.com>

When u-boot has the bus acquired on the other host, it can hold the bus
for much longer than 125ms.  Forcefully stealing the bus will result in
u-boot hanging.  Increase arbitration timeout to 1 second to avoid this
condition.

Arbitration timeout and forcefully taking the bus should only be
happening in a failure condition when the other host is dead.  Therefor
increasing this timeout to a large value should not impact normal
operation.

Signed-off-by: Jonathan Stroud <jonathan.stroud@amd.com>
Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
---
 drivers/i2c/muxes/i2c-mux-pca9541.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/muxes/i2c-mux-pca9541.c
index 8663c8a7c269..e602c4a294d3 100644
--- a/drivers/i2c/muxes/i2c-mux-pca9541.c
+++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
@@ -64,8 +64,8 @@
 #define busoff(x)	(!((x) & BUSON) || ((x) & BUSON) == BUSON)
 
 /* arbitration timeouts, in jiffies */
-#define ARB_TIMEOUT	(HZ / 8)	/* 125 ms until forcing bus ownership */
-#define ARB2_TIMEOUT	(HZ / 4)	/* 250 ms until acquisition failure */
+#define ARB_TIMEOUT	(HZ)		/* 1 s until forcing bus ownership */
+#define ARB2_TIMEOUT	(2 * HZ)	/* 2 s until acquisition failure */
 
 /* arbitration retry delays, in us */
 #define SELECT_DELAY_SHORT	50
@@ -229,6 +229,7 @@ static int pca9541_arbitrate(struct i2c_client *client)
 		 */
 		data->select_timeout = SELECT_DELAY_LONG;
 		if (time_is_before_eq_jiffies(data->arb_timeout)) {
+			dev_info(&client->dev, "I2C Bus Arbiter timeout, forcing take bus\n");
 			/* Time is up, take the bus and reset it. */
 			pca9541_reg_write(client,
 					  PCA9541_CONTROL,
@@ -267,6 +268,7 @@ static int pca9541_select_chan(struct i2c_mux_core *muxc, u32 chan)
 		else
 			msleep(data->select_timeout / 1000);
 	} while (time_is_after_eq_jiffies(timeout));
+	dev_info(&client->dev, "Timeout acquiring I2C bus\n");
 
 	return -ETIMEDOUT;
 }
-- 
2.34.1


