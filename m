Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBAB64EDE1E
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Mar 2022 18:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239460AbiCaQED (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Mar 2022 12:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233278AbiCaQEC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Mar 2022 12:04:02 -0400
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2449660D9E;
        Thu, 31 Mar 2022 09:02:14 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 52F603C04C0;
        Thu, 31 Mar 2022 18:02:12 +0200 (CEST)
Received: from lxhi-065 (10.72.94.4) by hi2exch02.adit-jv.com (10.72.92.28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Thu, 31 Mar
 2022 18:02:11 +0200
Date:   Thu, 31 Mar 2022 18:02:07 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        <linux-renesas-soc@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2] i2c: rcar: add SMBus block read support
Message-ID: <20220331160207.GA27757@lxhi-065>
References: <20210922160649.28449-1-andrew_gabbasov@mentor.com>
 <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com>
 <000001d7badd$a8512d30$f8f38790$@mentor.com>
 <20211006182314.10585-1-andrew_gabbasov@mentor.com>
 <Yg6ls0zyTDe7LQbK@kunai>
 <20220323215229.GA9403@lxhi-065>
 <YkQ31VMqj1MXqBd3@shikoro>
 <YkQ6XRITOFZ7hLXV@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YkQ6XRITOFZ7hLXV@shikoro>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.94.4]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Wolfram,

Thanks for your feedback!

On Wed, Mar 30, 2022 at 01:09:17PM +0200, Wolfram Sang wrote:
> 
> BTW...
> 
> > > ############################################################
> > > ##################### WOLFRAM'S PATCH ######################
> > > ############################################################
> > > root@rcar-gen3:# i2cget -y 4 0x68 0 i 8
> > > 0x08 0xff 0x06 0xff 0x5f 0xff 0x11 0x08
> 
> ... for further tests I think the last parameter should be "i 9" here...

Your patch re-tested on your request (we'll use -i 9 in the future):

root@rcar-gen3:# i2cget -y 4 0x68 0 s
0xff 0x06 0xff 0x5f 0xff 0x11 0x08 0x08
root@rcar-gen3:# i2cget -y 4 0x68 0 i 9
0x08 0xff 0x06 0xff 0x5f 0xff 0x11 0x08 0x08
root@rcar-gen3:# i2cget -y 4 0x68 0 i
0x08 0xff 0x06 0xff 0x5f 0xff 0x11 0x08 0x08 0xff 0xff 0x7e 0x99 0x3e 0x00 0x00 0xfb 0xff 0xff 0x87 0x27 0xff 0x04 0xff 0x30 0x03 0xfd 0xff 0xff 0xff 0xff 0xff
 
> > > 
> > > root@rcar-gen3:# i2cget -y 4 0x68 0 s
> > > 0xff 0x06 0xff 0x5f 0xff 0x11 0x08 0x08
> 
> ... to see if these 8 bytes match the last 8 bytes from above. The first
> byte from above is returned internally as the length. It is not a data
> byte.
> 

BTW, thanks to Bhuvanesh, we've got another patch [*] which tries
to combine the best of both worlds:

* DMA support in the v1/v2 patches from Andrew/Bhuvanesh
* Simplicity of your proposal in https://lore.kernel.org/lkml/Yg6ls0zyTDe7LQbK@kunai/

Unfortunately, this patch has a dependency to the rcar_i2c_is_pio()
in https://github.com/renesas-rcar/linux-bsp/commit/55d2d2fb8b0 
(which should be resolvable by extracting the function).

Do you think we are on the right track with this new approach or do
you feel the implementation is still overly complicated?

Appreciate your time/feedback.

Best regards,
Eugeniu

[*] v3

From: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
Date: Wed, 26 May 2021 11:36:36 +0530
Subject: [PATCH v3] i2c: rcar: add SMBus block read support

The SMBus block read is currently not supported for rcar i2c devices.

Add appropriate support to R-Car i2c driver, so that blocks of data
can be read using SMbus block reads (using i2c_smbus_read_block_data()
function from i2c-core-smbus.c).

Inspired from:
 - commit 8e8782c71595a5 ("i2c: imx: add SMBus block read support")
 - https://lore.kernel.org/lkml/Yg6ls0zyTDe7LQbK@kunai/
   (proposal/suggestion from Wolfram Sang)

Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
---
 drivers/i2c/busses/i2c-rcar.c | 39 ++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index f71c730f9838..f4f36689464c 100644
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
@@ -522,6 +523,7 @@ static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
 static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 {
 	struct i2c_msg *msg = priv->msg;
+	bool recv_len_init = priv->pos == 0 && msg->flags & I2C_M_RECV_LEN;
 
 	/* FIXME: sometimes, unknown interrupt happened. Do nothing */
 	if (!(msr & MDR))
@@ -535,12 +537,37 @@ static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 		rcar_i2c_dma(priv);
 	} else if (priv->pos < msg->len) {
 		/* get received data */
-		msg->buf[priv->pos] = rcar_i2c_read(priv, ICRXTX);
+		u8 data = rcar_i2c_read(priv, ICRXTX);
+
+		if (recv_len_init) {
+			/*
+			 * First byte is the length of remaining packet
+			 * in the SMBus block data read. Add it to
+			 * msg->len.
+			 */
+			if (data == 0 || data > I2C_SMBUS_BLOCK_MAX) {
+				priv->flags |= ID_DONE | ID_EPROTO;
+				return;
+			}
+			msg->len += data;
+
+			if (!rcar_i2c_is_pio(priv)) {
+				/*
+				 * Still try to use DMA to receive the rest of
+				 * data
+				 */
+				rcar_i2c_dma(priv);
+				goto next_txn;
+			} else {
+				recv_len_init = false;
+			}
+		}
+		msg->buf[priv->pos] = data;
 		priv->pos++;
 	}
 
 	/* If next received data is the _LAST_, go to new phase. */
-	if (priv->pos + 1 == msg->len) {
+	if (priv->pos + 1 == msg->len && !recv_len_init) {
 		if (priv->flags & ID_LAST_MSG) {
 			rcar_i2c_write(priv, ICMCR, RCAR_BUS_PHASE_STOP);
 		} else {
@@ -549,6 +576,7 @@ static void rcar_i2c_irq_recv(struct rcar_i2c_priv *priv, u32 msr)
 		}
 	}
 
+next_txn:
 	if (priv->pos == msg->len && !(priv->flags & ID_LAST_MSG))
 		rcar_i2c_next_msg(priv);
 	else
@@ -847,6 +875,8 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 		ret = -ENXIO;
 	} else if (priv->flags & ID_ARBLOST) {
 		ret = -EAGAIN;
+	} else if (priv->flags & ID_EPROTO) {
+		ret = -EPROTO;
 	} else {
 		ret = num - priv->msgs_left; /* The number of transfer */
 	}
@@ -909,6 +939,8 @@ static int rcar_i2c_master_xfer_atomic(struct i2c_adapter *adap,
 		ret = -ENXIO;
 	} else if (priv->flags & ID_ARBLOST) {
 		ret = -EAGAIN;
+	} else if (priv->flags & ID_EPROTO) {
+		ret = -EPROTO;
 	} else {
 		ret = num - priv->msgs_left; /* The number of transfer */
 	}
@@ -975,7 +1007,8 @@ static u32 rcar_i2c_func(struct i2c_adapter *adap)
 	 * I2C_M_IGNORE_NAK (automatically sends STOP after NAK)
 	 */
 	u32 func = I2C_FUNC_I2C | I2C_FUNC_SLAVE |
-		   (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
+		   (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK) |
+		   I2C_FUNC_SMBUS_READ_BLOCK_DATA;
 
 	if (priv->flags & ID_P_HOST_NOTIFY)
 		func |= I2C_FUNC_SMBUS_HOST_NOTIFY;
-- 
2.35.1
