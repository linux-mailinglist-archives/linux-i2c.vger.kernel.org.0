Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859101C6CF0
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 11:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbgEFJ3d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 05:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728663AbgEFJ3c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 05:29:32 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901AFC061A0F
        for <linux-i2c@vger.kernel.org>; Wed,  6 May 2020 02:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ioeUcI+rZy7wa17vPkObjhz/czqFcwCLpvV6UzxZ8FU=; b=ZrVWjDpa4yiEPAH05BgblH9Khc
        tG8iCZbGaCKCw0e7m/Cz7ki5s0N9G6TMQO+otUnmvmvgmALqGp/QBJWpPiWHaAwV7BK9R9qSdKWW1
        SLx3Xn6xGYh0CKLudGO08jTrSIIJdoAJQFcT0PzoLwKUzPamWWpRhQtvhdLGolrtvFTFg+eHhIAHL
        Uv6ZVrhhZD9iBXRw5b1hx+/WmoX1Rxpz9DzK2gF9M8m4pxacUfm9QeGyy+ztlWGUM1AquMv3w9fzo
        lQZcR4z/Lvd7t+KiPiySeCOTMIGwyLfBa4mt5HKcqQycEt9+KboJKrJoOEeECK/0YLQTcpZeuCokl
        G7TGcgOw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:48920 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jWGMq-0007lo-PH; Wed, 06 May 2020 10:29:28 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jWGMq-0000NX-30; Wed, 06 May 2020 10:29:28 +0100
In-Reply-To: <20200506092831.GN1551@shell.armlinux.org.uk>
References: <20200506092831.GN1551@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH 4/4] i2c: pxa: remove some unnecessary debug
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jWGMq-0000NX-30@rmk-PC.armlinux.org.uk>
Date:   Wed, 06 May 2020 10:29:28 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Remove unnecessary show_state() in the loop inside
i2c_pxa_pio_set_master(), which can be unnecessarily verbose.

Remove the i2c_pxa_scream_blue_murder() in i2c_pxa_pio_xfer(), which
will trigger if we are probing the I2C bus and a slave does not
respond; this is a normal event, and not something to report.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 0becab239476..db739cce93ac 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1161,10 +1161,8 @@ static int i2c_pxa_pio_set_master(struct pxa_i2c *i2c)
 	/*
 	 * Wait for the bus to become free.
 	 */
-	while (timeout-- && readl(_ISR(i2c)) & (ISR_IBB | ISR_UB)) {
+	while (timeout-- && readl(_ISR(i2c)) & (ISR_IBB | ISR_UB))
 		udelay(1000);
-		show_state(i2c);
-	}
 
 	if (timeout < 0) {
 		show_state(i2c);
-- 
2.20.1

