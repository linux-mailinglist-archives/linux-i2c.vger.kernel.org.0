Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 456EF782C1
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2019 02:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbfG2AP3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 28 Jul 2019 20:15:29 -0400
Received: from gateway34.websitewelcome.com ([192.185.149.62]:40132 "EHLO
        gateway34.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726238AbfG2AP3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 28 Jul 2019 20:15:29 -0400
X-Greylist: delayed 1427 seconds by postgrey-1.27 at vger.kernel.org; Sun, 28 Jul 2019 20:15:28 EDT
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway34.websitewelcome.com (Postfix) with ESMTP id 3B470FE3C0
        for <linux-i2c@vger.kernel.org>; Sun, 28 Jul 2019 18:51:41 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id rsx3hkMNo2qH7rsx3hmtAI; Sun, 28 Jul 2019 18:51:41 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nqhItU/yVLc8ci7xr995svAr83BiyHeRNAak3CCkDaQ=; b=tA1lzwPRRIq/zQqLhnBGjmnwf2
        kX3TNopWA2sq8OYd9i3WfvHpsZvj05B4dL2UpBW+RKBahP4Rflh3ES1PVue9zXWLpjqqvQ8WZ+JTi
        s5B09R+JS2rrz4yqX/df503Lm/xGSaXhaaANynDagVrHQ6HzlNv/AWe0KbX4wgiYVtmTCPpUJGZXO
        McPrY96pCJoI0uqqQFQsDkRK0bi0OsTSLdla6oBvC2ivAJyZuwj/uo+Jy8T65Q8WraaEkQNGGhilS
        1UzNMitF1IC0A9ROofnNUzAsHCq/cbL9e1k7tmPb8gvCcq+vtZdXbQ+AEUE/jKMlUDPjm1sKVl+Yf
        82f3gFxg==;
Received: from [187.192.11.120] (port=39574 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hrsx1-003jvw-Tn; Sun, 28 Jul 2019 18:51:40 -0500
Date:   Sun, 28 Jul 2019 18:51:38 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] i2c: s3c2410: Mark expected switch fall-through
Message-ID: <20190728235138.GA23429@embeddedor>
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
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hrsx1-003jvw-Tn
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:39574
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 45
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Mark switch cases where we are expecting to fall through.

This patch fixes the following warning:

drivers/i2c/busses/i2c-s3c2410.c: In function 'i2c_s3c_irq_nextbyte':
drivers/i2c/busses/i2c-s3c2410.c:431:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
   if (i2c->state == STATE_READ)
      ^
drivers/i2c/busses/i2c-s3c2410.c:439:2: note: here
  case STATE_WRITE:
  ^~~~

Notice that, in this particular case, the code comment is
modified in accordance with what GCC is expecting to find.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index d97fb857b0ea..c98ef4c4a0c9 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -435,6 +435,7 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 		 * fall through to the write state, as we will need to
 		 * send a byte as well
 		 */
+		/* Fall through */
 
 	case STATE_WRITE:
 		/*
-- 
2.22.0

