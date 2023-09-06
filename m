Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9475279442B
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 22:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244122AbjIFUBX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Sep 2023 16:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243736AbjIFUAr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Sep 2023 16:00:47 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F8B1997
        for <linux-i2c@vger.kernel.org>; Wed,  6 Sep 2023 13:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=k1; bh=b7rT9wKJbxCEtc/9yaA+sRK1E4pHjRX6I/sjz0k8OFI=; b=XkyC9W
        SX7VufPiTrmKAmknt+S/jhNIMLXAsM5CelCu9rasnkZBlJcVz8lYKgvAJAxTrKcU
        RoPxNqXTxx20jVaGWZiq9/umbtkdM3Zb5qIBjrCrXIiCiXdBJZhwBnh2R7zdA3gI
        9jb6wJ2weDhLDQ/eeaVN1SURDC4aUPY0mjBhzyxhHASxPL6EZ8pzanDZI4eu0I+X
        oAXFMUq0iR32cGvVPNedhwQ1HcupXLGPJK20bTqs/gGM+XWqHMo5N0lP52Iq5pXB
        YF0zz1cvHcT4k0gaI1Fqo1xYTtRkjosts1lpOZgxuZNc1yfatSkuyYO3sLrNIWa/
        mhya5NnN/zYNuIzw==
Received: (qmail 2929932 invoked from network); 6 Sep 2023 22:00:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Sep 2023 22:00:30 +0200
X-UD-Smtp-Session: l3s3148p1@kxsBMrYEOIsgAQnoAFZhALrSGIaWNE/A
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] i2c: riic: avoid potential division by zero
Date:   Wed,  6 Sep 2023 22:00:23 +0200
Message-Id: <20230906200024.5305-6-wsa+renesas@sang-engineering.com>
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

Value comes from DT, so it could be 0. Unlikely, but could be.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-riic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index f0ee8871d5ae..e43ff483c56e 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -313,7 +313,7 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 	 * frequency with only 62 clock ticks max (31 high, 31 low).
 	 * Aim for a duty of 60% LOW, 40% HIGH.
 	 */
-	total_ticks = DIV_ROUND_UP(rate, t->bus_freq_hz);
+	total_ticks = DIV_ROUND_UP(rate, t->bus_freq_hz ?: 1);
 
 	for (cks = 0; cks < 7; cks++) {
 		/*
-- 
2.35.1

