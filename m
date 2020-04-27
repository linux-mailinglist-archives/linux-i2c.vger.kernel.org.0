Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A9B1BA766
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 17:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbgD0PJ2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 11:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727881AbgD0PJ2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 11:09:28 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8E0C0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 08:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Kx38hGVtLtXvYcqPhQMgtDOaMblpmaMaWYOzznmrMXU=; b=oIg4PLH7hKEiFE5hVXkQGMm3oS
        fwXx8naay8LaZ5HWb4p5a4BR/SiUwkjamkOqPHNK9jriEiBo7tT83Hx6NhCOwgW9qs1lvYcSNf1KA
        SfK5jkUIvPflJA5Cn9DexBe4OyoJIOp2yUSH7hqpI49OskDVLxMmsqT0MD7471NEctwKF3gGWgjHH
        5rUNwAjXKObstdYcTB1yfFLt76EPE16gNmAbO3nwQgAsY9jCTw47mo4MQDN8PGNxh52anRxEzoFqs
        zEz0c965kfzCpVJBzW69EcTJyNE4OyyyFc+//1gFP6/jVA93q2zEl87Q0CN6sBCA0bkbex4srjAAt
        mJVGQwHw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57198 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5Ns-0003YY-75; Mon, 27 Apr 2020 16:09:24 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5Nr-0001rs-Ks; Mon, 27 Apr 2020 16:09:23 +0100
In-Reply-To: <20200427150755.GT5827@shell.armlinux.org.uk>
References: <20200427150755.GT5827@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH REPOST 10/12] i2c: pxa: fix i2c_pxa_scream_blue_murder() debug
 output
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jT5Nr-0001rs-Ks@rmk-PC.armlinux.org.uk>
Date:   Mon, 27 Apr 2020 16:09:23 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The IRQ log output is supposed to appear on a single line.  However,
commit 3a2dc1677b60 ("i2c: pxa: Update debug function to dump more info
on error") resulted in it being printed one-entry-per-line, which is
excessively long.

Fixing this is not a trivial matter; using pr_cont() doesn't work as
the previous dev_dbg() may not have been compiled in, or may be
dynamic.

Since the rest of this function output is at error level, and is also
debug output, promote this to error level as well to avoid this
problem.

Reduce the number of always zero prefix digits to save screen real-
estate.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 4f12362b6553..ada5a325e23b 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -363,11 +363,10 @@ static void i2c_pxa_scream_blue_murder(struct pxa_i2c *i2c, const char *why)
 	dev_err(dev, "IBMR: %08x IDBR: %08x ICR: %08x ISR: %08x\n",
 		readl(_IBMR(i2c)), readl(_IDBR(i2c)), readl(_ICR(i2c)),
 		readl(_ISR(i2c)));
-	dev_dbg(dev, "log: ");
+	dev_err(dev, "log:");
 	for (i = 0; i < i2c->irqlogidx; i++)
-		pr_debug("[%08x:%08x] ", i2c->isrlog[i], i2c->icrlog[i]);
-
-	pr_debug("\n");
+		pr_cont(" [%03x:%05x]", i2c->isrlog[i], i2c->icrlog[i]);
+	pr_cont("\n");
 }
 
 #else /* ifdef DEBUG */
-- 
2.20.1

