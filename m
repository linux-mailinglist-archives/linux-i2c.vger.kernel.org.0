Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1856077C2D3
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 23:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbjHNVxo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 17:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233048AbjHNVxM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 17:53:12 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C5F171F;
        Mon, 14 Aug 2023 14:53:01 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bc7e65ea44so32472265ad.1;
        Mon, 14 Aug 2023 14:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692049981; x=1692654781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LlzwqrLSxr+d/fmguNZGigijFXvKVx5gs0X7gBK/frI=;
        b=jX2kuvTB5Zn/b0h4gbQ83XnwaX+08yun9vCz/nPT1qszkkkATNJDFoslQnQff9/Fyn
         yCIvmF1EaOxZ8IRX3LLZaRFN6giM3ZWK2QAhG8201qPoSF4DjVtj9ivDDPVKitJcCBaY
         epR6uUtN/QaWyOTjXi9u+qDZ1ODUv4SL3r3dGIMWtS4GpIz3g4R45cnRKdajZMkun2m1
         AKaceFgZA4jpgDyENGKrJYfuu3C7srHeo0UQbrjzWFkI84VC0m0XZhA+XQaqrQBn8Yvc
         eHY3ViwkB4uez/E4SY4lmJVPnG0xGVdUQNuFSY+3H0Tqf4IXg/2aT8e59bqJwySFbYLX
         7uhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692049981; x=1692654781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LlzwqrLSxr+d/fmguNZGigijFXvKVx5gs0X7gBK/frI=;
        b=a/YlrYLbIHsZ5Nr8l6sCKSLsVMIlLw2DmSfa8IB6f+X1oTMpdg2nQUlX3AYIbtILDc
         yYYHlYDOYZMNMfi6i7+hsGNhM1nw5dhMSB5PRIWb/JhJzwVrf//fszoBcqd9yR+w1TZx
         cajaeSW9avo5VbT19QPpcwMIz9hzvJl0eCSOh9WPwfpA4PaaI+PDjhTU4737De09wl3E
         PewdDhsSlS164V9uDLEqTzdc/zErt9QItStS4cG75iQYibo+29MalkTCUvAAptZkSliK
         pFC8cdyvrYrKiNiAeUbjkSfadHt2r4anF3RnZNXShUfyytRncTPd9pSvyEh4RuU/UjPi
         YmBA==
X-Gm-Message-State: AOJu0YznD+p6OFhRTevXtZKo8jL8cpfb02TC1g/WfO//41x8XjtJ1hag
        YHfxI12Jewry3enm4WGVOxI=
X-Google-Smtp-Source: AGHT+IFOgBS3GLoMnjEuhGA2p00hBi2mTODATf2Gq3m6heKXdGS9F5l5wItCfO7gRT+ScTGNlfKwFQ==
X-Received: by 2002:a17:903:41d2:b0:1b3:b84b:9008 with SMTP id u18-20020a17090341d200b001b3b84b9008mr237134ple.5.1692049981264;
        Mon, 14 Aug 2023 14:53:01 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:6c34:7c96:4b56:4eca])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm10056065plb.237.2023.08.14.14.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 14:53:00 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 3/4] i2c: mux: pca954x: convert to using a pointer in i2c_device_id
Date:   Mon, 14 Aug 2023 14:52:51 -0700
Message-ID: <20230814-i2c-id-rework-v1-3-3e5bc71c49ee@gmail.com>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
In-Reply-To: <20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmail.com>
References: <20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13-dev-099c9
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Switch the driver to use newly added "data" pointer in i2c_device_id to
streamline DT and legacy flows.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 6965bf4c2348..c8540e4ca660 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -177,18 +177,18 @@ static const struct chip_desc chips[] = {
 };
 
 static const struct i2c_device_id pca954x_id[] = {
-	{ "pca9540", pca_9540 },
-	{ "pca9542", pca_9542 },
-	{ "pca9543", pca_9543 },
-	{ "pca9544", pca_9544 },
-	{ "pca9545", pca_9545 },
-	{ "pca9546", pca_9546 },
-	{ "pca9547", pca_9547 },
-	{ "pca9548", pca_9548 },
-	{ "pca9846", pca_9846 },
-	{ "pca9847", pca_9847 },
-	{ "pca9848", pca_9848 },
-	{ "pca9849", pca_9849 },
+	{ "pca9540", .data = &chips[pca_9540] },
+	{ "pca9542", .data = &chips[pca_9542] },
+	{ "pca9543", .data = &chips[pca_9543] },
+	{ "pca9544", .data = &chips[pca_9544] },
+	{ "pca9545", .data = &chips[pca_9545] },
+	{ "pca9546", .data = &chips[pca_9546] },
+	{ "pca9547", .data = &chips[pca_9547] },
+	{ "pca9548", .data = &chips[pca_9548] },
+	{ "pca9846", .data = &chips[pca_9846] },
+	{ "pca9847", .data = &chips[pca_9847] },
+	{ "pca9848", .data = &chips[pca_9848] },
+	{ "pca9849", .data = &chips[pca_9849] },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pca954x_id);
@@ -206,7 +206,7 @@ static const struct of_device_id pca954x_of_match[] = {
 	{ .compatible = "nxp,pca9847", .data = &chips[pca_9847] },
 	{ .compatible = "nxp,pca9848", .data = &chips[pca_9848] },
 	{ .compatible = "nxp,pca9849", .data = &chips[pca_9849] },
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(of, pca954x_of_match);
 
@@ -447,7 +447,7 @@ static int pca954x_probe(struct i2c_client *client)
 
 	data->chip = device_get_match_data(dev);
 	if (!data->chip)
-		data->chip = &chips[id->driver_data];
+		data->chip = id->data;
 
 	if (data->chip->id.manufacturer_id != I2C_DEVICE_ID_NONE) {
 		struct i2c_device_identity id;

-- 
2.41.0.694.ge786442a9b-goog

