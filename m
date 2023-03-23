Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4BA16C6733
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 12:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbjCWLye (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 07:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjCWLyQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 07:54:16 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DEC2366A5
        for <linux-i2c@vger.kernel.org>; Thu, 23 Mar 2023 04:54:03 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id w9so85295698edc.3
        for <linux-i2c@vger.kernel.org>; Thu, 23 Mar 2023 04:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1679572442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwXKfhhEqm0u3hOwcWnbc9eMv2uIS61iRmPoBGhEqx8=;
        b=QpVV0iCOdd/v9NX41dCw4Nec0YlnHwzuiVRcNBkX/1oQQe18FO3VBXdP9ICayeP/0F
         aOsFvgs1DqWdHGV+C0WVQDE2fq/BRFDKnk3iINV+UEeARPHd3X56Nldv77kO4Ulm3+B3
         y1TyFlb78uGpFgLMaTtD/0xhrpBxDXzQui7ZPGg3w8OUdpH0LUVvz6346xBwf71kzNrP
         ciShAqFPG2KfKKVTh6xBa8P3NyaKlj6G1adVAK2D5kXgmfSfxe688SfeDpEU7K7sYv/Q
         Le7+YxBXk9jT1vD9GXfTKhAbyxP5BGTrdBLWLXr85r6tbKWRL383TmhDVs0gvT5mehiN
         spcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679572442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwXKfhhEqm0u3hOwcWnbc9eMv2uIS61iRmPoBGhEqx8=;
        b=JjW05LlgOd020MK8gGnGEiWBxT+ynRBIv+dmODw48y+MBHrEjjANntBaj17DxRsEFT
         k/m1sxMNQqqlFwqrcA6E9tdcoB1HjwgdETlHiR9QWhn4JFUwYS7SRC7X1n9dfi13jp/K
         +NQhjzdz1HWW5NwH/uh4mvEJzx0w8sJSg/FXT0bqf5p8TOPKlxfKTmvghLa4GxvcSxWB
         SAqVlmfgo2I4tVb/W1HKOYEo6lBYDSaJOIQac2NirX7xVfpkF70buHM3DeVHmMWsCKDB
         L+4Pjy0rQAKiT8KQfA0QlV4XUKN8HoW2TnN/+d0zRKm4KbKtxEsidnCrWlUZ/2E8MveG
         LPCg==
X-Gm-Message-State: AO0yUKXIDKKQCKCLH/Ht8qPBpDVR60KRlIcinvibtAjnOgJjUCxpPgcK
        QETHVJTe/SIxrHu5jF1IEXqqTA==
X-Google-Smtp-Source: AK7set+PztqGXPY+F39TuHJGfQGLCyOqIjduXiRvi157vwXBlw9c5EWERhFdx4SUk9GPRtPrNrdEoA==
X-Received: by 2002:a17:906:3389:b0:8eb:d3a5:b9f0 with SMTP id v9-20020a170906338900b008ebd3a5b9f0mr9977599eja.67.1679572442112;
        Thu, 23 Mar 2023 04:54:02 -0700 (PDT)
Received: from fedora.. (ip-095-222-150-251.um34.pools.vodafone-ip.de. [95.222.150.251])
        by smtp.gmail.com with ESMTPSA id r5-20020a1709064d0500b00923f05b2931sm8510047eju.118.2023.03.23.04.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 04:54:01 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 3/3] i2c: muxes: pca954x: Add regulator support
Date:   Thu, 23 Mar 2023 12:53:55 +0100
Message-Id: <20230323115356.2602042-4-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230323115356.2602042-1-patrick.rudolph@9elements.com>
References: <20230323115356.2602042-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a vdd regulator and enable it for boards that have the
mux powered off by default.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 35 ++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 39f313658b18..0d966a55b727 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -49,6 +49,7 @@
 #include <linux/module.h>
 #include <linux/pm.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <dt-bindings/mux/mux.h>
@@ -101,6 +102,7 @@ struct pca954x {
 	struct irq_domain *irq;
 	unsigned int irq_mask;
 	raw_spinlock_t lock;
+	struct regulator *supply;
 };
 
 /* Provide specs for the MAX735x, PCA954x and PCA984x types we know about */
@@ -440,6 +442,9 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
 	struct pca954x *data = i2c_mux_priv(muxc);
 	int c, irq;
 
+	if (data->supply)
+		regulator_disable(data->supply);
+
 	if (data->irq) {
 		for (c = 0; c < data->chip->nchans; c++) {
 			irq = irq_find_mapping(data->irq, c);
@@ -492,10 +497,28 @@ static int pca954x_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, muxc);
 	data->client = client;
 
+	data->supply = devm_regulator_get_optional(dev, "vdd");
+	if (IS_ERR(data->supply)) {
+		ret = PTR_ERR(data->supply);
+		if (ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+				"Failed to request regulator\n");
+		else
+			data->supply = NULL;
+	} else {
+		ret = regulator_enable(data->supply);
+		if (ret) {
+			dev_err(dev, "Failed to enable regulator: %d\n", ret);
+			return ret;
+		}
+	}
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
@@ -512,7 +535,7 @@ static int pca954x_probe(struct i2c_client *client)
 
 		ret = i2c_get_device_id(client, &id);
 		if (ret && ret != -EOPNOTSUPP)
-			return ret;
+			goto fail_cleanup;
 
 		if (!ret &&
 		    (id.manufacturer_id != data->chip->id.manufacturer_id ||
@@ -520,7 +543,8 @@ static int pca954x_probe(struct i2c_client *client)
 			dev_warn(dev, "unexpected device id %03x-%03x-%x\n",
 				 id.manufacturer_id, id.part_id,
 				 id.die_revision);
-			return -ENODEV;
+			ret = -ENODEV;
+			goto fail_cleanup;
 		}
 	}
 
@@ -539,7 +563,8 @@ static int pca954x_probe(struct i2c_client *client)
 	ret = pca954x_init(client, data);
 	if (ret < 0) {
 		dev_warn(dev, "probe failed\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto fail_cleanup;
 	}
 
 	ret = pca954x_irq_setup(muxc);
-- 
2.39.1

