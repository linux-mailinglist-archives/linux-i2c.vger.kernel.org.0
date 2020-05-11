Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0542E1CE728
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 23:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgEKVKh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 17:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725888AbgEKVKg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 17:10:36 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EADBC061A0C
        for <linux-i2c@vger.kernel.org>; Mon, 11 May 2020 14:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=t02Pua84F0WbVP4eX0Sk6k2jQqfPLke4y5cjV7sPCjQ=; b=mRfy4iiC6sEhFoiFjeE5kkRaKg
        vQfUEbFelDSRgtsOTt5IFiJ5m7IIHDqsw4y9IytVanFrg+FbKBLR8lHII95jO75VVR91L4j4QGj7T
        H85LpB/SB9QW4rFrbXC2z50bCnzk+gFmxAL6MP62KzkVUikxBKrfEIa5T1VdP+82MPqZO8ede0cZ+
        8tmc58b+++O+F6HE+O0qcN/Vm1fNcoBjCBv1AuOWs1yRW2thfX4Z8sQ6tpoKy2FTDrSVhdF6CwW4r
        zfSeX4cQVFmp3Rt14RUPp+RBlk65yG3pYz1cXH0TdJTKhFOc74/OjMh0uxnxUCZlaSzdfcjS+KmMe
        NVhrb2Gw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51906 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jYFh2-0007d3-Vw; Mon, 11 May 2020 22:10:33 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jYFh2-0007K5-ET; Mon, 11 May 2020 22:10:32 +0100
In-Reply-To: <20200511210948.GY1551@shell.armlinux.org.uk>
References: <20200511210948.GY1551@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH v2 2/4] i2c: pxa: avoid complaints with non-responsive slaves
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jYFh2-0007K5-ET@rmk-PC.armlinux.org.uk>
Date:   Mon, 11 May 2020 22:10:32 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Running i2cdetect on a PXA I2C adapter is very noisy; it complains
whenever a slave fails to respond to the address cycle.  Since it is
normal to probe for slaves in this way, we should not fill the kernel
log.  This is especially true with SFP modules that take a while to
respond on the I2C bus, and probing via the I2C bus is the only way to
detect that they are ready.

Fix this by changing the internal transfer return code from I2C_RETRY
to a new NO_SLAVE code (mapped to -ENXIO, as per the I2C documentation
for this condition, but we still return -EREMOTEIO to the I2C stack to
maintain long established driver behaviour.)

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 46f1cf97d955..f20f8b905793 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -90,6 +90,7 @@
  */
 #define DEF_TIMEOUT             32
 
+#define NO_SLAVE		(-ENXIO)
 #define BUS_ERROR               (-EREMOTEIO)
 #define XFER_NAKED              (-ECONNREFUSED)
 #define I2C_RETRY               (-2000) /* an error has occurred retry transmit */
@@ -881,7 +882,7 @@ static void i2c_pxa_irq_txempty(struct pxa_i2c *i2c, u32 isr)
 		 */
 		if (isr & ISR_ACKNAK) {
 			if (i2c->msg_ptr == 0 && i2c->msg_idx == 0)
-				ret = I2C_RETRY;
+				ret = NO_SLAVE;
 			else
 				ret = XFER_NAKED;
 		}
@@ -1109,16 +1110,19 @@ static int i2c_pxa_internal_xfer(struct pxa_i2c *i2c,
 {
 	int ret, i;
 
-	for (i = i2c->adap.retries; i >= 0; i--) {
+	for (i = 0; ; ) {
 		ret = xfer(i2c, msgs, num);
-		if (ret != I2C_RETRY)
+		if (ret != I2C_RETRY && ret != NO_SLAVE)
 			goto out;
+		if (++i >= i2c->adap.retries)
+			break;
 
 		if (i2c_debug)
 			dev_dbg(&i2c->adap.dev, "Retrying transmission\n");
 		udelay(100);
 	}
-	i2c_pxa_scream_blue_murder(i2c, "exhausted retries");
+	if (ret != NO_SLAVE)
+		i2c_pxa_scream_blue_murder(i2c, "exhausted retries");
 	ret = -EREMOTEIO;
  out:
 	i2c_pxa_set_slave(i2c, ret);
-- 
2.20.1

