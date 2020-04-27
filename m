Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17E61BAD1B
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 20:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgD0Ssq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 14:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgD0Ssq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 14:48:46 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A99C0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 11:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=AGsk02fuI/VMll0aZ6G+pNKFELvmtzYIiC+3HIwi5pY=; b=UBBCf+aRhUAWiErQcNfteQmljv
        Ci8TG8rXB4L2Mk1vy94iX7/PlJijTYthyfVlCbEufPS+B7ZkZ0zpD1k0ArxCmUbE1g9yywN6h+QYR
        YwcDoWsHV1Fdu2P05Gpqq1Cyfr4fnr/Qs8vIRL8TwxZiQKzFhiYYF/7mAfjHbRsr4pMbk7cujQ3v6
        OUX4Gryn/+/OoSy3BMvuFKGh//RlxWGK6t0xfrasqA6s960Fj4OWzqSctnmDuyUtt1G4N1LfOvFh4
        YsWm5p8FQQzQnTW3jaHOyYT0HnESy3XrkdNJG5FanmCBbSf+ky8j3okrnKpRwt18tYhqJ6yhS+66O
        88/Vci5A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([2002:4e20:1eda:1:222:68ff:fe15:37dd]:34890 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT8o6-0004S3-2f; Mon, 27 Apr 2020 19:48:42 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT8o5-0002uO-H7; Mon, 27 Apr 2020 19:48:41 +0100
In-Reply-To: <20200427184658.GM25745@shell.armlinux.org.uk>
References: <20200427184658.GM25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH v2 02/12] i2c: pxa: remove unneeded includes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jT8o5-0002uO-H7@rmk-PC.armlinux.org.uk>
Date:   Mon, 27 Apr 2020 19:48:41 +0100
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
index 5703e2671fbf..220bcf1e2285 100644
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

