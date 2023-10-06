Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 846D17BBB4D
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Oct 2023 17:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbjJFPIT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Oct 2023 11:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232615AbjJFPIS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Oct 2023 11:08:18 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E228F
        for <linux-i2c@vger.kernel.org>; Fri,  6 Oct 2023 08:08:13 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231006150812euoutp01d655a6a6328a4c9ddc2144f800a754c7~LjSkh7Nyc1193911939euoutp018
        for <linux-i2c@vger.kernel.org>; Fri,  6 Oct 2023 15:08:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231006150812euoutp01d655a6a6328a4c9ddc2144f800a754c7~LjSkh7Nyc1193911939euoutp018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1696604892;
        bh=z76s/ciW4Hejdlg9e+eJr7BZxEfsnnnyHl0fW3UO0yE=;
        h=From:To:Cc:Subject:Date:References:From;
        b=sOOl+Z8ffWdMLb7cltz6FrjKlMHFMjfjf0tZaHXMtyZRYXLxhfzAkiCrw3O4ombKU
         SOua/9MyorUUXgzDnPPbEg8wHPlRx/75qoiPU43bI1VfByO1uz3Y2t+57JxAT6+Rph
         8SHNSjed10BjF1EbC8sYZPxZlP+yh54nHKZTyW6o=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20231006150812eucas1p18c0d7df1934c82767fc5fbfcbba828f8~LjSkXnrBc1131411314eucas1p1C;
        Fri,  6 Oct 2023 15:08:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 92.95.42423.CD220256; Fri,  6
        Oct 2023 16:08:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20231006150811eucas1p1a9e2b98d191bb8093daf38daba14e9a0~LjSkDT8P71816418164eucas1p1-;
        Fri,  6 Oct 2023 15:08:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20231006150811eusmtrp1de04c96d81b065202deb75c8cd3e466f~LjSkCtBnk1331413314eusmtrp1D;
        Fri,  6 Oct 2023 15:08:11 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-13-652022dc4617
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id F3.72.10549.BD220256; Fri,  6
        Oct 2023 16:08:11 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20231006150811eusmtip1e236ce5a09da0e5bd1e5bf00d2278573~LjSjkZvE50922109221eusmtip1a;
        Fri,  6 Oct 2023 15:08:11 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v3] i2c: exynos5: add support for atomic transfers
Date:   Fri,  6 Oct 2023 17:08:03 +0200
Message-Id: <20231006150804.4113844-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42LZduzned07SgqpBie6uC0ezNvGZnH/awej
        xd7XW9ktOv5+YbSYcX4fk8XaI3fZLe7un8vowO6xaVUnm8eda3vYPPq2rGL0+LxJLoAlissm
        JTUnsyy1SN8ugSvj6bx+loJtEhWNs3ezNjA+Ee5i5OSQEDCRuDLtEAuILSSwglFi53VVCPsL
        o8Te55ZdjFxA9mdGiY1XnrLANMw4fIMNIrGcUeJ35z5WCAeoY/6Ek0wgVWwChhJdb7vYQGwR
        AQeJ7m1H2EGKmAWuMkqc6p3CDJIQFnCSeLxrByuIzSKgKtHyYj2YzStgL7GmaRbUOnmJ/QfP
        MkPEBSVOznwCFmcGijdvnc0MMlRCYCqHxL+vLewQDS4S11fOZYKwhSVeHd8CFZeROD25hwWi
        oZ1RYsHv+0wQzgRGiYbntxghqqwl7pz7BXQ3B9AKTYn1u/Qhwo4SvReXMYGEJQT4JG68FYQ4
        gk9i0rbpzBBhXomONiGIajWJWcfXwa09eOESM4TtIXF91gFWSPjGStxd2cQ8gVFhFpLXZiF5
        bRbCDQsYmVcxiqeWFuempxYb5qWW6xUn5haX5qXrJefnbmIEppjT/45/2sE499VHvUOMTByM
        hxglOJiVRHjTG2RShXhTEiurUovy44tKc1KLDzFKc7AoifOqpsinCgmkJ5akZqemFqQWwWSZ
        ODilGpjCVna57Pq5Umr36dQ1i/lfJ7Ff/ll76kiMtIj+jZib/kxcqpLm57r3Om66/ny6tsmZ
        clb5OetZWNpmh51Y/KN8Xqz7KR2rR5MteT/qtizcZXTafWOHz65Q/rdsh2O2l1Utn9+S0B/8
        SaJQJUclaBInx2nhQ5Eq90PsV3Yodia8fDPl/q0nBtwOPybtnCt8rHLS20nflrQmWC3td2uu
        VpqQWvvteZlJguDzeTkPtFdrfMwJ26DTzjtXN/FB7I0r1544/6q7d+T1p9fK9yZceWPZzvdM
        5uJqmVMnp0SdP2IoHnt2yy4HjjOdhWGTs5rv7dwvdepzlJ6PsM/MpVEFrfqMuvOOTo8vWyjR
        u/TFJu/XSizFGYmGWsxFxYkAjv/c3qADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsVy+t/xu7q3lRRSDeYtMrJ4MG8bm8X9rx2M
        Fntfb2W36Pj7hdFixvl9TBZrj9xlt7i7fy6jA7vHplWdbB53ru1h8+jbsorR4/MmuQCWKD2b
        ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2Mp/P6WQq2
        SVQ0zt7N2sD4RLiLkZNDQsBEYsbhG2xdjFwcQgJLGSVWzLzHCpGQkTg5rQHKFpb4c60LqugT
        o8SMx3cZQRJsAoYSXW9BEpwcIgJOEv/mX2UBKWIWuM4oMeH9TSaQhDBQ4vGuHWCTWARUJVpe
        rAezeQXsJdY0zWKB2CAvsf/gWWaIuKDEyZlPwOLMQPHmrbOZJzDyzUKSmoUktYCRaRWjSGpp
        cW56brGhXnFibnFpXrpecn7uJkZgcG879nPzDsZ5rz7qHWJk4mA8xCjBwawkwpveIJMqxJuS
        WFmVWpQfX1Sak1p8iNEU6L6JzFKiyfnA+MoriTc0MzA1NDGzNDC1NDNWEuf1LOhIFBJITyxJ
        zU5NLUgtgulj4uCUamDSlertfiN6ouqBrZKK6NkcxtOTj5vI+V+RcipZEcAT/ut6YfrmBRFT
        ORSXa37zafHlK+2yPD83euOxILGvyS2XH85Zte70yT3+cwoW7LyvVbfs59JZL65Nzyh8vkNq
        wTODp+a2+t9E8x6tdE6rCGGeN7NwcaHBqiOmae3R77f3FZ/0KdlisEQiZF+8FWvCm7qPS44y
        SU7fcerpvEIfwWX/X/htEJ37apbCpJysMzrCsfM5o3IC6+687F/f5G2xY6XcqV6VmO4zfmmG
        ycE3zn5/YBQ0Q0LoxT8JxvMyonc2xquELxd/J5Tq9b/vZtO9MHUHpVzBHX+aBMSTxHhz2VxC
        7Is0X9mknn/JX3v3i4ESS3FGoqEWc1FxIgBGCkeL9wIAAA==
X-CMS-MailID: 20231006150811eucas1p1a9e2b98d191bb8093daf38daba14e9a0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231006150811eucas1p1a9e2b98d191bb8093daf38daba14e9a0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231006150811eucas1p1a9e2b98d191bb8093daf38daba14e9a0
References: <CGME20231006150811eucas1p1a9e2b98d191bb8093daf38daba14e9a0@eucas1p1.samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for atomic transfers using polling mode with interrupts
intentionally disabled. This removes the warning introduced by commit
63b96983a5dd ("i2c: core: introduce callbacks for atomic transfers")
during system reboot and power-off.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v3:
- simplified timeout calculations, adjusted some names even more

v2:
- adjusted some names as pointed by Andi
---
 drivers/i2c/busses/i2c-exynos5.c | 46 ++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 2b0b9cdffa86..65cb06ec3804 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -194,6 +194,11 @@ struct exynos5_i2c {
 	 */
 	int			trans_done;
 
+	/*
+	 * Called from atomic context, don't use interrupts.
+	 */
+	unsigned int		atomic;
+
 	/* Controller operating frequency */
 	unsigned int		op_clock;
 
@@ -711,6 +716,22 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
 	spin_unlock_irqrestore(&i2c->lock, flags);
 }
 
+static bool exynos5_i2c_poll_irqs_timeout(struct exynos5_i2c *i2c,
+					  unsigned long timeout)
+{
+	unsigned long time_left = jiffies + timeout;
+
+	while (time_before(jiffies, time_left) &&
+	       !((i2c->trans_done && (i2c->msg->len == i2c->msg_ptr)) ||
+	         (i2c->state < 0))) {
+		while (readl(i2c->regs + HSI2C_INT_ENABLE) &
+		       readl(i2c->regs + HSI2C_INT_STATUS))
+			exynos5_i2c_irq(i2c->irq, i2c);
+		usleep_range(100, 200);
+	}
+	return time_before(jiffies, time_left);
+}
+
 static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
 			      struct i2c_msg *msgs, int stop)
 {
@@ -725,8 +746,13 @@ static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
 
 	exynos5_i2c_message_start(i2c, stop);
 
-	timeout = wait_for_completion_timeout(&i2c->msg_complete,
-					      EXYNOS5_I2C_TIMEOUT);
+	if (!i2c->atomic)
+		timeout = wait_for_completion_timeout(&i2c->msg_complete,
+						      EXYNOS5_I2C_TIMEOUT);
+	else
+		timeout = exynos5_i2c_poll_irqs_timeout(i2c,
+							EXYNOS5_I2C_TIMEOUT);
+
 	if (timeout == 0)
 		ret = -ETIMEDOUT;
 	else
@@ -777,6 +803,21 @@ static int exynos5_i2c_xfer(struct i2c_adapter *adap,
 	return ret ?: num;
 }
 
+static int exynos5_i2c_xfer_atomic(struct i2c_adapter *adap,
+				   struct i2c_msg *msgs, int num)
+{
+	struct exynos5_i2c *i2c = adap->algo_data;
+	int ret;
+
+	disable_irq(i2c->irq);
+	i2c->atomic = true;
+	ret = exynos5_i2c_xfer(adap, msgs, num);
+	i2c->atomic = false;
+	enable_irq(i2c->irq);
+
+	return ret;
+}
+
 static u32 exynos5_i2c_func(struct i2c_adapter *adap)
 {
 	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
@@ -784,6 +825,7 @@ static u32 exynos5_i2c_func(struct i2c_adapter *adap)
 
 static const struct i2c_algorithm exynos5_i2c_algorithm = {
 	.master_xfer		= exynos5_i2c_xfer,
+	.master_xfer_atomic	= exynos5_i2c_xfer_atomic,
 	.functionality		= exynos5_i2c_func,
 };
 
-- 
2.34.1

