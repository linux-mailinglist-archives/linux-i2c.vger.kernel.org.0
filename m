Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E749355254
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Apr 2021 13:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242952AbhDFLet (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Apr 2021 07:34:49 -0400
Received: from mail-db8eur05on2077.outbound.protection.outlook.com ([40.107.20.77]:22144
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245662AbhDFLeD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Apr 2021 07:34:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHowY4JUGwXBwNRIIGQgn20y/cIoJdKqxfSNzrgwRTETaSYJMyyhOB6CVmWDyZVMm0vtmlxRxc3IjYbUYTh6MkPjF2gFCx2hnn194tq53t7aEVtxs0ENFpGzG7FSbjYszr0TewLhdK9uXML7WB/zbg6xL4lisqeNYiM/0fL4I6+z4+alUKe6x7TS/F/nEFrns8gEbiB0YYrytMM7Ga9acl/Dk/2TZ/abcfYqRWMcLnS1+N/4bOKNyObT2cFaGRDqmV3Qb13Yklkne9xM76MD81rTcUsfK/sijO2eoIa3HAOaGO54K6nKusNuZZ/cyHAt4+gU6cp83wkByXqZYo6S8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJgHL/hV5EBgRKFYGPVT5eQ7si2/5oigY9LOwihNR5k=;
 b=GO2SrtcLFJSFsalczUEr2IcWynyvPrah7lSpM38yWVZUvmtEywgDY9+R47+cBos1NK+GE3VEr8U2oWFSjLRPcXU9KCPoCRsdzZd4YR+QXbtVxR8nRrpWsnwCbhPNMMJoS6y0evQ49ML1dzS6VYcbpoYc1GpUmmWRmqLhdHPcbqGF4fv/y+JSU0O4u2FPL7IY/lVMRJwADw2MYbh/E+3DGcfGXyiylw4WBkL5o0PllGZpaRNwquARg2Z0DWx/9upBVcCKjVhALGABWvJX6/ej4GDgtSydrpzESHzZ/0x2YAVyU/4NEwA9QfOt+uL90LLKy8dVvU2NtEr9NfbRA4/KbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJgHL/hV5EBgRKFYGPVT5eQ7si2/5oigY9LOwihNR5k=;
 b=c52atin0T/1un6uBNVop5yIux7ZkUfGVyahHIAUcaxdcjF7eSafJajuaw8o1cZ8cWQmvd9rRuXhfU8TDahjC2mC/IPAGRISo98gHC9MkLhQecI7gAUm8xAeUnLFPdKtxmCDzVlummklguZugWLAUK8C7NpHc2Pc+WK+7GLnj/NM=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 11:33:47 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::5cd9:3da7:144f:36f9%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:33:47 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, robh+dt@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 14/18] i2c: imx-lpi2c: add edma mode support
Date:   Tue,  6 Apr 2021 19:33:02 +0800
Message-Id: <20210406113306.2633595-15-xiaoning.wang@nxp.com>
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
Received: from localhost.localdomain (119.31.174.71) by HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Tue, 6 Apr 2021 11:33:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74bb926b-e9fa-4596-d122-08d8f8efd7d7
X-MS-TrafficTypeDiagnostic: AM7PR04MB7142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7142AC5CFF2EFD47FB2EBC63F3769@AM7PR04MB7142.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tbfF/JqIFSDcg4zunf9GT8i9kTgN7iMnRrMVo4mMifDIcWiyMi6QbrUBdHe4BnjZfXtJUjSnnkaAqdc985U+p7thNURoGhOmXsH851Yb1hMhi8MVob/REV85BIgMY3hvCSa7F/KLkHhsvPfOESa+N2kLO+gB/W9p3eG41JcoIsihCDsTE2d5Aez8BioL0V89gdIrriWdD22M/rjUsa11C73zCdRuLXsgjTpLkvGIMT3p7odRs4+VYrkL2C+ci+26wqjIwgjOGQBw5dpd9GUCc1ULosWep83X6AR6+gJWxVGz77B5CMP8boDxL4udGNXGWKxhWcPb7cKm8qtujABD3L7ucAYJDGFnwgj3EXlkGyLmdBa5i0aNV30OXTTVY/k/vyU1Glguwe0EBmxImsRZBO7jC9oVf7xWOdvWdvxh0mPqKxbwyMY3fqcsg5UkoYwqr81b4g7Zs5qC+UUrzlfxSNFlHf/8YPpTBGkmXdbswYhmMjv7Gqiz5SjF/32XWvu+FYSBuDjteUojN/sqkT4rx5Exg7C3O6iupgz3TylpNr62LI3mElLCoPIwb5S5u8o5ljVQAJKU8jmz3oC9pjSOtRbCnD5hqpaMsqCqWCmjZXiKHMN8v6p2Yd1kdrh0DmfkwqxVG18vP+28O55WHYK3kH0A8G2BhQpqyFYXEJPcjLIZPIaFJM6/xqG5N/BYFuASRU5MYJ7sBktxo/Zr/GxtZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5623.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(186003)(16526019)(86362001)(36756003)(26005)(66946007)(6486002)(6506007)(2906002)(66556008)(38100700001)(38350700001)(498600001)(69590400012)(8676002)(8936002)(2616005)(83380400001)(956004)(6666004)(30864003)(5660300002)(1076003)(4326008)(6512007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fPf2lUS+vkfdV/mF3URnlIvv5PX6aCBvt+0FYb+XAaO3Jerxz/9bHzVP93Mk?=
 =?us-ascii?Q?I0WKLVTC8XLGR2j/RROIovcbHpYeOL4kbTqifRv/hYIh+k67uEbTAN8oS65k?=
 =?us-ascii?Q?hBgMg1JCzsnAhB5lkPGL8p3Ib6q263o7vfBgD4Xo6KFxvOrgjmn/3tC6mMGn?=
 =?us-ascii?Q?oMlN+6ufgnxLAlJuELbj/IQgIhgC5r+TSfXO9RylGjyXssCwNokyvBsoHsKn?=
 =?us-ascii?Q?vYd/AffdPv2e1D/9ntOmvRMyolu3qODqieejwq8WoP3W/IKVaDKt6TKG4660?=
 =?us-ascii?Q?xt0uE/16CDw5UNYDJrR3lF2X/sJL+/F9yU0TXveKYoJEUvna4qlbB1XrkNUE?=
 =?us-ascii?Q?8o4oe9gV0yhP1+DghsrTiia4ciMyLCQdgsam64WBSSfrDl0dPpbxmGgr+XYN?=
 =?us-ascii?Q?9L47jbN739q3QQOsDHjStVsaw3U7tZ1lv9uKCDOnBVYt+du5rY8VSqTHr9wP?=
 =?us-ascii?Q?LU4i+UDNGLqOWnVf2p2E85yUAoPOWqhE3Yy7/JD/t6m7jkgCT0dYDb0qkbZ4?=
 =?us-ascii?Q?QaqueVmDhcg2c7z0UZvDYZkr5/9z2lmIAR8LacRRArLan+YOdiAFUiHCBvKy?=
 =?us-ascii?Q?ww5rA6L3aQdP90LxMWNSPeFqD86ZSeE9SeOt0yfRNdQQVA1+NkhUPHcvnBlc?=
 =?us-ascii?Q?L2PqMoJ/PSB6ZWVlaM7IhCRom8u72pLP1SV8/pguTQRiy8ipOVU4pXJHOS64?=
 =?us-ascii?Q?/bV12aCjVMSydNwyRPlPru0g0y/ddcHww+ghQM0bK1FV68FkJNL5UUgE/uQZ?=
 =?us-ascii?Q?/ZuwrY3otN3kKYAt8/4TDTlWbqKo8g1rS4Pxc33L7nj6YN84x4Q/lnradky3?=
 =?us-ascii?Q?Z4Adf+WSUT+TQw7TbJfcnvvpHu6ST2VhldXoFNnLMo+zh4zL67zuYfywJK+L?=
 =?us-ascii?Q?petslkrcAsLfj/aMR4Ok5qamYN4loAwKmuwYIDCoU1axqlV1MrPjGDtQLSwC?=
 =?us-ascii?Q?NGA8HetOHcupjS7cWInsABiJwDl5V6QKUXM8uJmr1OjWGue+EXiOPRP97voq?=
 =?us-ascii?Q?fuy9jTZEYuauyFpwzyPBoJOuuwm315ycJxmd86xS3OaMw3pbKwvjIolO/KFE?=
 =?us-ascii?Q?l1mccgBsMh/qfvc+TSx5ZFe9U/wyz4ajY7X+deCMAJtutXP9Aje4FnpMXEQn?=
 =?us-ascii?Q?r0nheOBN9owWpEuiLFNtQaPvqT+WV+JHm3EZlbE/Dl9bckLrHQZIKjJzEHbL?=
 =?us-ascii?Q?hRtf9/aVkzyJRWrW9Zszye9vmqQU+BBpRPcuGFpXv0kWfhHNM56Z8vdD/iLI?=
 =?us-ascii?Q?C8HVKDUVASUZ7faQwNjrt5Rclr4Fad8IlQ4sN/4IhQPrIWlgUMCAX+Uoxm9M?=
 =?us-ascii?Q?gkBa74awUB/ZxZB/cJUT/GpF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bb926b-e9fa-4596-d122-08d8f8efd7d7
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 11:33:47.7011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5jkGFQg6Pw66ryMthRdQZWlSHFCiumJstNZ0BKJmWIPpvC6kHdoY7SkIwaljFs+LhPRa0MPLnWxVWtRu8zMDxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7142
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add eDMA receive and send mode support.
Support to read and write data larger than 256 bytes in one frame.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Reviewed-by: Li Jun <jun.li@nxp.com>
---
V2 changes:
 - change marco I2C_USE_PIO to DMA_ERR_I2C_USE_PIO. It is a error code defined
   in this driver to 
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 290 ++++++++++++++++++++++++++++-
 1 file changed, 288 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index c2f8e49660ea..d1a56d52f19f 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -8,6 +8,8 @@
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
@@ -31,6 +33,7 @@
 #define LPI2C_MCR	0x10	/* i2c contrl register */
 #define LPI2C_MSR	0x14	/* i2c status register */
 #define LPI2C_MIER	0x18	/* i2c interrupt enable */
+#define LPI2C_MDER	0x1C	/* i2c DMA enable */
 #define LPI2C_MCFGR0	0x20	/* i2c master configuration */
 #define LPI2C_MCFGR1	0x24	/* i2c master configuration */
 #define LPI2C_MCFGR2	0x28	/* i2c master configuration */
@@ -72,11 +75,15 @@
 #define MCFGR1_AUTOSTOP	BIT(8)
 #define MCFGR1_IGNACK	BIT(9)
 #define MRDR_RXEMPTY	BIT(14)
+#define MDER_TDDE	BIT(0)
+#define MDER_RDDE	BIT(1)
 
 #define I2C_CLK_RATIO	24 / 59
 #define CHUNK_DATA	256
 
 #define I2C_PM_TIMEOUT		1000 /* ms */
+#define I2C_DMA_THRESHOLD	16 /* bytes */
+#define DMA_ERR_I2C_USE_PIO	(-150)
 
 enum lpi2c_imx_mode {
 	STANDARD,	/* <=100Kbps */
@@ -95,6 +102,7 @@ enum lpi2c_imx_pincfg {
 
 struct lpi2c_imx_struct {
 	struct i2c_adapter	adapter;
+	resource_size_t		phy_addr;
 	int			irq;
 	struct clk		*clk_per;
 	struct clk		*clk_ipg;
@@ -114,6 +122,17 @@ struct lpi2c_imx_struct {
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pinctrl_pins_default;
 	struct pinctrl_state *pinctrl_pins_gpio;
+
+	bool			can_use_dma;
+	bool			using_dma;
+	bool			xferred;
+	struct i2c_msg		*msg;
+	dma_addr_t		dma_addr;
+	struct dma_chan		*dma_tx;
+	struct dma_chan		*dma_rx;
+	enum dma_data_direction dma_direction;
+	u8			*dma_buf;
+	unsigned int		dma_len;
 };
 
 static void lpi2c_imx_intctrl(struct lpi2c_imx_struct *lpi2c_imx,
@@ -289,6 +308,9 @@ static int lpi2c_imx_master_enable(struct lpi2c_imx_struct *lpi2c_imx)
 	if (ret)
 		goto rpm_put;
 
+	if (lpi2c_imx->can_use_dma)
+		writel(MDER_TDDE | MDER_RDDE, lpi2c_imx->base + LPI2C_MDER);
+
 	temp = readl(lpi2c_imx->base + LPI2C_MCR);
 	temp |= MCR_MEN;
 	writel(temp, lpi2c_imx->base + LPI2C_MCR);
@@ -462,6 +484,154 @@ static void lpi2c_imx_read(struct lpi2c_imx_struct *lpi2c_imx,
 	lpi2c_imx_intctrl(lpi2c_imx, MIER_RDIE | MIER_NDIE);
 }
 
+static void lpi2c_dma_unmap(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	struct dma_chan *chan = lpi2c_imx->dma_direction == DMA_FROM_DEVICE
+				? lpi2c_imx->dma_rx : lpi2c_imx->dma_tx;
+
+	dma_unmap_single(chan->device->dev, lpi2c_imx->dma_addr,
+			 lpi2c_imx->dma_len, lpi2c_imx->dma_direction);
+
+	lpi2c_imx->dma_direction = DMA_NONE;
+}
+
+static void lpi2c_cleanup_dma(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	if (lpi2c_imx->dma_direction == DMA_NONE)
+		return;
+	else if (lpi2c_imx->dma_direction == DMA_FROM_DEVICE)
+		dmaengine_terminate_all(lpi2c_imx->dma_rx);
+	else if (lpi2c_imx->dma_direction == DMA_TO_DEVICE)
+		dmaengine_terminate_all(lpi2c_imx->dma_tx);
+
+	lpi2c_dma_unmap(lpi2c_imx);
+}
+
+static void lpi2c_dma_callback(void *data)
+{
+	struct lpi2c_imx_struct *lpi2c_imx = (struct lpi2c_imx_struct *)data;
+
+	lpi2c_dma_unmap(lpi2c_imx);
+	writel(GEN_STOP << 8, lpi2c_imx->base + LPI2C_MTDR);
+	lpi2c_imx->xferred = true;
+
+	complete(&lpi2c_imx->complete);
+}
+
+static int lpi2c_dma_submit(struct lpi2c_imx_struct *lpi2c_imx,
+			   struct i2c_msg *msg)
+{
+	bool read = msg->flags & I2C_M_RD;
+	enum dma_data_direction dir = read ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+	struct dma_chan *chan = read ? lpi2c_imx->dma_rx : lpi2c_imx->dma_tx;
+	struct dma_async_tx_descriptor *txdesc;
+	dma_cookie_t cookie;
+
+	lpi2c_imx->dma_len = read ? msg->len - 1 : msg->len;
+	lpi2c_imx->msg = msg;
+	lpi2c_imx->dma_direction = dir;
+
+	if (IS_ERR(chan))
+		return PTR_ERR(chan);
+
+	lpi2c_imx->dma_addr = dma_map_single(chan->device->dev,
+					     lpi2c_imx->dma_buf,
+					     lpi2c_imx->dma_len, dir);
+	if (dma_mapping_error(chan->device->dev, lpi2c_imx->dma_addr)) {
+		dev_err(&lpi2c_imx->adapter.dev, "dma map failed, use pio\n");
+		return -EINVAL;
+	}
+
+	txdesc = dmaengine_prep_slave_single(chan, lpi2c_imx->dma_addr,
+					lpi2c_imx->dma_len, read ?
+					DMA_DEV_TO_MEM : DMA_MEM_TO_DEV,
+					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	if (!txdesc) {
+		dev_err(&lpi2c_imx->adapter.dev, "dma prep slave sg failed, use pio\n");
+		lpi2c_cleanup_dma(lpi2c_imx);
+		return -EINVAL;
+	}
+
+	reinit_completion(&lpi2c_imx->complete);
+	txdesc->callback = lpi2c_dma_callback;
+	txdesc->callback_param = (void *)lpi2c_imx;
+
+	cookie = dmaengine_submit(txdesc);
+	if (dma_submit_error(cookie)) {
+		dev_err(&lpi2c_imx->adapter.dev, "submitting dma failed, use pio\n");
+		lpi2c_cleanup_dma(lpi2c_imx);
+		return -EINVAL;
+	}
+
+	lpi2c_imx_intctrl(lpi2c_imx, MIER_NDIE);
+
+	dma_async_issue_pending(chan);
+
+	return 0;
+}
+
+static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
+{
+	if (!lpi2c_imx->can_use_dma)
+		return false;
+
+	if (msg->len < I2C_DMA_THRESHOLD)
+		return false;
+
+	return true;
+}
+
+static int lpi2c_imx_dma_push_rx_cmd(struct lpi2c_imx_struct *lpi2c_imx,
+				 struct i2c_msg *msg)
+{
+	unsigned int temp, rx_remain;
+	unsigned long orig_jiffies = jiffies;
+
+	if ((msg->flags & I2C_M_RD)) {
+		rx_remain = msg->len;
+		do {
+			temp = rx_remain > CHUNK_DATA ?
+				CHUNK_DATA - 1 : rx_remain - 1;
+			temp |= (RECV_DATA << 8);
+			while ((readl(lpi2c_imx->base + LPI2C_MFSR) & 0xff) > (lpi2c_imx->rxfifosize >> 1)) {
+				if (time_after(jiffies, orig_jiffies + msecs_to_jiffies(1000))) {
+					dev_dbg(&lpi2c_imx->adapter.dev, "txfifo empty timeout\n");
+					if (lpi2c_imx->adapter.bus_recovery_info)
+						i2c_recover_bus(&lpi2c_imx->adapter);
+					return -ETIMEDOUT;
+				}
+				schedule();
+			}
+			writel(temp, lpi2c_imx->base + LPI2C_MTDR);
+			rx_remain = rx_remain - (temp & 0xff) - 1;
+		} while (rx_remain > 0);
+	}
+
+	return 0;
+}
+
+static int lpi2c_dma_xfer(struct lpi2c_imx_struct *lpi2c_imx,
+			   struct i2c_msg *msg)
+{
+	int result;
+
+	result = lpi2c_dma_submit(lpi2c_imx, msg);
+	if (!result) {
+		result = lpi2c_imx_dma_push_rx_cmd(lpi2c_imx, msg);
+		if (result)
+			return result;
+		result = lpi2c_imx_msg_complete(lpi2c_imx);
+		return result;
+	}
+
+	/* DMA xfer failed, try to use PIO, clean up dma things */
+	i2c_put_dma_safe_msg_buf(lpi2c_imx->dma_buf, lpi2c_imx->msg,
+				 lpi2c_imx->xferred);
+	lpi2c_cleanup_dma(lpi2c_imx);
+
+	return DMA_ERR_I2C_USE_PIO;
+}
+
 static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 			  struct i2c_msg *msgs, int num)
 {
@@ -474,6 +644,9 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 		return result;
 
 	for (i = 0; i < num; i++) {
+		lpi2c_imx->xferred = false;
+		lpi2c_imx->using_dma = false;
+
 		result = lpi2c_imx_start(lpi2c_imx, &msgs[i]);
 		if (result)
 			goto disable;
@@ -482,9 +655,24 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 		if (num == 1 && msgs[0].len == 0)
 			goto stop;
 
+		if (is_use_dma(lpi2c_imx, &msgs[i])) {
+			lpi2c_imx->using_dma = true;
+
+			writel(0x1, lpi2c_imx->base + LPI2C_MFCR);
+
+			lpi2c_imx->dma_buf = i2c_get_dma_safe_msg_buf(&msgs[i],
+							    I2C_DMA_THRESHOLD);
+			if (lpi2c_imx->dma_buf) {
+				result = lpi2c_dma_xfer(lpi2c_imx, &msgs[i]);
+				if (result != DMA_ERR_I2C_USE_PIO)
+					goto stop;
+			}
+		}
+
+		lpi2c_imx->using_dma = false;
 		lpi2c_imx->delivered = 0;
 		lpi2c_imx->msglen = msgs[i].len;
-		init_completion(&lpi2c_imx->complete);
+		reinit_completion(&lpi2c_imx->complete);
 
 		if (msgs[i].flags & I2C_M_RD)
 			lpi2c_imx_read(lpi2c_imx, &msgs[i]);
@@ -503,7 +691,16 @@ static int lpi2c_imx_xfer(struct i2c_adapter *adapter,
 	}
 
 stop:
-	lpi2c_imx_stop(lpi2c_imx);
+	if (!lpi2c_imx->using_dma)
+		lpi2c_imx_stop(lpi2c_imx);
+	else {
+		i2c_put_dma_safe_msg_buf(lpi2c_imx->dma_buf, lpi2c_imx->msg,
+					 lpi2c_imx->xferred);
+		if (result) {
+			lpi2c_cleanup_dma(lpi2c_imx);
+			writel(GEN_STOP << 8, lpi2c_imx->base + LPI2C_MTDR);
+		}
+	}
 
 	temp = readl(lpi2c_imx->base + LPI2C_MSR);
 	if ((temp & MSR_NDF) && !result)
@@ -528,6 +725,10 @@ static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id)
 	temp = readl(lpi2c_imx->base + LPI2C_MSR);
 
 	if (temp & MSR_NDF) {
+		if (lpi2c_imx->using_dma) {
+			lpi2c_cleanup_dma(lpi2c_imx);
+			writel(GEN_STOP << 8, lpi2c_imx->base + LPI2C_MTDR);
+		}
 		complete(&lpi2c_imx->complete);
 		goto ret;
 	}
@@ -623,6 +824,77 @@ static const struct of_device_id lpi2c_imx_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi2c_imx_of_match);
 
+static void lpi2c_dma_exit(struct lpi2c_imx_struct *lpi2c_imx)
+{
+	if (lpi2c_imx->dma_rx) {
+		dma_release_channel(lpi2c_imx->dma_rx);
+		lpi2c_imx->dma_rx = NULL;
+	}
+
+	if (lpi2c_imx->dma_tx) {
+		dma_release_channel(lpi2c_imx->dma_tx);
+		lpi2c_imx->dma_tx = NULL;
+	}
+}
+
+static int lpi2c_dma_init(struct device *dev,
+			  struct lpi2c_imx_struct *lpi2c_imx)
+{
+	int ret;
+	struct dma_slave_config dma_sconfig;
+
+	/* Prepare for TX DMA: */
+	lpi2c_imx->dma_tx = dma_request_chan(dev, "tx");
+	if (IS_ERR(lpi2c_imx->dma_tx)) {
+		ret = PTR_ERR(lpi2c_imx->dma_tx);
+		dev_err(dev, "can't get the TX DMA channel, error %d!\n", ret);
+		lpi2c_imx->dma_tx = NULL;
+		goto err;
+	}
+
+	dma_sconfig.dst_addr = lpi2c_imx->phy_addr + LPI2C_MTDR;
+	dma_sconfig.dst_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+	dma_sconfig.dst_maxburst = 1;
+	dma_sconfig.direction = DMA_MEM_TO_DEV;
+	ret = dmaengine_slave_config(lpi2c_imx->dma_tx, &dma_sconfig);
+	if (ret < 0) {
+		dev_err(dev, "can't configure tx channel (%d)\n", ret);
+		goto fail_tx;
+	}
+
+	/* Prepare for RX DMA: */
+	lpi2c_imx->dma_rx = dma_request_chan(dev, "rx");
+	if (IS_ERR(lpi2c_imx->dma_rx)) {
+		ret = PTR_ERR(lpi2c_imx->dma_rx);
+		dev_err(dev, "can't get the RX DMA channel, error %d\n", ret);
+		lpi2c_imx->dma_rx = NULL;
+		goto fail_tx;
+	}
+
+	dma_sconfig.src_addr = lpi2c_imx->phy_addr + LPI2C_MRDR;
+	dma_sconfig.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+	dma_sconfig.src_maxburst = 1;
+	dma_sconfig.direction = DMA_DEV_TO_MEM;
+	ret = dmaengine_slave_config(lpi2c_imx->dma_rx, &dma_sconfig);
+	if (ret < 0) {
+		dev_err(dev, "can't configure rx channel (%d)\n", ret);
+		goto fail_rx;
+	}
+
+	lpi2c_imx->can_use_dma = true;
+	lpi2c_imx->using_dma = false;
+
+	return 0;
+fail_rx:
+	dma_release_channel(lpi2c_imx->dma_rx);
+fail_tx:
+	dma_release_channel(lpi2c_imx->dma_tx);
+err:
+	lpi2c_dma_exit(lpi2c_imx);
+	lpi2c_imx->can_use_dma = false;
+	return ret;
+}
+
 static int lpi2c_imx_clocks_prepare(struct lpi2c_imx_struct *lpi2c_imx)
 {
 	int ret = 0;
@@ -656,15 +928,18 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	struct lpi2c_imx_struct *lpi2c_imx;
 	unsigned int temp;
 	int ret;
+	struct resource *res;
 
 	lpi2c_imx = devm_kzalloc(&pdev->dev, sizeof(*lpi2c_imx), GFP_KERNEL);
 	if (!lpi2c_imx)
 		return -ENOMEM;
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	lpi2c_imx->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(lpi2c_imx->base))
 		return PTR_ERR(lpi2c_imx->base);
 
+	lpi2c_imx->phy_addr = (dma_addr_t)res->start;
 	lpi2c_imx->irq = platform_get_irq(pdev, 0);
 	if (lpi2c_imx->irq < 0)
 		return lpi2c_imx->irq;
@@ -716,6 +991,17 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret == -EPROBE_DEFER)
 		goto rpm_disable;
 
+	/* Init DMA */
+	lpi2c_imx->dma_direction = DMA_NONE;
+	ret = lpi2c_dma_init(&pdev->dev, lpi2c_imx);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "dma setup error %d, use pio\n", ret);
+		if (ret == -EPROBE_DEFER)
+			goto rpm_disable;
+	}
+
+	init_completion(&lpi2c_imx->complete);
+
 	ret = i2c_add_adapter(&lpi2c_imx->adapter);
 	if (ret)
 		goto rpm_disable;
-- 
2.25.1

