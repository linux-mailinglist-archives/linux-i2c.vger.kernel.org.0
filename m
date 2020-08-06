Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B71023DC59
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Aug 2020 18:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729558AbgHFQvD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 12:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729130AbgHFQur (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Aug 2020 12:50:47 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A465C002145;
        Thu,  6 Aug 2020 08:48:51 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id g33so9556133pgb.4;
        Thu, 06 Aug 2020 08:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=O4fFNtupII4G3GGho31c/AZ+b/qF/UUJtsnTVBsXCWQ=;
        b=Qe0AHxKYEd9paOfHikjpuE8sGQp696XvNaD8W3DahCu5M7sEFlNJNvAh9DJSbDzo2k
         wLTyOY91Jl5e6ZHEnaARkpVYICAxLtbL93ynS+hilvB/gdQFh1a2nZ7/0N4OU03WUWQy
         mE0F+8w5iI0rlA1rJZavPbSB/VZ+TK2D1cKsQArlVhvBIx8i1wIwDUX78REVE2AAGSzA
         nk0aT0hCXgNkoE6fO2AnBmW/wWqPBwQxLeTbNys1MsXZ4goh6G+QgY1HLGZz6yr9B75f
         fo9XxYBqcD0J+fvBKD7VLsLV6w7oHEgMtqGpa/PpjlFbo0AznYv/5Y70V4iCcVMZchBK
         DPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=O4fFNtupII4G3GGho31c/AZ+b/qF/UUJtsnTVBsXCWQ=;
        b=eTe3+TNKuSiMxgGA44yc8CniXRXVJukqlO2mPWK4qhiu5cWos1fYYscaDez2X/L26v
         2PXISZ4vgM92g0Nc9WzWmPrIiJdK10Pcw+4bYKfHwOu3QesjunbtmQgHG/3Vi6TuAxio
         x7E5xukL9Ne3uN9+dpHIQ4AkhWSigXCr2rB/ucZ58fiJuc3ajH2+x8OeTNmA2JmEGZTJ
         5zFE5cFqQ6W+Tk39a18USr1WWwcuiHsm6ELUAxD+I0z+Bt2XCwcX3ey42F0b6XmMXK8m
         6DFL9c3yBTpL3BMNJtaqUvJWfGtJfacSRin75ot536b9xA/J3gmgSd1oJon7iCpnem+J
         HU7A==
X-Gm-Message-State: AOAM532xi3liQqv0xUtjrhi417+AX33hlBwM/KUV8q7ezULdmhVIHdFd
        3+Sx3pfaQrRjgEPg/RNp3oHGs1efQrI=
X-Google-Smtp-Source: ABdhPJwjxTDldD4lbT7Tg3xiJNgOhHHqyCxRvl290V9QfB+Zm4xmX12EtTp0dNKbfe7bxHFShHTOug==
X-Received: by 2002:a62:c182:: with SMTP id i124mr2596803pfg.225.1596728930820;
        Thu, 06 Aug 2020 08:48:50 -0700 (PDT)
Received: from localhost.localdomain ([123.201.68.255])
        by smtp.gmail.com with ESMTPSA id f6sm8375856pje.16.2020.08.06.08.48.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Aug 2020 08:48:50 -0700 (PDT)
From:   Raag Jadav <raagjadav@gmail.com>
To:     linux-media@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     wsa+renesas@sang-engineering.com, jacopo@jmondi.org,
        akinobu.mita@gmail.com, sakari.ailus@linux.intel.com,
        mchehab@kernel.org, Raag Jadav <raagjadav@gmail.com>
Subject: [PATCH v2] media: ov7740: use SCCB regmap
Date:   Thu,  6 Aug 2020 21:18:27 +0530
Message-Id: <1596728907-32120-1-git-send-email-raagjadav@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Make use of SCCB APIs for regmap operations.
Remove i2c_check_functionality as devm_regmap_init_sccb
does it for us.

Signed-off-by: Raag Jadav <raagjadav@gmail.com>
---
Changes since v1:
- Changed commit message.
- Added SCCB config for ov7740.

 drivers/media/i2c/Kconfig  |  2 +-
 drivers/media/i2c/ov7740.c | 10 +---------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index da11036..c7d5722 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1001,7 +1001,7 @@ config VIDEO_OV7670
 config VIDEO_OV7740
 	tristate "OmniVision OV7740 sensor support"
 	depends on I2C && VIDEO_V4L2
-	select REGMAP_I2C
+	select REGMAP_SCCB
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV7740 VGA camera sensor.
diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 732655f..5832461 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -1068,13 +1068,6 @@ static int ov7740_probe(struct i2c_client *client)
 	struct v4l2_subdev *sd;
 	int ret;
 
-	if (!i2c_check_functionality(client->adapter,
-				     I2C_FUNC_SMBUS_BYTE_DATA)) {
-		dev_err(&client->dev,
-			"OV7740: I2C-Adapter doesn't support SMBUS\n");
-		return -EIO;
-	}
-
 	ov7740 = devm_kzalloc(&client->dev, sizeof(*ov7740), GFP_KERNEL);
 	if (!ov7740)
 		return -ENOMEM;
@@ -1091,7 +1084,7 @@ static int ov7740_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	ov7740->regmap = devm_regmap_init_i2c(client, &ov7740_regmap_config);
+	ov7740->regmap = devm_regmap_init_sccb(client, &ov7740_regmap_config);
 	if (IS_ERR(ov7740->regmap)) {
 		ret = PTR_ERR(ov7740->regmap);
 		dev_err(&client->dev, "Failed to allocate register map: %d\n",
@@ -1100,7 +1093,6 @@ static int ov7740_probe(struct i2c_client *client)
 	}
 
 	sd = &ov7740->subdev;
-	client->flags |= I2C_CLIENT_SCCB;
 	v4l2_i2c_subdev_init(sd, client, &ov7740_subdev_ops);
 
 #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API
-- 
2.7.4

