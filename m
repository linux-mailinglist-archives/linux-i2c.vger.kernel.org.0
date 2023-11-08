Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFE0D7E5BA2
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 17:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbjKHQoK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 11:44:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231924AbjKHQoJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 11:44:09 -0500
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7676D1FE9
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 08:44:06 -0800 (PST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231108164405euoutp0103c4d44b929252f7a2d1481a20693fab~Vs4tQmpSh1675416754euoutp01F
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 16:44:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231108164405euoutp0103c4d44b929252f7a2d1481a20693fab~Vs4tQmpSh1675416754euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1699461845;
        bh=/Poy4ZiSU6m7dMMQv9E5e9L8uydGQeX714UmDAIeZxY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gJjtKDOUgg029EK+v1fTvVSCK3tVesV5hZZsz3X8szu24he/UqnbdYOHDPLXC4WIa
         oUYtHM+NNKUqwSKcbXuvWHFiGoDYmQTde5yZ4VCq4NpBQbhxwmoLfKMzMhOD53w3Hh
         cpeCA0OPiUBZEt4CIRwN0SoeqOCpxzUYdafzxOTE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231108164405eucas1p251f53df0a2356c394c4b60ceab2dd278~Vs4tAU2UF1401514015eucas1p2S;
        Wed,  8 Nov 2023 16:44:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id AA.54.11320.4DABB456; Wed,  8
        Nov 2023 16:44:04 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20231108164404eucas1p2b4d3bbbd618707456d3d667fabccc4f9~Vs4sogklC1401114011eucas1p2M;
        Wed,  8 Nov 2023 16:44:04 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231108164404eusmtrp221c9ce923becbcc519ef35e9337ca30f~Vs4snijxN2869728697eusmtrp2G;
        Wed,  8 Nov 2023 16:44:04 +0000 (GMT)
X-AuditID: cbfec7f4-993ff70000022c38-7c-654bbad4957d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 9A.12.25043.4DABB456; Wed,  8
        Nov 2023 16:44:04 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231108164403eusmtip2b93279776c1de1a4da9671ccbfef3092~Vs4r-k7-50975909759eusmtip2C;
        Wed,  8 Nov 2023 16:44:03 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v4 2/3] i2c: s3c24xx: fix transferring more than one message
 in polling mode
Date:   Wed,  8 Nov 2023 17:43:53 +0100
Message-Id: <20231108164354.712406-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108164354.712406-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+XaO29lg6zgdvnQbSUoabWpBpyw1LThhSHSvP6yRBxV1yi5Z
        kaETy1TMNKwmXkLDMfGSOS/DXIpoOqdlJeElJeyqluZKLKycZ13++73v+zzf877wEZg432U1
        EavUMCqlIt6TK8Abuxb7tzw3hzN+mWaKmihp5FLjXzMR9cyymXo4ZeJRmUt2RN0eaONQ1Z1j
        PGrMUoxCCLreeI1Ljw61cuncBiOi5+vXH8RPCXZFMfGx5xiVPOiMIMYyZ0NJre7nS6ZfcFLR
        KzIL8Qkgt0GaftwlCwkIMWlAUPtmFLGFHUFOYaVzMo/AnGHh/rFcL23lsYNKBJP2Ks5fi25w
        ekXFJf0hayZrhd3JECipXuA5GCN/IliwyxzsRkbCjZpF3ME46QV36ytXNEIyCGqalnA2TQqW
        dhvmYD4ZDNl5RU6NK/TcmcTZN6WQbirCHEsA2UyA8ceQ07wXah/cc7IbfOxu4LG8Fn61lHJY
        w1UEZT/GnUUegtR3w4hVBcJo//flE4jlCB+oNcvZ9h6Y07UhRxtIEbyccWWXEEF+4y2MbQsh
        84qYVXuDvrvmb2z7k0GMZRp6rAt4Htqg/+8c/X/n6P/lliHMiDwYrTohmlEHKJlkmVqRoNYq
        o2VnExPq0fK3sf7stjejyo9zsg7EIVAHAgLzdBcuBdOMWBiluHCRUSWeVmnjGXUHWkPgnh5C
        rygpIyajFRomjmGSGNWfKYfgr07lHH96sDzc5bFf0KUGWxhs+XRCakrc0ycJ0++uCzNsz7Am
        iWy+kUr5t66IlO0VRO5wWnTjBYtWwK3xfjsuci8xdMqmKgJ0B0yuB9o2Wfcu3tqqehoTO91X
        tc16cj5CI+51zUm5u/+BRxWnrrBFN1WasXOmOtmFejkpT58lj/nkFPSOJBU2FbTy9yWPSEJ4
        w/Th2vcJ8rK52ZMvLosD/V5fnkg2j0x98GraYJJoBlLi2sm3m6Mea3ZIQ5pjbIcEvKN0ypeJ
        N7lDn1OHIzYWha/y6BRJ6HVpN4+YAns0p/G40LqIgvRynV5dGHz/0uDsp/zitYYxbXZYUVdV
        aLy31O2RJ66OUfj7Yiq14jdnbqWApQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsVy+t/xe7pXdnmnGvQtlLd4MG8bm8X9rx2M
        Fpf3a1vsfb2V3aLj7xdGixnn9zFZrD1yl93i7v65jA4cHptWdbJ53Lm2h82jb8sqRo/Pm+QC
        WKL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0MvZ/
        PMtYsEekYt6bq0wNjPcEuhg5OSQETCT65+9h72Lk4hASWMoo8eBIPxtEQkbi5LQGVghbWOLP
        tS6wuJDAJ0aJc/sVQGw2AUOJrrcQcREBJ4nbi2axggxiFmhikug4sQhoKgeHsECMxJdWLZAa
        FgFViYWblrOD2LwCdhLrtv9lgZgvL7H/4FlmEJtTwF6ie8JsdohddhLfLxxmg6gXlDg58wlY
        PTNQffPW2cwTGAVmIUnNQpJawMi0ilEktbQ4Nz232EivODG3uDQvXS85P3cTIzAith37uWUH
        48pXH/UOMTJxMB5ilOBgVhLh/WvvkSrEm5JYWZValB9fVJqTWnyI0RTo7onMUqLJ+cCYzCuJ
        NzQzMDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRqYOpziLp674rqrMJDsXsO
        Orbo9VUflPHieXa3YKqpCrvFy8LwuVLxvIF1Qb0p6qK9GZMfT/n18eHK6C+cfYctMtRT/p5J
        WjM34mbowYddehGSX67cP8XGteje1LzFf1edzdEInmidyWNdpJ/8YkFNcC3PZs6qdbnlH7pf
        PXjyIH5zsIpMTV/JlxWH7etvmwooVie+eCPJXJy1LE617uH2yzluuhut89g29C/40Xp1U+PD
        9YeuKTiY3Hu3dUeu8DH1sH+zDfK0HSs2HPkgkPjl1MxMo0fHTbfV9PnIMoQ8/BnyxZJ/z2FX
        FbHIKMEEL/2jd9I9S0vaJoW97z8hne7qFhnlsyBazdnuu9PXUJtIJZbijERDLeai4kQAbLHB
        axEDAAA=
X-CMS-MailID: 20231108164404eucas1p2b4d3bbbd618707456d3d667fabccc4f9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231108164404eucas1p2b4d3bbbd618707456d3d667fabccc4f9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231108164404eucas1p2b4d3bbbd618707456d3d667fabccc4f9
References: <20231108164354.712406-1-m.szyprowski@samsung.com>
        <CGME20231108164404eucas1p2b4d3bbbd618707456d3d667fabccc4f9@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

To properly handle ACK on the bus when transferring more than one
message in polling mode, move the polling handling loop from
s3c24xx_i2c_message_start() to s3c24xx_i2c_doxfer(). This way
i2c_s3c_irq_nextbyte() is always executed till the end, properly
acknowledging the IRQ bits and no recursive calls to
i2c_s3c_irq_nextbyte() are made.

While touching this, also fix finishing transfers in polling mode by
using common code path and always waiting for the bus to become idle
and disabled.

Fixes: 117053f77a5a ("i2c: s3c2410: Add polling mode support")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-s3c2410.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index bf9a5670ef33..c0fe96a4f2c4 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -279,16 +279,6 @@ static void s3c24xx_i2c_message_start(struct s3c24xx_i2c *i2c,
 
 	stat |= S3C2410_IICSTAT_START;
 	writel(stat, i2c->regs + S3C2410_IICSTAT);
-
-	if (i2c->quirks & QUIRK_POLL) {
-		while ((i2c->msg_num != 0) && is_ack(i2c)) {
-			i2c_s3c_irq_nextbyte(i2c, stat);
-			stat = readl(i2c->regs + S3C2410_IICSTAT);
-
-			if (stat & S3C2410_IICSTAT_ARBITR)
-				dev_err(i2c->dev, "deal with arbitration loss\n");
-		}
-	}
 }
 
 static inline void s3c24xx_i2c_stop(struct s3c24xx_i2c *i2c, int ret)
@@ -694,7 +684,7 @@ static void s3c24xx_i2c_wait_idle(struct s3c24xx_i2c *i2c)
 static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
 			      struct i2c_msg *msgs, int num)
 {
-	unsigned long timeout;
+	unsigned long timeout = 0;
 	int ret;
 
 	ret = s3c24xx_i2c_set_master(i2c);
@@ -714,16 +704,19 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
 	s3c24xx_i2c_message_start(i2c, msgs);
 
 	if (i2c->quirks & QUIRK_POLL) {
-		ret = i2c->msg_idx;
+		while ((i2c->msg_num != 0) && is_ack(i2c)) {
+			unsigned long stat = readl(i2c->regs + S3C2410_IICSTAT);
 
-		if (ret != num)
-			dev_dbg(i2c->dev, "incomplete xfer (%d)\n", ret);
+			i2c_s3c_irq_nextbyte(i2c, stat);
 
-		goto out;
+			stat = readl(i2c->regs + S3C2410_IICSTAT);
+			if (stat & S3C2410_IICSTAT_ARBITR)
+				dev_err(i2c->dev, "deal with arbitration loss\n");
+		}
+	} else {
+		timeout = wait_event_timeout(i2c->wait, i2c->msg_num == 0, HZ * 5);
 	}
 
-	timeout = wait_event_timeout(i2c->wait, i2c->msg_num == 0, HZ * 5);
-
 	ret = i2c->msg_idx;
 
 	/*
-- 
2.34.1

