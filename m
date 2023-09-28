Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C149A7B25EC
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 21:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbjI1TYe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 15:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231556AbjI1TYc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 15:24:32 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB9EB1A1
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 12:24:29 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230928192428euoutp01cc87d9f088c969d6f0193d1a6609159f~JJoCtKSus3233332333euoutp01J
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 19:24:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230928192428euoutp01cc87d9f088c969d6f0193d1a6609159f~JJoCtKSus3233332333euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1695929068;
        bh=oBDmmJRwhJ39d2l7by/nE4QIBDkcbt4eJaaAte6Fm54=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CaPkqy+Vjg0wjru2aDsvfif63n2hT9A9cs28aQSkVHyQ8Qa4ZrCR5Q3gna8v2Uhuh
         gGgUpnXmfZyK1hoeYArohC3gfI55+YPwF42XXHYhW2Mj5Ul9aQ9qoFRr8PZEKc77ZD
         K5ScyhbKVluQInChyZ2xPYWZhJuEyv7CeKKiJDl8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20230928192427eucas1p25f4bb1a4c32ff9bd8384d4df11653828~JJoB6L9hh2293122931eucas1p2F;
        Thu, 28 Sep 2023 19:24:27 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id E1.03.42423.BE2D5156; Thu, 28
        Sep 2023 20:24:27 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20230928192427eucas1p2e9e7147af816c288e3fec365467ca357~JJoBDNgNP2294322943eucas1p2E;
        Thu, 28 Sep 2023 19:24:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20230928192426eusmtrp19854def43ee1f91c36d45f6143a3197b~JJoBCmcU62223422234eusmtrp1D;
        Thu, 28 Sep 2023 19:24:26 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-8d-6515d2eb92ca
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id C0.DC.10549.AE2D5156; Thu, 28
        Sep 2023 20:24:26 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20230928192426eusmtip2d264c5d5577478fd49a61b7a60e8260b~JJoAnAffY1592515925eusmtip2m;
        Thu, 28 Sep 2023 19:24:26 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 3/3] i2c: s3c24xx: add support for atomic transfers
Date:   Thu, 28 Sep 2023 21:24:14 +0200
Message-Id: <20230928192414.258169-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928192414.258169-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleLIzCtJLcpLzFFi42LZduzned3Xl0RTDV49NbZ4MG8bm8X9rx2M
        Fntfb2W36Pj7hdFixvl9TBZrj9xlt7i7fy6jA7vHplWdbB53ru1h8+jbsorR4/MmuQCWKC6b
        lNSczLLUIn27BK6Mw99bmQuuCVXcmHmWpYFxA38XIyeHhICJxLxvK1lAbCGBFYwSB+dYdDFy
        AdlfGCU6pj1lhUh8ZpT4v9MJpuHZ6VdAcQ6g+HJGiZ9SECVA9XsuJIDYbAKGEl1vu9hAbBEB
        B4l5a7+zg8xkFrjMKDFtzjYmkISwgLPE7t0TwGwWAVWJvqXLmEFsXgE7iaYrjcwQu+Ql9h88
        ywyyi1PAXuLCZ0mIEkGJkzOfgN3MDFTSvHU2M8h8CYEtHBK/b79khOh1keictgbKFpZ4dXwL
        O4QtI3F6cg8LREM7o8SC3/eZIJwJjBINz29BdVhL3Dn3iw1kM7OApsT6XfoQYUeJ5pd/mEDC
        EgJ8EjfeCkIcwScxadt0Zogwr0RHmxBEtZrErOPr4NYevHAJ6i0PifkLF7NPYFScheSdWUje
        mYWwdwEj8ypG8dTS4tz01GLDvNRyveLE3OLSvHS95PzcTYzA1HL63/FPOxjnvvqod4iRiYPx
        EKMEB7OSCO/D20KpQrwpiZVVqUX58UWlOanFhxilOViUxHm1bU8mCwmkJ5akZqemFqQWwWSZ
        ODilGphCndI6XJk4SpKjN4ctq5AMYHPwUxOSVNlxIP79CflUozjmMOllPk7uf6bwK3fnThN0
        i5/D9v+jZHEBh+Ji1kvuk+oO307e6Hq6YOvi5bn9hnoWXo+4cg8cj77PJtIj1cVasvVpj4Db
        hiMhQk8ef/u6veJw9ttJNRutJnBPX3SqzMIttvN+l/07cflej8DT83a8u7UoViGz0vBl/owL
        O7rCa9ac532lHx/yub1nvezj/wkf5W/Me/pliuJmJgZPt+/n1/ksuHcw4fWUpJ4N69N/nT69
        5rGBeIRMT/fd8HmyaSd+69VfsPXnPJ91tNpZI3TuAYc5QkeEGxPyWTafeH7HZvmlE2bv1/L+
        vJMbpK3EUpyRaKjFXFScCABsAp+dnAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFLMWRmVeSWpSXmKPExsVy+t/xe7qvLommGiz7bGHxYN42Nov7XzsY
        Lfa+3spu0fH3C6PFjPP7mCzWHrnLbnF3/1xGB3aPTas62TzuXNvD5tG3ZRWjx+dNcgEsUXo2
        RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZh7+3Mhdc
        E6q4MfMsSwPjBv4uRk4OCQETiWenX7F2MXJxCAksZZT4/XUBC0RCRuLktAZWCFtY4s+1LjaI
        ok+MEvt2fwdLsAkYSnS9BUlwcogIOEncXjQLbBKzwHVGie8H/jGCJIQFnCV2757ABGKzCKhK
        9C1dxgxi8wrYSTRdaWSG2CAvsf/gWSCbg4NTwF7iwmdJEFMIqGTOcRWIakGJkzOfgN3GDFTd
        vHU28wRGgVlIUrOQpBYwMq1iFEktLc5Nzy021CtOzC0uzUvXS87P3cQIjIRtx35u3sE479VH
        vUOMTByMhxglOJiVRHgf3hZKFeJNSaysSi3Kjy8qzUktPsRoCnT1RGYp0eR8YCzmlcQbmhmY
        GpqYWRqYWpoZK4nzehZ0JAoJpCeWpGanphakFsH0MXFwSjUwtU70YdR1vDz1ePMb67WZtxQ+
        X34Qc+0t4+eNux7kfH4jtfL6X6Wunkds8b8fb9ScHnZdJbYp8EbqaY1mZmbWe771Zg9zdXkn
        XOxLkP3zeXXQ4Rmsm6878eVXOO9bM8H4iqjBL3Hvxo2xf3YzTXuWY9Bszv97alhDg6qqtMq7
        2Ofqf0ye1H+ed/Bn1la7isC5DoybJDeon13twnPrfDzv5ecXZcxZIssTd12Rt4wsNv4a25zG
        m6t8/KHVqWIuLfvPfb+FP5706T8cM8d9QnPLjFq7LccfpS2KO5IS/k90q3u4Ruuin1OTDn4/
        ecS5oLJtRxIjy+/tidOnfdN+mq0hu6Lh95QNa9/NW69scPnjDiWW4oxEQy3mouJEAOQAnx0N
        AwAA
X-CMS-MailID: 20230928192427eucas1p2e9e7147af816c288e3fec365467ca357
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230928192427eucas1p2e9e7147af816c288e3fec365467ca357
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230928192427eucas1p2e9e7147af816c288e3fec365467ca357
References: <20230928192414.258169-1-m.szyprowski@samsung.com>
        <CGME20230928192427eucas1p2e9e7147af816c288e3fec365467ca357@eucas1p2.samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for atomic transfers using polled mode with interrupts
intentionally disabled to get rid of the warning introduced by commit
63b96983a5dd ("i2c: core: introduce callbacks for atomic transfers").

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 8da85cb42980..586b82b30bdf 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -76,6 +76,7 @@
 #define QUIRK_HDMIPHY		(1 << 1)
 #define QUIRK_NO_GPIO		(1 << 2)
 #define QUIRK_POLL		(1 << 3)
+#define QUIRK_FORCE_POLL	(1 << 4)
 
 /* Max time to wait for bus to become idle after a xfer (in us) */
 #define S3C2410_IDLE_TIMEOUT	5000
@@ -174,7 +175,7 @@ static inline void s3c24xx_i2c_master_complete(struct s3c24xx_i2c *i2c, int ret)
 	if (ret)
 		i2c->msg_idx = ret;
 
-	if (!(i2c->quirks & QUIRK_POLL))
+	if (!(i2c->quirks & (QUIRK_POLL | QUIRK_FORCE_POLL)))
 		wake_up(&i2c->wait);
 }
 
@@ -700,7 +701,7 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
 	s3c24xx_i2c_enable_irq(i2c);
 	s3c24xx_i2c_message_start(i2c, msgs);
 
-	if (i2c->quirks & QUIRK_POLL) {
+	if (i2c->quirks & (QUIRK_POLL | QUIRK_FORCE_POLL)) {
 		while ((i2c->msg_num != 0) && is_ack(i2c)) {
 			unsigned long stat = readl(i2c->regs + S3C2410_IICSTAT);
 
@@ -774,6 +775,21 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
 	return -EREMOTEIO;
 }
 
+static int s3c24xx_i2c_xfer_atomic(struct i2c_adapter *adap,
+				   struct i2c_msg *msgs, int num)
+{
+	struct s3c24xx_i2c *i2c = (struct s3c24xx_i2c *)adap->algo_data;
+	int ret;
+
+	disable_irq(i2c->irq);
+	i2c->quirks |= QUIRK_FORCE_POLL;
+	ret = s3c24xx_i2c_xfer(adap, msgs, num);
+	i2c->quirks &= ~QUIRK_FORCE_POLL;
+	enable_irq(i2c->irq);
+
+	return ret;
+}
+
 /* declare our i2c functionality */
 static u32 s3c24xx_i2c_func(struct i2c_adapter *adap)
 {
@@ -784,6 +800,7 @@ static u32 s3c24xx_i2c_func(struct i2c_adapter *adap)
 /* i2c bus registration info */
 static const struct i2c_algorithm s3c24xx_i2c_algorithm = {
 	.master_xfer		= s3c24xx_i2c_xfer,
+	.master_xfer_atomic     = s3c24xx_i2c_xfer_atomic,
 	.functionality		= s3c24xx_i2c_func,
 };
 
-- 
2.34.1

