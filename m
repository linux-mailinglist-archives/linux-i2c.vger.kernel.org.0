Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C969311F8BB
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Dec 2019 17:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbfLOQFb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Dec 2019 11:05:31 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:53038 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfLOQFb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Dec 2019 11:05:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=W14AsM1hSe/0STHHJZsnC2rF+JqEgKK+TbOIv/rUEu0=; b=hAo+1sZZMrr4lCdwvURd7ETcO0
        kvDH5R2c9mnUOzXEkRcM9zehfaXss78xbcPuKeN3se4Z49+J+45uqSp8ZeCfXf67xi2GS72d8Ss4C
        gTfSRIFt394pQjAMUCRetGufeX3orr+eI0SKemnBePge+y2i1xZKOn7ZwxZcqoAnlnpF6AnRur0pb
        hMCCHrPAHjbefMYeAEVDStXYTAamsoXeBgcPNIdu7D2nT3+yLd0HSv1HwNb6CFvHw0aakveDxJRqu
        vxtntWusQCqArVRZG8wJtJuA4F0xwd7g73gKQPe4xsxDDwsfRYEq9Sh1mXcszjJdXMd6IMeUojGO0
        enngCIKg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60116 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWOe-0001gJ-Lu; Sun, 15 Dec 2019 16:05:28 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1igWOe-0005E3-5A; Sun, 15 Dec 2019 16:05:28 +0000
In-Reply-To: <20191215160444.GB25745@shell.armlinux.org.uk>
References: <20191215160444.GB25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH 03/12] i2c: pxa: re-arrange includes to be in alphabetical
 order
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1igWOe-0005E3-5A@rmk-PC.armlinux.org.uk>
Date:   Sun, 15 Dec 2019 16:05:28 +0000
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Arrange the includes to be in alphabetical order to help avoid
duplicated includes.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index eddb749c9eae..ee83d2e46de0 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -16,22 +16,22 @@
  *    Dec 2004: Added support for PXA27x and slave device probing [Liam Girdwood]
  *    Feb 2005: Rework slave mode handling [RMK]
  */
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/i2c.h>
-#include <linux/init.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/errno.h>
-#include <linux/interrupt.h>
+#include <linux/i2c.h>
 #include <linux/i2c-pxa.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
-#include <linux/err.h>
-#include <linux/clk.h>
-#include <linux/slab.h>
-#include <linux/io.h>
 #include <linux/platform_data/i2c-pxa.h>
+#include <linux/slab.h>
 
 struct pxa_reg_layout {
 	u32 ibmr;
-- 
2.20.1

