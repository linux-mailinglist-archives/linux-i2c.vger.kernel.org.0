Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69AB17DD717
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 21:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232698AbjJaUa3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 16:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjJaUa3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 16:30:29 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122C5F3
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 13:30:25 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9d216597f64so512731466b.3
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 13:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698784223; x=1699389023; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZ0fpFws3Q2gJ7ih+xPfWI4qbvw2mB7kzlrYxK/aR90=;
        b=CgEdlOf29bsjXPj1Y9YsNEsITpoPAjW1VNa4OkP7hNSekOTcgnJ5KkGX29sEvJ+k2Q
         Urh+L0hgD2M+lx+cusfp7U5+F4YKcPUMLGj/ufmEBzpFANiRHhBbzCMFn9xa1z05f+QV
         25H18C7rZKBY8OvqNjkqj+5xhVkgZvnreIDAuPo9Yk3W+Z6x5vfn27NSFF5OZvDIiGts
         H4+rAmS9QIRFJiD0AygikqURkk6gjO2HTgEy3Jr7C9q7YPma+wgIMaUcbDmklZxq2Nxr
         tt0HSpzCVwjfaCoMAxuKGa7Owm983+f+w9eahLGEcQxQ4EAJercD/NcmOuslMBTmssA2
         dYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698784223; x=1699389023;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZ0fpFws3Q2gJ7ih+xPfWI4qbvw2mB7kzlrYxK/aR90=;
        b=HslnIUguAcQFD0OCZCHzkGxuXuLZ7OqDT3ogEyvQLTm0Ou2mEbBNfj45dFeiNELjpU
         ZM41VUUw0PgW5tglKNp4xYYrtDViTqrVSQNtXEV76jN70Sre4LGm2VXdZ5I1RHgkjNKC
         PA9K+YTVMQCfkiPok8lHnPQYvcq2iHWx6gYCp8zcyAAQNRRnUneq5m2ABpyPbWtjQV9d
         TBYP+pb/pDITIOQn2wai63Z6u/Ff7H279949d+wMVSfIVz309XRQKPNrmNBHxRla+1+v
         bTWOfyrfAl7kbXkO1CcAdiwhTFZEoH7waFYrvQh9HgGPmviQ0pD9W8avIM0MNFk7gv/d
         IF1A==
X-Gm-Message-State: AOJu0Yzeg8k8JCMr715SVI2e3+blZBSnd4r9CQJkU2kX8+J7PG0vI4fT
        Z9u2ksQHMXT+EyUK4Ndxlgo=
X-Google-Smtp-Source: AGHT+IGpEZz8a1JWP1+sJzF3/IMjrKyItDPg1ZC34q6mtsILXFHcSZEkoOj4qzXHxb8Qi0I4ylIiLA==
X-Received: by 2002:a17:906:4784:b0:9b9:facb:d950 with SMTP id cw4-20020a170906478400b009b9facbd950mr357987ejc.72.1698784223204;
        Tue, 31 Oct 2023 13:30:23 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c07e:7700:4190:4a51:d58f:fb30? (dynamic-2a01-0c23-c07e-7700-4190-4a51-d58f-fb30.c23.pool.telefonica.de. [2a01:c23:c07e:7700:4190:4a51:d58f:fb30])
        by smtp.googlemail.com with ESMTPSA id f7-20020a170906084700b009aa292a2df2sm1472161ejd.217.2023.10.31.13.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 13:30:22 -0700 (PDT)
Message-ID: <45c5366f-cbee-4c7d-bb62-a446935b2729@gmail.com>
Date:   Tue, 31 Oct 2023 21:30:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Use I2C_CLASS_HWMON for i2c mux children
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In case there ever should be a jc42-driven device on a muxed child bus,
we may end up with multiple logical devices, see linked discussion.

jc42 is the only remaining i2c client device driver supporting
I2C_CLASS_SPD, however it supports I2C_CLASS_HWMON too. Therefore
we can safely switch to I2C_CLASS_HWMON on the muxed child busses.
IMO it's more logical anyway that the muxed child busses support
the same class that the parent supports if it's not muxed.

This change is one further step towards removing I2C_CLASS_SPD.

Link: https://www.spinics.net/lists/linux-i2c/msg65458.html
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 070999139..8c9bb2e09 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1298,7 +1298,7 @@ static struct i801_mux_config i801_mux_config_asus_z8_d12 = {
 	.gpio_chip = "gpio_ich",
 	.values = { 0x02, 0x03 },
 	.n_values = 2,
-	.classes = { I2C_CLASS_SPD, I2C_CLASS_SPD },
+	.classes = { I2C_CLASS_HWMON, I2C_CLASS_HWMON },
 	.gpios = { 52, 53 },
 	.n_gpios = 2,
 };
@@ -1307,7 +1307,7 @@ static struct i801_mux_config i801_mux_config_asus_z8_d18 = {
 	.gpio_chip = "gpio_ich",
 	.values = { 0x02, 0x03, 0x01 },
 	.n_values = 3,
-	.classes = { I2C_CLASS_SPD, I2C_CLASS_SPD, I2C_CLASS_SPD },
+	.classes = { I2C_CLASS_HWMON, I2C_CLASS_HWMON, I2C_CLASS_HWMON },
 	.gpios = { 52, 53 },
 	.n_gpios = 2,
 };
@@ -1395,6 +1395,9 @@ static void i801_add_mux(struct i801_priv *priv)
 
 	mux_config = id->driver_data;
 
+	/* Parent and mux children class support must not overlap */
+	priv->adapter.class = 0;
+
 	/* Prepare the platform data */
 	memset(&gpio_data, 0, sizeof(struct i2c_mux_gpio_platform_data));
 	gpio_data.parent = priv->adapter.nr;
-- 
2.42.0

