Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7938F1C6D0F
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 11:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729092AbgEFJgs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 05:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729079AbgEFJgs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 05:36:48 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B4CC061A0F
        for <linux-i2c@vger.kernel.org>; Wed,  6 May 2020 02:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HtNgqevPg3gn1g5/oHHtrSer3QztyifZhJd1XP90828=; b=1s7VcHookKYjrTxuyMhZdFV0/u
        r7E9yhvCORSYCReu7A3QL7VeBJ1deHVkwZ3vsS7Cer1AOInPHgNASlwxc6uaeI1BfxfjCFJboBdPF
        1E9zLngQeKDvhTzLgKN34YYvveZXv+1NdELVHMInqeQJXvUG3RfPxhq/SzZeMjDSV69QwxhPyoN38
        rNgE3O1/ixn66EBkWl0L1pPhdsbYGYZIJ1etwP9/KrU7cG7LpwR7/Y7A7McxC2xrsddwF2y+8uvS8
        zHrqJkcpoFUoOyBUFvh8hpkSqGfT6KpB0uFVnm7IllFDJsmEYBh1FmzJBair8+e4qMkZAXAsbpEdf
        w1lby3eA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:33166 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jWGTs-0007nj-BH; Wed, 06 May 2020 10:36:44 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jWGTr-0000VU-QI; Wed, 06 May 2020 10:36:43 +0100
In-Reply-To: <20200506093615.GO1551@shell.armlinux.org.uk>
References: <20200506093615.GO1551@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH 2/2] i2c: pxa: use master-abort for device probes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jWGTr-0000VU-QI@rmk-PC.armlinux.org.uk>
Date:   Wed, 06 May 2020 10:36:43 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use master-abort to send the stop condition after an address cycle
rather than resetting the controller.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index a72d07bdb793..0e194d6cd1b5 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -940,14 +940,8 @@ static void i2c_pxa_irq_txempty(struct pxa_i2c *i2c, u32 isr)
 		icr &= ~ICR_ALDIE;
 		icr |= ICR_START | ICR_TB;
 	} else {
-		if (i2c->msg->len == 0) {
-			/*
-			 * Device probes have a message length of zero
-			 * and need the bus to be reset before it can
-			 * be used again.
-			 */
-			i2c_pxa_reset(i2c);
-		}
+		if (i2c->msg->len == 0)
+			icr |= ICR_MA;
 		i2c_pxa_master_complete(i2c, 0);
 	}
 
-- 
2.20.1

