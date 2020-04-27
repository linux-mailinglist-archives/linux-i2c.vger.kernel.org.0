Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D14DC1BA767
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 17:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgD0PJd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 11:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727881AbgD0PJd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 11:09:33 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE5ABC0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 08:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6x65NTHCRgeRHErzrrUZ7vuww9QHKp3uCW9B9Wv2geo=; b=fwBl0mAORIVZd4v/0WY4iPE+qW
        ++FgWjRdhfkvF4sTCVMqOc6v1q4FvgSbZc/7WNaXrLkm41kR2yLC9PsOH3bAoQMdaqkoFB2ujIjlK
        WTFy8njEQUY+KVN00FlzmwYAuh+Wa0Mnl2vocNCyB7//dlq71DaZ/koN+AMRorR9DuESZYDqTl0LV
        NHR4PkBpV6ewTjuaKsxluwu2uLtvLsKsqiCxbje4vLt/tY1LpNiDdZ5DLJzWdrDNdzNiTITVEwkLL
        ImbqPW+HbTiK0SeBWMmib3PNuSFdrNZXXfuOvRcA53FPgdeyFIprgyAdAQG71bD3WGBzPi3aZmbOz
        ONmoSrMg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:51810 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5Nx-0003Ye-Ae; Mon, 27 Apr 2020 16:09:29 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5Nw-0001rz-OC; Mon, 27 Apr 2020 16:09:28 +0100
In-Reply-To: <20200427150755.GT5827@shell.armlinux.org.uk>
References: <20200427150755.GT5827@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH REPOST 11/12] i2c: pxa: clean up decode_bits()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jT5Nw-0001rz-OC@rmk-PC.armlinux.org.uk>
Date:   Mon, 27 Apr 2020 16:09:28 +0100
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
index ada5a325e23b..3c7f67d802a7 100644
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

