Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A18566D12E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 22:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234885AbjAPV7e (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 Jan 2023 16:59:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234913AbjAPV7d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 Jan 2023 16:59:33 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6094924482;
        Mon, 16 Jan 2023 13:59:32 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id n7so2678766wrx.5;
        Mon, 16 Jan 2023 13:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEER4gG7RrH5nGJS/fGDu3ke+kxVUORVccA45u2Td2I=;
        b=I57QkCHMGlbYXvIovs7C8K3p5Zytg16mB65Ob9eQIV6Vwtx8TEqlIumoit8oKutcGT
         lTu3aMulA6xLCMrbP1NKGtTX7HGNZyPPsXqUsimSRqrtQSS3/2jYA30xr6Tszjx97tqY
         fYCSN+H0eMmBYRkzgeMJ9B7OwT+GQSo+scEUd6Y1B83JqBXXce3EaEYMmkvc0zAC74BA
         XLeKZsx9ASSSkSKIKN+uaIYd9NNVNl3AeNb7dMH+Es2SdZZG7nSxthklaj6PZN2ZuSxl
         Y8/2DLSJ4M214IvRcs23TKO+07KkYLeYV0KEaZwofeWIWyq2oR16mU5X34LkNeEvNp4/
         kM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QEER4gG7RrH5nGJS/fGDu3ke+kxVUORVccA45u2Td2I=;
        b=3qGLvfZP7s/VLIF16lyxChJVkU4U/02B6caaXd2eoV3EPgPMqNvoOw0+yCNTQDxo6F
         OUIuhVWrcqTLBEk1UD/mVMjEp3qITmlVh+WcpNPx67Texk4JxzCG/i90RMLmZce8rpXA
         +HIKnGWlSwd65lvTQ+Cl4MCP/dd7djrEneuuWtGoxe2EP8joDPJGFq18rV6p4CLgiUs7
         X9Y9FrvHJi0syqF9pmrCmIQL2CFjCc4KLaKgr6uWm5/7nwZ5YR1H+9Ker7c7Yu6krezn
         2OaTbIu7rnTMCiGzclIzfx2LVPvdDYEsMiscr4ehDJ66EZOWMXAGwF8wxlHhgMKQjxq+
         HyuQ==
X-Gm-Message-State: AFqh2kojI226W1WyITbe6pt8T5ax/SHc1Kht4cqK3M2l3INcOhPmE8Uy
        P2DcdBL8SIDWNN/Bb+EUiDk=
X-Google-Smtp-Source: AMrXdXus6iZyo3Us6JCHv8ZmIf1c874EeB2R1ko8UPrELl/Lb19IRFOCxvjKMHET2+XlncPt3nYCuQ==
X-Received: by 2002:adf:a318:0:b0:2bd:dc0c:ffd1 with SMTP id c24-20020adfa318000000b002bddc0cffd1mr875897wrb.13.1673906370736;
        Mon, 16 Jan 2023 13:59:30 -0800 (PST)
Received: from ?IPV6:2a01:c23:c4bc:ff00:1041:a2b8:3c58:ba6d? (dynamic-2a01-0c23-c4bc-ff00-1041-a2b8-3c58-ba6d.c23.pool.telefonica.de. [2a01:c23:c4bc:ff00:1041:a2b8:3c58:ba6d])
        by smtp.googlemail.com with ESMTPSA id i6-20020adfe486000000b002423dc3b1a9sm26773622wrm.52.2023.01.16.13.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 13:59:30 -0800 (PST)
Message-ID: <6051bc58-4262-964b-ac92-25d263bd439d@gmail.com>
Date:   Mon, 16 Jan 2023 22:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To:     Peter Rosin <peda@axentia.se>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <3a5545f3-f858-2c80-8bd4-2e0d401a1dc0@gmail.com>
 <af12825d-76b1-e1b8-216e-03761b265a6e@gmail.com>
 <a0fda216-e022-1f18-4b79-bfcc51983713@axentia.se>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 3/3] i2c: gpio: support write-only sda
In-Reply-To: <a0fda216-e022-1f18-4b79-bfcc51983713@axentia.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16.01.2023 08:18, Peter Rosin wrote:
> Hi!
> 
> 2023-01-15 at 11:18, Heiner Kallweit wrote:
>> There are slave devices that understand I2C but have read-only
>> SDA and SCL. Examples are FD650 7-segment LED controller and
>> its derivatives. Typical board designs don't even have a
>> pull-up for both pins. Therefore don't enforce open-drain
>> if SDA and SCL both are unidirectional. This patch makes
>> i2c-gpio usable with such devices, based on new DT property
>> i2c-gpio,sda-output-only.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>> v3:
>> - improve description of attribute sda_is_output_only
>> ---
>>  drivers/i2c/busses/i2c-gpio.c          | 14 +++++++++++---
>>  include/linux/platform_data/i2c-gpio.h |  3 +++
>>  2 files changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
>> index 0e4385a9b..ea108d7e4 100644
>> --- a/drivers/i2c/busses/i2c-gpio.c
>> +++ b/drivers/i2c/busses/i2c-gpio.c
>> @@ -316,6 +316,8 @@ static void of_i2c_gpio_get_props(struct device_node *np,
>>  		of_property_read_bool(np, "i2c-gpio,scl-open-drain");
>>  	pdata->scl_is_output_only =
>>  		of_property_read_bool(np, "i2c-gpio,scl-output-only");
>> +	pdata->sda_is_output_only =
>> +		of_property_read_bool(np, "i2c-gpio,sda-output-only");
>>  }
>>  
>>  static struct gpio_desc *i2c_gpio_get_desc(struct device *dev,
>> @@ -363,6 +365,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>>  	struct device *dev = &pdev->dev;
>>  	struct device_node *np = dev->of_node;
>>  	enum gpiod_flags gflags;
>> +	bool sda_scl_output_only;
>>  	int ret;
>>  
>>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> @@ -391,8 +394,12 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>>  	 * marking these lines to be handled as open drain, and we should just
>>  	 * handle them as we handle any other output. Else we enforce open
>>  	 * drain as this is required for an I2C bus.
>> +	 * If SCL/SDA both are write-only, then this indicates I2C-like slaves
>> +	 * with read-only SCL/SDA. Such slaves don't need open-drain, and partially
>> +	 * don't even work with open-drain.
>>  	 */
>> -	if (pdata->sda_is_open_drain)
>> +	sda_scl_output_only = pdata->sda_is_output_only && pdata->scl_is_output_only;
>> +	if (pdata->sda_is_open_drain || sda_scl_output_only)
> 
> I have not looked closely, but I see no strong reason to tie the SCL
> output-only property to the flags of SDA?
> 

Maybe I best start with explaining my use case. It's about a slave device that has
read-only SDA/SCL and is connected to SDA/SCL GPIO's w/o pull-up resistor.
If the GPIO's are configured as open-drain the slave device doesn't work.
Maybe the slave device SDA/SCL pins have an internal pull-low, I don't know.
So I have to ensure that GPIOD_OUT_HIGH is used for both GPIO's.

I have some doubt that it's safe to use the following. The master may pull SCL
high whilst a clock stretching capable slave pulls SCL low.

if (pdata->scl_is_open_drain || pdata->scl_is_output_only)
	gflags = GPIOD_OUT_HIGH;
else
	gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;

I could use the i2c-gpio,scl-open-drain property that does what I need,
but just by chance and it would be misleading to (mis-)use it.

Maybe add a property i2c-gpio,scl-no-pullup that de-facto is an alias for
i2c-gpio,scl-open-drain?

My patch was based on the assumption that if both, SDA and SCL, are write-only,
then only slaves with read-only SDA/SCL are attached.
I can't imagine a meaningful setup where this assumption isn't true.

>>  		gflags = GPIOD_OUT_HIGH;
>>  	else
>>  		gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;
>> @@ -400,7 +407,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>>  	if (IS_ERR(priv->sda))
>>  		return PTR_ERR(priv->sda);
>>  
>> -	if (pdata->scl_is_open_drain)
>> +	if (pdata->scl_is_open_drain || sda_scl_output_only)
> 
> Same here, why tie the SDA output-only property to the flags of SCL?
> 
> Cheers,
> Peter
> 
>>  		gflags = GPIOD_OUT_HIGH;
>>  	else
>>  		gflags = GPIOD_OUT_HIGH_OPEN_DRAIN;
>> @@ -418,7 +425,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>>  
>>  	if (!pdata->scl_is_output_only)
>>  		bit_data->getscl = i2c_gpio_getscl;
>> -	bit_data->getsda = i2c_gpio_getsda;
>> +	if (!pdata->sda_is_output_only)
>> +		bit_data->getsda = i2c_gpio_getsda;
>>  
>>  	if (pdata->udelay)
>>  		bit_data->udelay = pdata->udelay;
>> diff --git a/include/linux/platform_data/i2c-gpio.h b/include/linux/platform_data/i2c-gpio.h
>> index a907774fd..e9536c078 100644
>> --- a/include/linux/platform_data/i2c-gpio.h
>> +++ b/include/linux/platform_data/i2c-gpio.h
>> @@ -16,6 +16,8 @@
>>   *	isn't actively driven high when setting the output value high.
>>   *	gpio_get_value() must return the actual pin state even if the
>>   *	pin is configured as an output.
>> + * @sda_is_output_only: SDA output drivers can't be turned off.
>> + *	This is for clients that can only read SDA/SCL.
>>   * @scl_is_open_drain: SCL is set up as open drain. Same requirements
>>   *	as for sda_is_open_drain apply.
>>   * @scl_is_output_only: SCL output drivers cannot be turned off.
>> @@ -24,6 +26,7 @@ struct i2c_gpio_platform_data {
>>  	int		udelay;
>>  	int		timeout;
>>  	unsigned int	sda_is_open_drain:1;
>> +	unsigned int	sda_is_output_only:1;
>>  	unsigned int	scl_is_open_drain:1;
>>  	unsigned int	scl_is_output_only:1;
>>  };

