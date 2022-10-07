Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB4385F74F5
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Oct 2022 09:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbiJGHzf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Oct 2022 03:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbiJGHzd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 7 Oct 2022 03:55:33 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C0E48EBD
        for <linux-i2c@vger.kernel.org>; Fri,  7 Oct 2022 00:55:24 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id l22so5921546edj.5
        for <linux-i2c@vger.kernel.org>; Fri, 07 Oct 2022 00:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYnWsZ0o5AknCBOblpHFLOK7lMI23PzUmjP6lQfCMsQ=;
        b=avOmEXJ6cStT+owLJndU87sr6b/pMzEYqRcsQYA1o7N41r1bLRrsz2hPfaDds2s52w
         KgywaP3cKvGgE/wamq8qicWJQ2H2nuif8Ust4HTrnG4dFeFQsBN3kYsjnfWxioE1bhSs
         8sROmt2UKBsJvVylcN/VyLHpH3lurz8h3PwJX9oj2GbCWuPkVL/IX/Mm7T/spKAYxUR/
         SIulbdY5vb/5JdfOhEAOK8QYQVl7SWqdx+dvj3zxIGK6VMy63AjFJsjhjH2Hdt4vtOdS
         q8QbdmAHGcSXD+unGR/ZJLH+UCS0rcaAJkFyJ60HtLNNyrdGG+YorbMvo8HlSynZi/rk
         ZPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYnWsZ0o5AknCBOblpHFLOK7lMI23PzUmjP6lQfCMsQ=;
        b=RVhCvIqQQ+PQLapw5MQCOJF3eqaYeSBNBJhoLxfKO9Wko01l7VGEKJecc5cjg3wP3g
         vOBsuHUV5S3Gmyo+gSZD7VMBo/XQbJ1ljo3vidZfmEL43xwtnFw0zyymatJIl+hu0qSS
         o3qQWz52ajlGnjTcTN7wEgyId5nXKTQ5X7zK47EtlZzopqdYXRn9n+TwubfcHavlmpg4
         iZ/lGGnNVPU07PrvvoaSrk2THOWpG5TAGjLGpzlntMQpF46IFB458Hk+ezULyYmkCARj
         270IT9Hl21TnznyGY63R1siWhaiUApK7VejENNk3EaTrc0hee6HKY9ADGq67lK1W4ROa
         +cZA==
X-Gm-Message-State: ACrzQf0bGOENlUEc7qDrsj+EqgTm5PjPr6LIwLd0HryB+GzInj7wrm2f
        fdetkc241mLDKzAfd8heXw76MQ==
X-Google-Smtp-Source: AMsMyM68rpMJy/RPe5slntPvR0+sj6c9rJWQ/6TZKc+/UJZagyRK49iVg8RHaE+sI1eBsinloVuF5Q==
X-Received: by 2002:a05:6402:1d55:b0:459:9dc3:85cb with SMTP id dz21-20020a0564021d5500b004599dc385cbmr3383488edb.353.1665129322550;
        Fri, 07 Oct 2022 00:55:22 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-094-114-232-236.um31.pools.vodafone-ip.de. [94.114.232.236])
        by smtp.gmail.com with ESMTPSA id hv13-20020a17090760cd00b00741a0c3f4cdsm782281ejc.189.2022.10.07.00.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 00:55:22 -0700 (PDT)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     robh@kernel.org, laurent.pinchart@ideasonboard.com, wsa@kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v9 4/4] i2c: muxes: pca954x: Add regulator support
Date:   Fri,  7 Oct 2022 09:53:53 +0200
Message-Id: <20221007075354.568752-5-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007075354.568752-1-patrick.rudolph@9elements.com>
References: <20221007075354.568752-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a vdd regulator and enable it for boards that have the
mux powered off by default.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Reviewed-by: Peter Rosin <peda@axentia.se>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 34 ++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 992976fa6798..857a4ec387be 100644
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
@@ -133,6 +134,7 @@ struct pca954x {
 	struct irq_domain *irq;
 	unsigned int irq_mask;
 	raw_spinlock_t lock;
+	struct regulator *supply;
 };
 
 /* Provide specs for the MAX735x, PCA954x and PCA984x types we know about */
@@ -473,6 +475,9 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
 	struct pca954x *data = i2c_mux_priv(muxc);
 	int c, irq;
 
+	if (!IS_ERR_OR_NULL(data->supply))
+		regulator_disable(data->supply);
+
 	if (data->irq) {
 		for (c = 0; c < data->chip->nchans; c++) {
 			irq = irq_find_mapping(data->irq, c);
@@ -531,15 +536,32 @@ static int pca954x_probe(struct i2c_client *client,
 			     pca954x_select_chan, pca954x_deselect_mux);
 	if (!muxc)
 		return -ENOMEM;
+
 	data = i2c_mux_priv(muxc);
 
 	i2c_set_clientdata(client, muxc);
 	data->client = client;
 
+	data->supply = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(data->supply)) {
+		ret = PTR_ERR(data->supply);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to request regulator: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_enable(data->supply);
+	if (ret) {
+		dev_err(dev, "Failed to enable regulator: %d\n", ret);
+		return ret;
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
@@ -556,7 +578,7 @@ static int pca954x_probe(struct i2c_client *client,
 
 		ret = i2c_get_device_id(client, &id);
 		if (ret && ret != -EOPNOTSUPP)
-			return ret;
+			goto fail_cleanup;
 
 		if (!ret &&
 		    (id.manufacturer_id != data->chip->id.manufacturer_id ||
@@ -564,7 +586,8 @@ static int pca954x_probe(struct i2c_client *client,
 			dev_warn(dev, "unexpected device id %03x-%03x-%x\n",
 				 id.manufacturer_id, id.part_id,
 				 id.die_revision);
-			return -ENODEV;
+			ret = -ENODEV;
+			goto fail_cleanup;
 		}
 	}
 
@@ -583,7 +606,8 @@ static int pca954x_probe(struct i2c_client *client,
 	ret = pca954x_init(client, data);
 	if (ret < 0) {
 		dev_warn(dev, "probe failed\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto fail_cleanup;
 	}
 
 	ret = pca954x_irq_setup(muxc);
-- 
2.37.3

