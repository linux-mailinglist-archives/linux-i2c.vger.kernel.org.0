Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1B125EB7F5
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Sep 2022 04:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbiI0C5i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 22:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbiI0C4P (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 22:56:15 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53B096E894
        for <linux-i2c@vger.kernel.org>; Mon, 26 Sep 2022 19:51:24 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id f26so5282736qto.11
        for <linux-i2c@vger.kernel.org>; Mon, 26 Sep 2022 19:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=3OBHFG8N1Wi/0+IDhzqdlFHWU7KQ36OfnHlG8UgKWrs=;
        b=fvl0FxpxnAb2ElYyhcyhcRlNeE/qyGMjB/hqO4hopozUF+IsxRG2ZcBOIN63Ua8qiP
         iphLcUjZm+zqkgEY4OJRgnfJboia7qgCL2ahnT2Mrnhoy1G0ExREY8nqcrfLsTlSr0D9
         hdZRaKuvEoDjIUK3mOsanFAnGzVYq1QUosq7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3OBHFG8N1Wi/0+IDhzqdlFHWU7KQ36OfnHlG8UgKWrs=;
        b=t6lzIYYMdsWDrDg0IQyxjm1xu9FASmkEyN2umTsMyMd1qQpVfhjoiLvgVzdyqOlyPl
         GWBhHMZ5WyTsfccGBnnCY5/dm9dicYj3XoUIeEyqKE6pUm1Fg+ffc/l2Z+l557ezN/RY
         1fal88rP9NQBaApPa2SUmKZCpDEE/y1tneYEec7MHwKC/KX7H0KHLogDrB46+ru7LyeW
         3+hgtULNe7NnuI43YTn5yyiXq7EjkdyV9pGdndFhDsSRqqwfXoMtHY44e5tuWwWXpS4K
         g8CQEQDYVxwDWmXFfsTktbwl0S9aOLPFXpuJmj/G8/ktBu5+rJT6tvATfpRkW+bq2+br
         niYg==
X-Gm-Message-State: ACrzQf1AKg3Dvr33mthes5oh2AZOQmSHBfUx1riOq6bxP80vVzfs5zwu
        rxs004qa9dltc36EvM21K/OjmQ==
X-Google-Smtp-Source: AMsMyM6Ycp2k/KnZ3joMhOyXWsmYanW6wkY4ckTXs6DGSEZsX2auFfpAzZ257aA1YYi8p0crsTKI3w==
X-Received: by 2002:ac8:584c:0:b0:35c:ceee:197a with SMTP id h12-20020ac8584c000000b0035cceee197amr20960705qth.662.1664247083421;
        Mon, 26 Sep 2022 19:51:23 -0700 (PDT)
Received: from roguebox.lan ([164.92.70.235])
        by smtp.gmail.com with ESMTPSA id y5-20020a37f605000000b006bb0f9b89cfsm199620qkj.87.2022.09.26.19.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 19:51:22 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org, gupt21@gmail.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org
Cc:     linux-input@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v5 3/5] iio: dac: fix future recursive dependencies
Date:   Mon, 26 Sep 2022 19:50:48 -0700
Message-Id: <20220927025050.13316-4-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927025050.13316-1-matt.ranostay@konsulko.com>
References: <20220927025050.13316-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When using 'imply IIO' for other configurations which have 'select GPIOLIB'
the following recursive dependency is detected for AD5592R/AD5593R

Switch from 'select GPIOLIB' to 'depends on GPIOLIB' to avoid this per
recommendation in kconfig-language.rst

drivers/gpio/Kconfig:14:error: recursive dependency detected!
drivers/gpio/Kconfig:14:        symbol GPIOLIB is selected by AD5592R
drivers/iio/dac/Kconfig:93:     symbol AD5592R depends on IIO
drivers/iio/Kconfig:6:  symbol IIO is implied by HID_MCP2221
drivers/hid/Kconfig:1227:       symbol HID_MCP2221 depends on GPIOLIB

Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/iio/dac/Kconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
index 80521bd28d0f..b93003e80b70 100644
--- a/drivers/iio/dac/Kconfig
+++ b/drivers/iio/dac/Kconfig
@@ -92,8 +92,7 @@ config AD5592R_BASE
 
 config AD5592R
 	tristate "Analog Devices AD5592R ADC/DAC driver"
-	depends on SPI_MASTER
-	select GPIOLIB
+	depends on SPI_MASTER && GPIOLIB
 	select AD5592R_BASE
 	help
 	  Say yes here to build support for Analog Devices AD5592R
@@ -104,8 +103,7 @@ config AD5592R
 
 config AD5593R
 	tristate "Analog Devices AD5593R ADC/DAC driver"
-	depends on I2C
-	select GPIOLIB
+	depends on I2C && GPIOLIB
 	select AD5592R_BASE
 	help
 	  Say yes here to build support for Analog Devices AD5593R
-- 
2.37.2

