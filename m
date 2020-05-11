Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A90A1CE727
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 23:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgEKVKc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 17:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725888AbgEKVKb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 17:10:31 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B1E3C061A0C
        for <linux-i2c@vger.kernel.org>; Mon, 11 May 2020 14:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QIp+RF1/uNaJva/G/js9kgy9Muu7s8J/r7bHlh5Z89s=; b=QvfxrDkwo+yupN2mi4kFX6O1xt
        xqVU5curpT6us7uhJN5chEvi1D2x2jnn4H4zSGQlHr9hVsy2Sg7P1SykTWtBNIvtL/PCt5PgSHIWe
        U/N44TmrbAsCLPoQKC1bQKe0VP5KotW1ypAtIOexg/a4I3tF6IqCvtuFTy+ICmz2Vp3PBEmwGzICc
        qY0+jNs731+Y8IeUw6B+opqT1PUGglAKqMu9t+M6VMXj4N+jOZUtbrv/dRyATgX5jzAi9WSMMBAFj
        VQ8G2TK3v46RpvK5B7J4yLCZaaojhMgKNpottXBhqTQ/ZMf7RsugcW7A5jX0Xi+tqzOqyTj0zyYMO
        wSOsIK/Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:49038 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jYFgx-0007cx-Rr; Mon, 11 May 2020 22:10:27 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jYFgx-0007Jy-9p; Mon, 11 May 2020 22:10:27 +0100
In-Reply-To: <20200511210948.GY1551@shell.armlinux.org.uk>
References: <20200511210948.GY1551@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH v2 1/4] i2c: pxa: consolidate i2c_pxa_*xfer() implementations
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jYFgx-0007Jy-9p@rmk-PC.armlinux.org.uk>
Date:   Mon, 11 May 2020 22:10:27 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Most of i2c_pxa_pio_xfer() and i2c_pxa_xfer() are identical; the only
differences are that i2c_pxa_pio_xfer() may reset the bus, and they
use different underlying transfer functions. The retry loop is the
same. Consolidate these two functions.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index c1e50c0b9756..46f1cf97d955 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1102,18 +1102,20 @@ static int i2c_pxa_do_xfer(struct pxa_i2c *i2c, struct i2c_msg *msg, int num)
 	return ret;
 }
 
-static int i2c_pxa_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
+static int i2c_pxa_internal_xfer(struct pxa_i2c *i2c,
+				 struct i2c_msg *msgs, int num,
+				 int (*xfer)(struct pxa_i2c *,
+					     struct i2c_msg *, int num))
 {
-	struct pxa_i2c *i2c = adap->algo_data;
 	int ret, i;
 
-	for (i = adap->retries; i >= 0; i--) {
-		ret = i2c_pxa_do_xfer(i2c, msgs, num);
+	for (i = i2c->adap.retries; i >= 0; i--) {
+		ret = xfer(i2c, msgs, num);
 		if (ret != I2C_RETRY)
 			goto out;
 
 		if (i2c_debug)
-			dev_dbg(&adap->dev, "Retrying transmission\n");
+			dev_dbg(&i2c->adap.dev, "Retrying transmission\n");
 		udelay(100);
 	}
 	i2c_pxa_scream_blue_murder(i2c, "exhausted retries");
@@ -1123,6 +1125,14 @@ static int i2c_pxa_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num
 	return ret;
 }
 
+static int i2c_pxa_xfer(struct i2c_adapter *adap,
+			struct i2c_msg msgs[], int num)
+{
+	struct pxa_i2c *i2c = adap->algo_data;
+
+	return i2c_pxa_internal_xfer(i2c, msgs, num, i2c_pxa_do_xfer);
+}
+
 static u32 i2c_pxa_functionality(struct i2c_adapter *adap)
 {
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL |
@@ -1210,7 +1220,6 @@ static int i2c_pxa_pio_xfer(struct i2c_adapter *adap,
 			    struct i2c_msg msgs[], int num)
 {
 	struct pxa_i2c *i2c = adap->algo_data;
-	int ret, i;
 
 	/* If the I2C controller is disabled we need to reset it
 	  (probably due to a suspend/resume destroying state). We do
@@ -1219,20 +1228,7 @@ static int i2c_pxa_pio_xfer(struct i2c_adapter *adap,
 	if (!(readl(_ICR(i2c)) & ICR_IUE))
 		i2c_pxa_reset(i2c);
 
-	for (i = adap->retries; i >= 0; i--) {
-		ret = i2c_pxa_do_pio_xfer(i2c, msgs, num);
-		if (ret != I2C_RETRY)
-			goto out;
-
-		if (i2c_debug)
-			dev_dbg(&adap->dev, "Retrying transmission\n");
-		udelay(100);
-	}
-	i2c_pxa_scream_blue_murder(i2c, "exhausted retries");
-	ret = -EREMOTEIO;
- out:
-	i2c_pxa_set_slave(i2c, ret);
-	return ret;
+	return i2c_pxa_internal_xfer(i2c, msgs, num, i2c_pxa_do_pio_xfer);
 }
 
 static const struct i2c_algorithm i2c_pxa_pio_algorithm = {
-- 
2.20.1

