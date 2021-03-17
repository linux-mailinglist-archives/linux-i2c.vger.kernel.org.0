Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60F0D33EA35
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Mar 2021 07:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhCQGy4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Mar 2021 02:54:56 -0400
Received: from mail-eopbgr80074.outbound.protection.outlook.com ([40.107.8.74]:4100
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230481AbhCQGya (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 17 Mar 2021 02:54:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KULyqXTX6EWc8dGvOe5inwA1/K+NGH3FOkTvDZ1MEagNJgWdSodPqai3bRVGDjnX56rZuY6EH0clwFeORANxPm+9+pw+49zQ1IVVlVayN2gn+XrjrVEZf6O++FFFiUTvGQg6n+1kWiAwWM24ymeBmyW2sl7XxdOx2iFaeWI3oKoMZcbymr/muoKYYVe/EIpdwv6ScmUEUrHvFh0lQisG+AJd8/k6eV7SgfXP11Eua0m8dGjUnKpSVZ75hzLDzxAMi9/G+cGTp7+ffU/PMySAN0YpiC1cirsaki7GELhchUHFoVt7Ldn9EmHIw+2LCIBNpwyiJAfJ/YsjcgBYKXS18Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9oihh89De+wkg6qHpZDyowrtTKj+Q5qfBUPeufKBGI=;
 b=oSsciypWfA7Wu7ou5z4ahv1/s+vG3NdZNGU6bd7D3RMwDhqMl9UkmMx3dAYlZRkKk9f2Nqy6vId5jqeEUZYcSWhy+F+Dxm5kZCekqfJRJLBZ/N3eP/Tuwvifv1llrE0GDsHS7ZiszCntqC275gLRRf6rtnRX4RDnOHrF17dQ6pXtP1dpHsiVz1m8+a6MSI8JnCDEPV5jcSXEqraS1MMKDK5F/5wzF+SQSuFcEL5SrubNf5wK4gyOjl2Pntwosclo8qOWa+OykcMTOoIlAa3o61GoA301puJ4kEVyK7SeiwMF9ji5JjOuT+KjooEpGg1pMR5JbTd7yNqDiRyW7MsRQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9oihh89De+wkg6qHpZDyowrtTKj+Q5qfBUPeufKBGI=;
 b=XVLXtVXjGhWqtfQheRHg4Bs4QiVQq77C5ZgO+C7t+KPNaLBFo9q3t+nZ4AMg9cxZHk82Xdpq16QNbl3NN0tL0L2fauMf88WKmbHvY3ZmPM9Qe2lhPhSIg0gL958j5E7I7G26tJg4i5WsoY1sEf3k5HFcLrQwS3EKKk0oYYV+lJM=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com (2603:10a6:208:123::11)
 by AM0PR04MB7091.eurprd04.prod.outlook.com (2603:10a6:208:197::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 06:54:28 +0000
Received: from AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236]) by AM0PR04MB5618.eurprd04.prod.outlook.com
 ([fe80::69a8:a768:8fa1:7236%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 06:54:28 +0000
From:   Clark Wang <xiaoning.wang@nxp.com>
To:     aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] i2c: imx-lpi2c: add edma mode support
Date:   Wed, 17 Mar 2021 14:53:59 +0800
Message-Id: <20210317065359.3109394-12-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
References: <20210317065359.3109394-1-xiaoning.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR02CA0215.apcprd02.prod.outlook.com
 (2603:1096:201:20::27) To AM0PR04MB5618.eurprd04.prod.outlook.com
 (2603:10a6:208:123::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by HK2PR02CA0215.apcprd02.prod.outlook.com (2603:1096:201:20::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 06:54:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f3a4034f-270f-4243-10b4-08d8e911823d
X-MS-TrafficTypeDiagnostic: AM0PR04MB7091:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB7091000671185051204788D8F36A9@AM0PR04MB7091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WqIN2G/Bt2TWPvS7w5LtLH31A0wgQ4mt8XuVRXBd+YdS9rO1YXf/z7h0W4wuLHbaKV09a8uWkNUzT6X3ouccV7fpcEYzpxmhm6yLQk36fkYpnnK2VYvOfK7VE8UTv+yvsrwYF7XcP7fIPFJ/f8NcDur9IdhbpWOIWkekKZ9p7ECHsLJi+86uoFuCU6/8tn0pxNj5QhYYk/q5m5jJODuEAFCn6PIkgWBOo1irrxlJhXJy+PWdVH1q4kM/vapKXD02XVeGh7ZgBswlOuzl1KBdlfvX+bAZGyv+ppFGghR3Rc/cqCu20AoM0eKZS+JyJq4R+NPgk+7BIyF4n7CeZLDyWhXZy/Cp9rep1oHGKIMUqzbBidZDORskUMBxQFWAW6FKwa63q+sCgV9ODv5Vn3u/cyckySKCBHbxGWOSI6CCz5J+caLzGMpDB917DCCrKdvZ4HgiX0tKLbelfvXM7Qo/SlmIaqLtQtpbt7BiyTix9qyNcAGhDbYsyoOtXDblq6y97JgZ5/yIuoeiU/k8BIPXhAO/BouwRd/pJZ3Yx/zB2RBWB2uMAI/Lxq9PErfbqlaU9hkybMAPsqEz5mkjW9cZeYKbMEEglYtLhkfOMlRommZkaCTs9Y1l8oKdqOMXo6yF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5618.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(478600001)(66556008)(66476007)(69590400012)(6506007)(66946007)(83380400001)(36756003)(16526019)(5660300002)(2616005)(316002)(2906002)(1076003)(8936002)(26005)(52116002)(186003)(956004)(4326008)(6512007)(6486002)(8676002)(6666004)(86362001)(30864003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ywpKA9YiXbJM2FR+Jp8PSo3EgW46pI6d88sfJ3JxW14SJFPyEkJOkNWUx9qi?=
 =?us-ascii?Q?sFxULyGbbXRJHRE4IJYgLozX/AsSuRr/tImYPoqS5wj7xYfdCrPu4Q5tVewq?=
 =?us-ascii?Q?3/KXumD4BS0sBqkIn1XA2nELpVTWbuFnzGtFk9as6mXnDRvXqCMf6Hll0dKM?=
 =?us-ascii?Q?AUOJY7a1r/692OtbTcCNhJJD+hy8ax6TqdtpGAN9bsjG3QGfgi5oB/2jNvSA?=
 =?us-ascii?Q?LCgpK0gSd9dOgYWI8cU3ekapJhvj4NdtVtGrNQisIW1vYcIpGyr4EeHvjbys?=
 =?us-ascii?Q?Smw66O98GAZD27QT1ZWj0tgoj/7vvKfcIqDFbmT6bKaVwbE36g/13GxJ84JU?=
 =?us-ascii?Q?TGoJxBdPj7W8iJxjfhdkdzh6kt7XjSmV0IYGPIJRvaAumYeIAghvWopNw5sE?=
 =?us-ascii?Q?OdqZZmEK5mXvmNZR7VjWHYtcUx/BccS6D7kj4+A3my4Lu8V8PHPnMqLau+dW?=
 =?us-ascii?Q?+V+dYupiMwUrIPm1d3WoG8zzu1b7aeZS5xtu03p2vIzd3AOMbUAY0KMJKPUN?=
 =?us-ascii?Q?zAd1/NC6EkwGmxWJ9iPL6qUdhAahliW6CpW2V+p/pUFsyOsoGXHW9C0MqZep?=
 =?us-ascii?Q?iggELjxD7Wrs8oMpWaCZM4HMcChOs9GUofUsmCuVX/b02sW7rlOH0wi8Hc6r?=
 =?us-ascii?Q?8h3xBASVtoSFGqYqatBwWhezHPe5CqlAvwx7atMf7pLH0Qsms7KGhh0LCqe2?=
 =?us-ascii?Q?5CX90SRXWqVi/AbHaTgY9KPd5+TBg51nRQaChQUMCc3qxVPVsnqtZFZz5Qlk?=
 =?us-ascii?Q?Ur0r6ocdplb+AUluP2FU18W/xgm3dK9BqbnOyCcoiz+xx6rXlYRBwBpcdy7f?=
 =?us-ascii?Q?6qRXKo24uPHIyhtqIX6O21f80FnJvTG0x2sGYqTP/5+g4vj+BncHdzJOJ7Ef?=
 =?us-ascii?Q?ukZAbMtoj3zsszTTAzu2WgdJ2IbxyhJimFWdGylKoKRbmBw41dK5bv1c6AGk?=
 =?us-ascii?Q?uLf/vIb6RwZ54PebL1ImNLaOiOg69y4p+8Tu/Rwf+jmdLhhQA+v1gJNRiPF1?=
 =?us-ascii?Q?caoQ+12w50fvOokJNMA/EC88vKyOHb2mtrZoV73A5rlDGVYXgsMiKFIn5URQ?=
 =?us-ascii?Q?ud9mNZi8KUyS+jRRLhjg6BvwhQh3F6a2rqI7GKGlSfc4Um0HTMF+5cbUGu4h?=
 =?us-ascii?Q?DUkO5Bg/dxmmedNxn5zAG2Nin4SJK7zOlakfDgYb081TYhJ0vKFNs1SQSeMq?=
 =?us-ascii?Q?Gz2wzugKuoIbWBM8MROMiDeTV9D/BCdOb6ZzWBvVkh1Xx4Qe9wrZsXs6ursD?=
 =?us-ascii?Q?jgHQpUzNY3kDkU7WKlS/zFWJrUpjAo8HVAHD1EBOl0aG71vnzVmysZ/6JERb?=
 =?us-ascii?Q?lJIizIlMmpEWl7zjqBfwrOdR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a4034f-270f-4243-10b4-08d8e911823d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5618.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 06:54:28.3749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQ8/7VbH7+taurY4UfJ4hAt3rIEYEgfTUj8DYOMC9PdUIxzWFD6QBxRzChB2wuRwJtNsy3V0mi7L/vwJl7sshg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7091
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add eDMA receive and send mode support.
Support to read and write data larger than 256 bytes in one frame.

Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Reviewed-by: Li Jun <jun.li@nxp.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 291 ++++++++++++++++++++++++++++-
 1 file changed, 289 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 1e26672d47bf..6d920bf0dbd4 100644
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
+#define I2C_USE_PIO		(-150)
 
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
+static int lpi2c_imx_push_rx_cmd(struct lpi2c_imx_struct *lpi2c_imx,
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
+			while ((readl(lpi2c_imx->base + LPI2C_MFSR) & 0xff) > 2) {
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
+		result = lpi2c_imx_push_rx_cmd(lpi2c_imx, msg);
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
+	return I2C_USE_PIO;
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
+				if (result != I2C_USE_PIO)
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
@@ -623,20 +824,94 @@ static const struct of_device_id lpi2c_imx_of_match[] = {
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
 static int lpi2c_imx_probe(struct platform_device *pdev)
 {
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
@@ -691,6 +966,18 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret == -EPROBE_DEFER)
 		goto rpm_disable;
 
+	/* Init DMA */
+	lpi2c_imx->dma_direction = DMA_NONE;
+	lpi2c_imx->dma_rx = lpi2c_imx->dma_tx = NULL;
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

