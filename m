Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74F29502B0D
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Apr 2022 15:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354080AbiDONkP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 09:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354096AbiDONkG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 09:40:06 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6FD8BB0BA;
        Fri, 15 Apr 2022 06:36:16 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id c6so9935826edn.8;
        Fri, 15 Apr 2022 06:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=2dA0epvc5N7hFjokHdhzA9rWHZSUiHXiHzxOnGfMxpU=;
        b=nSM0rLTRmSwkDd5hLrNSN3HsVr3JyqETDo/7IzxE9MrRJwnLU0X/5+CUvYj0WLsLZ2
         6cYVEm4sC3Wb8BI6Wjw2ov4Ohe6nGXkupxmwa3ubCb5fbCr79GxIo9XrHnYhAw1A0Ora
         n97aHVtTOdtqNe4Q5gJFq1yQFWX8nplpa6y4MA3c2hae87VG1AMRLpshDHSYgSeTh/yS
         2TOTf9q9MKa4VjLJfCeg12Wk6wFxCbTVI6sSj+RTMyNMe2QHml9+/gr0nLyGTezVLlQJ
         xyD/4YdnPfIHLZlwvUX3m+LXmNKOSnDullCPp5is+FIlNq5HnucsMaZEhaI+Uu8BC01R
         GppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=2dA0epvc5N7hFjokHdhzA9rWHZSUiHXiHzxOnGfMxpU=;
        b=QNrxM5zDDRe4M4siGjclNvUvTYl6Sc//FohMfIz1z3iCl/DxCYcDQTt6I9ZYBbeEBf
         x5HyJ3tvBCj2nrL1yx5JsGx30TwV7LXUixCVo2ni5/sFrUio1oDv51gD0QUb3PNL5qS1
         dEOlMJdX+66UFal1DMyQXrYfS+/XQvyuwEbDNfW+biEq5A94tYb+PFB5Z+MbSj1Mjsqe
         GwgLj94TQ4QA7ou+amMYcgAkwg4K5/fvYcQiN7+CBMGN6Q+d2aS6G4Qu7ePbRT+JSyb3
         0RKVUa6IpwGxmvd4bB2ascvzU+HBfS5Z42ZekPMWxBj/EUW6Jq52VbqoCch3PxMJ4JN6
         zP7A==
X-Gm-Message-State: AOAM5314mN8Dl9haMMxIS9ErYot36nIvS68H7jaoxVH+wjaRucwI1BBs
        TNI7dZYGK8i9jrxdgHuzXQ4=
X-Google-Smtp-Source: ABdhPJw61r8DFzHBTa8cU7+3p5/gfze63H8SWyVbYK/jtnD8zHLPxyUF5Q3jI4eBXpP9VZvjFVnvMw==
X-Received: by 2002:a05:6402:36d:b0:41d:7a5f:8393 with SMTP id s13-20020a056402036d00b0041d7a5f8393mr8181759edw.277.1650029775441;
        Fri, 15 Apr 2022 06:36:15 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6faa:ed00:b906:e23f:946b:b9f7? (dynamic-2a01-0c22-6faa-ed00-b906-e23f-946b-b9f7.c22.pool.telefonica.de. [2a01:c22:6faa:ed00:b906:e23f:946b:b9f7])
        by smtp.googlemail.com with ESMTPSA id o15-20020a50fd8f000000b0041f95b8a90dsm2617410edt.69.2022.04.15.06.36.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Apr 2022 06:36:14 -0700 (PDT)
Message-ID: <c007cba9-2dfd-181a-2726-944af48b312a@gmail.com>
Date:   Fri, 15 Apr 2022 15:35:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 3/3] i2c: gpio: support write-only sda
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <bc229e73-52aa-9f5d-c6fd-e84b64a589ba@gmail.com>
In-Reply-To: <bc229e73-52aa-9f5d-c6fd-e84b64a589ba@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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


