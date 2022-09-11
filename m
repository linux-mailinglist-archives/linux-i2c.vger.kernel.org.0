Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA6E5B4B3B
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Sep 2022 03:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbiIKBlN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Sep 2022 21:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiIKBlL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Sep 2022 21:41:11 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C609B31341
        for <linux-i2c@vger.kernel.org>; Sat, 10 Sep 2022 18:41:10 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id u28so927572qku.2
        for <linux-i2c@vger.kernel.org>; Sat, 10 Sep 2022 18:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=wUfUODMZKfU/KRMGIPcJ/EprHfUIajE7CfzqJDq54Sc=;
        b=X/wGV2VLKPM41GBNPVmj/Ik9dl6bKc59iC9TiPfHcpc9QgI8SbLKntgeQCqoA7MqgV
         g1zOHz7umwNdtI6zKQiKh8JOftpweA418DhQmaGp5+OPfME2mCYYl7B9fwE2iNnud3vl
         XYdECviAx0Nci2jpYOOCS8wnuD4vYFRXSz3ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wUfUODMZKfU/KRMGIPcJ/EprHfUIajE7CfzqJDq54Sc=;
        b=EW0JlH/Ec88zDomPDKPTR+mASRFC3Hx+yDMiU8KdPJIz5Z7gvKYg7kWJIhXkLprAa2
         zLICjAG++iLf6cRosFM/s0KT9Bknw0pf8uD9fpTjbNLahu8WT1nw31clFYGHuWw/HRVa
         93Xhx2ERp9Y4gBvRVGICQZE6Gzfy+yiOUBw6SsENA7jtMRKl3iRNMOKOHQnq/p4fKTlo
         t5osR+eWdBcEutY287//wfdzek5eMeQ/pp7BvcF+7nOPmEujCgRes79i6loCCeJJIlIa
         3xEnOPiuFzpnxbaZatBv23KyfcqOVUa0DPNB7CzTmCGBMrByqvrZAcdZMUsEJzqA12G2
         212Q==
X-Gm-Message-State: ACgBeo0Qui38sAK/mTlAbITHziUWrY96rS4RqpwW/NtS1BQxkVoaqNXc
        qt97IZdR2BZunR4kM+O5qkKl0KQmbxF4STx0Cjg=
X-Google-Smtp-Source: AA6agR7gtrVhQaNCx+8D8JtPVoCa7mQHb9j8E6uOWozp39f7/GAVTA8jFLa/bqQYpCgkpB1zm3OQWw==
X-Received: by 2002:a37:68c6:0:b0:6cd:e798:f07c with SMTP id d189-20020a3768c6000000b006cde798f07cmr5503925qkc.596.1662860469940;
        Sat, 10 Sep 2022 18:41:09 -0700 (PDT)
Received: from localhost.localdomain ([159.65.38.31])
        by smtp.gmail.com with ESMTPSA id q26-20020ac8451a000000b003438a8e842fsm3542973qtn.44.2022.09.10.18.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 18:41:09 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org, gupt21@gmail.com
Cc:     linux-input@vger.kernel.org, linux-i2c@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v2 3/5] iio: dac: fix future recursive dependencies
Date:   Sat, 10 Sep 2022 18:40:46 -0700
Message-Id: <20220911014048.64235-4-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220911014048.64235-1-matt.ranostay@konsulko.com>
References: <20220911014048.64235-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When using 'imply IIO' for other configurations which have 'select GPIOLIB'
the following recursive dependency detected happens for AD5592R and AD5593R.

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

