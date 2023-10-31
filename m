Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0067DCF66
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 15:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344316AbjJaOnJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 10:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbjJaOnI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 10:43:08 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE445F3
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 07:43:03 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231031144301euoutp015f5f34c1bd502f6f914898d8e27569c3~TOEtwhJUM0936809368euoutp01g
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 14:43:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231031144301euoutp015f5f34c1bd502f6f914898d8e27569c3~TOEtwhJUM0936809368euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698763381;
        bh=GcU2ll/TxroeEN8DWXDBWInJsuAQQu6nVNdzAemEqiY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Scl+WuxMWSF2zl5lGPxmnCEkOlsEcEEN7EDJ1fFIFJReIfzkicXSsSBa1/aX6o1ni
         WjUoVKSSfJXhNLAMS+eDFS9pHt7r+RzAjxSfNwcpd9FQPE8MnHGL28sAh0G/bCwOz9
         PgKlh3IYLEi0HKc9J7xK8DjYXik4ROrGsBm8X3t4=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231031144300eucas1p284a1d63ba169c8543deb016711e1ac5a~TOEtesviG1408414084eucas1p2K;
        Tue, 31 Oct 2023 14:43:00 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id BF.87.52736.47211456; Tue, 31
        Oct 2023 14:43:00 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20231031144300eucas1p1106849fbdedf6eb929647b96c24a7891~TOEtJnpOd3034530345eucas1p1Y;
        Tue, 31 Oct 2023 14:43:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231031144300eusmtrp11fcf2e3c8b4a2c4c6fca05ba9da47ff7~TOEtI_VBe0253802538eusmtrp1K;
        Tue, 31 Oct 2023 14:43:00 +0000 (GMT)
X-AuditID: cbfec7f5-ba1ff7000000ce00-ca-65411274ce0b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 53.1A.25043.47211456; Tue, 31
        Oct 2023 14:43:00 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231031144259eusmtip22c885635341d0594803add4a65745945~TOEsq6Lbo1967919679eusmtip2G;
        Tue, 31 Oct 2023 14:42:59 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 2/3] i2c: s3c24xx: fix transferring more than one message
 in polling mode
Date:   Tue, 31 Oct 2023 15:42:51 +0100
Message-Id: <20231031144252.2112593-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031144252.2112593-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZduzned0SIcdUg9d79CwezNvGZnH/awej
        xeX92hZ7X29lt+j4+4XRYsb5fUwWa4/cZbe4u38uowOHx6ZVnWwed67tYfPo27KK0ePzJrkA
        ligum5TUnMyy1CJ9uwSujK6ZL5kLukUqzr44wdzAuEmgi5GDQ0LAROLX8YouRi4OIYEVjBIf
        J79nhHC+MEp8332ACcL5zCjRdv8aexcjJ1jH6ZtXoKqWM0psXXOPHa5ly7bJbCBVbAKGEl1v
        u8BsEQEHiXlrv4N1Mwv8A5r7RQ9kt7BAnMTTc9YgYRYBVYn7t54xgdi8AvYSt2deYIRYJi+x
        /+BZZpByTqAxK89UQZQISpyc+YQFYqK8RPPW2cwgJ0gI7OGQmH5nIRNEr4vEqyf9UHOEJV4d
        3wL1gIzE6ck9LBAN7YwSC37fZ4JwJjBKNDy/BdVhLXHn3C82kM3MApoS63fpQ8LLUeL3dUkI
        k0/ixltBiBv4JCZtm84MEeaV6GgTgpihJjHr+Dq4rQcvXGKGsD0kDs78yTSBUXEWkm9mIflm
        FsLaBYzMqxjFU0uLc9NTi43zUsv1ihNzi0vz0vWS83M3MQKTzOl/x7/uYFzx6qPeIUYmDsZD
        jBIczEoivIdNHVKFeFMSK6tSi/Lji0pzUosPMUpzsCiJ86qmyKcKCaQnlqRmp6YWpBbBZJk4
        OKUamMwce6TWa9hsE3exOPVm4pYrL0r9p83LFWuo2/ey9tySu5nnzQ5aTF9mFZb3pCxr36zn
        HcGBq3Z3pXSZp9o+NTxcM/n5p4+zf7A/PvgroSOwmu3PF9mH7YZ70sM6n5YeeCj2s5F/UuCp
        cmOmhG82XoKKKqJeamYLzGZKrBC+qfOq+BLfeT4JY7Y83oJrzzxz7jeatdZHHZiev+2n/6Kn
        b+az/pD5/XT1y4n3dj8KFHrycULf0bsyLBudG+S0hJJipJyij5+5vauy5kl2buzNXQrnna73
        Sbwo7X+58HKcIDvzt6z5UrO4kzo/58cLmZ05+vQM53Z+tuoT0eyhDI+YI3peVXcpPY81CV0m
        tWzNcSWW4oxEQy3mouJEAKZZ1F2hAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsVy+t/xe7olQo6pBrMOS1g8mLeNzeL+1w5G
        i8v7tS32vt7KbtHx9wujxYzz+5gs1h65y25xd/9cRgcOj02rOtk87lzbw+bRt2UVo8fnTXIB
        LFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GV0z
        XzIXdItUnH1xgrmBcZNAFyMnh4SAicTpm1cYuxi5OIQEljJKzN27nQkiISNxcloDK4QtLPHn
        WhcbiC0k8IlRYu0zcRCbTcBQoustRFxEwEni9qJZrCCDmAWamCQ6TixiB0kIC8RIbDn5gRHE
        ZhFQlbh/6xnYAl4Be4nbMy8wQiyQl9h/8CxzFyMHB6eAg8TKM1UQu+wlbp1ohyoXlDg58wkL
        iM0MVN68dTbzBEaBWUhSs5CkFjAyrWIUSS0tzk3PLTbSK07MLS7NS9dLzs/dxAiMiG3Hfm7Z
        wbjy1Ue9Q4xMHIyHGCU4mJVEeA+bOqQK8aYkVlalFuXHF5XmpBYfYjQFOnsis5Rocj4wJvNK
        4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tSs1NTC1KLYPqYODilGpj22lZM37EjKIDz7tMv
        pes3dOfcZ39l8PiK/cTEwqbmTHO1Mv/GM9lrb8/jnx6gMef+/Vls9TabdzE/iJ7pO5Eh9qNo
        BIu81Mr9HecdGeurnns+y6s4euKd0V929aWsPCVdnQ2Scd8XJr3Pu6l1T3tB1gXJspN2jyom
        hNucmfn76MP9n9aIHHBcpyLNMVusIWiapn2A4F2u58cuCoeyOv5YMIm9uar+xqWQpz/fB89Z
        fao+bdGPZlXdwg17uBcJZcUemKs6u2KpxL/eM2cXTRR3CD1hc3md9v/QaucrjAWqUfXBs+e+
        XLD+ckCdvMyL09mdXokFF4+seGSm2CPxQ0VD1KaKVf+E7aO+dd9XBfgosRRnJBpqMRcVJwIA
        ByUlXBEDAAA=
X-CMS-MailID: 20231031144300eucas1p1106849fbdedf6eb929647b96c24a7891
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231031144300eucas1p1106849fbdedf6eb929647b96c24a7891
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231031144300eucas1p1106849fbdedf6eb929647b96c24a7891
References: <20231031144252.2112593-1-m.szyprowski@samsung.com>
        <CGME20231031144300eucas1p1106849fbdedf6eb929647b96c24a7891@eucas1p1.samsung.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
---
 drivers/i2c/busses/i2c-s3c2410.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index bcc6afe2ccb5..28114b6aadfa 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -275,16 +275,6 @@ static void s3c24xx_i2c_message_start(struct s3c24xx_i2c *i2c,
 
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
@@ -690,7 +680,7 @@ static void s3c24xx_i2c_wait_idle(struct s3c24xx_i2c *i2c)
 static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
 			      struct i2c_msg *msgs, int num)
 {
-	unsigned long timeout;
+	unsigned long timeout = 0;
 	int ret;
 
 	ret = s3c24xx_i2c_set_master(i2c);
@@ -710,16 +700,19 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
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

