Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03DED159800
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Feb 2020 19:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgBKSS1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Feb 2020 13:18:27 -0500
Received: from gateway20.websitewelcome.com ([192.185.55.25]:23538 "EHLO
        gateway20.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727511AbgBKSS1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Feb 2020 13:18:27 -0500
X-Greylist: delayed 1500 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Feb 2020 13:18:27 EST
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway20.websitewelcome.com (Postfix) with ESMTP id C6BA84012ECE3;
        Tue, 11 Feb 2020 10:17:58 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 1ZNkjQrto8vkB1ZNkjP415; Tue, 11 Feb 2020 11:31:32 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YMSqBvn3OFsv1lNznyX5EeTk3+DH+Esm65JtcIOwnMY=; b=NHUHDOfcZNONgQ1WuY5dZ7AOCh
        4mQkzvYwO/yKv3y/vPOypI8iKziwgDe3py2fiDT5L185TEMkA+8G2a0StgViX9Qwj3lRGN7rCloCo
        a1G2hFqJxJbQveFpv4Jk8e/ogd6GBHWzcs5hw2JCiODZVyQGXIkV14HxbAgx+Dg/7PYG3LaEMXe9p
        LGFr7/Ffzi1u21i8Du71DskqkRx31jb3D2gJQXPYxxXicXPJyaR9CTeYol4YzRpvPHUUhhbv3bAoT
        r3q2yGh/8m6EknhOaFtx/7ZRs7LGXkZqROqzdD+BXtMCqmMQDZdk08lh+FDfr5Y5CKwizz/mZG+TJ
        Xs72lOIA==;
Received: from [200.68.141.48] (port=6149 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j1Wm9-002prQ-E0; Tue, 11 Feb 2020 08:44:33 -0600
Date:   Tue, 11 Feb 2020 08:47:04 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Thor Thayer <thor.thayer@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        David Laight <David.Laight@ACULAB.COM>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH v2] i2c: altera: Fix potential integer overflow
Message-ID: <20200211144704.GA6461@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.141.48
X-Source-L: No
X-Exim-ID: 1j1Wm9-002prQ-E0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.141.48]:6149
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out 100 from the equation and do 32-bit arithmetic (3 * clk_mhz / 10)
instead of 64-bit.

Notice that clk_mhz is MHz, so the multiplication will never wrap 32 bits
and there is no need for div_u64().

Addresses-Coverity: 1458369 ("Unintentional integer overflow")
Fixes: 0560ad576268 ("i2c: altera: Add Altera I2C Controller driver")
Suggested-by: David Laight <David.Laight@ACULAB.COM>
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
Changes in v2:
 - Update subject and changelog text.
 - Avoid the need for 64-bit arithmetic at all.

 drivers/i2c/busses/i2c-altera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
index 5255d3755411..1de23b4f3809 100644
--- a/drivers/i2c/busses/i2c-altera.c
+++ b/drivers/i2c/busses/i2c-altera.c
@@ -171,7 +171,7 @@ static void altr_i2c_init(struct altr_i2c_dev *idev)
 	/* SCL Low Time */
 	writel(t_low, idev->base + ALTR_I2C_SCL_LOW);
 	/* SDA Hold Time, 300ns */
-	writel(div_u64(300 * clk_mhz, 1000), idev->base + ALTR_I2C_SDA_HOLD);
+	writel(3 * clk_mhz / 10, idev->base + ALTR_I2C_SDA_HOLD);
 
 	/* Mask all master interrupt bits */
 	altr_i2c_int_enable(idev, ALTR_I2C_ALL_IRQ, false);
-- 
2.25.0

