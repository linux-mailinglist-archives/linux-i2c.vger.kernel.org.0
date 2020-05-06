Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28EB21C6CEE
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 11:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgEFJ3W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 05:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728663AbgEFJ3W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 05:29:22 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16645C061A0F
        for <linux-i2c@vger.kernel.org>; Wed,  6 May 2020 02:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=cxFeZQJa565g9PiasEPjoaOONT/yWFDr00YhASQC08M=; b=MJAv13UcoFByH9ctHJyfmfFxKS
        5+PkYeiEcP/ZRG2vpvBUshtF8dSfkOJBxx7Afu0zpmh4HDHMaPBgeusWyELaEdYx6il13ioVhPfro
        s8ZjuLviB2S+P3tmlFZ71xgbhZzbxYmo4m+5ssQ3y5nm8Ap2rGFwNphLJI7t7o9YVFECQFsFT4sHF
        OJL35W2wD1nVhYPSAohfsKMJeiNgn7+1OU872R64vMXgglSgnHBY5SmeKLRyhoy1EW+o8DyREEuD4
        S5H/GeXBQ6yscrUFAuutTWl0SbnacKXaq2Wlvpkm1lgJwCVMr1iQRFOY056bQBL0DAzfzuL1EIIvr
        sC8mFhsw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:48916 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jWGMg-0007lb-Er; Wed, 06 May 2020 10:29:18 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jWGMf-0000NC-SI; Wed, 06 May 2020 10:29:17 +0100
In-Reply-To: <20200506092831.GN1551@shell.armlinux.org.uk>
References: <20200506092831.GN1551@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH 2/4] i2c: pxa: avoid complaints with non-responsive slaves
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jWGMf-0000NC-SI@rmk-PC.armlinux.org.uk>
Date:   Wed, 06 May 2020 10:29:17 +0100
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
 drivers/i2c/busses/i2c-pxa.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index be38a0ff981a..f20f8b905793 100644
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
-			dev_dbg(&adap->dev, "Retrying transmission\n");
+			dev_dbg(&i2c->adap.dev, "Retrying transmission\n");
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

