Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA5CB1BAD2B
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 20:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgD0Stc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 14:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbgD0Stb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 14:49:31 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6B8FC0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 11:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ONyNGM+w+DYsozLmJwYOPvC1MqHr1M04PKrw/UKvziE=; b=NeKKYHHyw40D6wDxIGWcYg7yt+
        CyvQMlThtTZQ+rkLnHbrfDwmGDDnt+2jSQbgB4rA4qnwBOIn3aw2i9UPsdsoRMRMbHKIBqxBgkmPs
        7lM0tdqeIErj3D/olFT08h7vwib59jT5m5Wd96w/g5Zk029CX0uvdcZ7I2D7FTi9ElDH1utjbvWqy
        pnDkE2nk957ds+68CLtB3B4TDR3/UQyZdsYUTSF2xnvpwukUO/ywecccAST57/E3fW1bosPA4mKmv
        Zhz+Sl0ThAJgshN2tb7r5oPKru4iLgK6mPQugmUmq6pXaUYOw48+1s/v4c72D54qUOjjr/ZdpV2yV
        5ZDUzLkw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:43070 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT8oq-0004T7-13; Mon, 27 Apr 2020 19:49:28 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT8op-0002vi-Fy; Mon, 27 Apr 2020 19:49:27 +0100
In-Reply-To: <20200427184658.GM25745@shell.armlinux.org.uk>
References: <20200427184658.GM25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH v2 11/12] i2c: pxa: clean up decode_bits()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jT8op-0002vi-Fy@rmk-PC.armlinux.org.uk>
Date:   Mon, 27 Apr 2020 19:49:27 +0100
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
index 90b0599e3f77..f0205c47286c 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -286,13 +286,14 @@ struct bits {
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
@@ -312,7 +313,6 @@ static const struct bits isr_bits[] = {
 static void decode_ISR(unsigned int val)
 {
 	decode_bits(KERN_DEBUG "ISR", isr_bits, ARRAY_SIZE(isr_bits), val);
-	printk("\n");
 }
 
 static const struct bits icr_bits[] = {
@@ -337,7 +337,6 @@ static const struct bits icr_bits[] = {
 static void decode_ICR(unsigned int val)
 {
 	decode_bits(KERN_DEBUG "ICR", icr_bits, ARRAY_SIZE(icr_bits), val);
-	printk("\n");
 }
 #endif
 
-- 
2.20.1

