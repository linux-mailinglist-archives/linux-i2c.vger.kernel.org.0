Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F231C6D0C
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 11:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729077AbgEFJgn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 05:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728640AbgEFJgn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 May 2020 05:36:43 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8881C061A0F
        for <linux-i2c@vger.kernel.org>; Wed,  6 May 2020 02:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=mIpCjO7kwut7VKnDHl/DuwvVoDFt+6NF2PEk8nuiJ8Y=; b=0BcQcfejRtq0R8VDNSewIEEfcn
        bESFnXwoW5Eo9WIz6b0/qBZrCgu4mWyS0OPBSE/tzy9lbIOKlYaplZ/wDu+o9AxpzWeR2E9j81QQd
        qFEtKVzS5/vmf36SzxWOxezUgUDFCYAwwG5hiAgIa9KZrkmVUCsWeJAn2Oo9CpVB4yd+EyMhZCmDh
        x9GdseTsI9CtkcGW/3F+vG58IMiGmcgPN7OU8Q0EPpUYVYy1obYEHox0jolem2N0tgbVN1k4cUtel
        stCUJEbjDKKVOvmvrLPy4q1j6yXpUr/UcGS5UnXH3ig1TmgRxXUSQwMx703Qd7lOKHz30t3T94r1J
        yMDw6YbA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:48954 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jWGTn-0007nd-76; Wed, 06 May 2020 10:36:39 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jWGTm-0000VI-N1; Wed, 06 May 2020 10:36:38 +0100
In-Reply-To: <20200506093615.GO1551@shell.armlinux.org.uk>
References: <20200506093615.GO1551@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH 1/2] i2c: pxa: clear all master action bits in
 i2c_pxa_stop_message()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jWGTm-0000VI-N1@rmk-PC.armlinux.org.uk>
Date:   Wed, 06 May 2020 10:36:38 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If we timeout during a message transfer, the control register may
contain bits that cause an action to be set. Read-modify-writing the
register leaving these bits set may trigger the hardware to attempt
one of these actions unintentionally.

Always clear these bits when cleaning up after a message or after
a timeout.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index db739cce93ac..a72d07bdb793 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -795,11 +795,9 @@ static inline void i2c_pxa_stop_message(struct pxa_i2c *i2c)
 {
 	u32 icr;
 
-	/*
-	 * Clear the STOP and ACK flags
-	 */
+	/* Clear the START, STOP, ACK, TB and MA flags */
 	icr = readl(_ICR(i2c));
-	icr &= ~(ICR_STOP | ICR_ACKNAK);
+	icr &= ~(ICR_START | ICR_STOP | ICR_ACKNAK | ICR_TB | ICR_MA);
 	writel(icr, _ICR(i2c));
 }
 
-- 
2.20.1

