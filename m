Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51B0E11F92A
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Dec 2019 17:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfLOQjK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Dec 2019 11:39:10 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:53418 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbfLOQjK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Dec 2019 11:39:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=VARlzsIIpVbI1D3nL/jFJAegy6MvdDOvMduKw8KuaL4=; b=030O05AvaUfqxwWn0Yra1A3dJb
        8IG7fLw9fdFucu5K6NQyz+TVNKzsNDKMsYH9as2xo/BAFST56uQqK5GcKt7zujT8UW4oJ1e/LKLot
        jwUqUrwr6XbImhcsMiSDQKcln6RJFe92hj0e0p58flk7en8YsEnWyGrmygpDSQPXYyIUJWYll+rXD
        ezNaWejAVDHmJJ9JrQbN/nNgxzRXDAK6Q8adJENxWu2hHuvrFHgL3CIhKky7VfdPkHg1G77osieP2
        R6kkYSiP6rVVefADFZXu+eGbYBTdobe1putJ6LK6J63ty0tDaR8bR3mnKb4q+1yxm2g0/gHJSQ6oU
        TMxuQoiw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:43990 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWvC-0001qP-F0; Sun, 15 Dec 2019 16:39:06 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWvB-0001ib-PV; Sun, 15 Dec 2019 16:39:05 +0000
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: fix bus recovery stop mode timing
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1igWvB-0001ib-PV@rmk-PC.armlinux.org.uk>
Date:   Sun, 15 Dec 2019 16:39:05 +0000
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C specification states that tsu:sto for standard mode timing must
be at minimum 4us. Pictographically, this is:

SCL: ____/~~~~~~~~~
SDA: _________/~~~~
       ->|    |<- 4us minimum

We are currently waiting 2.5us between asserting SCL and SDA, which is
in violation of the standard. Adjust the timings to ensure that we meet
what is stipulated as the minimum timings to ensure that all devices
correctly interpret the STOP bus transition.

This is more important than trying to generate a square wave with even
duty cycle.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/i2c-core-base.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5f6a4985f2bc..9f35edb960b9 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -186,10 +186,11 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 	 * If we can set SDA, we will always create a STOP to ensure additional
 	 * pulses will do no harm. This is achieved by letting SDA follow SCL
 	 * half a cycle later. Check the 'incomplete_write_byte' fault injector
-	 * for details.
+	 * for details. Note that we must honour tsu:sto, 4us, but lets use 5us
+	 * here for simplicity.
 	 */
 	bri->set_scl(adap, scl);
-	ndelay(RECOVERY_NDELAY / 2);
+	ndelay(RECOVERY_NDELAY);
 	if (bri->set_sda)
 		bri->set_sda(adap, scl);
 	ndelay(RECOVERY_NDELAY / 2);
@@ -210,8 +211,13 @@ int i2c_generic_scl_recovery(struct i2c_adapter *adap)
 
 		scl = !scl;
 		bri->set_scl(adap, scl);
-		/* Creating STOP again, see above */
-		ndelay(RECOVERY_NDELAY / 2);
+		if (scl)  {
+			/* Honour minimum tsu:sto */
+			ndelay(RECOVERY_NDELAY);
+		} else {
+			/* Honour minimum tf and thd:dat */
+			ndelay(RECOVERY_NDELAY / 2);
+		}
 		if (bri->set_sda)
 			bri->set_sda(adap, scl);
 		ndelay(RECOVERY_NDELAY / 2);
-- 
2.20.1

