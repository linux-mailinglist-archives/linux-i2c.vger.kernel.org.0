Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9497E414DDF
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Sep 2021 18:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236523AbhIVQQC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Sep 2021 12:16:02 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:58872 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236590AbhIVQQB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Sep 2021 12:16:01 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Wed, 22 Sep 2021 12:15:58 EDT
IronPort-SDR: 8UbnJGYKp9g00cfXnidR4XekML9AcaN1ikXoDPxI2aQNPOoTV25+1C1mpXUp410raLMJXgsIt8
 w8a/HmajNMuBBDJuYoG0ril5cWCdnSJ+Jlku2Eb8Qmcr9OUTFV5xaiE/3Fb/GGFRanKSsA1k3h
 nLUv51cpctMCSfQGfmJwvMakTCcHm8JGROPCi8HaD5FHVGqQiwNy8xakz6kkgbXfYw38kSMUMB
 FvedneDgXWpSHS8k3DqS8bAAfQZIAfDDehfqeX9H8B9QCw4FYZJock2nD6UJ9RFker5pCYg8e2
 9HYEIwFf5lqfyr7uKO003n3F
X-IronPort-AV: E=Sophos;i="5.85,314,1624348800"; 
   d="scan'208";a="66169774"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 22 Sep 2021 08:07:17 -0800
IronPort-SDR: TwrNP43X+qzAXREQFCLy/SGbiiUY1GzxlrBsCdu12I4vPOafw+HdxOo6U9v3SJrpthiMSoAY6i
 hJzGfLJNIlteK0lrzkaprszqmfSRArd2V7YcqrwpPx57nJ0fwNp1nB9ObXPTQQNXKBUFoHRYqI
 ZMbsvqtAiVAGVuyEUsyqoUsX95td5nNFjhAvo1ZwP7X4kOitS9c3sQex7bQ+HkF323QMlGB7bD
 dlhHSPEusa3Bfa8g+I1LOQvwNMI/+8RnxbcxonUhzGzvQ0a7HcFQcsiFoGI0wPtq7J9g8EzSt6
 WLA=
From:   Andrew Gabbasov <andrew_gabbasov@mentor.com>
To:     <linux-renesas-soc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
Subject: [PATCH] i2c: rcar: add SMBus block read support
Date:   Wed, 22 Sep 2021 11:06:49 -0500
Message-ID: <20210922160649.28449-1-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The smbus block read is not currently supported for rcar i2c devices.
This patchset adds the support to rcar i2c bus so that blocks of data
can be read using SMbus block reads.(using i2c_smbus_read_block_data()
function from the i2c-core-smbus.c).

Inspired by commit 8e8782c71595 ("i2c: imx: add SMBus block read support")

This patch (adapted) was tested with v4.14, but due to lack of real
hardware with SMBus block read operations support, using "simulation",
that is manual analysis of data, read from plain I2C devices with
SMBus block read request.

Signed-off-by: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
---
 drivers/i2c/busses/i2c-rcar.c | 45 +++++++++++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index bff9913c37b8..a9fc2b3b6392 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -105,6 +105,7 @@
 #define ID_DONE		(1 << 2)
 #define ID_ARBLOST	(1 << 3)
 #define ID_NACK		(1 << 4)
+#define ID_EPROTO	(1 << 5)
 /* persistent flags */
 #define ID_P_HOST_NOTIFY	BIT(28)
 #define ID_P_REP_AFTER_RD	BIT(29)
@@ -412,6 +413,7 @@ static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
 	struct device *dev = rcar_i2c_priv_to_dev(priv);
 	struct i2c_msg *msg = priv->msg;
 	bool read = msg->flags & I2C_M_RD;
+	bool block_data = msg->flags & I2C_M_RECV_LEN;
 	enum dma_data_direction dir = read ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
 	struct dma_chan *chan = read ? priv->dma_rx : priv->dma_tx;
 	struct dma_async_tx_descriptor *txdesc;
@@ -429,9 +431,16 @@ static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
 		/*
 		 * The last two bytes needs to be fetched using PIO in
 		 * order for the STOP phase to work.
+		 *
+		 * For SMBus block read the first byte was received using PIO.
 		 */
-		buf = priv->msg->buf;
-		len = priv->msg->len - 2;
+		if (block_data) {
+			buf = priv->msg->buf + 1;
+			len = priv->msg->len - 3;
+		} else {
+			buf = priv->msg->buf;
+			len = priv->msg->len - 2;
+		}
 	} else {
 		/*
 		 * First byte in message was sent using PIO.
@@ -530,6 +539,7 @@ static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
 static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 {
 	struct i2c_msg *msg = priv->msg;
+	bool block_data = msg->flags & I2C_M_RECV_LEN;
 
 	/* FIXME: sometimes, unknown interrupt happened. Do nothing */
 	if (!(msr & MDR))
@@ -538,8 +548,29 @@ static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 	if (msr & MAT) {
 		/*
 		 * Address transfer phase finished, but no data at this point.
-		 * Try to use DMA to receive data.
+		 * Try to use DMA to receive data if it is not SMBus block
+		 * data read.
 		 */
+		if (block_data)
+			goto next_txn;
+
+		rcar_i2c_dma(priv);
+	} else if (priv->pos == 0 && block_data) {
+		/*
+		 * First byte is the length of remaining packet
+		 * in the SMBus block data read. Add it to
+		 * msg->len.
+		 */
+		u8 data = rcar_i2c_read(priv, ICRXTX);
+
+		if (data == 0 || data > I2C_SMBUS_BLOCK_MAX) {
+			priv->flags |= ID_DONE | ID_EPROTO;
+			return;
+		}
+		msg->len += data;
+		msg->buf[priv->pos] = data;
+		priv->pos++;
+		/* Still try to use DMA to receive the rest of data */
 		rcar_i2c_dma(priv);
 	} else if (priv->pos < msg->len) {
 		/* get received data */
@@ -557,6 +588,7 @@ static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 		}
 	}
 
+next_txn:
 	if (priv->pos == msg->len && !(priv->flags & ID_LAST_MSG))
 		rcar_i2c_next_msg(priv);
 	else
@@ -855,6 +887,8 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 		ret = -ENXIO;
 	} else if (priv->flags & ID_ARBLOST) {
 		ret = -EAGAIN;
+	} else if (priv->flags & ID_EPROTO) {
+		ret = -EPROTO;
 	} else {
 		ret = num - priv->msgs_left; /* The number of transfer */
 	}
@@ -917,6 +951,8 @@ static int rcar_i2c_master_xfer_atomic(struct i2c_adapter *adap,
 		ret = -ENXIO;
 	} else if (priv->flags & ID_ARBLOST) {
 		ret = -EAGAIN;
+	} else if (priv->flags & ID_EPROTO) {
+		ret = -EPROTO;
 	} else {
 		ret = num - priv->msgs_left; /* The number of transfer */
 	}
@@ -983,7 +1019,8 @@ static u32 rcar_i2c_func(struct i2c_adapter *adap)
 	 * I2C_M_IGNORE_NAK (automatically sends STOP after NAK)
 	 */
 	u32 func = I2C_FUNC_I2C | I2C_FUNC_SLAVE |
-		   (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
+		   (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK) |
+		   I2C_FUNC_SMBUS_READ_BLOCK_DATA;
 
 	if (priv->flags & ID_P_HOST_NOTIFY)
 		func |= I2C_FUNC_SMBUS_HOST_NOTIFY;
-- 
2.21.0

