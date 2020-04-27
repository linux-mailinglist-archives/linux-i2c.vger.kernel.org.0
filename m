Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4AB51BA768
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 17:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbgD0PJi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 11:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728032AbgD0PJi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 11:09:38 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0231C0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wA9dKzNLLF0BWFBqTEtvkviVPy66XTxu2X6hrxXvJ2Q=; b=GvVlP0XnGqDwU+nDWDt8bTrFLA
        XYOTHwGZJl2zeml+t7G7IuP+yt/PCk0ENQXOfHD83gdgMeuclhIPRtdov5SIpCwsgjY1o38lIJABw
        BzxNimMjcDuhG2TQon/C9KBFdOXiIN4N2CVufTKltFZR8tPPp+QBudpA2fZuR468oed0knv/GCnr1
        VfBrwG3ShUQqRw8b7iNTe8kaQrddt9Gpcwv6cVaErdTy3BcVjZwYnK5eS5hxijaRfG2FOCUr5yfKX
        mQlkW4ucJxEbT0knY//E69VXsn9I5pC2J6ke8oNWrx86vDbZFofL9bSuCofcSDG8dj1sqLqOav9ei
        wF0YXfig==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41872 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5O2-0003Yk-Dg; Mon, 27 Apr 2020 16:09:34 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5O1-0001s6-SD; Mon, 27 Apr 2020 16:09:33 +0100
In-Reply-To: <20200427150755.GT5827@shell.armlinux.org.uk>
References: <20200427150755.GT5827@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH REPOST 12/12] i2c: pxa: fix i2c_pxa_wait_bus_not_busy()
 boundary condition
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jT5O1-0001s6-SD@rmk-PC.armlinux.org.uk>
Date:   Mon, 27 Apr 2020 16:09:33 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix i2c_pxa_wait_bus_not_busy()'s boundary conditions, so that a
coincidental success and timeout results in the function returning
success.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 3c7f67d802a7..ade0203d35cf 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -416,19 +416,26 @@ static void i2c_pxa_abort(struct pxa_i2c *i2c)
 static int i2c_pxa_wait_bus_not_busy(struct pxa_i2c *i2c)
 {
 	int timeout = DEF_TIMEOUT;
+	u32 isr;
 
-	while (timeout-- && readl(_ISR(i2c)) & (ISR_IBB | ISR_UB)) {
-		if ((readl(_ISR(i2c)) & ISR_SAD) != 0)
+	while (1) {
+		isr = readl(_ISR(i2c));
+		if (!(isr & (ISR_IBB | ISR_UB)))
+			return 0;
+
+		if (isr & ISR_SAD)
 			timeout += 4;
 
+		if (!timeout--)
+			break;
+
 		msleep(2);
 		show_state(i2c);
 	}
 
-	if (timeout < 0)
-		show_state(i2c);
+	show_state(i2c);
 
-	return timeout < 0 ? I2C_RETRY : 0;
+	return I2C_RETRY;
 }
 
 static int i2c_pxa_wait_master(struct pxa_i2c *i2c)
-- 
2.20.1

