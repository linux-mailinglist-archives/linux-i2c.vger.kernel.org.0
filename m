Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D41547BB5B5
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Oct 2023 12:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231834AbjJFKz7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Oct 2023 06:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbjJFKz5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 Oct 2023 06:55:57 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDB4CE
        for <linux-i2c@vger.kernel.org>; Fri,  6 Oct 2023 03:55:53 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231006105551euoutp022fb38639260ec52d6cb9c2b2db5a5cc8~Lf2PgRVa32994429944euoutp02C
        for <linux-i2c@vger.kernel.org>; Fri,  6 Oct 2023 10:55:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231006105551euoutp022fb38639260ec52d6cb9c2b2db5a5cc8~Lf2PgRVa32994429944euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1696589751;
        bh=K8cAsFi2biQ8rza2mUXUKVQclBLRbd3hfBEw7Vk5TOA=;
        h=From:To:Cc:Subject:Date:References:From;
        b=vaJZoqiHfdfnP0YFsiw2D7c8bjXX22xP4ufkxKp8LUmZmKxxUhR74e2GgyWmpgk4r
         8/ZGONrfFaHqyjNHx/vsCjsa2EsvboTBjwYx0yAV+pD0/CtvbVnCTohGd+ureiP0+q
         qBkM4zc1CKZZsAxsixcJe/SY1bU28GH0CViikiBo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20231006105551eucas1p18d763329ab3d7592575a239282899d33~Lf2PRF-pg0100201002eucas1p16;
        Fri,  6 Oct 2023 10:55:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 84.07.37758.7B7EF156; Fri,  6
        Oct 2023 11:55:51 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20231006105550eucas1p299b28864850bf69d48d4e35058e53afd~Lf2O8G0VO1896218962eucas1p2O;
        Fri,  6 Oct 2023 10:55:50 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231006105550eusmtrp2a6a11792d26bb1afea4b7ad461503596~Lf2O7VvlW2880128801eusmtrp2i;
        Fri,  6 Oct 2023 10:55:50 +0000 (GMT)
X-AuditID: cbfec7f5-815ff7000002937e-c5-651fe7b7a02f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 7F.09.10549.6B7EF156; Fri,  6
        Oct 2023 11:55:50 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231006105550eusmtip2d56d366054269e79793e1bcda3bc3896~Lf2OdnvvH1338713387eusmtip2I;
        Fri,  6 Oct 2023 10:55:50 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2] i2c: exynos5: add support for atomic transfers
Date:   Fri,  6 Oct 2023 12:55:45 +0200
Message-Id: <20231006105545.3194164-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZduzned3tz+VTDTbvFrB4MG8bm8X9rx2M
        Fntfb2W36Pj7hdFixvl9TBZrj9xlt7i7fy6jA7vHplWdbB53ru1h8+jbsorR4/MmuQCWKC6b
        lNSczLLUIn27BK6MSR9/Mxa8lKr4dOAiSwPjA9EuRk4OCQETifcTTrCB2EICKxglnly062Lk
        ArK/MErcnvyJDcL5zCixbMt9FpiOuQvnM0MkljNKNHQ/Y4FrWXZ5HxNIFZuAoUTX2y6wuSIC
        DhLd246wgxQxC1xllDjVO4UZJCEs4CSxd841sAYWAVWJeUdugdm8AvYS57aeYoJYJy+x/+BZ
        Zoi4oMTJmU/AzmAGijdvnQ12hoTATA6Ja5MWQd3nIjHj+SN2CFtY4tXxLVC2jMT/nfOZIBra
        GSUW/L4P5UwAeuL5LUaIKmuJO+d+Ad3NAbRCU2L9Ln2IsKPE6Q9dTCBhCQE+iRtvBSGO4JOY
        tG06M0SYV6KjTQiiWk1i1vF1cGsPXrjEDGF7SNzZ0cMKCexYiR0blrFNYFSYheS1WUhem4Vw
        wwJG5lWM4qmlxbnpqcXGeanlesWJucWleel6yfm5mxiBSeb0v+NfdzCuePVR7xAjEwfjIUYJ
        DmYlEd70BplUId6UxMqq1KL8+KLSnNTiQ4zSHCxK4ryqKfKpQgLpiSWp2ampBalFMFkmDk6p
        BqamZbwfX/6c/unIh2XbJy+bk5Obp6+uY7yz5OnNzU+jgj+n+6eLTZj40JHXSnrWwsqDCddY
        ZHddKrP2WNoqsqR6zZHzB5xFy0/kXX0a/SR5q/fTzEOMW0+lydnkMW+78/rrvECWSfd8m267
        vPF6IpMQnyK5ojdl1+t/2p/lf8UqfetqX172cfbLNL+Fn3Yft9k1L4m5JCpedOYH5wcGT9/P
        eMl1fbGpfbDd/TcTZxew1b3Mkij4fMM0anGwzXYGg6hVNV8/VHrt+5v0Mplz528Vx89KaWse
        WWtwfJ4y6f/2Mz+55VNtY3M1xK/XVKX2zxexWhjMq252+PCEa/uTj59t0WxdouB+fentmW9E
        0y5oK7EUZyQaajEXFScCAPIanZuhAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsVy+t/xe7rbnsunGrz4YWLxYN42Nov7XzsY
        Lfa+3spu0fH3C6PFjPP7mCzWHrnLbnF3/1xGB3aPTas62TzuXNvD5tG3ZRWjx+dNcgEsUXo2
        RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZkz7+Zix4
        KVXx6cBFlgbGB6JdjJwcEgImEnMXzmfuYuTiEBJYyihxf/1zFoiEjMTJaQ2sELawxJ9rXWwQ
        RZ8YJfperWACSbAJGEp0vQVJcHKICDhJ/Jt/lQWkiFngOqPEhPc3wYqEgRJ751wDs1kEVCXm
        HbkFZvMK2Euc23qKCWKDvMT+g2eZIeKCEidnPgG7ghko3rx1NvMERr5ZSFKzkKQWMDKtYhRJ
        LS3OTc8tNtQrTswtLs1L10vOz93ECAzubcd+bt7BOO/VR71DjEwcjIcYJTiYlUR40xtkUoV4
        UxIrq1KL8uOLSnNSiw8xmgLdN5FZSjQ5HxhfeSXxhmYGpoYmZpYGppZmxkrivJ4FHYlCAumJ
        JanZqakFqUUwfUwcnFINTB6qbfdepDhHXfweqjX93uQTn6/FhC0WZVhTMicp475I6MIjztrH
        Hn1f1LJuY9kNhRlVW3qXLz3081r3ltPJT35fin/GwZazOPbDrRVbmG8yPihZ/vPB83/ZLqqx
        J3kLZzU9j7vj1puy99f11z333kxazPvrgrEoW+mzEzcP8mWfCT++m7fHclPcpPt6Ob0LeaYa
        5aev7Xnen5lnI2BScblFmNFnd5bL4nnex+fdbp7tMO2Ude+2M+9C53fOYtoyeQeDGuvt0KZF
        SnuDhfdMXes175lCQNs2JgOX1acyazn2/3JOX7Zaw+jZtmtz7hS+Uv7Yf6GOMfX/JJd7rlli
        8yL2MS89K5e9mLXIzijcdZ+HEktxRqKhFnNRcSIAWz4MIvcCAAA=
X-CMS-MailID: 20231006105550eucas1p299b28864850bf69d48d4e35058e53afd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231006105550eucas1p299b28864850bf69d48d4e35058e53afd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231006105550eucas1p299b28864850bf69d48d4e35058e53afd
References: <CGME20231006105550eucas1p299b28864850bf69d48d4e35058e53afd@eucas1p2.samsung.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for atomic transfers using polling mode with interrupts
intentionally disabled. This removes the warning introduced by commit
63b96983a5dd ("i2c: core: introduce callbacks for atomic transfers")
during system reboot and power off.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- adjusted some names as pointed by Andi
---
 drivers/i2c/busses/i2c-exynos5.c | 51 ++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 2b0b9cdffa86..3ff398145b7b 100644
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
@@ -194,6 +195,11 @@ struct exynos5_i2c {
 	 */
 	int			trans_done;
 
+	/*
+	 * Called from atomic context, don't use interrupts.
+	 */
+	int			no_irqs;
+
 	/* Controller operating frequency */
 	unsigned int		op_clock;
 
@@ -711,6 +717,24 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
 	spin_unlock_irqrestore(&i2c->lock, flags);
 }
 
+static bool exynos5_i2c_poll_irqs_timeout(struct exynos5_i2c *i2c,
+					  unsigned long timeout_ms)
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
@@ -725,8 +749,13 @@ static int exynos5_i2c_xfer_msg(struct exynos5_i2c *i2c,
 
 	exynos5_i2c_message_start(i2c, stop);
 
-	timeout = wait_for_completion_timeout(&i2c->msg_complete,
-					      EXYNOS5_I2C_TIMEOUT);
+	if (!i2c->no_irqs)
+		timeout = wait_for_completion_timeout(&i2c->msg_complete,
+						      EXYNOS5_I2C_TIMEOUT);
+	else
+		timeout = exynos5_i2c_poll_irqs_timeout(i2c,
+							EXYNOS5_I2C_TIMEOUT_MS);
+
 	if (timeout == 0)
 		ret = -ETIMEDOUT;
 	else
@@ -777,6 +806,21 @@ static int exynos5_i2c_xfer(struct i2c_adapter *adap,
 	return ret ?: num;
 }
 
+static int exynos5_i2c_xfer_atomic(struct i2c_adapter *adap,
+				   struct i2c_msg *msgs, int num)
+{
+	struct exynos5_i2c *i2c = adap->algo_data;
+	int ret;
+
+	disable_irq(i2c->irq);
+	i2c->no_irqs = true;
+	ret = exynos5_i2c_xfer(adap, msgs, num);
+	i2c->no_irqs = false;
+	enable_irq(i2c->irq);
+
+	return ret;
+}
+
 static u32 exynos5_i2c_func(struct i2c_adapter *adap)
 {
 	return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
@@ -784,6 +828,7 @@ static u32 exynos5_i2c_func(struct i2c_adapter *adap)
 
 static const struct i2c_algorithm exynos5_i2c_algorithm = {
 	.master_xfer		= exynos5_i2c_xfer,
+	.master_xfer_atomic	= exynos5_i2c_xfer_atomic,
 	.functionality		= exynos5_i2c_func,
 };
 
-- 
2.34.1

