Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21AA57E5BA0
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Nov 2023 17:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbjKHQoJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Nov 2023 11:44:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjKHQoI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Nov 2023 11:44:08 -0500
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E0FA1FE7
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 08:44:06 -0800 (PST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20231108164404euoutp016ccbcaf799afd565afd9a49c70dd6edb~Vs4szpBVd1667816678euoutp01I
        for <linux-i2c@vger.kernel.org>; Wed,  8 Nov 2023 16:44:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20231108164404euoutp016ccbcaf799afd565afd9a49c70dd6edb~Vs4szpBVd1667816678euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1699461844;
        bh=+fxGh0F2jh5WLjDPhQfaN5Ox2KF8VceXdmWAUqrEtYA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=urKWOBNrmNI1A2mqlb9XnjRKasfR8IL8VzkA7pS1+WqudOynRrVnPGUvdPqpuuIxc
         I0opGqJMu7RX0G4lkfbYVMgxrc2oj982KovlBOlYnkD1FYGnvHz40H5gTp/5x8GQrr
         ppPqxT4wzee1cJJaRzGkG3cE1yKLyTXQukdclFbM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20231108164404eucas1p10c37b7f63fcda0e722054080041dd191~Vs4sV61-P0870608706eucas1p1u;
        Wed,  8 Nov 2023 16:44:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 95.D2.42423.4DABB456; Wed,  8
        Nov 2023 16:44:04 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20231108164404eucas1p2fab093d286ef3c118f63bdc375964776~Vs4sBgv0G0157401574eucas1p2s;
        Wed,  8 Nov 2023 16:44:04 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231108164403eusmtrp2c372e8b21f0aea4efba9a59f62810d04~Vs4sA3DFp2869728697eusmtrp2E;
        Wed,  8 Nov 2023 16:44:03 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-1e-654bbad4429f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 79.12.25043.3DABB456; Wed,  8
        Nov 2023 16:44:03 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231108164403eusmtip28a7163c316b152ef92196a14a2a86518~Vs4rdcjUL1025410254eusmtip2E;
        Wed,  8 Nov 2023 16:44:03 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v4 1/3] i2c: s3c24xx: fix read transfers in polling mode
Date:   Wed,  8 Nov 2023 17:43:52 +0100
Message-Id: <20231108164354.712406-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231108164354.712406-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZduzned0ru7xTDS7PF7R4MG8bm8X9rx2M
        Fpf3a1vsfb2V3aLj7xdGixnn9zFZrD1yl93i7v65jA4cHptWdbJ53Lm2h82jb8sqRo/Pm+QC
        WKK4bFJSczLLUov07RK4Mh4d/M9UcIarYtnPLqYGxvMcXYycHBICJhL3D2xk72Lk4hASWMEo
        sWvOYTaQhJDAF0aJPeskIezPjBJH3wfCNEy61M8K0bCcUeLT8euMEA5Qw5wvk9lBqtgEDCW6
        3naBTRIRcJCYt/Y7WJxZ4B+jxPcveiC2sICHxMcp88DiLAKqErd+gkzl5OAVsJNY39TGDLFN
        XmL/wbNgNqeAvUT3hNnsEDWCEidnPmGBmCkv0bx1NjPIERICOzgkvkxdBVTEAeS4SDQvK4eY
        Iyzx6vgWdghbRuL/zvlMEPXtjBILft+HciYwSjQ8v8UIUWUtcefcLzaQQcwCmhLrd+lDzHSU
        +PmNC8Lkk7jxVhDiBD6JSdumM0OEeSU62oQgZqhJzDq+Dm7rwQuXoL7ykLj6cDvjBEbFWUie
        mYXkmVkIaxcwMq9iFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQITDKn/x3/tINx7quPeocY
        mTgYDzFKcDArifD+tfdIFeJNSaysSi3Kjy8qzUktPsQozcGiJM6rmiKfKiSQnliSmp2aWpBa
        BJNl4uCUamCa8kHIJd6p33eV6Y0rW+dEMV6xLLWS7Cjbn7D+orLgyzUN80pY1L/zdeo45VqH
        rnHXyFhfaaQQN1fN8eDJXee0HaZENe/sdfmkaHL07on0g1/qH6935rR44vdljffVUzdq9hbx
        NvKccjk0rTDIVmbFmUyXpDT5B7Nf+1gYXpo5VUzof5ft5yt5OlbiF+/3iq6oYSv8yrGOSWS6
        Fp+5UcOrZPXA6Folc5/eufa9s+bvfqvbdGLen6emsrfumVxIejG71T4naXZ6eNqpF14GYj0G
        /U73W7+2amkfdHyc1Gn4fP4cj8LEdSvu370YmmGi/nSH3PubjjH5Gfu9N6Z2dz5KeOfveGJS
        2oUCnhSWLiWW4oxEQy3mouJEAE7zNiqhAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsVy+t/xe7qXd3mnGsxcaWHxYN42Nov7XzsY
        LS7v17bY+3oru0XH3y+MFjPO72OyWHvkLrvF3f1zGR04PDat6mTzuHNtD5tH35ZVjB6fN8kF
        sETp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZTw6
        +J+p4AxXxbKfXUwNjOc5uhg5OSQETCQmXepn7WLk4hASWMoocefyUXaIhIzEyWkNrBC2sMSf
        a11sILaQwCdGiQeT0kFsNgFDia63EHERASeJ24tmgQ1iFmhikug4sQhskLCAh8THKfPAbBYB
        VYlbP/vBhvIK2Emsb2pjhlggL7H/4Fkwm1PAXqJ7wmx2iGV2Et8vHGaDqBeUODnzCQuIzQxU
        37x1NvMERoFZSFKzkKQWMDKtYhRJLS3OTc8tNtIrTswtLs1L10vOz93ECIyJbcd+btnBuPLV
        R71DjEwcjIcYJTiYlUR4/9p7pArxpiRWVqUW5ccXleakFh9iNAW6eyKzlGhyPjAq80riDc0M
        TA1NzCwNTC3NjJXEeT0LOhKFBNITS1KzU1MLUotg+pg4OKUamNYx3tZxeLTgbs8GQR0zLuaX
        CfOvt30v/2Z11WNK6Rstj+J1Kuu371vPt8ij13VH+PbdvSEvG+Q3/Y64XufD+WrGzXgm1sCE
        K+dcfkjcbr946VaoQ0rY5XULeM1aHp4N0ud6ftrJ03tB5GZpPyfOvLjpT7qM/av3T4qN/r6R
        UddgyUJj/oOCW2dpz+ruUfC+65TxVDjjudPio5P6dVfKKGRaNuifXXB4skHVo9JPi3g8N0da
        z51h76OjKvT9qFBJtNHEd1dmnT56/Pryb8Wqyp/6gviecgsYsHQbzFxbv+64yNt59pZe/Qy7
        XS/UHE/0kPW+FLFxTv76+XURSx/cZ7wQOk3Wpe3x+qLHKa9XPVViKc5INNRiLipOBACvzYGf
        EgMAAA==
X-CMS-MailID: 20231108164404eucas1p2fab093d286ef3c118f63bdc375964776
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231108164404eucas1p2fab093d286ef3c118f63bdc375964776
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231108164404eucas1p2fab093d286ef3c118f63bdc375964776
References: <20231108164354.712406-1-m.szyprowski@samsung.com>
        <CGME20231108164404eucas1p2fab093d286ef3c118f63bdc375964776@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

To properly handle read transfers in polling mode, no waiting for the ACK
state is needed as it will never come. Just wait a bit to ensure start
state is on the bus and continue processing next bytes.

Fixes: 117053f77a5a ("i2c: s3c2410: Add polling mode support")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Chanho Park <chanho61.park@samsung.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-s3c2410.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index c56886af724e..bf9a5670ef33 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -216,8 +216,17 @@ static bool is_ack(struct s3c24xx_i2c *i2c)
 	int tries;
 
 	for (tries = 50; tries; --tries) {
-		if (readl(i2c->regs + S3C2410_IICCON)
-			& S3C2410_IICCON_IRQPEND) {
+		unsigned long tmp = readl(i2c->regs + S3C2410_IICCON);
+
+		if (!(tmp & S3C2410_IICCON_ACKEN)) {
+			/*
+			 * Wait a bit for the bus to stabilize,
+			 * delay estimated experimentally.
+			 */
+			usleep_range(100, 200);
+			return true;
+		}
+		if (tmp & S3C2410_IICCON_IRQPEND) {
 			if (!(readl(i2c->regs + S3C2410_IICSTAT)
 				& S3C2410_IICSTAT_LASTBIT))
 				return true;
-- 
2.34.1

