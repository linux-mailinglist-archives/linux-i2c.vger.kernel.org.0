Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044B07B318A
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Sep 2023 13:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232936AbjI2Li6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 07:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232779AbjI2Li5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 07:38:57 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF8EC0
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 04:38:53 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230929113852euoutp013045713d55dadd13aa61c8dcf96225d9~JW6zHHjda0271902719euoutp01H
        for <linux-i2c@vger.kernel.org>; Fri, 29 Sep 2023 11:38:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230929113852euoutp013045713d55dadd13aa61c8dcf96225d9~JW6zHHjda0271902719euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1695987532;
        bh=q4Ksx0hffAbr51fha/CFUoDgPTbVLV4EDgasd4lerRs=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Xo1+n/9pPuiBDKjpjlie2fMkTe+RbHVdglWYTo+fVdQH2OTNrxfuqaDq8Y2Upy3Nn
         Uhm4D5hhYt1/AFKLeo1WxmgA0RTcRJYCz1C51qXhwQYFQG5tlwzCQqklhMjbhBSnpf
         WbplYO+Th7pKfQ4pwkUqLHGI2FeC0mUYmmSQVsGU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20230929113852eucas1p10be53d5ad316de01f8e2a17f5259419a~JW6y5UyUe0346703467eucas1p1S;
        Fri, 29 Sep 2023 11:38:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id D5.FA.11320.B47B6156; Fri, 29
        Sep 2023 12:38:52 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20230929113851eucas1p28d902fbb6054951d57314ff181985e30~JW6ym0iqr0085900859eucas1p26;
        Fri, 29 Sep 2023 11:38:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20230929113851eusmtrp13ed705722074a5480a06d43b7755d532~JW6ymNO6y2484224842eusmtrp12;
        Fri, 29 Sep 2023 11:38:51 +0000 (GMT)
X-AuditID: cbfec7f4-993ff70000022c38-a1-6516b74b646f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 48.79.25043.B47B6156; Fri, 29
        Sep 2023 12:38:51 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20230929113851eusmtip2a484c63961018b5a9682126b51d14f14~JW6yJPdN80786207862eusmtip2t;
        Fri, 29 Sep 2023 11:38:51 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] i2c: exynos5: add support for atomic transfers
Date:   Fri, 29 Sep 2023 13:38:41 +0200
Message-Id: <20230929113841.1272625-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42LZduznOV2f7WKpBksjLB7M28Zmcf9rB6PF
        3tdb2S06/n5htJhxfh+Txdojd9kt7u6fy+jA7rFpVSebx51re9g8+rasYvT4vEkugCWKyyYl
        NSezLLVI3y6BK+PZ1ZPsBVOlKtZu3cbUwLhItIuRg0NCwETiwgH3LkYuDiGBFYwSL9Z3sUA4
        Xxglnp/dygzhfGaUuL32BXsXIydYx/Md61khEssZJY61HmZFaDm0jhmkik3AUKLrbRcbiC0i
        4CDRve0IO0gRs8BVRolTvVPAioQF7CX+bL7OCGKzCKhKzJu+AWwFL1D85/duVoh18hL7D55l
        hogLSpyc+YQFxGYGijdvnQ12n4TATA6JbRNmM0E0uEh82XUV6lZhiVfHt0DZMhKnJ/ewQDS0
        M0os+H2fCcKZwCjR8PwWI0SVtcSdc7/YQGHDLKApsX6XPkTYUeLj9TUskCDjk7jxVhDiCD6J
        SdumM0OEeSU62oQgqtUkZh1fB7f24IVLzBC2h8S387/B/hISiJWYsm0NywRGhVlIXpuF5LVZ
        CDcsYGRexSieWlqcm55abJSXWq5XnJhbXJqXrpecn7uJEZhiTv87/mUH4/JXH/UOMTJxMB5i
        lOBgVhLhfXhbKFWINyWxsiq1KD++qDQntfgQozQHi5I4r7btyWQhgfTEktTs1NSC1CKYLBMH
        p1QDU7+IxvftFwP5LE2qJlueXpFoV7vo4sNWh826kdnLd1eae905sOh55LroeZX5CWp2obsU
        J/ddkjHfJn18bRej6j3B5cmqL1477dbQqrdjnVa3IcFKq2L9jqP/vjybd9kgecm+L699giRL
        T+Skvm68eMByzrVDq3MSdKKWVhcnpKyuvcYhsOlgRd/LdVe1tq5ew796fbfIzIlZ/6VdH1hO
        nf9nvfv3dt+4GTtYgysSWGc4mXYIBsa/mbpyx6dr03/edDI7mZi8fu+MeR9nTWW149vNd/Gp
        hpdZkMPPHr6ujQF/3i19+nzprMV7ZJYFqze4rZtgZ3jZt39eZ8vqjRae+tEs13jcDZ+3vE/U
        dozbzqjEUpyRaKjFXFScCAAiqw7QoAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsVy+t/xe7re28VSDT4s0rJ4MG8bm8X9rx2M
        Fntfb2W36Pj7hdFixvl9TBZrj9xlt7i7fy6jA7vHplWdbB53ru1h8+jbsorR4/MmuQCWKD2b
        ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MZ1dPshdM
        lapYu3UbUwPjItEuRk4OCQETiec71rN2MXJxCAksZZQ4+vINE0RCRuLktAZWCFtY4s+1LjaI
        ok+MEuvXPGIGSbAJGEp0vQVJcHKICDhJ/Jt/lQWkiFngOqPEhPc3wSYJC9hL/Nl8nRHEZhFQ
        lZg3fQM7iM0LFP/5vRtqg7zE/oNnmSHighInZz5hAbGZgeLNW2czT2Dkm4UkNQtJagEj0ypG
        kdTS4tz03GIjveLE3OLSvHS95PzcTYzA4N527OeWHYwrX33UO8TIxMF4iFGCg1lJhPfhbaFU
        Id6UxMqq1KL8+KLSnNTiQ4ymQPdNZJYSTc4HxldeSbyhmYGpoYmZpYGppZmxkjivZ0FHopBA
        emJJanZqakFqEUwfEwenVANT+mnPTXW24j6H8u69N57ld3f7h9D09VX3fIpEjNb22Jdvvt7U
        uChovaRA57KUhUeXbd34cYfcLI7DhU8SGCd/TzEq3f6C3aTmfkivD+urkqAak74u0Yx18XPU
        g77v8XvWr8R806VMNfz1pm8Ojzx3To6c9XoB4xH3fVHpbB2NO1OyTnPbbSx8P9EtL9ftz/Ju
        rgW+5bp+nlO/Lfl0uy1MYvd555UPCjdoJv1i4GOQaVZfzXPhxbP5kmknjmYaKXvfLIht/DTR
        Skzm9209Fav0By+yV366eXzPDq+pTbpCptvNV955vvVxSWXs8Q0/DylKbHi3TSszxifAJPnj
        WjaH7xWae/3yj308LnxjR+oTJZbijERDLeai4kQAWvhrKPcCAAA=
X-CMS-MailID: 20230929113851eucas1p28d902fbb6054951d57314ff181985e30
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230929113851eucas1p28d902fbb6054951d57314ff181985e30
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230929113851eucas1p28d902fbb6054951d57314ff181985e30
References: <CGME20230929113851eucas1p28d902fbb6054951d57314ff181985e30@eucas1p2.samsung.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for atomic transfers using polled mode with interrupts
intentionally disabled. This removes the warning introduced by commit
63b96983a5dd ("i2c: core: introduce callbacks for atomic transfers")
during system reboot and power off.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 47 ++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 2b0b9cdffa86..4b012d86d811 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -162,7 +162,8 @@
 #define HSI2C_MASTER_ID(x)			((x & 0xff) << 24)
 #define MASTER_ID(x)				((x & 0x7) + 0x08)
 
-#define EXYNOS5_I2C_TIMEOUT (msecs_to_jiffies(100))
+#define EXYNOS5_I2C_TIMEOUT_MS (100)
+#define EXYNOS5_I2C_TIMEOUT (msecs_to_jiffies(EXYNOS5_I2C_TIMEOUT_MS))
 
 enum i2c_type_exynos {
 	I2C_TYPE_EXYNOS5,
@@ -178,6 +179,7 @@ struct exynos5_i2c {
 	unsigned int		msg_ptr;
 
 	unsigned int		irq;
+	unsigned int		polled;
 
 	void __iomem		*regs;
 	struct clk		*clk;		/* operating clock */
@@ -711,6 +713,24 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
 	spin_unlock_irqrestore(&i2c->lock, flags);
 }
 
+static unsigned long exynos5_i2c_polled_irqs_timeout(struct exynos5_i2c *i2c,
+						     unsigned long timeout_ms)
+{
+	ktime_t start, now;
+
+	start = now = ktime_get();
+	while (ktime_ms_delta(now, start) < timeout_ms &&
+	       !((i2c->trans_done && (i2c->msg->len == i2c->msg_ptr)) ||
+	         (i2c->state < 0))) {
+		while (readl(i2c->regs + HSI2C_INT_ENABLE) &
+		       readl(i2c->regs + HSI2C_INT_STATUS))
+			exynos5_i2c_irq(i2c->irq, i2c);
+		usleep_range(100, 200);
+		now = ktime_get();
+	}
+	return ktime_ms_delta(now, start) < timeout_ms;
+}
+
 static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
 			      struct i2c_msg *msgs, int stop)
 {
@@ -725,8 +745,13 @@ static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
 
 	exynos5_i2c_message_start(i2c, stop);
 
-	timeout = wait_for_completion_timeout(&i2c->msg_complete,
-					      EXYNOS5_I2C_TIMEOUT);
+	if (!i2c->polled)
+		timeout = wait_for_completion_timeout(&i2c->msg_complete,
+						      EXYNOS5_I2C_TIMEOUT);
+	else
+		timeout = exynos5_i2c_polled_irqs_timeout(i2c,
+							EXYNOS5_I2C_TIMEOUT_MS);
+
 	if (timeout == 0)
 		ret = -ETIMEDOUT;
 	else
@@ -777,6 +802,21 @@ static int exynos5_i2c_xfer(struct i2c_adapter *adap,
 	return ret ?: num;
 }
 
+static int exynos5_i2c_xfer_atomic(struct i2c_adapter *adap,
+				   struct i2c_msg *msgs, int num)
+{
+	struct exynos5_i2c *i2c = adap->algo_data;
+	int ret;
+
+	disable_irq(i2c->irq);
+	i2c->polled = true;
+	ret = exynos5_i2c_xfer(adap, msgs, num);
+	i2c->polled = false;
+	enable_irq(i2c->irq);
+
+	return ret;
+}
+
 static u32 exynos5_i2c_func(struct i2c_adapter *adap)
 {
 	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
@@ -784,6 +824,7 @@ static u32 exynos5_i2c_func(struct i2c_adapter *adap)
 
 static const struct i2c_algorithm exynos5_i2c_algorithm = {
 	.master_xfer		= exynos5_i2c_xfer,
+	.master_xfer_atomic	= exynos5_i2c_xfer_atomic,
 	.functionality		= exynos5_i2c_func,
 };
 
-- 
2.34.1

