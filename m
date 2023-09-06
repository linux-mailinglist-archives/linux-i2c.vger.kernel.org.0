Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFFD779442A
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 22:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243961AbjIFUBM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 16:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243302AbjIFUAr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 16:00:47 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0417919BA
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 13:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=k1; bh=qBxfS0Tf9/DuCfn43C/vkUHINEKl9b1xtv2hh3LyJBc=; b=WtJQe8
        FjFl6HiiP8WWG9mzP6zVQ7QuR9MoB+naxEwOr9MyS8o7x3/QlrqH5XO/TebRww0W
        fAErrRq3ehSD9b9bm3pBZtJ2XMU8A5p9ZRq5cISp7MVKNxmso+NseOJmbYm0g7Yb
        iFhNpMwcxmXXPXyXu29BSGqnjX4sHnm1YuhfxsgeHQLnXgDCcAkXi8BnLNzQIFN4
        CbbNdCpLNlF5jf9omb0zI1vEAof9brCMHSK7WLxJIFC1u2z4P/79658OfngiAd4k
        TFjxOYyEvw22CxnANUlUvi8C7z6+USSe0O3Dqd3TuYwHxCBv99BqC2omwJTG9lTu
        tjiE0VEaYSBWu3Xg==
Received: (qmail 2929897 invoked from network); 6 Sep 2023 22:00:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2023 22:00:29 +0200
X-UD-Smtp-Session: l3s3148p1@Rij2MbYENIsgAQnoAFZhALrSGIaWNE/A
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] i2c: rcar: remove open coded DIV_ROUND_CLOSEST
Date:   Wed,  6 Sep 2023 22:00:22 +0200
Message-Id: <20230906200024.5305-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230906200024.5305-1-wsa+renesas@sang-engineering.com>
References: <20230906200024.5305-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It improves readability if we use the available helper.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 2585092bed52..5e97635faf78 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -291,16 +291,15 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 	ick = rate / (cdf + 1);
 
 	/*
-	 * it is impossible to calculate large scale
-	 * number on u32. separate it
+	 * It is impossible to calculate a large scale number on u32. Separate it.
 	 *
 	 * F[(ticf + tr + intd) * ick] with sum = (ticf + tr + intd)
 	 *  = F[sum * ick / 1000000000]
 	 *  = F[(ick / 1000000) * sum / 1000]
 	 */
 	sum = t.scl_fall_ns + t.scl_rise_ns + t.scl_int_delay_ns;
-	round = (ick + 500000) / 1000000 * sum;
-	round = (round + 500) / 1000;
+	round = DIV_ROUND_CLOSEST(ick, 1000000);
+	round = DIV_ROUND_CLOSEST(round * sum, 1000);
 
 	/*
 	 * SCL	= ick / (20 + 8 * SCGD + F[(ticf + tr + intd) * ick])
-- 
2.35.1

