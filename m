Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1C96237D7
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Nov 2022 00:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbiKIX71 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Nov 2022 18:59:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiKIX71 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Nov 2022 18:59:27 -0500
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5988113DD3
        for <linux-i2c@vger.kernel.org>; Wed,  9 Nov 2022 15:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
        Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
        Content-Disposition:In-Reply-To:References;
        bh=8LIF6QQ0dxfj3eNqtmMdejLFEYmT6NtOD3j1HaOH6L8=; b=qINYcEXyPU7nsQtjeKqqkQhQXY
        vLWauKWlvsgRVpGbeZoNIbnvNumZI91DSvM6u6xRsxukPpuytbOyVgjRFR7tCVPjDHucz5NfL4e+y
        Qu1IKTX2odIWJiC8vKVyYY2n8FEI2YQXysSa8U9fO0hh6F3k2xX5QSWxz1X9am2DRpyc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1osuyZ-001xwI-Lq; Thu, 10 Nov 2022 00:59:23 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     linux-i2c@vger.kernel.org
Cc:     Oleksij Rempel <linux@rempel-privat.de>, kernel@pengutronix.de,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH] i2c: imx: Only DMA messages with I2C_M_DMA_SAFE flag set
Date:   Thu, 10 Nov 2022 00:59:02 +0100
Message-Id: <20221109235902.468723-1-andrew@lunn.ch>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Recent changes to the DMA code has resulting in the IMX driver failing
I2C transfers when the buffer has been vmalloc. Only perform DMA
transfers if the message has the I2C_M_DMA_SAFE flag set, indicating
the client is providing a buffer which is DMA safe.

This is a minimal fix for stable. The I2C core provides helpers to
allocate a bounce buffer. For a fuller fix the master should make use
of these helpers.

Fixes: 4544b9f25e70 ("dma-mapping: Add vmap checks to dma_map_single()")
Signed-off-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/i2c/busses/i2c-imx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 3082183bd66a..fc70920c4dda 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1132,7 +1132,8 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 	int i, result;
 	unsigned int temp;
 	int block_data = msgs->flags & I2C_M_RECV_LEN;
-	int use_dma = i2c_imx->dma && msgs->len >= DMA_THRESHOLD && !block_data;
+	int use_dma = i2c_imx->dma && msgs->flags & I2C_M_DMA_SAFE &&
+		msgs->len >= DMA_THRESHOLD && !block_data;
 
 	dev_dbg(&i2c_imx->adapter.dev,
 		"<%s> write slave address: addr=0x%x\n",
@@ -1298,7 +1299,8 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 			result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg, atomic);
 		} else {
 			if (!atomic &&
-			    i2c_imx->dma && msgs[i].len >= DMA_THRESHOLD)
+			    i2c_imx->dma && msgs[i].len >= DMA_THRESHOLD &&
+				msgs[i].flags & I2C_M_DMA_SAFE)
 				result = i2c_imx_dma_write(i2c_imx, &msgs[i]);
 			else
 				result = i2c_imx_write(i2c_imx, &msgs[i], atomic);
-- 
2.37.2

