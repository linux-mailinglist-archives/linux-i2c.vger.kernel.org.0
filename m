Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3E4211F8B9
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Dec 2019 17:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbfLOQFW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Dec 2019 11:05:22 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:53028 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfLOQFV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Dec 2019 11:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=8eaMcs4ue8vY8wWs5KG6kdHm2ZHGIhd/jNQk9PKkNEw=; b=BYKFwk4gqHyV4V945OE6ha0FYH
        5LSPcEhIIVIHTMq0unihk4D44u7z85NA07rS31uKDTIPa8UsTqGOTFYDaXqJwaYf9QKpTBPb8HcRF
        H16dBkvyrdJhH7r6VexwHwVJQvfNZuxm1LzGY42cfLM+aQHobCe39SYr+r6hlyDQSd/DuZdwaBwV4
        n2EAKMVY5ziKYbLZN+doLiYsL6HqGjEh3HP3leIXmcEM8+aM1lmsyiMxVSdQrLyLv8Of4g+E5HF5Z
        C8XhYiEkQIcGshY+QUnkVwKFK/OBBNBZ5G82pBJ1mg0uI5QP28rUG1P02l+zqNQGdbYdZ2MDZYBpQ
        f89V/1jQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:55870 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWOU-0001g6-Jb; Sun, 15 Dec 2019 16:05:18 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWOT-0005Dp-Sb; Sun, 15 Dec 2019 16:05:17 +0000
In-Reply-To: <20191215160444.GB25745@shell.armlinux.org.uk>
References: <20191215160444.GB25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH 01/12] i2c: pxa: use official address byte helper
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1igWOT-0005Dp-Sb@rmk-PC.armlinux.org.uk>
Date:   Sun, 15 Dec 2019 16:05:17 +0000
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c-pxa was created before i2c_8bit_addr_from_msg() was implemented,
and used its own i2c_pxa_addr_byte() which is functionally the same.
Sadly, it was never updated to use this new helper. Switch it over.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 2c3c3d6935c0..966000923e8e 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -675,25 +675,18 @@ static void i2c_pxa_slave_stop(struct pxa_i2c *i2c)
  * PXA I2C Master mode
  */
 
-static inline unsigned int i2c_pxa_addr_byte(struct i2c_msg *msg)
-{
-	unsigned int addr = (msg->addr & 0x7f) << 1;
-
-	if (msg->flags & I2C_M_RD)
-		addr |= 1;
-
-	return addr;
-}
-
 static inline void i2c_pxa_start_message(struct pxa_i2c *i2c)
 {
 	u32 icr;
+	u8 addr;
+
+	addr = i2c_8bit_addr_from_msg(i2c->msg);
 
 	/*
 	 * Step 1: target slave address into IDBR
 	 */
-	writel(i2c_pxa_addr_byte(i2c->msg), _IDBR(i2c));
-	i2c->req_slave_addr = i2c_pxa_addr_byte(i2c->msg);
+	writel(addr, _IDBR(i2c));
+	i2c->req_slave_addr = addr;
 
 	/*
 	 * Step 2: initiate the write.
@@ -1006,8 +999,8 @@ static void i2c_pxa_irq_txempty(struct pxa_i2c *i2c, u32 isr)
 		/*
 		 * Write the next address.
 		 */
-		writel(i2c_pxa_addr_byte(i2c->msg), _IDBR(i2c));
-		i2c->req_slave_addr = i2c_pxa_addr_byte(i2c->msg);
+		writel(i2c_8bit_addr_from_msg(i2c->msg), _IDBR(i2c));
+		i2c->req_slave_addr = i2c_8bit_addr_from_msg(i2c->msg);
 
 		/*
 		 * And trigger a repeated start, and send the byte.
-- 
2.20.1

