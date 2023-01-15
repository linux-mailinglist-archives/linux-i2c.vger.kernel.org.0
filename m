Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE5266B04E
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Jan 2023 11:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjAOKSt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Jan 2023 05:18:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbjAOKSc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Jan 2023 05:18:32 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73DDCDEB;
        Sun, 15 Jan 2023 02:18:30 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id az7so24866604wrb.5;
        Sun, 15 Jan 2023 02:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjLp6QWv6hG/L4se1xznm41jj/SIL/KV5mwnUzjGRjg=;
        b=V2haQMHoal0fFvcaeMRlztSg2HXfsgfRLiGj14vaZT4Ay7nVwHyBixyGeyHxMz8qjz
         DV4yB2W6Yw2epyhx4BGcpQ7ot3UL6S2apbO8J1dVU+kIWLs/4t40NmK7FrEQn0dUWjsH
         9TZ7sMsj90TKmhqd/wNg0+XYFkBTpPEDYWuSN/GeOS62YMVzCTTtRzrD8KH0W6kUpRdz
         l+B5SlP4btvH00FCClBAvO0b93iuFFhMZKzwKY5HVp3MW4FgujxsYtaUc04UnZpjjMKP
         e7Ih3pCOXlVZgyqVwDvApeUlKJsgUMZwRxzWmDSBfRaQfe9LV54cv0Q4KWvirSvfCZNh
         NT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QjLp6QWv6hG/L4se1xznm41jj/SIL/KV5mwnUzjGRjg=;
        b=pWnAYvBmSAFmxqHDfAj/UAvjyNIOQ1iXff3/0Y7lKlWhnPRXDSfnrVOkNYPA8u+N7K
         EEdMtV4HAI1nqGj947UmTSB0uRLQ7rmPMe9nYKqVxhUlM8AlTcjrEei3SPcODzAUDGzz
         a3te9cw+bn+PEU8/EN7SZVbm8I0Y3oQTgOnqW5m02iAXagmCAfa48I6fYAlO24ZG3ftS
         3eaG1zcibVFcgWjkMrMYBktfYK5vNule3mk0lzexIBClyIx3NwdlW8D9DHpOepZOgUNu
         MlvMgQZCsOe70lDFr/0xVjg5drnQl3gT1FIFeAVFeOkPXUBCde/VqgFZJ9TJYfSpIz7O
         T1PQ==
X-Gm-Message-State: AFqh2kprZwurQYyD/OsQcHrZ5VnCrpWwG0xTRXo6+EBq8YajnCv/dJMv
        btNAsfx5SdRvGTqrz8PyDSg=
X-Google-Smtp-Source: AMrXdXsdMKp8fN+naOGWSJXrvWof5ui/BkPM/JpwR76wJirFQ3AUkLZilNLJUS+/q0RO9JN+yMc3NA==
X-Received: by 2002:a5d:4a45:0:b0:2bb:62bf:f5ce with SMTP id v5-20020a5d4a45000000b002bb62bff5cemr19755850wrs.35.1673777909335;
        Sun, 15 Jan 2023 02:18:29 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e61:8c00:154f:326e:8d45:8ce7? (dynamic-2a01-0c22-6e61-8c00-154f-326e-8d45-8ce7.c22.pool.telefonica.de. [2a01:c22:6e61:8c00:154f:326e:8d45:8ce7])
        by smtp.googlemail.com with ESMTPSA id k2-20020a5d5182000000b00236545edc91sm23789073wrv.76.2023.01.15.02.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 02:18:29 -0800 (PST)
Message-ID: <af12825d-76b1-e1b8-216e-03761b265a6e@gmail.com>
Date:   Sun, 15 Jan 2023 11:18:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <3a5545f3-f858-2c80-8bd4-2e0d401a1dc0@gmail.com>
Subject: [PATCH v3 3/3] i2c: gpio: support write-only sda
In-Reply-To: <3a5545f3-f858-2c80-8bd4-2e0d401a1dc0@gmail.com>
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
v3:
- improve description of attribute sda_is_output_only
---
 drivers/i2c/busses/i2c-gpio.c          | 14 +++++++++++---
 include/linux/platform_data/i2c-gpio.h |  3 +++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index 0e4385a9b..ea108d7e4 100644
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
index a907774fd..e9536c078 100644
--- a/include/linux/platform_data/i2c-gpio.h
+++ b/include/linux/platform_data/i2c-gpio.h
@@ -16,6 +16,8 @@
  *	isn't actively driven high when setting the output value high.
  *	gpio_get_value() must return the actual pin state even if the
  *	pin is configured as an output.
+ * @sda_is_output_only: SDA output drivers can't be turned off.
+ *	This is for clients that can only read SDA/SCL.
  * @scl_is_open_drain: SCL is set up as open drain. Same requirements
  *	as for sda_is_open_drain apply.
  * @scl_is_output_only: SCL output drivers cannot be turned off.
@@ -24,6 +26,7 @@ struct i2c_gpio_platform_data {
 	int		udelay;
 	int		timeout;
 	unsigned int	sda_is_open_drain:1;
+	unsigned int	sda_is_output_only:1;
 	unsigned int	scl_is_open_drain:1;
 	unsigned int	scl_is_output_only:1;
 };
-- 
2.39.0


