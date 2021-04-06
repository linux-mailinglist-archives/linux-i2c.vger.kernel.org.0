Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A95735525A
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343572AbhDFLey (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:34:54 -0400
Received: from mail-vi1eur05on2043.outbound.protection.outlook.com ([40.107.21.43]:5955
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245723AbhDFLeZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:34:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sar13/hU5sKw0l8QL9VDopbDo2wBqyfbR0Y1WhhxcnUIRbdoUTtjAg+YwNCuNPJwGsoPjOSpMPejeGRbzMgxvVCW8xiMtjHPvJUvqePQkCC7PTtbq+mgrVosBRR8iBuuYr7wGBDB5FdFob2H3d7o5c6NW19Qx//ri5GcBmAlwo9PTbNuAOJP70rs+xnyyWT5nh8cLR2YcMc2n5H+syyVX28f0qKYiXhlIAcdEYh21wdM0+u1sx3f4IbWn1Uskwf6gJcC5KZ6EAjWuNrv7NMJqzHVh7mzgrUqzvAkPfYmuZgM6GsHwMKkCdX8vd8ICQ+lgONizBvzThhrHlitFoVe/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsMqRJ7b1swq7PgJZIFM+TvT0ckkLDGK5zgIUET/sWc=;
 b=LIVmunN25nqtQRHwdq72IjL5YfV8vDc1xtci73VggZtl/tyBbhp3xX5aIK635MHj519s6UrmfuQJ1wSVfBmfpI8BKL8PjYAt4OnAMwknCU1OeRIAyTZrKTnsHtZhbBjXhXQMcbRoKOZV94aNvkSKL339Q1EA10skV8maKT2Nt1Z1AAkW1XYWHoE4CWeUZEhsilsqqNFA8dF+fmU4GcLQ3BtmQZ4+X+ylKNXodq+XhqN8TrsVZeT+V3W8DX2kJHxMRgv8gOk1cTMsqzTmZqtF9FCIZRRYyE2dR13yYSeYqHQQRz0TyMQQS7HjJfjh3Kau3aLkJo0sMDR8eO8sTbppJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsMqRJ7b1swq7PgJZIFM+TvT0ckkLDGK5zgIUET/sWc=;
 b=HqoG7Ws0FBgg9VD/O1VLu2+msTBIHPotFihHjGQne+KeNA50GE2C8pDWX9UtMI1UkAsQ27RMdPy02cl018QZEIX2Pbej5wPepyGiwY+xog2LRuDT1uSslJyUVXQy2JYKyomzR40GxJMIL4bclxdxddhjafBZ5y9595xSuUQiV6A=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AS8PR04MB8359.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 11:34:02 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:34:02 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 18/18] i2c: imx-lpi2c: fix pio mode cannot send 256+ bytes in one frame
Date:   Tue,  6 Apr 2021 19:33:06 +0800
Message-Id: <20210406113306.2633595-19-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
References: <20210406113306.2633595-1-xiaoning.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR0401CA0010.apcprd04.prod.outlook.com
 (2603:1096:202:2::20) To AM6PR04MB5623.eurprd04.prod.outlook.com
 (2603:10a6:20b:a9::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bfca646-9492-46dd-4c84-08d8f8efe0a7
X-MS-TrafficTypeDiagnostic: AS8PR04MB8359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR04MB8359A45D699B079931C8B2A8F3769@AS8PR04MB8359.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sqHaODDYzH52VY4z0kM0UeHWi3st90xv5lgC7kk5jMEVJBe42a6RyQydc6lhQpjA3ZnACVMs6jB7QPMOvU+7qx4pXlTjA65TUfqQlo7avfQIRBXBSPIFUmVop3I33R/lMbMMSuOH/8t5nQpg66khYCs/fIOmKYX/OrLd+ivpVbj6OsTdRA8NMkFZHF5rE0a1BkLRwliQI10x8T/tvHPkaXFRhVR6/qpIpAnQ3hbWBGARI2aSjv5CGlmctMd9W+sRdCZzg11I22NvC/SYleEUCrersHxrlH79fnsQg3L6gAtbH/Zu/+wGa9XO8SyMo2W1Mm0SYKIhXpYakXwZ4C6nB+eVtJhLGC+830cB8v5wCItf8tutSh6kW5rqco8GOycrZbyV9rXAFtZKzx5nwOoGoG++wrTu6bkHV+0MFlNEch3nua9bbpVrrleOW6Bz2d8VGX/Ny6EGv2FqQ8GWfbJaTngyRFBBbTBEyzId76aNIpIuzzqBDit7J9d+8MSsO8N7KSVLfIJvy36rZ44d8Vvp/tnB5PIE7NhaQW4WROINR7MPmv5CXHZ+vo4TyrMI93RUTRh5cHdnr8MnBsN5zOLB+D+HziciyT6VhC1a8msNVHJ/6yDsHs8fV85UFyIBnq/LkGgp9UDMCUP7k/Bi0xjNCjlxBxb54AmUbVrwjbd1ghG++vxnjoAsDNT74Ala1hCeRVIt1idCUT4+feL/u9gGGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(5660300002)(8676002)(16526019)(86362001)(4326008)(8936002)(6506007)(52116002)(26005)(38350700001)(69590400012)(6666004)(186003)(83380400001)(2906002)(38100700001)(956004)(2616005)(36756003)(66476007)(6512007)(66946007)(66556008)(1076003)(498600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1Vre4mo1yj7hEDJN6f4qPmTRYQUSngsYJpyTbC16Jq5G6rf56ED9onxzwIQ5?=
 =?us-ascii?Q?p7Tqs5d9QdQayt1qSSJVUWwiISibDOGi8LxTSm1oeWeCJtjqxR7qIMCeDi3i?=
 =?us-ascii?Q?R2M6lVw+j+NYT7P52KjBUu41irvTp6iQOEIXPCWXnpfwEdwY1V4LkqmE/1bh?=
 =?us-ascii?Q?kUQgBTHlV0xQkYSZQXGF3ysdrj8SlctWFJFgkqx5sfZbea94nsWuQHF42CjQ?=
 =?us-ascii?Q?ROlT6K+X6rLqJaBszxVcgI2mOJRfQ4fLp7Ggi/O9kX08/vIPcbidawXJECca?=
 =?us-ascii?Q?JhnXGQIb7bhGlOTBKQxXU4Lnqhnv7CbxzVM+MK89Dx8QrW6NMa4KdUZOsZta?=
 =?us-ascii?Q?oeH+ahd9A4VcHTZxnkZuddnq1CDdJ0cOz/1kd6PtWDYP7Trz+Lws/5KxX4Xw?=
 =?us-ascii?Q?eok9l+w5uGNZSgppnn0fykU3sWeKqKoSWyPNiE4zqVJC9SwVDvvt826l0mv3?=
 =?us-ascii?Q?J12sQFnXS1ldVIiFnCohZFcG1hpt/aHlgrKiy+M9oN2OPmzYIeeMp4cPTecc?=
 =?us-ascii?Q?R7ULR1/hydELJmEN4zRudYGkEvIpnvnmfQFztNmxjkWEyUnwEmqR+KpCIzaa?=
 =?us-ascii?Q?IsK3mmuT8XU6ddoRgv41DW4E4qQZb8wv8kzBvPPuQPRzkQOt0sogdiWYChXM?=
 =?us-ascii?Q?fM3iH8VvXkWGPYdAwagqY5HxwQG2+CuZNgAd3tpZgsejSRa3AiEqaWuX4wgb?=
 =?us-ascii?Q?z2GOXTh59FnwrcWrRwU77qRgXYT32xcFsaF2aHN0e4MdpUNtnTh20oJph+KR?=
 =?us-ascii?Q?B9bh1pRvshlRhj4AGF5hLdLnDQWi0FoEkht493vJKugcIvRLdhF1zeWdBx99?=
 =?us-ascii?Q?uMnL6ad/AsllqssX2lZ29/Js4nB4KMskask4I2k4xA/+vn2y+mkGm3VdUVyD?=
 =?us-ascii?Q?QNL02wMe9vIpDxf6nV0BzLOUb25zNpi947e3JO6JcKjJMMV+EJ8/PjJ4ywta?=
 =?us-ascii?Q?ev3C3IRmnJ0ULmD0fD3Ly/GriYCXsNj9zAoxxDNeogyW4H6ECwceTTvDpaNX?=
 =?us-ascii?Q?wpKLg1xn5IVAm00yOxXb4UC/2bqhM75+BA/D/aYDFJ/sQ1ITiJcvSohI5aaH?=
 =?us-ascii?Q?kkUgT29BVGgxiOCSF3OxjY/PbDIOnPwfTG+CFI5aZFM3cvsM6ki9PFwcquzD?=
 =?us-ascii?Q?MMIuhNHR+/omrvrd5vmlAiMEceNam3dB8cp8Fb7y2nfvdZGCUmgFjBjBeTVO?=
 =?us-ascii?Q?9d/q4S82jIxuRVC0QZs6UVt6ntzMs63KOg6riNr5oCbPMgoGA9s7/v4oS4Y7?=
 =?us-ascii?Q?FSystxwPL53EI5S8iKYsNYHDpdROnQ5bMuqB22lu+SpaBg81RFEKvVYN5d8T?=
 =?us-ascii?Q?Z/c2xdk2xJ7ksO0Wm6Po+jK1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfca646-9492-46dd-4c84-08d8f8efe0a7
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:34:02.4856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N43EXGbYLaRMzDKhPwfIQ5ZHnou9jBGh6E99IeFW1hKuKsOdJCtxiiVKHQ7tlnjnn7/2HTnmxNXwV5trR7bZiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8359
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The next MTDR command should be filled before the last receive command is
fininshed. Otherwise, a NACK will be sent when the current MTDR command
is finished. It causes lpi2c cannot send the next chunk data
successfully.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
---
V2 changes:
 - New patch added in V2
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 43 +++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 3c0f16a79185..8d908b9b5112 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -112,6 +112,7 @@ struct lpi2c_imx_struct {
 	struct completion	complete;
 	unsigned int		msglen;
 	unsigned int		delivered;
+	unsigned int		remain_chunk_num;
 	unsigned int		block_data;
 	unsigned int		bitrate;
 	unsigned int		txfifosize;
@@ -413,6 +414,28 @@ static void lpi2c_imx_write_txfifo(struct lpi2c_imx_struct *lpi2c_imx)
 		complete(&lpi2c_imx->complete);
 }
 
+static void lpi2c_imx_pio_push_rx_cmd(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	unsigned int remaining, temp;
+	u8 last_chunk_num = lpi2c_imx->msglen % CHUNK_DATA;
+
+	if (lpi2c_imx->remain_chunk_num > 0 &&
+		(lpi2c_imx->delivered % CHUNK_DATA) > (CHUNK_DATA >> 1)) {
+		if ((readl(lpi2c_imx->base + LPI2C_MFSR) & 0xff) <=
+						(lpi2c_imx->rxfifosize >> 1)) {
+			if (last_chunk_num)
+				remaining = (lpi2c_imx->remain_chunk_num - 1) *
+					    CHUNK_DATA + last_chunk_num;
+			else
+				remaining = lpi2c_imx->remain_chunk_num * CHUNK_DATA;
+			temp = (remaining > CHUNK_DATA ? CHUNK_DATA : remaining) - 1;
+			temp |= (RECV_DATA << 8);
+			writel(temp, lpi2c_imx->base + LPI2C_MTDR);
+			lpi2c_imx->remain_chunk_num--;
+		}
+	}
+}
+
 static void lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx)
 {
 	unsigned int blocklen, remaining;
@@ -420,10 +443,16 @@ static void lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx)
 
 	do {
 		data = readl(lpi2c_imx->base + LPI2C_MRDR);
-		if (data & MRDR_RXEMPTY)
-			break;
+		if (data & MRDR_RXEMPTY) {
+			if (lpi2c_imx->delivered == lpi2c_imx->msglen ||
+			    lpi2c_imx->block_data)
+				break;
+			else
+				continue;
+		}
 
 		lpi2c_imx->rx_buf[lpi2c_imx->delivered++] = data & 0xff;
+		lpi2c_imx_pio_push_rx_cmd(lpi2c_imx);
 	} while (1);
 
 	/*
@@ -451,13 +480,9 @@ static void lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx)
 		temp = remaining;
 		temp |= (RECV_DATA << 8);
 		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
-	} else if (!(lpi2c_imx->delivered & 0xff)) {
-		temp = (remaining > CHUNK_DATA ? CHUNK_DATA : remaining) - 1;
-		temp |= (RECV_DATA << 8);
-		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
 	}
 
-	lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE);
+	lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE | MIER_NDIE);
 }
 
 static void lpi2c_imx_write(struct lpi2c_imx_struct *lpi2c_imx,
@@ -477,6 +502,10 @@ static void lpi2c_imx_read(struct lpi2c_imx_struct *lpi2c_imx,
 	lpi2c_imx->block_data = msgs->flags & I2C_M_RECV_LEN;
 
 	lpi2c_imx_set_rx_watermark(lpi2c_imx);
+	if (msgs->len > CHUNK_DATA) {
+		temp = CHUNK_DATA - 1;
+		lpi2c_imx->remain_chunk_num = DIV_ROUND_UP(msgs->len, CHUNK_DATA) - 1;
+	}
 	temp = msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
 	temp |= (RECV_DATA << 8);
 	writel(temp, lpi2c_imx->base + LPI2C_MTDR);
-- 
2.25.1

