Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 945B942461D
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Oct 2021 20:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbhJFSci (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Oct 2021 14:32:38 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:38545 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbhJFSch (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Oct 2021 14:32:37 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Oct 2021 14:32:37 EDT
IronPort-SDR: r27yQSxGvtZbSnwFAh3yReJHwEsOww5jK27gvdaYSf7nfw53VcxaOgxksJfbmf28JpneMnqcNR
 Rn2Dl71ikEFjzBclRft2tRO0EPjtJXf/URSreljPhJklOmucOvjA4b1BhoxxG7pe9CZmsQgSlD
 qubX8ZxHAxgXOnpXkIXTfQ7e1f0HHxtVjhkujohIt8SxrxequhykI/06ftPXrpoulZgUVPEZCE
 S6KtMtvBJkkAzz+dceFc4gKln71xl6vpG0gAcwh2Z5MvY3tXy82+sTH9MCxtNLPsEEeYMfuDid
 093kppB8FWRIM8PGYmeVSCa2
X-IronPort-AV: E=Sophos;i="5.85,352,1624348800"; 
   d="scan'208";a="66897571"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 06 Oct 2021 10:23:36 -0800
IronPort-SDR: oqcF/UaaU1HU5Rny0BXoSMKOMVQvo6pg5nlOfc5s6XZ1XPP6R9Az/HeWGEruPWwPl5zvjBDJ1J
 Jk3H4o24EPH6x8K6x1oeQE+18qSCx/F3x/FVUjlqBPEEXFCUWFlzMqKaqCp3A4uwwbvbHXicZ6
 NkwScd9AVfWMBtlYE4Ox73V/SZ4AcnRt/7/Gfn+3UMssDijuZwQpEBNmECPaMvxxNB8cJlDV06
 AdxgWdnGqRiNiBvEpjBP6crL5vjrW0+Omx3tBqzh0vdfWLprHMiKYKUndkGhZuwRluNhlDvlpa
 ZJc=
From:   Andrew Gabbasov <andrew_gabbasov@mentor.com>
To:     <linux-renesas-soc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
Subject: [PATCH v2] i2c: rcar: add SMBus block read support
Date:   Wed, 6 Oct 2021 13:23:14 -0500
Message-ID: <20211006182314.10585-1-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <000001d7badd$a8512d30$f8f38790$@mentor.com>
References: <20210922160649.28449-1-andrew_gabbasov@mentor.com> <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com> <000001d7badd$a8512d30$f8f38790$@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-08.mgc.mentorg.com (139.181.222.8) To
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
 drivers/i2c/busses/i2c-rcar.c | 49 +++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index bff9913c37b8..e4b603f425fa 100644
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
@@ -425,19 +427,22 @@ static bool rcar_i2c_dma(struct rcar_i2c_priv *priv)
 	    !(msg->flags & I2C_M_DMA_SAFE) || (read && priv->flags & ID_P_NO_RXDMA))
 		return false;
 
+	buf = priv->msg->buf;
+	len = priv->msg->len;
+
 	if (read) {
 		/*
 		 * The last two bytes needs to be fetched using PIO in
 		 * order for the STOP phase to work.
 		 */
-		buf = priv->msg->buf;
-		len = priv->msg->len - 2;
-	} else {
+		len -= 2;
+	}
+	if (!read || block_data) {
 		/*
-		 * First byte in message was sent using PIO.
+		 * First byte in message was sent or received using PIO.
 		 */
-		buf = priv->msg->buf + 1;
-		len = priv->msg->len - 1;
+		buf++;
+		len--;
 	}
 
 	dma_addr = dma_map_single(chan->device->dev, buf, len, dir);
@@ -530,6 +535,7 @@ static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
 static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 {
 	struct i2c_msg *msg = priv->msg;
+	bool block_data = msg->flags & I2C_M_RECV_LEN;
 
 	/* FIXME: sometimes, unknown interrupt happened. Do nothing */
 	if (!(msr & MDR))
@@ -538,8 +544,29 @@ static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
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
@@ -557,6 +584,7 @@ static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 		}
 	}
 
+next_txn:
 	if (priv->pos == msg->len && !(priv->flags & ID_LAST_MSG))
 		rcar_i2c_next_msg(priv);
 	else
@@ -855,6 +883,8 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 		ret = -ENXIO;
 	} else if (priv->flags & ID_ARBLOST) {
 		ret = -EAGAIN;
+	} else if (priv->flags & ID_EPROTO) {
+		ret = -EPROTO;
 	} else {
 		ret = num - priv->msgs_left; /* The number of transfer */
 	}
@@ -917,6 +947,8 @@ static int rcar_i2c_master_xfer_atomic(struct i2c_adapter *adap,
 		ret = -ENXIO;
 	} else if (priv->flags & ID_ARBLOST) {
 		ret = -EAGAIN;
+	} else if (priv->flags & ID_EPROTO) {
+		ret = -EPROTO;
 	} else {
 		ret = num - priv->msgs_left; /* The number of transfer */
 	}
@@ -983,7 +1015,8 @@ static u32 rcar_i2c_func(struct i2c_adapter *adap)
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

