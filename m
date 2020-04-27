Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF581BAD1C
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 20:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbgD0Ssv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 14:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726226AbgD0Ssv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 14:48:51 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18A1C0610D5
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 11:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
        Content-Transfer-Encoding:MIME-Version:Subject:To:From:References:In-Reply-To
        :Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=U4TFqPJok6dGFdpxZXeUh+xHpbdR+C3tTkLPNkKF/s0=; b=Tu/PJhP4MOGWZYKJ7Xd5cP/5lm
        1f+uEh+a0bLzYixQQOYOQNpAgp+aSl0nfyBETGBjipOS0bCiDutrKOX+iLXqef3yil/sVgwGDMUej
        PJFcIq03T+Dyfdtx2EcNjdhjjvi/U8XhuiNZzbz9Leq321q/nrYuFQwurWh88VdBGUAmALEwntQSo
        uwgksgNWd9XGeaWCk34PC97lLYvDFqDt/i754v6/98oc8q3VabrYXnf8PzHLIBAgZnBx0PEinvPYf
        a+Ob0m7MSn5EPqjLLjKxUtoa4eGBdQyXEEKOIyAVnHujkoHY5FHwiLGiyMjqj9UTA9hF6OBuXR8Ns
        EbOHT10g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43028 helo=rmk-PC.armlinux.org.uk)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT8oB-0004S9-5l; Mon, 27 Apr 2020 19:48:47 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <rmk@armlinux.org.uk>)
        id 1jT8oA-0002uV-KN; Mon, 27 Apr 2020 19:48:46 +0100
In-Reply-To: <20200427184658.GM25745@shell.armlinux.org.uk>
References: <20200427184658.GM25745@shell.armlinux.org.uk>
From:   Russell King <rmk+kernel@armlinux.org.uk>
To:     linux-i2c@vger.kernel.org
Subject: [PATCH v2 03/12] i2c: pxa: re-arrange includes to be in alphabetical
 order
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1jT8oA-0002uV-KN@rmk-PC.armlinux.org.uk>
Date:   Mon, 27 Apr 2020 19:48:46 +0100
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Arrange the includes to be in alphabetical order to help avoid
duplicated includes.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/i2c/busses/i2c-pxa.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 220bcf1e2285..48a49d7d544b 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -16,21 +16,21 @@
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
+#include <linux/i2c.h>
+#include <linux/init.h>
 #include <linux/interrupt.h>
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

