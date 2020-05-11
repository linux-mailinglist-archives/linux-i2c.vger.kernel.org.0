Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 522421CE72A
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 23:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgEKVKr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 17:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725888AbgEKVKr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 17:10:47 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E70C061A0C
        for <linux-i2c@vger.kernel.org>; Mon, 11 May 2020 14:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ioeUcI+rZy7wa17vPkObjhz/czqFcwCLpvV6UzxZ8FU=; b=I2PPpimJEDt1E56AbhSM12Ol1U
        q2AS7nDwYpFRK/QH/ogGO7vRjhWENQUG92kuHvGG2SN2lPYLqD+TtO3PbAbxLKqdLZBFCe3PYL4rA
        LpaDKS/vuy/EehO2wSq3xMp0AU43KFbHXPrAdcvVdGJ2rf+TCAQlFx6uzIAo3u4YXd8QWsN6Xjvu8
        jY5JICESFotXFaz/FlnpV0ddww5lNOkQFSTyMWCelzj7+wucel81dEK8ovhWugnfiN4y9BiC2E518
        aavcUi5wUXvNZGZroNTjEfFs94lz461KQPrI2vk/ikr4ZmUpIlmnEPcKkmHMKuHjoLOXLZAkMgkfx
        //Bpg58w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:46524 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jYFhD-0007dF-82; Mon, 11 May 2020 22:10:43 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jYFhC-0007KN-Ll; Mon, 11 May 2020 22:10:42 +0100
In-Reply-To: <20200511210948.GY1551@shell.armlinux.org.uk>
References: <20200511210948.GY1551@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH v2 4/4] i2c: pxa: remove some unnecessary debug
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jYFhC-0007KN-Ll@rmk-PC.armlinux.org.uk>
Date:   Mon, 11 May 2020 22:10:42 +0100
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

