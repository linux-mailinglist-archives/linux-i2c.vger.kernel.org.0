Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2825122AF
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Apr 2022 21:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232689AbiD0TaW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Apr 2022 15:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234680AbiD0T3K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Apr 2022 15:29:10 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C21E0C5;
        Wed, 27 Apr 2022 12:25:20 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id b19so3829131wrh.11;
        Wed, 27 Apr 2022 12:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=2dA0epvc5N7hFjokHdhzA9rWHZSUiHXiHzxOnGfMxpU=;
        b=IGFFKUt7JQIsHNdySLM1ofR3Imr0P2JT/oyz+z95E03Lk4Nx2J9T5o4wsyuQv3KvQ/
         +SR0lQT8IrVAQmiuB+3NGzlx5SpeYk9ysPpi96Mda3KDC95UOJkQBLOBSfztNm2VzqQc
         M1V88lpRiLDtT/SjaYC0LN7MvZnTNLbTg1oNmjGH+C1f2qD7fB95xMFJxBRamN+Yc/Yj
         HQxqcBJ0jbYi9QazFvDDvtGhia4pqDX313BMcrly/FnDPa8o3Zq6L4vI9np93XouNR3+
         NxDiKnR4KGI8803tqXEen0Hm4O04TJDDGK+WYKbd9Fm0+WFpTdx8FmRrLGAOk5go1xHr
         +fTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=2dA0epvc5N7hFjokHdhzA9rWHZSUiHXiHzxOnGfMxpU=;
        b=u4I9COGfG3VuffKWM9IcOIPB31IXCd8vbnc6rk/mtmC7CED8xw0pUGnebhUParY+m/
         HKxI/fVz7JFr3O6Bcw1owlRLQipxT2P1NiE+SAq9CKwi80Uzz1zUfOrMjIasZAtQqDIx
         bzO0gU0Nl373xqkettgnOMu0cHJgyclIrlpzi1084NSNpbNadJfeNGICYZSvlQSRuqfk
         iRmcbaq6uS1AS4xE7d4kSE08mWkYRsBHz9hHiSC0JVogCudvzYmjkrL1CKnr3Ec2yobo
         71ssHQEkSTv7RKti2GWjDU4yxwFJJfOtxFX6fV5mSEoumQ0U0zbzZ04/y31qqGwKH1nU
         a44Q==
X-Gm-Message-State: AOAM533OSyhDPuxiJnTrLMwya8Z24xu4HSqc3OPynBoGy604SAt8yZNt
        6Kh4zo/GQ/aXzq2iP99FzhI=
X-Google-Smtp-Source: ABdhPJyUgdwqrY0LJ60zNceNP7pBaKZhGApLpuyuV47K1MZjJHyZWBfCsy243tfP2WkjfLepXUbKVg==
X-Received: by 2002:adf:f6c4:0:b0:20a:cd34:9f68 with SMTP id y4-20020adff6c4000000b0020acd349f68mr20552551wrp.122.1651087518650;
        Wed, 27 Apr 2022 12:25:18 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c002:fc00:393a:1fdf:a518:6420? (dynamic-2a01-0c23-c002-fc00-393a-1fdf-a518-6420.c23.pool.telefonica.de. [2a01:c23:c002:fc00:393a:1fdf:a518:6420])
        by smtp.googlemail.com with ESMTPSA id m41-20020a05600c3b2900b00393e6f6c130sm2245143wms.42.2022.04.27.12.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 12:25:18 -0700 (PDT)
Message-ID: <a09b4c2e-5256-25b7-59da-f93b04d128c5@gmail.com>
Date:   Wed, 27 Apr 2022 21:25:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v2 3/3] i2c: gpio: support write-only sda
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <3e6c934e-5298-42c5-c346-31b1acaa06ba@gmail.com>
In-Reply-To: <3e6c934e-5298-42c5-c346-31b1acaa06ba@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There are slave devices that understand I2C but have read-only
SDA and SCL. Examples are FD650 7-segment LED controller and
its derivatives. Typical board designs don't even have a
pull-up for both pins. Therefore don't enforce open-drain
if SDA and SCL both are unidirectional. This patch makes
i2c-gpio usable with such devices, based on new DT property
i2c-gpio,sda-output-only.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-gpio.c          | 14 +++++++++++---
 include/linux/platform_data/i2c-gpio.h |  2 ++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index 7a048abbf..0a87af4a7 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -316,6 +316,8 @@ static void of_i2c_gpio_get_props(struct device_node *np,
 		of_property_read_bool(np, "i2c-gpio,scl-open-drain");
 	pdata->scl_is_output_only =
 		of_property_read_bool(np, "i2c-gpio,scl-output-only");
+	pdata->sda_is_output_only =
+		of_property_read_bool(np, "i2c-gpio,sda-output-only");
 }
 
 static struct gpio_desc *i2c_gpio_get_desc(struct device *dev,
@@ -363,6 +365,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	enum gpiod_flags gflags;
+	bool sda_scl_output_only;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -391,8 +394,12 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 	 * marking these lines to be handled as open drain, and we should just
 	 * handle them as we handle any other output. Else we enforce open
 	 * drain as this is required for an I2C bus.
+	 * If SCL/SDA both are write-only, then this indicates I2C-like slaves
+	 * with read-only SCL/SDA. Such slaves don't need open-drain, and partially
+	 * don't even work with open-drain.
 	 */
-	if (pdata->sda_is_open_drain)
+	sda_scl_output_only = pdata->sda_is_output_only && pdata->scl_is_output_only;
+	if (pdata->sda_is_open_drain || sda_scl_output_only)
 		gflags = GPIOD_OUT_HIGH;
 	else
 		gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;
@@ -400,7 +407,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->sda))
 		return PTR_ERR(priv->sda);
 
-	if (pdata->scl_is_open_drain)
+	if (pdata->scl_is_open_drain || sda_scl_output_only)
 		gflags = GPIOD_OUT_HIGH;
 	else
 		gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;
@@ -418,7 +425,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 
 	if (!pdata->scl_is_output_only)
 		bit_data->getscl = i2c_gpio_getscl;
-	bit_data->getsda = i2c_gpio_getsda;
+	if (!pdata->sda_is_output_only)
+		bit_data->getsda = i2c_gpio_getsda;
 
 	if (pdata->udelay)
 		bit_data->udelay = pdata->udelay;
diff --git a/include/linux/platform_data/i2c-gpio.h b/include/linux/platform_data/i2c-gpio.h
index a907774fd..928c87b00 100644
--- a/include/linux/platform_data/i2c-gpio.h
+++ b/include/linux/platform_data/i2c-gpio.h
@@ -16,6 +16,7 @@
  *	isn't actively driven high when setting the output value high.
  *	gpio_get_value() must return the actual pin state even if the
  *	pin is configured as an output.
+ * @sda_is_output_only: I2C-like interface, SDA is write-only.
  * @scl_is_open_drain: SCL is set up as open drain. Same requirements
  *	as for sda_is_open_drain apply.
  * @scl_is_output_only: SCL output drivers cannot be turned off.
@@ -24,6 +25,7 @@ struct i2c_gpio_platform_data {
 	int		udelay;
 	int		timeout;
 	unsigned int	sda_is_open_drain:1;
+	unsigned int	sda_is_output_only:1;
 	unsigned int	scl_is_open_drain:1;
 	unsigned int	scl_is_output_only:1;
 };
-- 
2.35.3

