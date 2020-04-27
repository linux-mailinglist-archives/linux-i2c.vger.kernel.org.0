Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB5E1BA75E
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 17:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbgD0PIr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 11:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727010AbgD0PIr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 11:08:47 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE85C0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 08:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0Cm8RUYxPLj/gnVRSqN2fd1SBtWXtM43ZbKbyFvVj3E=; b=NJSnMkyqUTVSEteFTzTcFYcJCu
        wV31O9hSk2H3kRNbSZwC+UHN6a/VCS1hl4Lj02dnlTebq9ZJC77ZDErN/70dt8UJStBSV7sUSD0Nf
        6amtAxHER1iDgbzRpupCo0l4cUC5Y7ykJCyvv6jNkqdypn+AqGccvlWqPxXMAmsAP5VJgSrcysZI2
        i1fU2689u9ac4aI/d1SPBqK5kH2CE3hGYlpAVIj2LfY+R+okjVbOUXfVr5t/TtvSV9y4ND4t2YyLj
        h20fIvQDMylBlzRHKeFbSvmTj0oPU2k8rhsTOAsv/djCNfJNsfo15Xinlv9IkDVqY8ELRWazXuKzk
        A70yQW6w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57170 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5ND-0003Xa-95; Mon, 27 Apr 2020 16:08:43 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT5NC-0001qr-Nm; Mon, 27 Apr 2020 16:08:42 +0100
In-Reply-To: <20200427150755.GT5827@shell.armlinux.org.uk>
References: <20200427150755.GT5827@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH REPOST 02/12] i2c: pxa: remove unneeded includes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jT5NC-0001qr-Nm@rmk-PC.armlinux.org.uk>
Date:   Mon, 27 Apr 2020 16:08:42 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c-pxa does not need linux/sched.h nor linux/time.h includes, so
remove these.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 2765dc530c36..dc04f064eb81 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -20,8 +20,6 @@
 #include <linux/module.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
-#include <linux/time.h>
-#include <linux/sched.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
@@ -34,8 +32,6 @@
 #include <linux/io.h>
 #include <linux/platform_data/i2c-pxa.h>
 
-#include <asm/irq.h>
-
 struct pxa_reg_layout {
 	u32 ibmr;
 	u32 idbr;
-- 
2.20.1

