Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC2C115D80
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2019 17:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfLGQ2q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Dec 2019 11:28:46 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:60680 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726414AbfLGQ2p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 Dec 2019 11:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=sZNwfDqK3njMgQ70g1Hb8c7ucZ7GlMF0XirY9YyAZxw=; b=iSGO6C205yJvI8AzFJh/p63sE5
        NBYJv9GyBOlgkg/CLGPTIc5/OB7YQfwRQKHKeGBppBPGvdOfMKr2dgBDHyXcc4B2pScrmAri5CcPM
        m96eNBUyxO1pMOQKJtXLp+G5lz6AUd885JZisT5a6zopy+JLXoDt55yCd5AI3Ednswk3WYGcKpkHT
        x/bbBtjnw++fwXh03/HSPMw8DinPaeJAxLop/Nf8TZhrMg7G+mXjgEF/i7y/hPirEJ1VlMZLC6pgW
        I3970sUPz/bQ2+g76jEX4qwh1AOBcdZQWgfJUt0295IvvBhkwFV63YbkUaqs9XUHbj7/RMPJgduMq
        vpLUAvkQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:43766 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1idcwk-0007ne-CW; Sat, 07 Dec 2019 16:28:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1idcwj-00055E-Qu; Sat, 07 Dec 2019 16:28:41 +0000
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: fix bus recovery stop mode timing
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1idcwj-00055E-Qu@rmk-PC.armlinux.org.uk>
Date:   Sat, 07 Dec 2019 16:28:41 +0000
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C specification states that tsu:sto for standard mode timing must
be at minimum 4us.  Pictographically, this is:

SCL: ____/~~~~~~~~~
SDA: _________/~~~~
       ->|    |<- 4us minimum

We are currently waiting 2.5us between asserting SCL and SDA, which is
in violation of the standard. Adjust the timings to ensure that we meet
what is stipulated as the minimum timings to ensure that all devices
correctly interpret the STOP bus transition.

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

