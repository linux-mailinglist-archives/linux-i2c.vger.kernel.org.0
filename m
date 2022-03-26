Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8D24E805E
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Mar 2022 11:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232395AbiCZKYN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Mar 2022 06:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232446AbiCZKYN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 26 Mar 2022 06:24:13 -0400
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A558F16BCE1;
        Sat, 26 Mar 2022 03:22:36 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id w21so9251701wra.2;
        Sat, 26 Mar 2022 03:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rMZJCSh8j3Scx/3Txqvkwixsg8qJcGalusKt/a4e+ag=;
        b=TrwMSFODen/V6Hb2snBwhHQYlJqFSsdZ/url2ltpQu/TZXjPhEaFwfz88uFY6cvm94
         5CKKVPhgeRQWw+RqvVDl3h/8W8ihQbZvtpoRKcrfDnzdnv2TDiwlCMdyRcXrBu47zWf4
         xrUdHwL3zETG/25tJUgCpqVnEgTRZX9/ygWCLCU1QOBzTI2uI4Tc1UdxbqK+cHAnKJot
         D10dAfuFahghF0oxoqsXuRAIvqE4LxuIhIZjjFvfxBN1DkrmF8IpRky18hQ/Ry9DU5zW
         wyj0hUJfBZYB6AuCARG7GvjxYcER50gr9hht1hbB0Wqc1ES18Hpjl1+BhoCCJyYg3IV2
         HoEA==
X-Gm-Message-State: AOAM532GzPAvMR1f5ClEaKvha0TvaxO6M0XTDHDFM//uD5rgrzBa9dAi
        rE+4hQc6G7vI4nRdm70P0pw=
X-Google-Smtp-Source: ABdhPJzaI24/mzl5qv3KP0ViFbjsTjiYbJsuzzk3dbm2uJIcK/DK2s2v9pDGdnM86sVwphHiXmtJ7Q==
X-Received: by 2002:adf:e444:0:b0:203:d6f4:3cc4 with SMTP id t4-20020adfe444000000b00203d6f43cc4mr13112278wrm.493.1648290155255;
        Sat, 26 Mar 2022 03:22:35 -0700 (PDT)
Received: from aryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.googlemail.com with ESMTPSA id l15-20020a05600c1d0f00b0038c8ff8e708sm6683057wms.13.2022.03.26.03.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 03:22:34 -0700 (PDT)
From:   Lucas Tanure <tanure@linux.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lucas Tanure <tanure@linux.com>
Subject: [PATCH 3/3] i2c: meson: Remove meson_i2c_data
Date:   Sat, 26 Mar 2022 10:22:29 +0000
Message-Id: <20220326102229.421718-4-tanure@linux.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326102229.421718-1-tanure@linux.com>
References: <20220326102229.421718-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The div_factor is not used anymore and can be removed.
With 50% duty cycle the div factor should 4 for all
devices.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/i2c/busses/i2c-meson.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index b913ba20f06e..c35fd4122bfc 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -65,10 +65,6 @@ enum {
 	STATE_WRITE,
 };
 
-struct meson_i2c_data {
-	unsigned char div_factor;
-};
-
 /**
  * struct meson_i2c - Meson I2C device private data
  *
@@ -514,22 +510,10 @@ static int meson_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct meson_i2c_data i2c_meson6_data = {
-	.div_factor = 4,
-};
-
-static const struct meson_i2c_data i2c_gxbb_data = {
-	.div_factor = 4,
-};
-
-static const struct meson_i2c_data i2c_axg_data = {
-	.div_factor = 3,
-};
-
 static const struct of_device_id meson_i2c_match[] = {
-	{ .compatible = "amlogic,meson6-i2c", .data = &i2c_meson6_data },
-	{ .compatible = "amlogic,meson-gxbb-i2c", .data = &i2c_gxbb_data },
-	{ .compatible = "amlogic,meson-axg-i2c", .data = &i2c_axg_data },
+	{ .compatible = "amlogic,meson6-i2c", },
+	{ .compatible = "amlogic,meson-gxbb-i2c", },
+	{ .compatible = "amlogic,meson-axg-i2c", },
 	{},
 };
 
-- 
2.35.1

