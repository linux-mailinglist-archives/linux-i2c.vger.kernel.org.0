Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11D9D794421
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 22:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243566AbjIFUAu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 16:00:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235285AbjIFUAl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 16:00:41 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADD2C19AB
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 13:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=k1; bh=XoiQxYsYwOkc6ek7lwwO9Ez6SawCuS1deuBN1MfPurg=; b=Egtst9
        yM4k4fxaCGvLCDq51Lf7uyTG7MU4U4qeniiDJpCo5XtVXBUGvTkJUR75yFlHTaRh
        EMpQorbsTg34hDpsm0NoOIXEPdp8bNM1VA2xD2rEchBy7DWSUsqsDG71Sv9CdTaF
        acai0tkQAscVvRkbywFCqUuCAKnGXprBQe4HKmb6vlbYS9hGRb/kCJBqLqd0Feez
        tMEu0TDRY8fzz4nEb8yvOSiEaL5UjaHZscFsODjwxbM83EHsnngPUrC+26X1n9eU
        NQiAm3/cojYKFG2iU0C+1n8sgLsZ4w0KcK25SN2vaiOJEVorpHxbwDrZgVzxXf2I
        yQI+sJqnXiNS0X3g==
Received: (qmail 2929796 invoked from network); 6 Sep 2023 22:00:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2023 22:00:27 +0200
X-UD-Smtp-Session: l3s3148p1@xLTUMbYEFIsgAQnoAFZhALrSGIaWNE/A
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] i2c: rcar: avoid non-standard use of goto
Date:   Wed,  6 Sep 2023 22:00:19 +0200
Message-Id: <20230906200024.5305-2-wsa+renesas@sang-engineering.com>
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

Kernel functions goto somewhere on error conditions. Using goto for the
default path is irritating. Let's bail out on error instead and use a
proper retval.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I dropped the Rev-bys because I think the changes are not trivial. YMMV.

 drivers/i2c/busses/i2c-rcar.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index a32a93f9a60d..49dfbeebf6b8 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -317,12 +317,12 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 	for (scgd = 0; scgd < 0x40; scgd++) {
 		scl = ick / (20 + (scgd * 8) + round);
 		if (scl <= t.bus_freq_hz)
-			goto scgd_find;
+			break;
 	}
-	dev_err(dev, "it is impossible to calculate best SCL\n");
-	return -EIO;
 
-scgd_find:
+	if (scgd == 0x40)
+		goto err_no_val;
+
 	dev_dbg(dev, "clk %d/%d(%lu), round %u, CDF:0x%x, SCGD: 0x%x\n",
 		scl, t.bus_freq_hz, rate, round, cdf, scgd);
 
@@ -330,6 +330,10 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 	priv->icccr = scgd << cdf_width | cdf;
 
 	return 0;
+
+err_no_val:
+	dev_err(dev, "it is impossible to calculate best SCL\n");
+	return -EINVAL;
 }
 
 /*
-- 
2.35.1

