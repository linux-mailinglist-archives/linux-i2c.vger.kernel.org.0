Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A044D672AF1
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 22:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjARVzy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 16:55:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbjARVzp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 16:55:45 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C8B654E6;
        Wed, 18 Jan 2023 13:55:44 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id ud5so819889ejc.4;
        Wed, 18 Jan 2023 13:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qhuunm12DEUADeX8dZ1+bPKvTYYCnKP/G5wxRkVG32M=;
        b=LcElQn9P1CW+7ADiCD8xLqPt5LHhfMwa70qarg6E0Wqr2HWQHtW+4v/6OIQGMpuxB2
         lRFAFdVAEKCOpbyV0OFgCTk9LBtYkHiLVADUeDKluHQb2KM5BHg1CRdsN3NkI7rtS3o5
         l6EJ5EreHncxlG1HWskT5TIqlM/j9HeXLxB9hBx9VtwXL0Fe9pH2ctygfw1RFsMGBJ0Y
         sPlXbNEbBMQ2doJwBVXhRfIdD7aqX4IcA4xXHdZNHdosYNnsT5rywT3S79pwgEHjAvQy
         Ho+oOCPl3buhkueBTQVe2lbptKGveW4hnghvxNqEkTsx2E4RLLBrqeOozPnXBefwH0lq
         QyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qhuunm12DEUADeX8dZ1+bPKvTYYCnKP/G5wxRkVG32M=;
        b=qN3G2k8XStCCciG8hk86Vtr93L2HK9QNn5Ujp+3fa5yd/KE+adNO8XH0b3BQVXKQmE
         MeXSfcZm6NKFUcTb16Sx5+m2p78mmvsxD9OfH75j+EDLK9zH0dNG6h+ZaTcfyr5BceO7
         AVk5wVKLLH79k2nx8lB2yifmU/4Qutz5S+umdUckkMHmd/6dYV7JeheeAdsbIZ8q/Av5
         Q8IVADa6XwX/PMJcB6y4jCRW1ukIoALEBxqMqTE7nCsb2eLZPeoCdeZqPFStCPaJz7Pw
         BjIK8GORbmZd2nCeDtkga9fziV9jqF1mU4gsPt2EQzAoPit9yhkf86yTng1kCYmv8C1W
         11PQ==
X-Gm-Message-State: AFqh2kotx+PivQjmpKwNw66/TJ+FgX0ehWh/W1gV/rV1tbb55pBPVG8Y
        ofgzlbSqm/VtnjW4yB04j+U=
X-Google-Smtp-Source: AMrXdXvXesO0DESwI62c2ayyyHVtZxgk0ZwMlinh+TTr3Qw5aQROnFmrkTeJZSzw+qSj9XGUhKY8AA==
X-Received: by 2002:a17:906:af14:b0:844:de87:8684 with SMTP id lx20-20020a170906af1400b00844de878684mr8899504ejb.46.1674078943224;
        Wed, 18 Jan 2023 13:55:43 -0800 (PST)
Received: from ?IPV6:2a02:3100:94be:5400:80c7:5ea4:ed2f:1a59? (dynamic-2a02-3100-94be-5400-80c7-5ea4-ed2f-1a59.310.pool.telefonica.de. [2a02:3100:94be:5400:80c7:5ea4:ed2f:1a59])
        by smtp.googlemail.com with ESMTPSA id y11-20020aa7c24b000000b004954c90c94bsm14835385edo.6.2023.01.18.13.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 13:55:42 -0800 (PST)
Message-ID: <7eea145d-d5a7-052c-e458-18f3b842c2ec@gmail.com>
Date:   Wed, 18 Jan 2023 22:55:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v5 3/3] i2c: gpio: support write-only sda/scl w/o pull-up
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <6f4b54d9-ab6d-a4d4-5142-27c89e03c6d2@gmail.com>
In-Reply-To: <6f4b54d9-ab6d-a4d4-5142-27c89e03c6d2@gmail.com>
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

There are slave devices that understand I2C but have read-only SDA and
SCL. Examples are FD650 7-segment LED controller and its derivatives.
Typical board designs don't even have a pull-up for both pins.
Handle the new attributes for write-only SDA and missing pull-up on
SDA/SCL.

For either pin the open-drain and has-no-pullup properties are
mutually-exclusive, what is documented in the DT property documentation.
We don't add an extra warning here because the open-drain properties
are marked deprecated anyway.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v3:
- improve description of attribute sda_is_output_only
v4:
- handle new no-pullup attributes
---
 drivers/i2c/busses/i2c-gpio.c          | 13 ++++++++++---
 include/linux/platform_data/i2c-gpio.h |  9 +++++++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index 0e4385a9b..85b3beb20 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -316,6 +316,12 @@ static void of_i2c_gpio_get_props(struct device_node *np,
 		of_property_read_bool(np, "i2c-gpio,scl-open-drain");
 	pdata->scl_is_output_only =
 		of_property_read_bool(np, "i2c-gpio,scl-output-only");
+	pdata->sda_is_output_only =
+		of_property_read_bool(np, "i2c-gpio,sda-output-only");
+	pdata->sda_has_no_pullup =
+		of_property_read_bool(np, "i2c-gpio,sda-has-no-pullup");
+	pdata->scl_has_no_pullup =
+		of_property_read_bool(np, "i2c-gpio,scl-has-no-pullup");
 }
 
 static struct gpio_desc *i2c_gpio_get_desc(struct device *dev,
@@ -392,7 +398,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 	 * handle them as we handle any other output. Else we enforce open
 	 * drain as this is required for an I2C bus.
 	 */
-	if (pdata->sda_is_open_drain)
+	if (pdata->sda_is_open_drain || pdata->sda_has_no_pullup)
 		gflags = GPIOD_OUT_HIGH;
 	else
 		gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;
@@ -400,7 +406,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->sda))
 		return PTR_ERR(priv->sda);
 
-	if (pdata->scl_is_open_drain)
+	if (pdata->scl_is_open_drain || pdata->scl_has_no_pullup)
 		gflags = GPIOD_OUT_HIGH;
 	else
 		gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;
@@ -418,7 +424,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 
 	if (!pdata->scl_is_output_only)
 		bit_data->getscl = i2c_gpio_getscl;
-	bit_data->getsda = i2c_gpio_getsda;
+	if (!pdata->sda_is_output_only)
+		bit_data->getsda = i2c_gpio_getsda;
 
 	if (pdata->udelay)
 		bit_data->udelay = pdata->udelay;
diff --git a/include/linux/platform_data/i2c-gpio.h b/include/linux/platform_data/i2c-gpio.h
index a907774fd..545639bcc 100644
--- a/include/linux/platform_data/i2c-gpio.h
+++ b/include/linux/platform_data/i2c-gpio.h
@@ -16,16 +16,25 @@
  *	isn't actively driven high when setting the output value high.
  *	gpio_get_value() must return the actual pin state even if the
  *	pin is configured as an output.
+ * @sda_is_output_only: SDA output drivers can't be turned off.
+ *	This is for clients that can only read SDA/SCL.
+ * @sda_has_no_pullup: SDA is used in a non-compliant way and has no pull-up.
+ *	Therefore disable open-drain.
  * @scl_is_open_drain: SCL is set up as open drain. Same requirements
  *	as for sda_is_open_drain apply.
  * @scl_is_output_only: SCL output drivers cannot be turned off.
+ * @scl_has_no_pullup: SCL is used in a non-compliant way and has no pull-up.
+ *	Therefore disable open-drain.
  */
 struct i2c_gpio_platform_data {
 	int		udelay;
 	int		timeout;
 	unsigned int	sda_is_open_drain:1;
+	unsigned int	sda_is_output_only:1;
+	unsigned int	sda_has_no_pullup:1;
 	unsigned int	scl_is_open_drain:1;
 	unsigned int	scl_is_output_only:1;
+	unsigned int	scl_has_no_pullup:1;
 };
 
 #endif /* _LINUX_I2C_GPIO_H */
-- 
2.39.0


