Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99C691BA75D
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 17:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbgD0PIm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 11:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728084AbgD0PIl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 11:08:41 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88D2C0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 08:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=njrCd9sj96cS7HKAozjkV53GYTbZj3E2WPo/tzME7Ug=; b=nalZXkwJgeNZNlTxf4WlJzkeTh
        r1aiJmNTIEa0Mr1Vo+DKjVPVuEd6s57Naf1iP5Uzg2ierC4yBhUaYTexrfj+4vg1SZxFZ93lc5AK+
        DCSR9bKrAoe/kKQq7e/Ec5VYDlqNZPr14T/NZ5z+G8RuAO09KI5qjlCzs0S0IXFTMafNqjTF69Yy+
        wmXvsWYXqbG7KSWA6K7Q9b6Z8SNhZx45oXgbZp5VoAkOE0bsBqZzxcwbJWpKzKL58gLYXgWi8pYhw
        SaQiq3rBSCmZMUxsXVMV2hzBfqmRY0IdkgNdaBSeeZWXvjktcNvXskOeTZbQzFsZhzgY83H8YC9MS
        wQnm7BbA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41836 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5N8-0003XU-73; Mon, 27 Apr 2020 16:08:38 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5N7-0001qk-HL; Mon, 27 Apr 2020 16:08:37 +0100
In-Reply-To: <20200427150755.GT5827@shell.armlinux.org.uk>
References: <20200427150755.GT5827@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH REPOST 01/12] i2c: pxa: use official address byte helper
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jT5N7-0001qk-HL@rmk-PC.armlinux.org.uk>
Date:   Mon, 27 Apr 2020 16:08:37 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c-pxa was created before i2c_8bit_addr_from_msg() was implemented,
and used its own i2c_pxa_addr_byte() which is functionally the same.
Sadly, it was never updated to use this new helper. Switch it over.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 466e4f681d7a..2765dc530c36 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -716,16 +716,6 @@ static void i2c_pxa_slave_stop(struct pxa_i2c *i2c)
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
@@ -733,8 +723,8 @@ static inline void i2c_pxa_start_message(struct pxa_i2c *i2c)
 	/*
 	 * Step 1: target slave address into IDBR
 	 */
-	writel(i2c_pxa_addr_byte(i2c->msg), _IDBR(i2c));
-	i2c->req_slave_addr = i2c_pxa_addr_byte(i2c->msg);
+	i2c->req_slave_addr = i2c_8bit_addr_from_msg(i2c->msg);
+	writel(i2c->req_slave_addr, _IDBR(i2c));
 
 	/*
 	 * Step 2: initiate the write.
@@ -963,6 +953,7 @@ static void i2c_pxa_master_complete(struct pxa_i2c *i2c, int ret)
 static void i2c_pxa_irq_txempty(struct pxa_i2c *i2c, u32 isr)
 {
 	u32 icr = readl(_ICR(i2c)) & ~(ICR_START|ICR_STOP|ICR_ACKNAK|ICR_TB);
+	u8 addr;
 
  again:
 	/*
@@ -1047,8 +1038,8 @@ static void i2c_pxa_irq_txempty(struct pxa_i2c *i2c, u32 isr)
 		/*
 		 * Write the next address.
 		 */
-		writel(i2c_pxa_addr_byte(i2c->msg), _IDBR(i2c));
-		i2c->req_slave_addr = i2c_pxa_addr_byte(i2c->msg);
+		i2c->req_slave_addr = i2c_8bit_addr_from_msg(i2c->msg);
+		writel(i2c->req_slave_addr, _IDBR(i2c));
 
 		/*
 		 * And trigger a repeated start, and send the byte.
-- 
2.20.1

