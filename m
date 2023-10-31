Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 256817DCF72
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 15:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344317AbjJaOnI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 10:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbjJaOnG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 10:43:06 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE4C6F4
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 07:43:03 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20231031144300euoutp0289afe2a02c38d91df81ba37c6ea60dcb~TOEtY0gXZ2615926159euoutp02J
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 14:43:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20231031144300euoutp0289afe2a02c38d91df81ba37c6ea60dcb~TOEtY0gXZ2615926159euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1698763380;
        bh=904cUKyVQZK/KgbJ73bN/05Obq8ZP8p+O3KY1ovxV50=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nIhANSsluH24JFeUhDgPZNtHvwlifw9+LHE8lYhQQ1ADz/OleDQX6YChobWNlyi+x
         gBh/FFHiNgrOp6AkzK72oWuVTCiLDNxssgcEcnLyN5syznQb9vnukBBQQIpTa5+sb8
         uI/lLZ2l22FEMEKALm1R+hijFnKHFvnCcXXG/jRw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20231031144300eucas1p11ba954c862cdf0fa87a2ab7d3c50f32c~TOEtHVpJU3036530365eucas1p1W;
        Tue, 31 Oct 2023 14:43:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 79.F5.11320.47211456; Tue, 31
        Oct 2023 14:43:00 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20231031144300eucas1p2c7d05a247469cec1bf3aec978bbd58d1~TOEswInTS1408414084eucas1p2J;
        Tue, 31 Oct 2023 14:43:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20231031144300eusmtrp2f4ad919247e63a78b0cb8ab35e93763c~TOEsviMkY2445524455eusmtrp2p;
        Tue, 31 Oct 2023 14:43:00 +0000 (GMT)
X-AuditID: cbfec7f4-993ff70000022c38-6c-65411274787e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 85.7A.10549.37211456; Tue, 31
        Oct 2023 14:42:59 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20231031144259eusmtip23b087c17714f9b0cca3c38a0518ca0ac~TOEsMRynK1957719577eusmtip2O;
        Tue, 31 Oct 2023 14:42:59 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH v3 1/3] i2c: s3c24xx: fix read transfers in polling mode
Date:   Tue, 31 Oct 2023 15:42:50 +0100
Message-Id: <20231031144252.2112593-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031144252.2112593-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleLIzCtJLcpLzFFi42LZduznOd0SIcdUg1ufRS0ezNvGZnH/awej
        xeX92hZ7X29lt+j4+4XRYsb5fUwWa4/cZbe4u38uowOHx6ZVnWwed67tYfPo27KK0ePzJrkA
        ligum5TUnMyy1CJ9uwSujC3PKwrWc1ZsaDZuYLzJ3sXIySEhYCLxadYDti5GLg4hgRWMEp8P
        X2aEcL4wSlz7/pYVwvnMKHHw2n82mJYHmx9CJZYzSvxq2MwC13L/yCMWkCo2AUOJrrddYB0i
        Ag4S89Z+B1vILPCPUeL7Fz0QW1jAQ+Lz9n6mLkYODhYBVYlLU2VAwrwC9hJrXz9hhFgmL7H/
        4FlmkBJOoDErz1RBlAhKnJz5hAViorxE89bZzCAnSAjs4JCYvegiM0Svi0Rj3zsoW1ji1fEt
        UD/LSPzfOZ8JoqGdUWLB7/tQzgRGiYbnt6A2W0vcOfeLDWQzs4CmxPpd+hBhR4kpPX8YQcIS
        AnwSN94KQhzBJzFp23RmiDCvREebEES1msSs4+vg1h68cAmqxENi8ZzQCYyKs5B8MwvJN7MQ
        1i5gZF7FKJ5aWpybnlpslJdarlecmFtcmpeul5yfu4kRmGJO/zv+ZQfj8lcf9Q4xMnEwHmKU
        4GBWEuE9bOqQKsSbklhZlVqUH19UmpNafIhRmoNFSZxXNUU+VUggPbEkNTs1tSC1CCbLxMEp
        1cC0VvhcdMlk8/ifCg8UW9cnJem7B3m7qKyb+r43lWdvvvvutdlKt/nD932Sm3VPQPpaLMvZ
        tSz7d38/7m76+0PkH4VX16Z7/lnLuaPhyE9bd/XKh96aZYdynmznsmty1PedUfPra9FaowZp
        ZuNr33QvzDcXWXHiQUrezm+7NX0O6tRsnfZaT63+meamPZ6zpcpOLI+94+a9JMwhfd534SUb
        WEqaX8+dqjzpc22FssppH66HSjEV/2KfW9rLl1w4vqo1VohpWuXL0y/CO+dPr/5l/dfupbF6
        jEFEXpH3q3wf1oeXlPqmHuZimDW3cEPf1cS4GY6vf+5wX/D+zmv2nQ5875f4eeZHzJhzzO/m
        qhXRSizFGYmGWsxFxYkAY7uVYKADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRmVeSWpSXmKPExsVy+t/xe7rFQo6pBpNumVk8mLeNzeL+1w5G
        i8v7tS32vt7KbtHx9wujxYzz+5gs1h65y25xd/9cRgcOj02rOtk87lzbw+bRt2UVo8fnTXIB
        LFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GVue
        VxSs56zY0GzcwHiTvYuRk0NCwETiweaHrF2MXBxCAksZJZa1dzNCJGQkTk5rYIWwhSX+XOti
        gyj6xCix9eN6FpAEm4ChRNdbkAQnh4iAk8TtRbPAJjELNDFJdJxYBLZCWMBD4vP2fqYuRg4O
        FgFViUtTZUDCvAL2EmtfP4FaJi+x/+BZZpASTgEHiZVnqkDCQkAlt060M0GUC0qcnPkEbC0z
        UHnz1tnMExgFZiFJzUKSWsDItIpRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMwGrYd+7l5B+O8
        Vx/1DjEycTAeYpTgYFYS4T1s6pAqxJuSWFmVWpQfX1Sak1p8iNEU6OqJzFKiyfnAeMwriTc0
        MzA1NDGzNDC1NDNWEuf1LOhIFBJITyxJzU5NLUgtgulj4uCUamBi2HdXP2dusPTZ8oPel6fs
        dFlat2tSTOOXtkvVH7Y95p9S+bEwzrTtSr3c5IuVTslHAj/Ybj3psHLOgW2dJm/5xZu2NAdP
        SXIr0N6+d0mHxLt4V0b2ZZl1tyX2OOltqoy19wpJnppUkrL/5/madkbu7+ssd7al/DeV2qd4
        YUt35QK1hOfPdrzX4Jx086Dwi9Ohzgb9q78d4/htvvAl19z6zzeFd/qyXZ+1d9dXobSrIrFs
        j0t7yp7GRv03cDMwuyf5LcFKf0/a/clpCXXflm5LkW/ctUZQx6axPv9u/Mwmg2PGNk0Vyocy
        HS6davpkabrimND6zSccHmjmnvCb3Lh7hkpowhL234yTH6su4qhQYinOSDTUYi4qTgQAFPia
        NA8DAAA=
X-CMS-MailID: 20231031144300eucas1p2c7d05a247469cec1bf3aec978bbd58d1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231031144300eucas1p2c7d05a247469cec1bf3aec978bbd58d1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231031144300eucas1p2c7d05a247469cec1bf3aec978bbd58d1
References: <20231031144252.2112593-1-m.szyprowski@samsung.com>
        <CGME20231031144300eucas1p2c7d05a247469cec1bf3aec978bbd58d1@eucas1p2.samsung.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
Reviewed-by: Chanho Park <chanho61.park@samsung.com>
---
 drivers/i2c/busses/i2c-s3c2410.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index c56886af724e..bcc6afe2ccb5 100644
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

