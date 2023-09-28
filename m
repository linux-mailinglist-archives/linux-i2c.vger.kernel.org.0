Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C50B7B25EA
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 21:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjI1TYd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 15:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231191AbjI1TYc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 15:24:32 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3347F1A5
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 12:24:29 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230928192427euoutp0130f454ec09e9819e0e549fc4382c4d58~JJoB8lQln0400004000euoutp01u
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 19:24:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230928192427euoutp0130f454ec09e9819e0e549fc4382c4d58~JJoB8lQln0400004000euoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1695929068;
        bh=QFAsA2i7L3s/e//v7+GdgOSFKhScvcK0wqEuRE0fPmA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NNt/L1+d5UWDAdoih7Zngsl9Izg467zETXxfTqh1Ld/+dcvu+41yQd07E1iMYkEMm
         /45ljCPdFAGMoVXd1lj65IHgVKATumu0V8hJtfts3xt/y9dWv5dZJBPP6E1JQs3J5T
         kpi1aUbx7iggndetXvOZiS3q18K3GjWxxR+cMhgs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20230928192427eucas1p2adaa7aef3d812da843ea4f1946f367fa~JJoBwqASb2293522935eucas1p2C;
        Thu, 28 Sep 2023 19:24:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id A0.9A.37758.BE2D5156; Thu, 28
        Sep 2023 20:24:27 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20230928192426eucas1p19f03ce636f843fcbaeecde038c24f983~JJoArK53_1600016000eucas1p14;
        Thu, 28 Sep 2023 19:24:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20230928192426eusmtrp1af5bc6497f37586178fd06fb500c7267~JJoAqrgqe2223422234eusmtrp1C;
        Thu, 28 Sep 2023 19:24:26 +0000 (GMT)
X-AuditID: cbfec7f5-815ff7000002937e-83-6515d2eb8bc6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 40.DC.10549.AE2D5156; Thu, 28
        Sep 2023 20:24:26 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20230928192426eusmtip26d3bedef21d4b6a9b64c1fb3b9006901~JJoAMpCIR1722017220eusmtip2n;
        Thu, 28 Sep 2023 19:24:26 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 2/3] i2c: s3c24xx: fix transferring more than one message in
 polled mode
Date:   Thu, 28 Sep 2023 21:24:13 +0200
Message-Id: <20230928192414.258169-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928192414.258169-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42LZduznOd3Xl0RTDba16Vg8mLeNzeL+1w5G
        i72vt7JbdPz9wmgx4/w+Jou1R+6yW9zdP5fRgd1j06pONo871/awefRtWcXo8XmTXABLFJdN
        SmpOZllqkb5dAlfG80vHWAqOCld82v+LrYHxO38XIyeHhICJRNfuQyxdjFwcQgIrGCXWH3vO
        BOF8YZSY2dPLCuF8ZpS4sH8lkMMB1nL7mw5EfDmjROetTla4jn0nDjOCzGUTMJToetvFBmKL
        CDhIzFv7nR2kiFngMqPEtDnbmEASwgJREk8mLGAFsVkEVCUmTf8K1swrYCdxcepmJogD5SX2
        HzzLDLKZU8Be4sJnSYgSQYmTM5+wgNjMQCXNW2czg8yXENjBIfFjwSlmiF4XiSWT+tghbGGJ
        V8e3QNkyEqcn97BANLQzSiz4fZ8JwpnAKNHw/BYjRJW1xJ1zv9hANjMLaEqs36UPEXaUaDj8
        hwUSFHwSN94KQhzBJzFp23RmiDCvREebEES1msSs4+vg1h68cAnqNA+JyUca2SYwKs5C8s4s
        JO/MQti7gJF5FaN4amlxbnpqsXFearlecWJucWleul5yfu4mRmCKOf3v+NcdjCtefdQ7xMjE
        wXiIUYKDWUmE9+FtoVQh3pTEyqrUovz4otKc1OJDjNIcLErivNq2J5OFBNITS1KzU1MLUotg
        skwcnFINTKYpp1uKuNonTOF6vjyznlHF/9qahWLc3f9v1h1cazPJxjaN+7eYjOiqTsH974wC
        /8xYY9y+oWOeVJfB5dU/zn5ldhfIPjipZY5f7hveTBb9pzeXP1Dti206VZ35sXqmFFdvntF7
        Pb2jWk07I6cozxT7s89Z7cyPHWEdJ3ZOr9JrXnB0e8GDQ+9Xdd6o8V30uGDT+uoFjaZ/dgXa
        BczMesjfzXZX5NVH5yMVHvM71tsnmNged7syd8XGySE7Uya87S3eWJXu2q1dveLOhlt9XH4O
        j6KmvlB//NJJ8/Wl7MDtfwP+TzVO/X9PMG5uouXeAJl/Zcab27J+Mc7p75+wTkO7Ofnv/all
        NT03mGqqVyuxFGckGmoxFxUnAgARHP+CoAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsVy+t/xe7qvLommGnR9kbV4MG8bm8X9rx2M
        Fntfb2W36Pj7hdFixvl9TBZrj9xlt7i7fy6jA7vHplWdbB53ru1h8+jbsorR4/MmuQCWKD2b
        ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2M55eOsRQc
        Fa74tP8XWwPjd/4uRg4OCQETidvfdLoYuTiEBJYySqw7do2xi5ETKC4jcXJaAyuELSzx51oX
        G0TRJ0aJa88ugiXYBAwlut6CJDg5RAScJG4vmsUKUsQscJ1R4vuBf2CThAUiJPq33mICsVkE
        VCUmTf8KFucVsJO4OHUzE8QGeYn9B88yg1zEKWAvceGzJIgpBFQy57gKRLWgxMmZT1hAbGag
        6uats5knMArMQpKahSS1gJFpFaNIamlxbnpusaFecWJucWleul5yfu4mRmAcbDv2c/MOxnmv
        PuodYmTiYDzEKMHBrCTC+/C2UKoQb0piZVVqUX58UWlOavEhRlOgqycyS4km5wMjMa8k3tDM
        wNTQxMzSwNTSzFhJnNezoCNRSCA9sSQ1OzW1ILUIpo+Jg1OqgWmK07EXavOiaxIdtyyyXH2n
        Moj32Z87nZFrLwQest3BcuRCwswvCh08xjeuOK19eucgi1Lys9pd17yYa9bfY+t89He6TcOR
        LJaHW4uLYmZuEXzw0eL2gpeNSft8a6amK6zeEnwpJHjdngjHf/ZlHOcmzrXu4S817D+rMCEx
        rv2S1dsyw9WSka+lGPyXP73lHcOVLfJwmsfzRu+//8J44hY5WuvqyTppmHm2PZnNnfNjzsaO
        FX8nxr97Kvq859KbA3vPp/Q/KdniKft+TsKETxVpiu9PTfhrGxn4e1mP5obiUxt9Jqrd19jS
        2d3mIRRlJfN7PceEiMSNx4QzylhEl+6w8WPjY7Wyazz+bQ6fzC8lluKMREMt5qLiRADTO0vn
        DAMAAA==
X-CMS-MailID: 20230928192426eucas1p19f03ce636f843fcbaeecde038c24f983
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230928192426eucas1p19f03ce636f843fcbaeecde038c24f983
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230928192426eucas1p19f03ce636f843fcbaeecde038c24f983
References: <20230928192414.258169-1-m.szyprowski@samsung.com>
        <CGME20230928192426eucas1p19f03ce636f843fcbaeecde038c24f983@eucas1p1.samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

To properly handle ACK on the bus when transferring more than one
message in polled mode, move the polling handling loop from
s3c24xx_i2c_message_start() to s3c24xx_i2c_doxfer(). This way
i2c_s3c_irq_nextbyte() is always executed till the end, properly
acknowledging the IRQ bits and no recursive calls to i2c_s3c_irq_nextbyte()
are made.

Also fix finishing transfers in polled mode by using common code path and
always waiting for the bus to become idle and disabled.

Fixes: 117053f77a5a ("i2c: s3c2410: Add polling mode support")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index f9dcb1112a61..8da85cb42980 100644
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
@@ -691,7 +681,7 @@ static void s3c24xx_i2c_wait_idle(struct s3c24xx_i2c *i2c)
 static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
 			      struct i2c_msg *msgs, int num)
 {
-	unsigned long timeout;
+	unsigned long timeout = 0;
 	int ret;
 
 	ret = s3c24xx_i2c_set_master(i2c);
@@ -711,16 +701,21 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
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
+		goto skip_waiting;
 	}
 
 	timeout = wait_event_timeout(i2c->wait, i2c->msg_num == 0, HZ * 5);
 
+ skip_waiting:
 	ret = i2c->msg_idx;
 
 	/*
-- 
2.34.1

