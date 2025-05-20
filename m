Return-Path: <linux-i2c+bounces-11069-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B3BABD823
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 14:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D51F1B60870
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 12:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377441C69D;
	Tue, 20 May 2025 12:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="Iqd+m/Qs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D77EED7;
	Tue, 20 May 2025 12:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743805; cv=fail; b=TS8OokfRewqt/XqjnGqpgIFYg+P5lO9lzVJznzw/xVPcZOmhqL6WE08ADHlPsbzCk4aa0JWbVLg/9PsTimqQhU7xnQv+tk0HK+yiPXUeE3oXYQL0/pUKQjrHrAg5qmsjWEKUjRYxqKxghyy648/39NDMzZGH0w6e/JyPzgeor88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743805; c=relaxed/simple;
	bh=zlzAlyeLGOhN5f7KCfu5bW+ENlu+aCRmHZNtxXl/h10=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XlMP1nP5K8yHCi66MSj2sPpYJkWN3Z91qNRfW8Pm57ic2X0wj0qkfHLaZ3WLhE61qxRz0lsvh5Mmf30gzM/3/kq4mrn5w+ZHQ+WKiBNwPWuqs6Z4jE4RUGZPlnJByosg6c0FVcghvcApcTJZ/XB7bBGb3EqsUlDR5qPK1m+U3wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=Iqd+m/Qs; arc=fail smtp.client-ip=40.107.22.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iF9rFFqt3Ig9WDdoEsXuRx64RajwfC+g5P6SYCMKG/rLx7j8AE1CxQ8aGFTyOofXIPgWfIsWJN9n01ofx5lenou9Exq5fLZaXZcRjTdWlt/ly6mSlh2yN+B7Itd1+N9m7TDOXGO45RkEVxYVJxPx5O5AnKykmDBEC2phML1mAoPcPHRZEZXJnA3UGtyJDA9HEuf/Y2ELeFLj3CDUvq71EygVxUZ/QG3WxcjH5AOC/FHJXSB6ga+YrQLPJ5gwuhznHOCoXyWYgXkXBE4imnOiTdSNnQ1cDiSMCc5uwgTkWd1X+8gEJ8yPo85jEHo5qTRAMst1K4AVu0eDvaJsTDYRtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxurCwMuEKIGoYXTWrOi91D71CqokKrlhNK1pPhzgKc=;
 b=O8onhOqFejpulPpYToW506Jiuy5ytS8LMuZV33zNCIRIRk+Knf1j2VtI05+jBySrZYzCSzL3RNQA6NmqCL2At0Lns6PFDwEXot64R5r1x+l2yYGAKZ2r4/dxxXS5H26lfYmOfUMlUXL7eIcza1LMoVg3CdL08M0a/eHydB5hB/s5jVTx6mXeqUtEADY7MeZGER1yRHeSjYPN617XoULno0cM4N08rQbaJZDiWsHJm2VW47cdK0Ru0OVBOofqDBdi15n42RVqktDDYHPBiR1L61f7ZcE+T2Ujr15Kambo2/dMstY2H+yQ3LD1Ier9cAZKpbFZ4tfP7uPvmhS2tI1cfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxurCwMuEKIGoYXTWrOi91D71CqokKrlhNK1pPhzgKc=;
 b=Iqd+m/QstM+bAu8Zy+8Z0XTMTEQb/GgrnZErzRHOLPP61IBnuIkcxnhD0G5PzclP9i1RYkN3p707J+4LQTCxfgglS/8RsUpqcUnPBeBY4oqKF8S11BfakMBt8CrEVGYLf2EIgnQkDrhNcP4fW2b5CsvH71uiK5uaHln4kSYJCZg=
Received: from DUZPR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::17) by VI0PR06MB9510.eurprd06.prod.outlook.com
 (2603:10a6:800:23b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 12:23:14 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::12) by DUZPR01CA0048.outlook.office365.com
 (2603:10a6:10:469::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Tue,
 20 May 2025 12:23:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Tue, 20 May 2025 12:23:12 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 20 May 2025 14:23:12 +0200
From: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	stefan.eichenberger@toradex.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org (open list:FREESCALE IMX I2C DRIVER),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	bsp-development.geo@leica-geosystems.com,
	customers.leicageo@pengutronix.de,
	Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
Subject: [PATCH] i2c: imx: fix emulated smbus block read
Date: Tue, 20 May 2025 14:22:52 +0200
Message-Id: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 May 2025 12:23:12.0237 (UTC) FILETIME=[F430E1D0:01DBC981]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|VI0PR06MB9510:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3fb66eba-6192-487e-b3cd-08dd979916f2
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qln+vPaGJLJuSwahqC3JYhoYbHyA82UoSSA4IeIGt0JQnlT1swy72na/b+8Q?=
 =?us-ascii?Q?GXLmzLbSDihQIAwsV3pV95BNkm5tsDV1HtPWYMVsUhzbTino3b4Eo8GQqx1z?=
 =?us-ascii?Q?OuR74XAc0flcDMy1wCk3oFMoykbIiQ4P6+QM2kZO7BFlH8qcLZy1zHdANTyq?=
 =?us-ascii?Q?C/BeT52qHqo97rv9zXG/HctwciwWHSrsdS0MIMcMiJpQ5OV4k5BNt2eWJIes?=
 =?us-ascii?Q?Qprv+sj+/PPO2E++arGNBZwzJUIm2fdGnSxIiaIhtzf4P3bMcNEow/g0wRtn?=
 =?us-ascii?Q?PKMVDIHkIJz7IFRvpRiIaXRo78XE1j2gGxD1ar+4Xtn7YAF6yLgNQSxp9lsF?=
 =?us-ascii?Q?KRhIy1vK49tnUEw6mihJgtlmW3SwgN/O1fjN2qctfNn9Tvju2j6NFUQH4bup?=
 =?us-ascii?Q?iUS/uMKPNA9+IPbCd9fMrne03x4zU50FpvmI7XQu7XSRaX4BlQTleevHq28+?=
 =?us-ascii?Q?uwQ9davJWrul6UOntDsBQGjj1Xlz93wdPD6YByZdRHetTJ8QR55++AHrM+o5?=
 =?us-ascii?Q?MMVXUsnU+LNFakl37FqnA1VFOTUN9v5x3xZHwjo6aX4wiqYKxdVr5sJnoCXK?=
 =?us-ascii?Q?UZmkahk9b1G8DYT4Qj47Jh+rdDursOsGN7/uyvEf0ND0WW9WUI3yQdPlsvvf?=
 =?us-ascii?Q?e5IPrgvRImxX9wo8+zmnAzLqRnZWnffL45v28OLrh5vckSF62WOceOz5xrzg?=
 =?us-ascii?Q?WLNBZ1V31e/v1LuoYe1RqjDvr4SxDPXzacqeVUHMLOiW/j1lOdSRSZHyWf2X?=
 =?us-ascii?Q?JSpRziXxMsVkyTOrhibtDmjOtRRHidjdSTGGN17J5itGvSMzeZWdqfU9NG/Z?=
 =?us-ascii?Q?IJxr6wLjh1cR9Gttg0sKNBFMbArkZxEPEZ+ivNISugu4kfOr7EW7fnrR+kSU?=
 =?us-ascii?Q?h+ioUnWNCidsuyf6J1r69ueVjrwJ+q2GkNRJSnw5Mf/vWeQ7LFUjyOtDjui1?=
 =?us-ascii?Q?6kaIcyL5Bm0rs8jN23tar9VShFS2sSg5N4s7hi4BRQZRiQW325B8wlTd/Y8P?=
 =?us-ascii?Q?wBlYDtuOXyhDc/0QK3niGoOFmgjgJfL7pYtQWeo61/D0o3lGT010xrktO9yW?=
 =?us-ascii?Q?3ePG+TT/Kz7PiP1Duep/C93RN2D3MAgjPRdZ6ja7/OkWuTS/TDfEc4K78H3g?=
 =?us-ascii?Q?7VGsr/Bqk+ZmWaPmGn2qkS/wP6+bPo7lLgrLdpEtc3wdrf7bSHoXClF7rvff?=
 =?us-ascii?Q?ozTgYnYb1ZWa88XXVq8/QM3DB9Twvj6PG/CUbRSK3gqHtkVH1Fzc4b6Dh6lc?=
 =?us-ascii?Q?9kaGYWt9ZEXhqbiweZb7EXzaX9o8IHFy+HXlHFkkvTWuEnVnzcLAH+C7Kuro?=
 =?us-ascii?Q?IXcYG+rfaBfYDPC63Yppnm3Py8RbXtxLIAh0mz41t8Kc5uJjZUVen54HMrxd?=
 =?us-ascii?Q?O5Jnv5pk0AaEU+BdBJEYE/XUOqWHwBhkPHHwU1zEUeGNUGthFS/JYE91kk4f?=
 =?us-ascii?Q?D3BPujUSMHzJblLAUYvsUH16zbedr1EIAPqbKdOpytbIUabl9Ie+Hg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 12:23:12.5893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb66eba-6192-487e-b3cd-08dd979916f2
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9510

Acknowledge the byte count submitted by the target.
When I2C_SMBUS_BLOCK_DATA read operation is executed by
i2c_smbus_xfer_emulated(), the length of the second (read) message is set
to 1. Length of the block is supposed to be obtained from the target by the
underlying bus driver.
The i2c_imx_isr_read() function should emit the acknowledge on i2c bus
after reading the first byte (i.e., byte count) while processing such
message (as defined in Section 6.5.7 of System Management Bus
Specification [1]). Without this acknowledge, the target does not submit
subsequent bytes and the controller only reads 0xff's.

In addition, store the length of block data obtained from the target in
the buffer provided by i2c_smbus_xfer_emulated() - otherwise the first
byte of actual data is erroneously interpreted as length of the data
block.

[1] https://smbus.org/specs/SMBus_3_3_20240512.pdf

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Signed-off-by: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
---
 drivers/i2c/busses/i2c-imx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ee0d25b498cb..4bf550a3b98d 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1008,7 +1008,7 @@ static inline int i2c_imx_isr_read(struct imx_i2c_struct *i2c_imx)
 	/* setup bus to read data */
 	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 	temp &= ~I2CR_MTX;
-	if (i2c_imx->msg->len - 1)
+	if ((i2c_imx->msg->len - 1) || (i2c_imx->msg->flags & I2C_M_RECV_LEN))
 		temp &= ~I2CR_TXAK;
 
 	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
@@ -1063,6 +1063,7 @@ static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_im
 		wake_up(&i2c_imx->queue);
 	}
 	i2c_imx->msg->len += len;
+	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
 }
 
 static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned int status)
-- 
2.34.1


