Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6917C791937
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 15:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242452AbjIDN7E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 09:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241890AbjIDN7E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 09:59:04 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10D5CE2
        for <linux-i2c@vger.kernel.org>; Mon,  4 Sep 2023 06:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=k1; bh=gTgG/iMjuUGFkqh+59f/9Qfbm32Y7Y4TEfEtj5suNns=; b=SXMgb0
        +Wu/GAYW2J3j4tS5XxFZmTxzhFA19xMDMOSm1T3SuYOQZhtVIQ4e2e+jPCyf2mD9
        aDc/FBuqV8zTRqSbglKqHuXBy665oc4H7uR38LiUPuPNcuyLFg1vNQcGfEd5L3XT
        aXgyNRHJQljaiHvpC+hVPdJzLwWQOd39pXWO4ynzb/rhy5LajsKUIBl/+mQSrq+j
        kptBcYo5b+kGuogr4/iKIiNbiA5ty1VEx95iq1/USGELKP0RDXgNB2kunBJvY/J3
        HTEF3phQEU6I8rPi58mLSO/7YqNiEvxyOMdDtimLgRUl/GV6bHcLWuqLFUqueE5t
        q+i0PkwS6aiR3lkw==
Received: (qmail 2131761 invoked from network); 4 Sep 2023 15:58:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Sep 2023 15:58:59 +0200
X-UD-Smtp-Session: l3s3148p1@h+xc6YgELpAgAwDPXx78AHsOvgc204Bb
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] i2c: rcar: avoid non-standard use of goto
Date:   Mon,  4 Sep 2023 15:58:49 +0200
Message-Id: <20230904135852.12146-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
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
default path is irritating. Let's bail out on error instead.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 2d9c37410ebd..f2b953df0c4d 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -317,12 +317,14 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 	for (scgd = 0; scgd < 0x40; scgd++) {
 		scl = ick / (20 + (scgd * 8) + round);
 		if (scl <= t.bus_freq_hz)
-			goto scgd_find;
+			break;
+	}
+
+	if (scgd == 0x40) {
+		dev_err(dev, "it is impossible to calculate best SCL\n");
+		return -EIO;
 	}
-	dev_err(dev, "it is impossible to calculate best SCL\n");
-	return -EIO;
 
-scgd_find:
 	dev_dbg(dev, "clk %d/%d(%lu), round %u, CDF:0x%x, SCGD: 0x%x\n",
 		scl, t.bus_freq_hz, rate, round, cdf, scgd);
 
-- 
2.35.1

