Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E23B57D6B24
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Oct 2023 14:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343868AbjJYMRx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Oct 2023 08:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343665AbjJYMRq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Oct 2023 08:17:46 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4366192
        for <linux-i2c@vger.kernel.org>; Wed, 25 Oct 2023 05:17:39 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231025121738euoutp01aff74b026150ac6e035d40ace7162f05~RWOErLaKd1299212992euoutp01e
        for <linux-i2c@vger.kernel.org>; Wed, 25 Oct 2023 12:17:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231025121738euoutp01aff74b026150ac6e035d40ace7162f05~RWOErLaKd1299212992euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698236258;
        bh=7i2kWxChpl+dJDdb02fIFXYVrXI2eBgain5wDSeEKPI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lXs5WA+j0QeQDf1CgaRBEloRb2CYT/4HmN56M6VRyV5l7OYNepWnbW3ryEZBXaXho
         jYi6Wu9NZa4aWwLOdcRGgZOgAWqjKlGZTMglVbQiMkCisJI7w69HMaYPnB3KXXdWht
         4mDAv9r61Rr93ijNu7lmTy+iottXZ29J3SbpnFmA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231025121738eucas1p258ad23b4e246b76caf4c0b3a772fb419~RWOEdWxCQ0172001720eucas1p2u;
        Wed, 25 Oct 2023 12:17:38 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 5B.C0.11320.26709356; Wed, 25
        Oct 2023 13:17:38 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f~RWOD8ZUDM0317903179eucas1p1I;
        Wed, 25 Oct 2023 12:17:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231025121737eusmtrp2f9faff147d35884baadd66d2df074a5b~RWOD7ukDI0245102451eusmtrp2F;
        Wed, 25 Oct 2023 12:17:37 +0000 (GMT)
X-AuditID: cbfec7f4-993ff70000022c38-34-653907628296
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id DD.CA.10549.16709356; Wed, 25
        Oct 2023 13:17:37 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231025121737eusmtip2a777633719cde1288833fcc227dec25e~RWODbLYx13189431894eusmtip2g;
        Wed, 25 Oct 2023 12:17:37 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 1/3] i2c: s3c24xx: fix read transfers in polling mode
Date:   Wed, 25 Oct 2023 14:17:23 +0200
Message-Id: <20231025121725.46028-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025121725.46028-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZduznOd0kdstUg6Z7ghYP5m1js7j/tYPR
        Yu/rrewWHX+/MFrMOL+PyWLtkbvsFnf3z2V0YPfYtKqTzePOtT1sHn1bVjF6fN4kF8ASxWWT
        kpqTWZZapG+XwJXROfMle8FPjoozz2awNDCuYO9i5OSQEDCRWPTxOHMXIxeHkMAKRomXD59A
        OV8YJRqbXrJCOJ8ZJZZ8XssI07L77A9GiMRyRonnf3axgiTAWh69FwKx2QQMJbredrGB2CIC
        DhLz1n5nB2lgFrjMKDFtzjYmkISwgIdE651ZzCA2i4CqxN+u9WBH8QrYSjS864Q6UF5i/8Gz
        YDWcAnYSX1d8Z4SoEZQ4OfMJC4jNDFTTvHU22N0SAms5JO63tkOd6iJxceF8qEHCEq+Ob4Gy
        ZST+75zPBNHQziix4Pd9KGcCo0TD81tQ3dYSd879AvqBA2iFpsT6XfoQYUeJddO3gIUlBPgk
        brwVhDiCT2LStunMEGFeiY42IYhqNYlZx9fBrT144RIzhO0hMXnjT9YJjIqzkLwzC8k7sxD2
        LmBkXsUonlpanJueWmyUl1quV5yYW1yal66XnJ+7iRGYZE7/O/5lB+PyVx/1DjEycTAeYpTg
        YFYS4Y30sUgV4k1JrKxKLcqPLyrNSS0+xCjNwaIkzquaIp8qJJCeWJKanZpakFoEk2Xi4JRq
        YOpnV2vP+8Qn6VIU5bL779fHPM62jxVFu84e/2DG2r9hdsKb6ClVHO3v3l1dVZizcsHFuhbt
        exI+aYZC0dU6sraf/DRjYkX+mQTzVNlfc1dv1q0Ku7AjoP7bme7ljncP/vj6Y2HaqSnPVxeo
        brnxTXlS+6INT1V//s9iyys32xn1yeQ5z3YtDc3yPMPzjULfP9ibbpr+dtOZ+RNKyh+Vbz5p
        9vtj1tbY4sPzK+x69fL3v7X+bv1+/o8zu3dFsWoYTVI41bhWvu7N0t2a7bqt5/8L+vFNT66f
        eMBSTz7xv7wWf9q+tTE9/V6ln7qNpA7v4/Cco/H1+KPdPCtzHffMYbT6c33B61mHsvIU6h5V
        fFRiKc5INNRiLipOBAD5HG9yoQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRmVeSWpSXmKPExsVy+t/xe7qJ7JapBke2alk8mLeNzeL+1w5G
        i72vt7JbdPz9wmgx4/w+Jou1R+6yW9zdP5fRgd1j06pONo871/awefRtWcXo8XmTXABLlJ5N
        UX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl5G58yX7AU/
        OSrOPJvB0sC4gr2LkZNDQsBEYvfZH4xdjFwcQgJLGSWmP5/EApGQkTg5rYEVwhaW+HOtiw2i
        6BOjxMpt85hAEmwChhJdb0ESnBwiAk4StxfNYgUpYha4zijx/cA/RpCEsICHROudWcwgNouA
        qsTfrvVgq3kFbCUa3nVCnSEvsf/gWbAaTgE7ia8rvoP1CgHV7D7eCVUvKHFy5hOw65iB6pu3
        zmaewCgwC0lqFpLUAkamVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIHRsO3Yz807GOe9+qh3
        iJGJg/EQowQHs5IIb6SPRaoQb0piZVVqUX58UWlOavEhRlOguycyS4km5wPjMa8k3tDMwNTQ
        xMzSwNTSzFhJnNezoCNRSCA9sSQ1OzW1ILUIpo+Jg1OqgUn4guPcwrUNMgbqfK9EVr/b36eS
        tWqP87f573z09/V8uDxvQuM+Ds7LcX6hxovUH62vTxT8cfCA3UM14Yq5wq7cGz743zt/dcaZ
        fceVVdUY5+s0f+EQ8LusfYYlrvGXxpR5u9MyNN7Ny6j/Jq8dqqb7PKvCQKh5/s3TDO1vTq+8
        LbhJLzpGVFa0Jv3i0XNbnT12Fkd8O2uRz7+lrKSIqWlHu4Kv442tss8jRReWfraVvvsu6b9F
        1DbjpQFp7xSWPPHdaKbgcpnbs9w2+P1B76MTXaJdNU1LVKW60q7k99jfj8ia8lpE9ZKs8N0T
        G2pCPpuFccxuKLocsK63Kb98u7WqW9K1dfsWzjC58OrVCyWW4oxEQy3mouJEAOOrisEPAwAA
X-CMS-MailID: 20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f
References: <20231025121725.46028-1-m.szyprowski@samsung.com>
        <CGME20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f@eucas1p1.samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

To properly handle read transfers in polling mode, no waiting for the ACK
state is needed as it will never come. Just wait a bit to ensure start
state is on the bus and continue processing next bytes.

Fixes: 117053f77a5a ("i2c: s3c2410: Add polling mode support")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 127eb3805fac..f9dcb1112a61 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -216,8 +216,13 @@ static bool is_ack(struct s3c24xx_i2c *i2c)
 	int tries;
 
 	for (tries = 50; tries; --tries) {
-		if (readl(i2c->regs + S3C2410_IICCON)
-			& S3C2410_IICCON_IRQPEND) {
+		unsigned long tmp = readl(i2c->regs + S3C2410_IICCON);
+
+		if (!(tmp & S3C2410_IICCON_ACKEN)) {
+			usleep_range(100, 200);
+			return true;
+		}
+		if (tmp & S3C2410_IICCON_IRQPEND) {
 			if (!(readl(i2c->regs + S3C2410_IICSTAT)
 				& S3C2410_IICSTAT_LASTBIT))
 				return true;
-- 
2.34.1

