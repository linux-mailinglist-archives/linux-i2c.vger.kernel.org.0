Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33657794423
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 22:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233963AbjIFUA7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 16:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243632AbjIFUAl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 16:00:41 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD0F519A0
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 13:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=k1; bh=VJ3mLrt5G3E1weRn20fSYxodtrWVlLm96b4uFr3fzos=; b=aZkUzC
        6+9fOrQWoPE38eJ2s/a9wtqjWxSe09Lk7hVxr9EaWPgXmsAdKltFIBL6ocJlPUD+
        3yXiLSSRcaB6GxzZTBlem1/JbPKjFVUcLlCbSGeH986ofxC3uzVBmphK6wM8Qzs+
        CnrhsLBDZeZ3tIwuw3kW/+nwpae/bdDgRpmffk75K8lYv2/2gP+WnVfEP88dVqZF
        T1dW1aRqgSRcALSqQ5vLM4Pxge8LB9Au6uOfveg35m4d0Fs/fh1WVyl1ii7oysyT
        EerjpVimxgAk5ONL0lWoveZumXoHNvNUo2ZDlbLIPQ7aaQpoJXOE5jXB5Wh8FM4d
        xiFh9DwHXLP3F+ng==
Received: (qmail 2929830 invoked from network); 6 Sep 2023 22:00:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2023 22:00:27 +0200
X-UD-Smtp-Session: l3s3148p1@iKnfMbYEJIsgAQnoAFZhALrSGIaWNE/A
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] i2c: rcar: properly format a debug output
Date:   Wed,  6 Sep 2023 22:00:20 +0200
Message-Id: <20230906200024.5305-3-wsa+renesas@sang-engineering.com>
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

Use proper types and spacing.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 49dfbeebf6b8..4bf47e35094f 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -323,7 +323,7 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 	if (scgd == 0x40)
 		goto err_no_val;
 
-	dev_dbg(dev, "clk %d/%d(%lu), round %u, CDF:0x%x, SCGD: 0x%x\n",
+	dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u, SCGD: %u\n",
 		scl, t.bus_freq_hz, rate, round, cdf, scgd);
 
 	/* keep icccr value */
-- 
2.35.1

