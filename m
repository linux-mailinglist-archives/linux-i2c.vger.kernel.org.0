Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6415B4B36
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Sep 2022 03:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbiIKBlM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Sep 2022 21:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiIKBlJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Sep 2022 21:41:09 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEFB32DAB
        for <linux-i2c@vger.kernel.org>; Sat, 10 Sep 2022 18:41:07 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id s13so4233111qvq.10
        for <linux-i2c@vger.kernel.org>; Sat, 10 Sep 2022 18:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=TVCgLHI6doxJO+C8xmrBxNy2DyFsnEYY2dswoZKE5JM=;
        b=oeoaIkxV0Fuf+OqJSjW+T81ab/aP9Fg5NTRvgrXw7z46AbDt4qN44e050xDr2FKgIZ
         FwYJjVPvdalFc2rVV/OPkhuxaVm9CFHHwL0BsHGR4/9APHGFMZMSimDl6GyIqKPTgEMQ
         +k33C3tcZ9S8IlnS0Kl11cWBGccWB7LtOfayE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TVCgLHI6doxJO+C8xmrBxNy2DyFsnEYY2dswoZKE5JM=;
        b=Z2uTOS9vQmmWeY156s6dNw6qlp3l8FKvJ9hXj24hPA3zQ3PKjDlu71aUkr9aREHY8O
         vif/TJTiOGTjNQU8IuCMiQNXiliSENRb2L2eRHmT4KP5hRbsTur6D55ZM9Ddop0ZR9DY
         PYdkiu0gbduSa6hvDm1secpt7JKpiPt0u+9m4D9PjxK1mlUDXQ37F9utUd/7tpt1kO3r
         0XmvYMliwnGnxPd1QwtfECdN32zgHotmnzJsbRSQ+s6eWoSTqxPD0K0TqF46CXJJxzXx
         AHnZtDX4Pnzl9SxQ8Ov7giAlqG6pRNCKORBDW8BVqiXe8ZbXvkn5a/DyJmP1WuzhHN1T
         Xr3g==
X-Gm-Message-State: ACgBeo0CU06ZicvlvFNVcIJQrtQj/eOwlL9YiDDzDnbN20SPlE/WnGcJ
        W4sXofWw8VsidyNKqlITxkG2dw==
X-Google-Smtp-Source: AA6agR6dbbSLsAlHCay/8aZh/7yY8ZouRstyZCThCYHwwTqxn4RetkzUX74LqLnee1WzVt6w3HVDsg==
X-Received: by 2002:a05:6214:2a81:b0:473:af82:9a95 with SMTP id jr1-20020a0562142a8100b00473af829a95mr17908794qvb.44.1662860467002;
        Sat, 10 Sep 2022 18:41:07 -0700 (PDT)
Received: from localhost.localdomain ([159.65.38.31])
        by smtp.gmail.com with ESMTPSA id q26-20020ac8451a000000b003438a8e842fsm3542973qtn.44.2022.09.10.18.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 18:41:06 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org, gupt21@gmail.com
Cc:     linux-input@vger.kernel.org, linux-i2c@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v2 1/5] i2c: muxes: ltc4306: fix future recursive dependencies
Date:   Sat, 10 Sep 2022 18:40:44 -0700
Message-Id: <20220911014048.64235-2-matt.ranostay@konsulko.com>
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
the following recursive dependency detected happens for I2C_MUX_LTC4306

Switch from 'select GPIOLIB' to 'depends on GPIOLIB' to avoid this per
recommendation in kconfig-language.rst

drivers/gpio/Kconfig:14:error: recursive dependency detected!
drivers/gpio/Kconfig:14:        symbol GPIOLIB is selected by I2C_MUX_LTC4306
drivers/i2c/muxes/Kconfig:47:   symbol I2C_MUX_LTC4306 depends on I2C_MUX
drivers/i2c/Kconfig:62: symbol I2C_MUX is selected by MPU3050_I2C
drivers/iio/gyro/Kconfig:127:   symbol MPU3050_I2C depends on IIO
drivers/iio/Kconfig:6:  symbol IIO is implied by HID_MCP2221
drivers/hid/Kconfig:1227:       symbol HID_MCP2221 depends on GPIOLIB

Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/i2c/muxes/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index ea838dbae32e..7b6a68df4a39 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -46,7 +46,7 @@ config I2C_MUX_GPMUX
 
 config I2C_MUX_LTC4306
 	tristate "LTC LTC4306/5 I2C multiplexer"
-	select GPIOLIB
+	depends on GPIOLIB
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the Analog Devices
-- 
2.37.2

