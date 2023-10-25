Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB357D6B1F
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Oct 2023 14:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343822AbjJYMRv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Oct 2023 08:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343785AbjJYMRq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Oct 2023 08:17:46 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1346B186
        for <linux-i2c@vger.kernel.org>; Wed, 25 Oct 2023 05:17:43 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231025121741euoutp0268460b2743e3aee14278a13e1a38eda2~RWOHOfolF2806128061euoutp02I
        for <linux-i2c@vger.kernel.org>; Wed, 25 Oct 2023 12:17:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231025121741euoutp0268460b2743e3aee14278a13e1a38eda2~RWOHOfolF2806128061euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698236261;
        bh=BpdV7f9VR8u/BvRs3fCZwzxWnpXyLciTLMxLr/lmKWs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sik4vA+CcbX6Y3haTf5Njyf3CjEOryGsPW4cb5jb2lfZ0wJuiW85VfJlbQ/itDgQw
         DS9sfiT87NQkTlWZ7PWZyjlu4v/b2DX9E+rcCeW5td30qYri2XfC9EwAB1wW4QCQHA
         nDDmZta9U5vjDYK2rwsUc7q56/9BgdOR2Bv31btE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231025121741eucas1p296c6b198607e86f1ace7b09a4e35a53d~RWOG-OaV00868708687eucas1p2J;
        Wed, 25 Oct 2023 12:17:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 00.D0.11320.46709356; Wed, 25
        Oct 2023 13:17:40 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20231025121740eucas1p2db798a12d80580af321c75edf5d59663~RWOGkCSOW0941409414eucas1p2D;
        Wed, 25 Oct 2023 12:17:40 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231025121740eusmtrp21f8bfe7fa64a842afad87ff76cd1e9cf~RWOGjcyd20245102451eusmtrp2K;
        Wed, 25 Oct 2023 12:17:40 +0000 (GMT)
X-AuditID: cbfec7f4-993ff70000022c38-40-65390764ed9a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 41.DA.10549.46709356; Wed, 25
        Oct 2023 13:17:40 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231025121740eusmtip20cf96bf644ee975258f6ae98c4a482d0~RWOGGz8oW0383403834eusmtip2e;
        Wed, 25 Oct 2023 12:17:40 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 3/3] i2c: s3c24xx: add support for atomic transfers
Date:   Wed, 25 Oct 2023 14:17:25 +0200
Message-Id: <20231025121725.46028-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025121725.46028-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42LZduznOd1UdstUg1ZhiwfztrFZ3P/awWix
        9/VWdouOv18YLWac38dksfbIXXaLu/vnMjqwe2xa1cnmcefaHjaPvi2rGD0+b5ILYInisklJ
        zcksSy3St0vgyrhx7jhjwQuhikOPljI2MO7m72Lk5JAQMJH4P+sccxcjF4eQwApGiTO7njNB
        OF8YJTb8X8MMUiUk8JlR4sAnbpiOpT//MkIULWeU+PZnGRtcx91n81lAqtgEDCW63naxgdgi
        Ag4S89Z+ZwcpYha4zCgxbc42JpCEsICbxPW+drAiFgFViWnf/4M18wrYSmz93cEOsU5eYv/B
        s2BncArYSXxd8Z0RokZQ4uTMJ2D1zEA1zVtngz0hIbCFQ+LZsrOsEM0uEid/fWSBsIUlXh3f
        AjVURuL/zvlMEA3tjBILft+HciYwSjQ8v8UIUWUtcefcL6DzOIBWaEqs36UPEXaUmPxgHyNI
        WEKAT+LGW0GII/gkJm2bzgwR5pXoaBOCqFaTmHV8HdzagxcuMUPYHhJHpn9mn8CoOAvJO7OQ
        vDMLYe8CRuZVjOKppcW56anFRnmp5XrFibnFpXnpesn5uZsYgSnm9L/jX3YwLn/1Ue8QIxMH
        4yFGCQ5mJRHeSB+LVCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8qinyqUIC6YklqdmpqQWpRTBZ
        Jg5OqQamtUrznsyN3mY1O7ahU8GL2asvd6PBux/zhP14NosER51RXWOQ/SA0IEvgD2PM6uC7
        Rr8ZDkq94a5/wC34d8b1fVHpD2eeXPePiXGqmE9Dzo36tMfsMmuzT+jFl+WYXVh9zlHGMFQ8
        0ZXJd/Zb51BtrUSvQ5/Ej06PKpPe+LumcWIb39XezTevzi1LcJg49UjR63aFDWbHT+fN7Z6y
        9OTu59PLC/7o/f65WS5qraeHROuhQMHOj4WcHw4sPLc6dsrSx15vDse+9T3qKS7yf+aq9Ac8
        8ad394pf4r67R0ax84AI8w2ts08ELO+6uU03lt3sy20mueiVbmZoZ1Ep++FnkmUbgtp8XnSu
        FHcXjuJUYinOSDTUYi4qTgQARyjucKADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRmVeSWpSXmKPExsVy+t/xe7op7JapBlsmKVs8mLeNzeL+1w5G
        i72vt7JbdPz9wmgx4/w+Jou1R+6yW9zdP5fRgd1j06pONo871/awefRtWcXo8XmTXABLlJ5N
        UX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7GjXPHGQte
        CFUcerSUsYFxN38XIyeHhICJxNKffxm7GLk4hASWMkq8aL7ECpGQkTg5rQHKFpb4c62LDaLo
        E6PE5DXnWEASbAKGEl1vQRKcHCICThK3F81iBSliFrjOKPH9wD9GkISwgJvE9b52sCIWAVWJ
        ad//gzXzCthKbP3dwQ6xQV5i/8GzzCA2p4CdxNcV38F6hYBqdh/vZIeoF5Q4OfMJWC8zUH3z
        1tnMExgFZiFJzUKSWsDItIpRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMwGrYd+7l5B+O8Vx/1
        DjEycTAeYpTgYFYS4Y30sUgV4k1JrKxKLcqPLyrNSS0+xGgKdPdEZinR5HxgPOaVxBuaGZga
        mphZGphamhkrifN6FnQkCgmkJ5akZqemFqQWwfQxcXBKNTAFnRNiCTnXx9MslL71wI3e9juR
        05QPHlwdV2kc+1PvokTEUQvbmclpu12yiuPfOphNPJp26M9MroMHtZyaJ7x/vmvxeZMAFuZ+
        9mdbTl6763yiTOicgUDZ/7JWOzWn6CW3axwuHdNZ1bPi18FnU8JsD/c//JIWL35u19pUld4j
        LJ8t1NlXbp+6gvVNUcUZq/cbC78bZcTs27/Mb7HFKkFWv6CMJR+jGZaJ/lqW7lkxX9A5Mce9
        0prrSeRydp70Wye2zLR9zB60a9tjHltxu8MZ02dVc4Zdkw5gyuTbk6k5nSNPUj/15m/HMKlp
        l6uD0tYt0xLP7pj2WM9Nu8Ne9syMfQYZUf9mMKTuYb6w2kWJpTgj0VCLuag4EQCzrFSbDwMA
        AA==
X-CMS-MailID: 20231025121740eucas1p2db798a12d80580af321c75edf5d59663
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231025121740eucas1p2db798a12d80580af321c75edf5d59663
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231025121740eucas1p2db798a12d80580af321c75edf5d59663
References: <20231025121725.46028-1-m.szyprowski@samsung.com>
        <CGME20231025121740eucas1p2db798a12d80580af321c75edf5d59663@eucas1p2.samsung.com>
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
intentionally disabled to get rid of the warning introduced by commit
63b96983a5dd ("i2c: core: introduce callbacks for atomic transfers")
during system reboot and power-off.

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
+#define QUIRK_ATOMIC		(1 << 4)
 
 /* Max time to wait for bus to become idle after a xfer (in us) */
 #define S3C2410_IDLE_TIMEOUT	5000
@@ -174,7 +175,7 @@ static inline void s3c24xx_i2c_master_complete(struct s3c24xx_i2c *i2c, int ret)
 	if (ret)
 		i2c->msg_idx = ret;
 
-	if (!(i2c->quirks & QUIRK_POLL))
+	if (!(i2c->quirks & (QUIRK_POLL | QUIRK_ATOMIC)))
 		wake_up(&i2c->wait);
 }
 
@@ -700,7 +701,7 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
 	s3c24xx_i2c_enable_irq(i2c);
 	s3c24xx_i2c_message_start(i2c, msgs);
 
-	if (i2c->quirks & QUIRK_POLL) {
+	if (i2c->quirks & (QUIRK_POLL | QUIRK_ATOMIC)) {
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
+	i2c->quirks |= QUIRK_ATOMIC;
+	ret = s3c24xx_i2c_xfer(adap, msgs, num);
+	i2c->quirks &= ~QUIRK_ATOMIC;
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

