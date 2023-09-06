Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A12BE794426
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 22:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243611AbjIFUBB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 16:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243687AbjIFUAr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 16:00:47 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8624119B6
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 13:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=k1; bh=xJsHUvQhrLbRjhVbZzw9GQZf+nq+ia33sWzU4P2ylJo=; b=LLsSji
        ouIYueos70JY0o2u+vtusywFfMoaEnLidS6PvOdmV4mHgxGynGnGfcixrXic068k
        IetzyAorzwCMqmRanV98lI/fGLmh+onLxnL3uUgb5e6RpTjzOSYt0wDjvJ/21Ah1
        +0kKr8neBy5ptgfxZjICHX2SJzuJsfRYN5sVo5mRwYDnpXfXYf8+l6EIBtYzSD6a
        tbLBr2+rSAZwzYLg7rP8iCn7bzZSqr8zPOwAfSHPEKD8U9bbZWvT5ClvSkyB+rUP
        nSxkHiT+2kemliuzqSYlp1moanQNvTaTFoYz9QrFDavMhQa3XCGZcnYvemLSG2hL
        RG+5fConjg1c2SAA==
Received: (qmail 2929864 invoked from network); 6 Sep 2023 22:00:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2023 22:00:28 +0200
X-UD-Smtp-Session: l3s3148p1@CvrqMbYELIsgAQnoAFZhALrSGIaWNE/A
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] i2c: rcar: calculate divider instead of brute-forcing it
Date:   Wed,  6 Sep 2023 22:00:21 +0200
Message-Id: <20230906200024.5305-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230906200024.5305-1-wsa+renesas@sang-engineering.com>
References: <20230906200024.5305-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Instead of trying all values, we can actually compute it as the comment
suggests. It is unclear what the comment means with "involved", it works
nicely.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

@Geert: I hope the formulas are more clear now?
@Andi: I don't think that replacing 0x3f with a define helps
understanding the code, but I am open for discussion.

 drivers/i2c/busses/i2c-rcar.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 4bf47e35094f..2585092bed52 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -303,24 +303,16 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 	round = (round + 500) / 1000;
 
 	/*
-	 * SCL	= ick / (20 + SCGD * 8 + F[(ticf + tr + intd) * ick])
-	 *
-	 * Calculation result (= SCL) should be less than
-	 * bus_speed for hardware safety
-	 *
-	 * We could use something along the lines of
-	 *	div = ick / (bus_speed + 1) + 1;
-	 *	scgd = (div - 20 - round + 7) / 8;
-	 *	scl = ick / (20 + (scgd * 8) + round);
-	 * (not fully verified) but that would get pretty involved
+	 * SCL	= ick / (20 + 8 * SCGD + F[(ticf + tr + intd) * ick])
+	 * 20 + 8 * SCGD + F[...] = ick / SCL
+	 * SCGD = ((ick / SCL) - 20 - F[...]) / 8
+	 * Result (= SCL) should be less than bus_speed for hardware safety
 	 */
-	for (scgd = 0; scgd < 0x40; scgd++) {
-		scl = ick / (20 + (scgd * 8) + round);
-		if (scl <= t.bus_freq_hz)
-			break;
-	}
+	scgd = DIV_ROUND_UP(ick, t.bus_freq_hz ?: 1);
+	scgd = DIV_ROUND_UP(scgd - 20 - round, 8);
+	scl = ick / (20 + 8 * scgd + round);
 
-	if (scgd == 0x40)
+	if (scgd > 0x3f)
 		goto err_no_val;
 
 	dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u, SCGD: %u\n",
-- 
2.35.1

