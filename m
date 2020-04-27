Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4EEA1BA762
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 17:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgD0PJK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 11:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727881AbgD0PJK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 11:09:10 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B26C0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pm4wlD/eSGDrG9RT+DX04PXAHwKRu9VRL3MjmFm4zW0=; b=oJ6m35RnH6IVc8WWj1g2BHz0/p
        J+qqfrmCzJ1/YVDPpTB8yDLEreOFjsKRUjZCw80EMbx+5aeqCp5zbY+Qi7t9E3frpNuldVtLz4DCG
        394EdOMnqBzIgliYbsvZ+Wk0mEs+TFfgYwadKy0qV2yB388Z8co49OS2gw0VTRrtTgPA9jGxlo+Ks
        iX7l7G9Edti767GTt6LBrGeb9jgV4NBCoxVwKwj1HVEhvGuJIoCMg+JFoVFFTicXBI8Pv/iBEVUKH
        b1Fr4+2TdyY4jpzP/FzX69gTxTFZJD0p9CCJXtdXblNhy4wBX3H2f+YRntD4hEm7QaGPdvwbHDnag
        Hdr275Pw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41848 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5NY-0003Y4-2r; Mon, 27 Apr 2020 16:09:04 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5NX-0001rJ-72; Mon, 27 Apr 2020 16:09:03 +0100
In-Reply-To: <20200427150755.GT5827@shell.armlinux.org.uk>
References: <20200427150755.GT5827@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH REPOST 06/12] i2c: pxa: add and use definitions for IBMR
 register
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jT5NX-0001rJ-72@rmk-PC.armlinux.org.uk>
Date:   Mon, 27 Apr 2020 16:09:03 +0100
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
index 62b7d4fa5cfd..6a7e8e1f7ca3 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -33,6 +33,9 @@
 #include <linux/slab.h>
 
 /* I2C register field definitions */
+#define IBMR_SDAS	(1 << 0)
+#define IBMR_SCLS	(1 << 1)
+
 #define ICR_START	(1 << 0)	   /* start bit */
 #define ICR_STOP	(1 << 1)	   /* stop bit */
 #define ICR_ACKNAK	(1 << 2)	   /* send ACK(0) or NAK(1) */
@@ -334,7 +337,7 @@ static void i2c_pxa_abort(struct pxa_i2c *i2c)
 		return;
 	}
 
-	while ((i > 0) && (readl(_IBMR(i2c)) & 0x1) == 0) {
+	while ((i > 0) && (readl(_IBMR(i2c)) & IBMR_SDAS) == 0) {
 		unsigned long icr = readl(_ICR(i2c));
 
 		icr &= ~ICR_START;
@@ -389,7 +392,8 @@ static int i2c_pxa_wait_master(struct pxa_i2c *i2c)
 		 * quick check of the i2c lines themselves to ensure they've
 		 * gone high...
 		 */
-		if ((readl(_ISR(i2c)) & (ISR_UB | ISR_IBB)) == 0 && readl(_IBMR(i2c)) == 3) {
+		if ((readl(_ISR(i2c)) & (ISR_UB | ISR_IBB)) == 0 &&
+		    readl(_IBMR(i2c)) == (IBMR_SCLS | IBMR_SDAS)) {
 			if (i2c_debug > 0)
 				dev_dbg(&i2c->adap.dev, "%s: done\n", __func__);
 			return 1;
@@ -584,7 +588,7 @@ static void i2c_pxa_slave_start(struct pxa_i2c *i2c, u32 isr)
 	timeout = 0x10000;
 
 	while (1) {
-		if ((readl(_IBMR(i2c)) & 2) == 2)
+		if ((readl(_IBMR(i2c)) & IBMR_SCLS) == IBMR_SCLS)
 			break;
 
 		timeout--;
@@ -679,7 +683,7 @@ static void i2c_pxa_slave_start(struct pxa_i2c *i2c, u32 isr)
 	timeout = 0x10000;
 
 	while (1) {
-		if ((readl(_IBMR(i2c)) & 2) == 2)
+		if ((readl(_IBMR(i2c)) & IBMR_SCLS) == IBMR_SCLS)
 			break;
 
 		timeout--;
-- 
2.20.1

