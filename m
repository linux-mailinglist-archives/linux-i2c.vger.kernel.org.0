Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F042778FEC
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Aug 2023 14:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjHKMxM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Aug 2023 08:53:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjHKMxM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Aug 2023 08:53:12 -0400
X-Greylist: delayed 400 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 11 Aug 2023 05:53:10 PDT
Received: from mx4.sionneau.net (mx4.sionneau.net [51.15.250.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CFDE109;
        Fri, 11 Aug 2023 05:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sionneau.net;
        s=selectormx4; t=1691757988;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=AhVnwGJ68D1Er7EJTToc3iXwRxrhSPiDwmkI0Rp62EY=;
        b=LlpAinAp59spqpc8ohnGESsFJg0xwj+1DyiGslwbKsCiEHN/pFllgeuIZIOIdPOp0Fk63f
        bqMh129NCs59I6WprKV0m3BdHdXJ/6DbusWqkPddwvA6PNOVgDZZtYRamoc5WPHLLIQ57z
        yo0SrJbcgVW0umx+h/zYp4VS/UXpNZs=
Received: from junon.lin.mbt.kalray.eu (<unknown> [217.181.231.53])
        by mx4.sionneau.net (OpenSMTPD) with ESMTPSA id 1b942a1f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Fri, 11 Aug 2023 12:46:28 +0000 (UTC)
From:   Yann Sionneau <yann@sionneau.net>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yann Sionneau <ysionneau@kalray.eu>,
        Jonathan Borne <jborne@kalray.eu>
Subject: [PATCH 2/2] i2c: designware: abort the transfer if receiving byte count of 0
Date:   Fri, 11 Aug 2023 14:46:24 +0200
Message-Id: <20230811124624.12792-2-yann@sionneau.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230811124624.12792-1-yann@sionneau.net>
References: <20230811124624.12792-1-yann@sionneau.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Yann Sionneau <ysionneau@kalray.eu>

Context:
It's not clear whether Linux SMBus stack supports receiving 0
as byte count for SMBus read data block.

Linux supports SMBus v2.0 spec, which says "The byte count may not be 0."
Which does not seem very clear to me, as a non-native speaker.
(Note that v3.0 of the spec says "The byte count may be 0.")

Some drivers explicitly return -EPROTO in case of byte count 0.

The issue:
Regardless of whether Linux supports byte count of 0, if this happens
the i2c-designware driver goes into an unrecoverable state holding
SCL low if the IP is synthesized with the IC_EMPTYFIFO_HOLD_MASTER_EN
parameter.

The fix proposed by this patch:
Abort the transfer by sending a STOP condition on the bus.

Another approach would be to ignore the issue and let the driver
timeout and disable the IP. The IP disabling is fixed by the previous
patch in this patch series.
The current patch just makes the recovery faster since Abort is sent
directly without waiting for the timeout to happen. With this patch,
disabling the IP is not necessary anymore.

Co-developed-by: Jonathan Borne <jborne@kalray.eu>
Signed-off-by: Jonathan Borne <jborne@kalray.eu>
Tested-by: Yann Sionneau <ysionneau@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---
 drivers/i2c/busses/i2c-designware-master.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index b55c19b2515a..fa5301566bb1 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -499,6 +499,15 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
 	return len;
 }
 
+static void
+i2c_dw_abort(struct dw_i2c_dev *dev)
+{
+	u32 enable;
+
+	regmap_read(dev->map, DW_IC_ENABLE, &enable);
+	regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
+}
+
 static void
 i2c_dw_read(struct dw_i2c_dev *dev)
 {
@@ -526,11 +535,16 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 			u32 flags = msgs[dev->msg_read_idx].flags;
 
 			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
+			tmp &= DW_IC_DATA_CMD_DAT;
+
 			/* Ensure length byte is a valid value */
-			if (flags & I2C_M_RECV_LEN &&
-			    (tmp & DW_IC_DATA_CMD_DAT) <= I2C_SMBUS_BLOCK_MAX && (tmp & DW_IC_DATA_CMD_DAT) > 0) {
-				len = i2c_dw_recv_len(dev, tmp);
+			if (flags & I2C_M_RECV_LEN) {
+				if ((tmp <= I2C_SMBUS_BLOCK_MAX) && (tmp != 0))
+					len = i2c_dw_recv_len(dev, tmp);
+				else
+					i2c_dw_abort(dev);
 			}
+
 			*buf++ = tmp;
 			dev->rx_outstanding--;
 		}
-- 
2.17.1

