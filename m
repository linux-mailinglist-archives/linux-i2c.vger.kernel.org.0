Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE44B245A9
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 03:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbfEUBfk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 May 2019 21:35:40 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44203 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbfEUBfk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 May 2019 21:35:40 -0400
Received: by mail-pl1-f196.google.com with SMTP id c5so7550024pll.11
        for <linux-i2c@vger.kernel.org>; Mon, 20 May 2019 18:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=gb0yL9y2PsgXv4WkLnp+y0ZvUFalduQd+9R0GCqrRt8=;
        b=aPaYQvTdfXoDsxffozfBVMLrNC6CfQoqAEeXj3RyJEKRtqYr3cGwN778STMweLrGsS
         9mXUBby7aD4IhxKORduCe9wtYdc8dVjYHekFffs/jpDxab5caXTWmZ2Gg1b41GCk9QTu
         +I1YhquIi1zTTpJnbYS5H5ffiWfWLzjYyVIcyiP5aaXgtDAFxqimvYv4ses3gqLPUN0y
         lM29y8sZpSOv5m3xm5rHEA2MfLmfg24HLJiLbQhQ6HZ2EsdYWFjbZ/OBlJZFm6/GBGJ7
         dIDCP2/35Gq8YcgjyxbG8kZDUVKImdeKf9jAE059kf7lJUOBXun1DCwJ/Le19uatZNnf
         i68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gb0yL9y2PsgXv4WkLnp+y0ZvUFalduQd+9R0GCqrRt8=;
        b=nJK1/FTRlhLz7owjBi4+hTz/p/JtkvDIQSLOoMAMvAr/hxvH1BfA6FYsvs1kGmnNLG
         LnNukxxhMaK1SESH3RQESxUCR0BWWqp16DiZ9l8OJztAfP0A65gfh18y0pHm/RB694/B
         +1ruUW21jJrA+LAf5u/DEdPqiNx4xpUqA12DHZb/nxW/laz3S8xInVFbbDWnyBpYzP2c
         h2yQy3F4FLhQ2R/MXikaIWchEXWnx7kZ09qZpszY4oFq1z7bzggY6aibaj/8d86HNevd
         qzdy/Hq914hFv1Mp5tbnVA0N47jlb8JJXXcUlHlcxKbFWEo/sjzwDmyfIQFiNm0pMFlK
         /Zlg==
X-Gm-Message-State: APjAAAUqGXLNdQSre5+mwi1wzrAsJnd7w7tZVRbD/cmR9R2tnT02VlQ/
        mOPvu0ju521DEAdWhe8YNF0wutX+rCw=
X-Google-Smtp-Source: APXvYqxFvYhB8iec4KLUGC0uHxfaamJc6Vg/MyONFtLNPddBKFlolINF2mRmLHGEvBeDjnUKUgAxCg==
X-Received: by 2002:a17:902:7044:: with SMTP id h4mr18487738plt.219.1558402539873;
        Mon, 20 May 2019 18:35:39 -0700 (PDT)
Received: from localhost ([121.95.100.191])
        by smtp.gmail.com with ESMTPSA id q17sm31958773pfq.74.2019.05.20.18.35.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 18:35:39 -0700 (PDT)
From:   Masahisa Kojima <masahisa.kojima@linaro.org>
To:     linux-i2c@vger.kernel.org, ard.biesheuvel@linaro.org
Cc:     okamoto.satoru@socionext.com,
        Masahisa Kojima <masahisa.kojima@linaro.org>
Subject: [PATCH] i2c: synquacer: fix synquacer_i2c_doxfer() return value
Date:   Tue, 21 May 2019 10:33:50 +0900
Message-Id: <20190521013350.8426-1-masahisa.kojima@linaro.org>
X-Mailer: git-send-email 2.14.2
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

master_xfer should return the number of messages successfully
processed.

Fixes: 0d676a6c4390 ("i2c: add support for Socionext SynQuacer I2C controller")
Cc: <stable@vger.kernel.org> # v4.19+
Signed-off-by: Okamoto Satoru <okamoto.satoru@socionext.com>
Signed-off-by: Masahisa Kojima <masahisa.kojima@linaro.org>
---
 drivers/i2c/busses/i2c-synquacer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index f14d4b3fab44..f724c8e6b360 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -351,7 +351,7 @@ static int synquacer_i2c_doxfer(struct synquacer_i2c *i2c,
 	/* wait 2 clock periods to ensure the stop has been through the bus */
 	udelay(DIV_ROUND_UP(2 * 1000, i2c->speed_khz));
 
-	return 0;
+	return ret;
 }
 
 static irqreturn_t synquacer_i2c_isr(int irq, void *dev_id)
-- 
2.14.2

