Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2496705CD
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 22:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjAQV7V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 16:59:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjAQV6e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 16:58:34 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104064B1BC;
        Tue, 17 Jan 2023 12:39:52 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id mg12so5901510ejc.5;
        Tue, 17 Jan 2023 12:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qhuunm12DEUADeX8dZ1+bPKvTYYCnKP/G5wxRkVG32M=;
        b=C0R6/YwzfY0T7pWfj1KfzrJMC5SROY64WVHpv9q03vsb1sWMnmpnyJDkQ0577A527Y
         Q5JvKbM4xbjkk5TBLmzKZ4CjUefEXu/yLdSOpk1kYGHKw0+/XNX1ZJqwtq8vGcJJjBlc
         X1Z+VDPZ9J8ZAl6Kpr+5M8JhAocBRGc1Kz0r741kDFmONPvYv9/fhuoyZploNhkjIDBd
         eyqhOE8oqXhzQjD6Jgd1521qa32Ftw6L9XqDt1N/9b0o0lWzhYSySg+Ym7wmdDo4iy2s
         YONXrK7yRsIcJjYXuXQj+ta8z2iWkfSY+ibhge3MTdDDnsklxzkRt0wo+XdFXBnxSSO/
         yhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qhuunm12DEUADeX8dZ1+bPKvTYYCnKP/G5wxRkVG32M=;
        b=KUJsCX9WhItOrWCyi4RoGaeMUlUeU97G68a/txU/ieY804ojEEWT7KnEhaBzn0VZFG
         3EH/s39FlZPRHANEH2iQPTOHaDjEf4JDBVeJZpj/uwuuDeVRU7m0kVstfUI+OdMJOF33
         h3v5eYiFxFEVGBipvS5307x+AKSeaBfO4ZdvIK9UNmot7X+0EJ7k+3HNCx7/CwkjAEjp
         c6q3Lgxy2zGrFMYGswB+F6E49klhmFkFLckw9fVczZw4VxQom+tXFbxIK47PoDTkNdhV
         nFEz3lxefpmX1Tcsl2Ki0XOyxMu1zMBTxeOlmS88tZlqCxc38J8ykHKEww/szAi0kF6m
         sZJA==
X-Gm-Message-State: AFqh2kqOKPGRmSF+Zt5vWF0MOqSvN/9UU5W6/Uh/tWMMQZ9g2GXO9sSv
        ncqiG7vIYstVSgh/CNuPu1JwzO1SX00=
X-Google-Smtp-Source: AMrXdXuVeW6YLq5/ciKW4vskN7m/dm4j3ksM0yiEaslkEmcfX81qP4Hul8QfbtJ5HXmPY4q3blbKow==
X-Received: by 2002:a17:906:6b03:b0:86e:26d8:52ff with SMTP id q3-20020a1709066b0300b0086e26d852ffmr5452018ejr.2.1673987990514;
        Tue, 17 Jan 2023 12:39:50 -0800 (PST)
Received: from ?IPV6:2a01:c22:7346:8100:11fa:3b53:e36a:9e73? (dynamic-2a01-0c22-7346-8100-11fa-3b53-e36a-9e73.c22.pool.telefonica.de. [2a01:c22:7346:8100:11fa:3b53:e36a:9e73])
        by smtp.googlemail.com with ESMTPSA id p14-20020a17090653ce00b0085ea718a81bsm8213416ejo.198.2023.01.17.12.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 12:39:50 -0800 (PST)
Message-ID: <b2b52a43-0dff-d363-fc2b-deb20c1097a2@gmail.com>
Date:   Tue, 17 Jan 2023 21:39:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v4 3/3] i2c: gpio: support write-only sda/scl w/o pull-up
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <57666b4f-4c12-7feb-caf1-5bd38908bfc7@gmail.com>
In-Reply-To: <57666b4f-4c12-7feb-caf1-5bd38908bfc7@gmail.com>
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


