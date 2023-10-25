Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 328E37D6B22
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Oct 2023 14:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343767AbjJYMRu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Oct 2023 08:17:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343843AbjJYMRq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Oct 2023 08:17:46 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A4F13D
        for <linux-i2c@vger.kernel.org>; Wed, 25 Oct 2023 05:17:41 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231025121739euoutp029d8adec685355ee4509e7e13a1d7f198~RWOF7hhyF2623326233euoutp02E
        for <linux-i2c@vger.kernel.org>; Wed, 25 Oct 2023 12:17:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231025121739euoutp029d8adec685355ee4509e7e13a1d7f198~RWOF7hhyF2623326233euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698236259;
        bh=EaxngnN5GPuk7N9hQGHXw/8N7rRnuHbLIX0yHopRP18=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QB34PelVVNndRMDWQtZ0Ro9Mxnkdrf5JcYTpuYC7OkVflDKjyEqJYdhwo1Qfu7vVL
         e/cRyrn991s2d179l0UxzglTALq9s1vqWMQuN83S3g6z1YIQQ0etuJ9bFruxj9QbMn
         nqBePJabDFlwjuKvtq0yl14EjYbHuP3v7zIHlzkg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20231025121739eucas1p2bc0ec9c4828ca17177f534a268b82d2b~RWOFnbw1V1712917129eucas1p2G;
        Wed, 25 Oct 2023 12:17:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 7E.C0.11320.36709356; Wed, 25
        Oct 2023 13:17:39 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20231025121739eucas1p26ce7f34cb63076626d40e08962497a0b~RWOFTaJvv1086510865eucas1p2Z;
        Wed, 25 Oct 2023 12:17:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231025121739eusmtrp250f7e8c7f1cae10e6786c4039a6fb2a9~RWOFSrpmg0245102451eusmtrp2H;
        Wed, 25 Oct 2023 12:17:39 +0000 (GMT)
X-AuditID: cbfec7f4-97dff70000022c38-39-6539076321e9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 7F.CA.10549.36709356; Wed, 25
        Oct 2023 13:17:39 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231025121738eusmtip2b03099c0b30b3ae265b5595f06226191~RWOE1zQF_0359003590eusmtip2d;
        Wed, 25 Oct 2023 12:17:38 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH v2 2/3] i2c: s3c24xx: fix transferring more than one message
 in polling mode
Date:   Wed, 25 Oct 2023 14:17:24 +0200
Message-Id: <20231025121725.46028-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025121725.46028-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42LZduzned1kdstUg4s7FS0ezNvGZnH/awej
        xd7XW9ktOv5+YbSYcX4fk8XaI3fZLe7un8vowO6xaVUnm8eda3vYPPq2rGL0+LxJLoAlissm
        JTUnsyy1SN8ugSvj8+m9bAV3hStmbF3H3sDYLdDFyMkhIWAi8fDbB8YuRi4OIYEVjBLPbnSw
        QzhfGCV6931lgXA+M0rc3TOXCaZlyqlPzBCJ5YwS/56fZINrab5zmhWkik3AUKLrbRcbiC0i
        4CAxb+13sLnMApcZJabN2QY2SlggTuLFyi5GEJtFQFVi+8omMJtXwFbix4u5bBDr5CX2HzzL
        DGJzCthJfF3xHapGUOLkzCcsIDYzUE3z1tlgJ0kI7OGQmPJzDwtEs4vE2dWfWCFsYYlXx7ew
        Q9gyEv93zmeCaGhnlFjw+z6UM4FRouH5LUaIKmuJO+d+AZ3BAbRCU2L9Ln2IsKPE2QMbmEDC
        EgJ8EjfeCkIcwScxadt0Zogwr0RHmxBEtZrErOPr4NYevHCJGcL2kDj+cSbjBEbFWUjemYXk
        nVkIexcwMq9iFE8tLc5NTy02ykst1ytOzC0uzUvXS87P3cQITDOn/x3/soNx+auPeocYmTgY
        DzFKcDArifBG+likCvGmJFZWpRblxxeV5qQWH2KU5mBREudVTZFPFRJITyxJzU5NLUgtgsky
        cXBKNTBJqB19sYUj5dj0NVLXcnPuLt795/1RzRTfd+7yLBP0Ji37l+P0Jy5tzZqGBydPLLk2
        t7b6oKy2ocrxZLErSz00TzpYhf//7nc3XpBH2cjzVJ1vJm/5kbYDh85PX5m+eG7WTp5ZrM+O
        bbm1pPPP42jlM/2vVfq++yRtub6p8+K3P9y9Rb3fKmS+LZqYu2SpUFhd1NE4s+0Vj3eFaR8Q
        Tq7PaCs6dDHfQqfw8q2tT3rT52qUZC5asfWbYsuJKOWpN/wvbMr4XREqzbPIkcU6uGaBwJWn
        akJ35kVpv7Gb83vPzz5vmb29Xt0RwsvkDRxFtrZZCRlO2RDwRjKj+Krg0zb/TOX0QM6cu3/2
        2n56fc9HiaU4I9FQi7moOBEACwcw4KIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNLMWRmVeSWpSXmKPExsVy+t/xe7rJ7JapBt938lo8mLeNzeL+1w5G
        i72vt7JbdPz9wmgx4/w+Jou1R+6yW9zdP5fRgd1j06pONo871/awefRtWcXo8XmTXABLlJ5N
        UX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G59N72Qru
        ClfM2LqOvYGxW6CLkZNDQsBEYsqpT8xdjFwcQgJLGSUe/TjOApGQkTg5rYEVwhaW+HOtiw2i
        6BOjxNPFU5hAEmwChhJdb0ESnBwiAk4StxfNYgUpYha4zijx/cA/xi5GDg5hgRiJswflQGpY
        BFQltq9sYgSxeQVsJX68mMsGsUBeYv/Bs8wgNqeAncTXFd/BaoSAanYf72SHqBeUODnzCdhx
        zED1zVtnM09gFJiFJDULSWoBI9MqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwFjYduzn5h2M
        81591DvEyMTBeIhRgoNZSYQ30sciVYg3JbGyKrUoP76oNCe1+BCjKdDdE5mlRJPzgdGYVxJv
        aGZgamhiZmlgamlmrCTO61nQkSgkkJ5YkpqdmlqQWgTTx8TBKdXAxPlI9m6jSPZS1afvXl3N
        tCr73rHp09rLH8rDTTbUG+3nX12rZbKD++T57ezLi/zXXl4b2zPjnfGryd/+fI+4JqZ8L/mq
        fWWwrUmXeMwyqxcfhU7+r/l7arF30H2Je1w5JWkJZ1mP/C97mfEzqfAHg+cj/jOi267Utn3l
        Z3ld/H4C4/IphloTPrTXfN01MeHl79yHS2I9VRa5NR9Yxb2sarWV2kH+BUL7TQr3LxCOP95U
        c2p17imVS7v7PFblz2RPZpNYbSH/xZLr85Gz0XGP85n9J89MXPHpiHouU6BwetXlVX88J5yI
        Nbsq/PPPfKt0JtHzp59wnu67EOt1RdTIl6/zgGXHIRbp75d/Sb7RMVdiKc5INNRiLipOBAAC
        ZygwDgMAAA==
X-CMS-MailID: 20231025121739eucas1p26ce7f34cb63076626d40e08962497a0b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231025121739eucas1p26ce7f34cb63076626d40e08962497a0b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231025121739eucas1p26ce7f34cb63076626d40e08962497a0b
References: <20231025121725.46028-1-m.szyprowski@samsung.com>
        <CGME20231025121739eucas1p26ce7f34cb63076626d40e08962497a0b@eucas1p2.samsung.com>
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

