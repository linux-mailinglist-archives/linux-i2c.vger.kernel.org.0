Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1C87E3639
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Nov 2023 09:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbjKGIEj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Nov 2023 03:04:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233686AbjKGIEh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Nov 2023 03:04:37 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3609D7A
        for <linux-i2c@vger.kernel.org>; Tue,  7 Nov 2023 00:04:33 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40859c46447so33638225e9.1
        for <linux-i2c@vger.kernel.org>; Tue, 07 Nov 2023 00:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699344272; x=1699949072; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6g/I5DxqmnAaVHsRupYRyE9TPG0ePVByaoS4lmQcYU=;
        b=kOjQnmMh9qLmL/EMerjqLacU902eIL11mTs8/4S1MCszwVr4AIIPRWg0Sr7+PqGNTi
         NMWi8j7secW3pBH/Gmj8ybi6qlNvzGAI2IDQmnFBudgYuu7l4iZJON/KDLcqQqcURdQy
         XUgT+41Iz4YYgnjikaWvNhmyckKcQ04W7kQGctz7klPxdNCVzZDNy4BYbkzt8J4Mf/fg
         6ZwhKQxs6Uw5J9jLh7jQMU84a+00K1hTQJtv+8F86OyiLhXq8nE7FQJXOSCF5Uf79zEc
         MJrMpaFrkEDBOt7B+2LWrNUYOle8MkucdZskf2QlL/1Hado9mlDcbKyW39rMiFgGUBPo
         X5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699344272; x=1699949072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V6g/I5DxqmnAaVHsRupYRyE9TPG0ePVByaoS4lmQcYU=;
        b=Lr7kG1yn903KRVCOpbKUjbZxY3pClN5BT71SO0GnjMavoeq7oPXnA5vJsUdeM+kPJm
         FbByFYAFKzeMVJfyg8aw1+wMAcUPgI3xsc4ijVVpLCcmQQlaJ1IAghH+xtb5ErK1my/1
         kpnAx4Oy8dRJ97Bn8EiJ9pGcKVdK+hASWxUjD6LF5+NdZKJLxjZcwymRXvgqjzHQTQS+
         twZ1alEbZtFksr6uWh7zAeSwM3FZ5cFeUa6TUepvSpWbWznEtkz3tZsCortLmocYw3B/
         eMrwgRFH27VCG8rwiSlovRV8YFdloV5zF9RqAo34qwUBXuaZYltd6524oZL030t6yclR
         dcCA==
X-Gm-Message-State: AOJu0YzTGZvmYSh6FvnUeJzyOAAgRzkyqbAksGct8H/sL1lrnaZgARFw
        Pgc1EYY2okQAGj0Dw7xLEcA=
X-Google-Smtp-Source: AGHT+IG5Ao0ztA7xf5VMPa6sKCPF2jOrZiNPeT7YbDeHfVZJ+8roelhU6qMcuVJ0StzLe4ds0nS9kA==
X-Received: by 2002:a7b:cc0c:0:b0:408:500b:a476 with SMTP id f12-20020a7bcc0c000000b00408500ba476mr1818846wmh.20.1699344271751;
        Tue, 07 Nov 2023 00:04:31 -0800 (PST)
Received: from ?IPV6:2a01:c22:6f6b:1c00:45f5:1cd8:f090:5720? (dynamic-2a01-0c22-6f6b-1c00-45f5-1cd8-f090-5720.c22.pool.telefonica.de. [2a01:c22:6f6b:1c00:45f5:1cd8:f090:5720])
        by smtp.googlemail.com with ESMTPSA id l26-20020a05600c1d1a00b003fef5e76f2csm12352454wms.0.2023.11.07.00.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 00:04:31 -0800 (PST)
Message-ID: <a22978a4-88e4-46f4-b71c-032b22321599@gmail.com>
Date:   Tue, 7 Nov 2023 09:04:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i801: Use I2C_CLASS_HWMON for i2c mux children
Content-Language: en-US
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>
References: <45c5366f-cbee-4c7d-bb62-a446935b2729@gmail.com>
 <20231106155036.366fb752@endymion.delvare>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20231106155036.366fb752@endymion.delvare>
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

On 06.11.2023 15:50, Jean Delvare wrote:
> Hi Heiner,
> 
> On Tue, 31 Oct 2023 21:30:22 +0100, Heiner Kallweit wrote:
>> In case there ever should be a jc42-driven device on a muxed child bus,
>> we may end up with multiple logical devices, see linked discussion.
>>
>> jc42 is the only remaining i2c client device driver supporting
>> I2C_CLASS_SPD, however it supports I2C_CLASS_HWMON too. Therefore
>> we can safely switch to I2C_CLASS_HWMON on the muxed child busses.
>> IMO it's more logical anyway that the muxed child busses support
>> the same class that the parent supports if it's not muxed.
>>
>> This change is one further step towards removing I2C_CLASS_SPD.
>>
>> Link: https://www.spinics.net/lists/linux-i2c/msg65458.html
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-i801.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
>> index 070999139..8c9bb2e09 100644
>> --- a/drivers/i2c/busses/i2c-i801.c
>> +++ b/drivers/i2c/busses/i2c-i801.c
>> @@ -1298,7 +1298,7 @@ static struct i801_mux_config i801_mux_config_asus_z8_d12 = {
>>  	.gpio_chip = "gpio_ich",
>>  	.values = { 0x02, 0x03 },
>>  	.n_values = 2,
>> -	.classes = { I2C_CLASS_SPD, I2C_CLASS_SPD },
>> +	.classes = { I2C_CLASS_HWMON, I2C_CLASS_HWMON },
>>  	.gpios = { 52, 53 },
>>  	.n_gpios = 2,
>>  };
>> @@ -1307,7 +1307,7 @@ static struct i801_mux_config i801_mux_config_asus_z8_d18 = {
>>  	.gpio_chip = "gpio_ich",
>>  	.values = { 0x02, 0x03, 0x01 },
>>  	.n_values = 3,
>> -	.classes = { I2C_CLASS_SPD, I2C_CLASS_SPD, I2C_CLASS_SPD },
>> +	.classes = { I2C_CLASS_HWMON, I2C_CLASS_HWMON, I2C_CLASS_HWMON },
>>  	.gpios = { 52, 53 },
>>  	.n_gpios = 2,
>>  };
>> @@ -1395,6 +1395,9 @@ static void i801_add_mux(struct i801_priv *priv)
>>  
>>  	mux_config = id->driver_data;
>>  
>> +	/* Parent and mux children class support must not overlap */
>> +	priv->adapter.class = 0;
> 
> There may also be a hardware monitoring device on the parent segment on
> these boards. With this change, that device will no longer be detected.
> That would be a regression, so I have to nack this proposed change,
> sorry.
> 
Hmm, right. To me it seems we have a fundamental problem:
The parent has no way to find out whether a detected device sits on
the parent segment or whether it belongs to a muxed child segment.
In the latter case the device may show up twice, as you mentioned
before.
And the core check "supported classes of parent and child must not
overlap" doesn't consider that we may have e.g. hwmon devices
on parent segment and on muxed child segment too.

> The only way forward I can think of (if we want to get rid of
> I2C_CLASS_SPD) would be to remove device auto-detection on children
> segments completely (.class = 0 for them) and instead actively probe
> for SPD EEPROMs and JC42 thermal sensors on these segments. For SPD we
> should be able to just reuse i2c_register_spd(). For JC42 we would need
> similar code, which doesn't exist yet.
> 

Regarding the first part, removing auto-detection on muxed children:
We have only two i2c mux drivers supporting auto-detection, i2c-mux-gpio
and i2c-mux-reg. Both do not support auto-detection for DT-configured
systems.
Only user for i2c-mux-gpio is i801. Only user for i2c-mux-reg is
drivers/platform/x86/mlx-platform, and it doesn't make use of
auto-detection.
So I think as first step we should remove auto-detection support from
i2c-mux-reg.
Then we could do the same for i2c-mux-gpio, and afterwards remove the
class parameter from i2c_mux_add_adapter().
So we need an "i2c_register_jc42()" only for use by i801.
What's good, because we can make this function private to i801 and
won't attract any potential additional users.

+ i2c-mux-gpio and i2c-mux-reg maintainers

