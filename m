Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 203F74B81EB
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Feb 2022 08:49:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbiBPHrc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Feb 2022 02:47:32 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:48166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbiBPHrR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Feb 2022 02:47:17 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAAEB2DD5
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 23:46:54 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id q17so2448823edd.4
        for <linux-i2c@vger.kernel.org>; Tue, 15 Feb 2022 23:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UXFVdha6mdWIMpTuHA+4tNIC4aJVupleztPzYIr+WPI=;
        b=IWGOoTDEmlPr6DtIASuFxDjhqh5/L0fV+GCo/Si5iX3xTv5LSIB/gHCtw/jl/17UhV
         o8B9B91aM7Ay2uW/kJkTld1BNFL8oQhsz/JzoOEV2Ei6Gb1f6ABBYu1E1nnPcm4c3AIx
         KccTMJdDOg/2rXec48mltO60Om5XKWGSqP4QgjOa8MB7Txybrkb5eEEp6v0A1xxEfPQp
         gxaLx82Pjmh48q9sLqqU0AWpZ7yB6VUubrSnYaLCwXEdpGfJC2ZvQapy80SraRdztfHE
         Z/gDKy7aeJLNWkgdpmhD1a6m6J0FkxFZ4ThoST3TJhNenyVJjVgslooDOSULFlv94OCZ
         IEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UXFVdha6mdWIMpTuHA+4tNIC4aJVupleztPzYIr+WPI=;
        b=KOHy+DmROmyiaLlWAjfDd4P1VySNJBIw5zBNlNe/6XILr1owMpk7AGV+AsE2DfvA77
         0Satvc8DeUPWaMb9IpeE2j71bp38QXi15DAJFEdkPRtZx3WL/tf9nuWuSEj9AioqKfOu
         xTBWgmPeRTTtdrEykiZyniIxp6Lk8Eg2t5attffBo2K0TOmCEDfmSUrxWjAnBwXaewpC
         Nr10/VgYKXua2KEyVkIHEhqkLTCCv+F9QskCBKo6xR1w/Yvf+2CGqnEg7Ki8ZHQOVHHF
         7xTpWyWGoCUDGMX6p/WlAkH2lb6SaA650zptVJ/Ja5e3LO5m3sD6yBP+htiKCBPFSF22
         lIRA==
X-Gm-Message-State: AOAM530pV0cn17SwhHjgjyLG5oAg5gMuruypzE4bfzxrEwGfVcYoQtou
        RXdhME9Pzm6vwgtgJN7G1lHLIQ==
X-Google-Smtp-Source: ABdhPJw0NxKrW2MThGN7NIdtD3nPnvUA7EhJt3HLsCndpIsnFXXpAl9ArWuefX/23/LbYnF2kNOFJw==
X-Received: by 2002:aa7:c793:0:b0:408:4a69:90b4 with SMTP id n19-20020aa7c793000000b004084a6990b4mr1608214eds.58.1644997613266;
        Tue, 15 Feb 2022 23:46:53 -0800 (PST)
Received: from fedora.sec.9e.network (ip-088-153-139-166.um27.pools.vodafone-ip.de. [88.153.139.166])
        by smtp.gmail.com with ESMTPSA id gq1sm11615202ejb.58.2022.02.15.23.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 23:46:52 -0800 (PST)
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [v6 3/3] i2c: muxes: pca954x: Add regulator support
Date:   Wed, 16 Feb 2022 08:46:12 +0100
Message-Id: <20220216074613.235725-4-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216074613.235725-1-patrick.rudolph@9elements.com>
References: <20220216074613.235725-1-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a vdd regulator and enable it for boards that have the
mux powered off by default.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 34 ++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 33b9a6a1fffa..e25383752616 100644
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
@@ -119,6 +120,7 @@ struct pca954x {
 	struct irq_domain *irq;
 	unsigned int irq_mask;
 	raw_spinlock_t lock;
+	struct regulator *supply;
 };
 
 /* Provide specs for the PCA954x and MAX735x types we know about */
@@ -459,6 +461,9 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
 	struct pca954x *data = i2c_mux_priv(muxc);
 	int c, irq;
 
+	if (!IS_ERR_OR_NULL(data->supply))
+		regulator_disable(data->supply);
+
 	if (data->irq) {
 		for (c = 0; c < data->chip->nchans; c++) {
 			irq = irq_find_mapping(data->irq, c);
@@ -513,15 +518,32 @@ static int pca954x_probe(struct i2c_client *client,
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
@@ -538,7 +560,7 @@ static int pca954x_probe(struct i2c_client *client,
 
 		ret = i2c_get_device_id(client, &id);
 		if (ret && ret != -EOPNOTSUPP)
-			return ret;
+			goto fail_cleanup;
 
 		if (!ret &&
 		    (id.manufacturer_id != data->chip->id.manufacturer_id ||
@@ -546,7 +568,8 @@ static int pca954x_probe(struct i2c_client *client,
 			dev_warn(dev, "unexpected device id %03x-%03x-%x\n",
 				 id.manufacturer_id, id.part_id,
 				 id.die_revision);
-			return -ENODEV;
+			ret = -ENODEV;
+			goto fail_cleanup;
 		}
 	}
 
@@ -565,7 +588,8 @@ static int pca954x_probe(struct i2c_client *client,
 	ret = pca954x_init(client, data);
 	if (ret < 0) {
 		dev_warn(dev, "probe failed\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto fail_cleanup;
 	}
 
 	ret = pca954x_irq_setup(muxc);
-- 
2.34.1

