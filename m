Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C63E78239B
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Aug 2023 08:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233396AbjHUGVM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Aug 2023 02:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233392AbjHUGVL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Aug 2023 02:21:11 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D6DA7
        for <linux-i2c@vger.kernel.org>; Sun, 20 Aug 2023 23:21:08 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so3557212a12.0
        for <linux-i2c@vger.kernel.org>; Sun, 20 Aug 2023 23:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1692598866; x=1693203666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhOUt2tzecxNC3yGDp4EJrCLbLTReEQeCvGgn9oNECQ=;
        b=ZQM1yvfOVOjcoGQYSEeUL61W/8qjmfX75t6ywcuimb4Z5OGEh+9xLJMqBdpWickwAC
         71wVipcSDAzKllbVAhHEo6e6Bz6I3d7K8q6NChgRFhgqpMzs2cVlqCEIp2NTeJQ64tky
         udzhZ1+M34yeWCFYABh20rXqNcxAZ7rXX3iWN7EhSZ7pLOMdT7iYgwR0rc4uonLqyIkq
         gz3hvFU/ThRccrx3ROnG0QhiipwJDS5QYu8O7kya9BlqrkNXBLSS9/8WYv1jsPXk9tjd
         yhe6EKSmgUV6oaB1SMXRjblNUpxzB500FYclY0VQ+BswO9nUO4Kb98+hCmPdo+kpM0HI
         /igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692598866; x=1693203666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhOUt2tzecxNC3yGDp4EJrCLbLTReEQeCvGgn9oNECQ=;
        b=hC2C4TC1MdIltB7fdTxmS0HWrKO5JadLJzy+B79ke0IDWPykMyb5hmfAo8u94RlIMK
         GDU8/8vBxnTDUAf+i2pSPD3ZRO5glK7iU9mdkBBQM2aGYQG+mTwRJD5reYZZwP+ji/Rd
         ZRsINK8CUDDxZ8P2FDzanRMo1Ejy2AaKuI0l8pQK2GfN1BjbHpPn5ByjU0QdFzp4Ry3L
         UaewiWaA9VEIM4p0hmHSK77Su/IzQWFg8WeHOR+6gx7/OL+1eYCC3K01JyKdTMtji9oT
         7heFjDqE/GoIuL+f7B3surwWihkmMi8qqq2y1+ifoFawQCpsIBZNjmjMEBa3xZC98smS
         OvmQ==
X-Gm-Message-State: AOJu0YxyF/Dm4rueGg/YN6FyaXd9P7hYywPvYNJL0h0gucZLHjDlUaTZ
        i4g5kb07x79D7FbGL0qvw67ubg==
X-Google-Smtp-Source: AGHT+IEZ1WGJCViXYgku7ZS537iNI1j7BtgGYKhrahmtuPd9m/nuY+r0npj3vob2/C6pkRBxjSVxWA==
X-Received: by 2002:a05:6402:60f:b0:51d:fa7c:c330 with SMTP id n15-20020a056402060f00b0051dfa7cc330mr3787050edv.26.1692598866798;
        Sun, 20 Aug 2023 23:21:06 -0700 (PDT)
Received: from fedora.. (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id c4-20020aa7df04000000b00523b1335618sm5455003edy.97.2023.08.20.23.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 23:21:06 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     naresh.solanki@9elements.com,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [v16 4/4] i2c: muxes: pca954x: Add regulator support
Date:   Mon, 21 Aug 2023 08:20:24 +0200
Message-ID: <20230821062027.2631725-5-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821062027.2631725-1-patrick.rudolph@9elements.com>
References: <20230821062027.2631725-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a vdd regulator and enable it for boards that have the
mux powered off by default.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 32873df56e33..f36a26acb0d2 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -48,6 +48,7 @@
 #include <linux/module.h>
 #include <linux/pm.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <dt-bindings/mux/mux.h>
@@ -100,6 +101,7 @@ struct pca954x {
 	struct irq_domain *irq;
 	unsigned int irq_mask;
 	raw_spinlock_t lock;
+	struct regulator *supply;
 };
 
 /* Provide specs for the MAX735x, PCA954x and PCA984x types we know about */
@@ -447,6 +449,8 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
 	struct pca954x *data = i2c_mux_priv(muxc);
 	int c, irq;
 
+	regulator_disable(data->supply);
+
 	if (data->irq) {
 		for (c = 0; c < data->chip->nchans; c++) {
 			irq = irq_find_mapping(data->irq, c);
@@ -499,10 +503,22 @@ static int pca954x_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, muxc);
 	data->client = client;
 
+	data->supply = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(data->supply))
+		return dev_err_probe(dev, PTR_ERR(data->supply),
+				"Failed to request regulator\n");
+
+	ret = regulator_enable(data->supply);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to enable vdd supply\n");
+
 	/* Reset the mux if a reset GPIO is specified. */
 	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpio))
-		return PTR_ERR(gpio);
+	if (IS_ERR(gpio)) {
+		ret = PTR_ERR(gpio);
+		goto fail_cleanup;
+	}
 	if (gpio) {
 		udelay(1);
 		gpiod_set_value_cansleep(gpio, 0);
@@ -519,7 +535,7 @@ static int pca954x_probe(struct i2c_client *client)
 
 		ret = i2c_get_device_id(client, &id);
 		if (ret && ret != -EOPNOTSUPP)
-			return ret;
+			goto fail_cleanup;
 
 		if (!ret &&
 		    (id.manufacturer_id != data->chip->id.manufacturer_id ||
@@ -527,7 +543,8 @@ static int pca954x_probe(struct i2c_client *client)
 			dev_warn(dev, "unexpected device id %03x-%03x-%x\n",
 				 id.manufacturer_id, id.part_id,
 				 id.die_revision);
-			return -ENODEV;
+			ret = -ENODEV;
+			goto fail_cleanup;
 		}
 	}
 
@@ -546,7 +563,8 @@ static int pca954x_probe(struct i2c_client *client)
 	ret = pca954x_init(client, data);
 	if (ret < 0) {
 		dev_warn(dev, "probe failed\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto fail_cleanup;
 	}
 
 	ret = pca954x_irq_setup(muxc);
-- 
2.41.0

