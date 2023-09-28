Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81F8C7B25E8
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 21:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbjI1TYd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 15:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjI1TYb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 15:24:31 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B11E1A2
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 12:24:29 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20230928192427euoutp026045c6a0e8bae29c5aa0161c76a15344~JJoBrNWz90642006420euoutp02V
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 19:24:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20230928192427euoutp026045c6a0e8bae29c5aa0161c76a15344~JJoBrNWz90642006420euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1695929067;
        bh=GFOyU81B/Zw0ASGJNMLnJcw4VVGvy7QuYTXBvsRx+xQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=A8k+eG2amUBfRrEN/nSRgUUQeLsrCAc/VPgQf8jAMD0Xngi9t1Q/8eeVwFhTFFyJ7
         i5LHredwrBnakxBO4cY7V6A01A0ra0qC1I1/pgx57uOYS43H7bC8GlzJCpHSkCcVb4
         ycjhBcHGrUm+dgHTXNJhv/y1YlPOcT0q4ez79OtE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20230928192426eucas1p104af8583aedfa059f6ee7bad21573821~JJoAm_1Nm1181211812eucas1p17;
        Thu, 28 Sep 2023 19:24:26 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id DC.60.11320.AE2D5156; Thu, 28
        Sep 2023 20:24:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20230928192426eucas1p2b1763303daefc3fe1ac9354c17432572~JJoAOlcjT0047000470eucas1p2p;
        Thu, 28 Sep 2023 19:24:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20230928192426eusmtrp2fd6c1a553186f69c82c415e7fda1585a~JJoAOFyXz2794927949eusmtrp2l;
        Thu, 28 Sep 2023 19:24:26 +0000 (GMT)
X-AuditID: cbfec7f4-993ff70000022c38-9c-6515d2eafc61
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 02.F9.25043.AE2D5156; Thu, 28
        Sep 2023 20:24:26 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20230928192425eusmtip22b152eb299f6856c83994bbbac2651ce~JJn-y2dj12447124471eusmtip2P;
        Thu, 28 Sep 2023 19:24:25 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 1/3] i2c: s3c24xx: fix read transfers in polled mode
Date:   Thu, 28 Sep 2023 21:24:12 +0200
Message-Id: <20230928192414.258169-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230928192414.258169-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleLIzCtJLcpLzFFi42LZduznOd1Xl0RTDbbOkLF4MG8bm8X9rx2M
        Fntfb2W36Pj7hdFixvl9TBZrj9xlt7i7fy6jA7vHplWdbB53ru1h8+jbsorR4/MmuQCWKC6b
        lNSczLLUIn27BK6MCf9fsBfc5ai43MXdwDiJvYuRk0NCwESi89RFpi5GLg4hgRWMErsu3mKE
        cL4wSuybdpMZwvnMKLG98wtcy7/VU6CqljNKLJ39mhkkAdYybZcriM0mYCjR9baLDcQWEXCQ
        mLf2OztIA7PAZaCaOduYQBLCAi4SW/+9ZwWxWQRUJSa1NANN5eDgFbCT+HRSB2KZvMT+g2eZ
        QcKcAvYSFz5LgoR5BQQlTs58wgJiMwOVNG+dDXaohMAWDombrX+ZIXpdJKZ1rYeyhSVeHd8C
        9YCMxP+d85kgGtoZJRb8vg/lTGCUaHgOCgCQKmuJO+d+sYFsZhbQlFi/Sx8i7Chx9M8LsLCE
        AJ/EjbeCEEfwSUzaNp0ZIswr0dEmBFGtJjHr+Dq4tQcvXII6x0Pi1ZNTzBMYFWcheWcWkndm
        IexdwMi8ilE8tbQ4Nz212CgvtVyvODG3uDQvXS85P3cTIzC9nP53/MsOxuWvPuodYmTiYDzE
        KMHBrCTC+/C2UKoQb0piZVVqUX58UWlOavEhRmkOFiVxXm3bk8lCAumJJanZqakFqUUwWSYO
        TqkGphB7A4mb30VfpLGzhAZNPJOybNmBjtvTV93Uf3Qk8Y992vOnHd0sUuufeN0+93ZNiv+J
        Ttu8qf19pt7JR89cm1/x7Z6X/7Wt52+Lrjj/XXN/lds2+W3XopN/7e2fZla9yT3o4urob8aC
        zHbNhnOn/90i++nGvWmOU5zeV7oknl3iv+P+KQ2bVR53Rbv2PD90k8UutsDx2Tf7/nU/+pZt
        Ppp70+f73il9ZkwxAbuCtneVhdW/bT/7U+XGjYP7T1x/+bluuc7ClvNtbx4ee62mv2f73Sm3
        Nws9dM48kqFa73rI+bjX9CD+IO9Xb67Msi2dGXf/x8M3cXUf3Zb+CuoN+ia0Q/n8j0OTruYw
        Wpy5zZ60S4mlOCPRUIu5qDgRADcVN8meAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsVy+t/xe7qvLommGjzawGzxYN42Nov7XzsY
        Lfa+3spu0fH3C6PFjPP7mCzWHrnLbnF3/1xGB3aPTas62TzuXNvD5tG3ZRWjx+dNcgEsUXo2
        RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZE/6/YC+4
        y1FxuYu7gXESexcjJ4eEgInEv9VTGLsYuTiEBJYySrTfX8UKkZCRODmtAcoWlvhzrYsNougT
        o8Sn/ulsIAk2AUOJrrddYLaIgJPE7UWzWEGKmAWuM0p8P/CPESQhLOAisfXfe7BJLAKqEpNa
        moHiHBy8AnYSn07qQCyQl9h/8CwzSJhTwF7iwmdJEFMIqGLOcRWQCl4BQYmTM5+wgNjMQNXN
        W2czT2AUmIUkNQtJagEj0ypGkdTS4tz03GIjveLE3OLSvHS95PzcTYzAKNh27OeWHYwrX33U
        O8TIxMF4iFGCg1lJhPfhbaFUId6UxMqq1KL8+KLSnNTiQ4ymQEdPZJYSTc4HxmFeSbyhmYGp
        oYmZpYGppZmxkjivZ0FHopBAemJJanZqakFqEUwfEwenVAOTjoPus3U3l/0JmfmYT3B6z7dZ
        Mzmbd4u2rzD9MGGV7yuNaV4mBrNynrjFCZ7znMDAMz/13+aYh0Y/ilkMn6+0Uav79n+59bQv
        7m/F9npsndPXWuyRO32pQmDxotodfPLLkvezMhT1dOvOVnjD9YjbeUddRPRXq5B47jLZBlmf
        zZIbVk/e4CcodfZVo2TN0UvhyxjWX7E5nDBv0gHv/UetRZIMyt747Fx0t20jj/G0R+5K3+Mm
        C994FxXzVf5CHL/Y3Md5G+Mmsc3oVPWZHPGx/rug8s/Df67suN5Z/UotNVjf9lOzyo7bATLP
        jNo9np6a8bQx/4eadv/MxyWL0wuivgfMf6zO15B5ikXjsK2nEktxRqKhFnNRcSIASC0KqQsD
        AAA=
X-CMS-MailID: 20230928192426eucas1p2b1763303daefc3fe1ac9354c17432572
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230928192426eucas1p2b1763303daefc3fe1ac9354c17432572
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230928192426eucas1p2b1763303daefc3fe1ac9354c17432572
References: <20230928192414.258169-1-m.szyprowski@samsung.com>
        <CGME20230928192426eucas1p2b1763303daefc3fe1ac9354c17432572@eucas1p2.samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

To properly handle read transfers in polled mode, no waiting for the ACK
state is needed. Just wait a bit to ensure start state is on the bus and
continue processing bytes.

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

