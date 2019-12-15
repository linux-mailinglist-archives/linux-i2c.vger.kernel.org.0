Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECAF11F8C3
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Dec 2019 17:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfLOQGM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Dec 2019 11:06:12 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:53076 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfLOQGM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Dec 2019 11:06:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4ms2mFpm+kRimbMc1mOLsiPWR9haRVUofHiPEp1wsOU=; b=NBZKOk9fDLknR6HxfxkleKfoU7
        EB3p3y8vkdkBm37W6Iji1dR4pY3Qu7ZTbw/KuT4PtSBPIalxXWClnIRBaFmz3o9u3hrgsMH1q5UO9
        nZB8RxYkPe4QTRquV9z0z4Gkk8ZRhFKhLwrLdm7fqmcpv2jz9n31xgmY19GOPSeSiiAcokFpaGB8f
        5bE08waDQiK+wLUk8l58RC9x+ZqDQsA0I35Uc8eYQQUXu7JMB6opHKYAjeC8Z4RLlMlcbWBnUCQ7a
        v+NZBXl+9NdRHhOe4Eg0T7GFw8IL8ig71N2vJrchpiUPoAhh3ndzI5b5wW6qdxSqhTwGaROM2FgUy
        5Ub8vq8Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:55890 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWPJ-0001hJ-Ol; Sun, 15 Dec 2019 16:06:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWPJ-0005F0-7r; Sun, 15 Dec 2019 16:06:09 +0000
In-Reply-To: <20191215160444.GB25745@shell.armlinux.org.uk>
References: <20191215160444.GB25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH 11/12] i2c: pxa: clean up decode_bits()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1igWPJ-0005F0-7r@rmk-PC.armlinux.org.uk>
Date:   Sun, 15 Dec 2019 16:06:09 +0000
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Clean up decode_bits() to use pr_cont(), and move the newline into the
function rather than at its two callsites. Avoid printing an
unnecessary space before the newline.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index f3a11050053c..b2c7765756e2 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -287,13 +287,14 @@ struct bits {
 static inline void
 decode_bits(const char *prefix, const struct bits *bits, int num, u32 val)
 {
-	printk("%s %08x: ", prefix, val);
+	printk("%s %08x:", prefix, val);
 	while (num--) {
 		const char *str = val & bits->mask ? bits->set : bits->unset;
 		if (str)
-			printk("%s ", str);
+			pr_cont(" %s", str);
 		bits++;
 	}
+	pr_cont("\n");
 }
 
 static const struct bits isr_bits[] = {
@@ -313,7 +314,6 @@ static const struct bits isr_bits[] = {
 static void decode_ISR(unsigned int val)
 {
 	decode_bits(KERN_DEBUG "ISR", isr_bits, ARRAY_SIZE(isr_bits), val);
-	printk("\n");
 }
 
 static const struct bits icr_bits[] = {
@@ -338,7 +338,6 @@ static const struct bits icr_bits[] = {
 static void decode_ICR(unsigned int val)
 {
 	decode_bits(KERN_DEBUG "ICR", icr_bits, ARRAY_SIZE(icr_bits), val);
-	printk("\n");
 }
 #endif
 
-- 
2.20.1

