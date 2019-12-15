Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C92A11F8BE
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Dec 2019 17:10:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbfLOQFr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Dec 2019 11:05:47 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:53054 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfLOQFr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Dec 2019 11:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wi+UteQ5xF86S5WpcXkEgX9GCuWYbCP0yaq2PSO2B+0=; b=GDZA4iWa9WxrIxTJI78GryR9/y
        ouuIusoNpPl8ZNyft672Sh0RWcfw3LvMRgfOi7msieAmdIdHXcxg9TLdp291HN6Z3UeR1SVkEe9Eo
        6+/91rjeFkEKM5NfWEKRyrTGouF1Q413KSOi/FhrqgznjE4NXH7A6pTtuIpsXxcPIJwx0OeHSpn57
        DmV2dg6UyifL0aM+GtUQGv/p+MTIojinO86FuyRKqQyJMB+KzTSPSMdbdf+yTWl9x1POFaGrpjFix
        GvoxTzpsrapdKuW5vNXsBUxNrl561yeSJ/hsxKZCOy0Rd3hUWuEV9Q4YziIkmJB8PxdqtPrIqWPgM
        g0JvcDFg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:43692 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWOu-0001gd-4C; Sun, 15 Dec 2019 16:05:44 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWOt-0005EP-JL; Sun, 15 Dec 2019 16:05:43 +0000
In-Reply-To: <20191215160444.GB25745@shell.armlinux.org.uk>
References: <20191215160444.GB25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH 06/12] i2c: pxa: add and use definitions for IBMR register
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1igWOt-0005EP-JL@rmk-PC.armlinux.org.uk>
Date:   Sun, 15 Dec 2019 16:05:43 +0000
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add definitions for the bits in the IBMR register, and use them in the
code. This improves readability.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index ea96dfa6b9d5..b3286d7ab75d 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -34,6 +34,9 @@
 #include <linux/slab.h>
 
 /* I2C register field definitions */
+#define IBMR_SDAS	(1 << 0)
+#define IBMR_SCLS	(1 << 1)
+
 #define ICR_START	(1 << 0)	   /* start bit */
 #define ICR_STOP	(1 << 1)	   /* stop bit */
 #define ICR_ACKNAK	(1 << 2)	   /* send ACK(0) or NAK(1) */
@@ -335,7 +338,7 @@ static void i2c_pxa_abort(struct pxa_i2c *i2c)
 		return;
 	}
 
-	while ((i > 0) && (readl(_IBMR(i2c)) & 0x1) == 0) {
+	while ((i > 0) && (readl(_IBMR(i2c)) & IBMR_SDAS) == 0) {
 		unsigned long icr = readl(_ICR(i2c));
 
 		icr &= ~ICR_START;
@@ -390,7 +393,8 @@ static int i2c_pxa_wait_master(struct pxa_i2c *i2c)
 		 * quick check of the i2c lines themselves to ensure they've
 		 * gone high...
 		 */
-		if ((readl(_ISR(i2c)) & (ISR_UB | ISR_IBB)) == 0 && readl(_IBMR(i2c)) == 3) {
+		if ((readl(_ISR(i2c)) & (ISR_UB | ISR_IBB)) == 0 &&
+		    readl(_IBMR(i2c)) == (IBMR_SCLS | IBMR_SDAS)) {
 			if (i2c_debug > 0)
 				dev_dbg(&i2c->adap.dev, "%s: done\n", __func__);
 			return 1;
@@ -575,7 +579,7 @@ static void i2c_pxa_slave_start(struct pxa_i2c *i2c, u32 isr)
 	timeout = 0x10000;
 
 	while (1) {
-		if ((readl(_IBMR(i2c)) & 2) == 2)
+		if ((readl(_IBMR(i2c)) & IBMR_SCLS) == IBMR_SCLS)
 			break;
 
 		timeout--;
@@ -638,7 +642,7 @@ static void i2c_pxa_slave_start(struct pxa_i2c *i2c, u32 isr)
 	timeout = 0x10000;
 
 	while (1) {
-		if ((readl(_IBMR(i2c)) & 2) == 2)
+		if ((readl(_IBMR(i2c)) & IBMR_SCLS) == IBMR_SCLS)
 			break;
 
 		timeout--;
-- 
2.20.1

