Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD06390C7B
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 00:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbhEYWy5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 18:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhEYWy4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 May 2021 18:54:56 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E69C061574;
        Tue, 25 May 2021 15:53:24 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id f20-20020a05600c4e94b0290181f6edda88so7488962wmq.2;
        Tue, 25 May 2021 15:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=reDM3jFc19oKCFJlz500fPCv9/GS7ihZ1/NylsFXAi8=;
        b=raQd9OTH9uCIvVlLRCoa5+T4rvcKEsectlqRKDUA/KMhSkZEEp2mX5+83qTKq46eUM
         uIwB+2XdUVPQ0gMseEIUgUpnZE9f1wg9GYGNbYQTSWE6/nv6CQT65096mWPCF65oYVxn
         9L8O9Oc5Mb7n/Ia38As1ZkwDaVJqfTThDiHKQzCItVXEdqg7LtmjixaXuMMgCK6Ig3Ff
         4QZ32erEQ0H555qyt2xKLH3yjXzXCnWnmnrTvb1Ceseqs9y2pMeuLc5ztkxTB2gQjEYG
         eyRqx9IbkOwTi8xUeqvLkHfqIyc0oKg2PAGK1gZfwHTUl5uhWFLnwRr5ZMvZujTPDdJl
         2k+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=reDM3jFc19oKCFJlz500fPCv9/GS7ihZ1/NylsFXAi8=;
        b=roXn1kG2o3Qq057WHXBKjeJ0xmeQw7rZTj4FbQC8ao/lV3TLpU8XJ6dOqUd1sOr+v5
         DUlUii2Hy3otg1NtvH5aqTGlaLG+6MlnsA5wCviqz++TH0iz8nX1KwGIk15VgTQfam/i
         2Wc5uQB4BhCS4rQsGzy1wtINvrEgiqVy8817Vy9uhhAETI8+3cQyqOwLDUhgPMXbcHuA
         Ubh5v0uQILnOVKuJSs2GtVankQuVo69TnLW5wjDVgr6WhBj7Wmesr+8FkiDvCdQgjwD+
         WQBPQVymPUtFcpLGRkrtS6WNoCyn/d3GPrJyujceCE7hisU5sy5+b5z0wARlaEHgdWy1
         XH4g==
X-Gm-Message-State: AOAM531JWxuKWKNIQo3gF9VVBte/G641Khg4B49SZTSSIksxRY+UwjQ1
        yWaTm7Gg9KfdW1TwrZfo9dPGvDntAXs=
X-Google-Smtp-Source: ABdhPJw546gEmZ1nK6tk1g/lyiMMiRk3FHagS3+zvR+uDwiNQ85UPv2DV/NENvTbCsLZ9hgKYh/Pjg==
X-Received: by 2002:a1c:6a0f:: with SMTP id f15mr23961465wmc.29.1621983203295;
        Tue, 25 May 2021 15:53:23 -0700 (PDT)
Received: from [192.168.1.211] ([91.110.20.117])
        by smtp.gmail.com with ESMTPSA id r7sm11905348wmq.18.2021.05.25.15.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 15:53:22 -0700 (PDT)
Subject: Re: [PATCH v4 7/8] platform/x86: Add intel_skl_int3472 driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org, Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20210520140928.3252671-1-djrscally@gmail.com>
 <20210520140928.3252671-8-djrscally@gmail.com>
 <YKeuQM/O9+jDZFpb@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <6294177b-d6e1-8bbd-d313-5cce1c498604@gmail.com>
Date:   Tue, 25 May 2021 23:53:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKeuQM/O9+jDZFpb@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy - thanks for comments

On 21/05/2021 13:57, Andy Shevchenko wrote:

>> +/*
>> + * The regulators have to have .ops to be valid, but the only ops we actually
>> + * support are .enable and .disable which are handled via .ena_gpiod. Pass an
>> + * empty struct to clear the check without lying about capabilities.
>> + */
>> +static const struct regulator_ops int3472_gpio_regulator_ops;
> Hmm... Can you use 'reg-fixed-voltage' platform device instead?
>
> One example, although gone from upstream, but available in the tree, I can
> point to is this:
>
>   git log -p -- arch/x86/platform/intel-mid/device_libs/platform_bcm43xx.c
>
> It uses constant structures, but I think you may dynamically generate the
> necessary ones.
>

I can experiment with this, though one thing is we have no actual idea
what voltages these are supplying...it doesn't look like that matters
from drivers/regulator/fixed.c, but I'd have to try it to be sure.

> +
> +static int skl_int3472_clk_enable(struct clk_hw *hw)
> +{
> +	/*
> +	 * We're just turning a GPIO on to enable the clock, which operation
> +	 * has the potential to sleep. Given .enable() cannot sleep, but
> +	 * .prepare() can, we toggle the GPIO in .prepare() instead. Thus,
> +	 * nothing to do here.
> +	 */
> It's a nice comment, but you are using non-sleeping GPIO value setters. Perhaps
> you need to replace them with gpiod_set_value_cansleep()?


That would make sense!


>> +static unsigned int skl_int3472_get_clk_frequency(struct int3472_discrete_device *int3472)
>> +{
>> +	union acpi_object *obj;
>> +	unsigned int freq;
>> +
>> +	obj = skl_int3472_get_acpi_buffer(int3472->sensor, "SSDB");
>> +	if (IS_ERR(obj))
>> +		return 0; /* report rate as 0 on error */
>> +
>> +	if (obj->buffer.length < CIO2_SENSOR_SSDB_MCLKSPEED_OFFSET + sizeof(u32)) {
>> +		dev_err(int3472->dev, "The buffer is too small\n");
>> +		goto out_free_buff;
> First of all, freq will be uninitialized here.
>
> I'm wondering if you can simple drop the goto and replace it with direct steps, i.e.
> 	kfree(obj);
> 	return 0;


Sure, I have no real preference; I'll do that instead.


>> +static const struct int3472_sensor_config *
>> +skl_int3472_get_sensor_module_config(struct int3472_discrete_device *int3472)
>> +{
>> +	const struct int3472_sensor_config *ret;
>> +	union acpi_object *obj;
>> +	unsigned int i;
>> +
>> +	obj = acpi_evaluate_dsm_typed(int3472->sensor->handle,
>> +				      &cio2_sensor_module_guid, 0x00,
>> +				      0x01, NULL, ACPI_TYPE_STRING);
>> +
>> +	if (!obj) {
>> +		dev_err(int3472->dev,
>> +			"Failed to get sensor module string from _DSM\n");
>> +		return ERR_PTR(-ENODEV);
>> +	}
>> +
>> +	if (obj->string.type != ACPI_TYPE_STRING) {
>> +		dev_err(int3472->dev,
>> +			"Sensor _DSM returned a non-string value\n");
>> +		ret = ERR_PTR(-EINVAL);
>> +		goto out_free_obj;
>> +	}
>> +	ret = ERR_PTR(-EINVAL);
>> +	for (i = 0; i < ARRAY_SIZE(int3472_sensor_configs); i++) {
>> +		if (!strcmp(int3472_sensor_configs[i].sensor_module_name,
>> +			    obj->string.pointer)) {
>> +			ret = &int3472_sensor_configs[i];
>> +			break;
>> +		}
>> +	}
> Can be refactored like this:
>
> 	for (i = 0; i < ARRAY_SIZE(int3472_sensor_configs); i++) {
> 		if (!strcmp(int3472_sensor_configs[i].sensor_module_name,
> 			    obj->string.pointer))
> 			break;
> 	}
>
> 	ACPI_FREE(obj);
>
> 	if (i >= ARRAY_SIZE(int3472_sensor_configs))
> 		return ERR_PTR(-EINVAL);
>
> 	return &int3472_sensor_configs[i];


Yeah ok, I like this better than the ret = ERR_PTR(-EINVAL) before the
loop; thank you.


>> + * Return:
>> + * * 0		- When all resources found are handled properly.
> Positive number ... ?
>> +	if (!acpi_gpio_get_io_resource(ares, &agpio))
>> +		return 1; /* Deliberately positive so parsing continues */
> Move it to description above?


oops, yes, I'll add those to the comment.


>> +	if (int3472->clock.ena_gpio) {
>> +		ret = skl_int3472_register_clock(int3472);
>> +		if (ret)
>> +			goto out_free_res_list;
>> +	} else {
> Hmm... Have I got it correctly that we can't have ena_gpio && led_gpio together?


No, just that we can only have led_gpio if we also have ena_gpio (at
least that's the intention...)


>> +	if (ret)
>> +		ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> This I don't like. Since we get a returned variable with different meaning, can
> we use a specific variable name for it? On top of that, I would rather see
> something like this:
>
> 	whatever = skl_...(...);
> 	switch (whatever) {
> 	case WHATEVER_ONE_CASE:
> 		if (cldb.control_logic_type != 2) {
> 			dev_err(&client->dev, "Unsupported control logic type %u\n",
> 				cldb.control_logic_type);
> 			return -EINVAL;
> 		}
> 		cells_data = tps68470_win;
> 		cells_size = ARRAY_SIZE(tps68470_win);
> 		break;
> 	case WHATEVER_ANOTHER_CASE:
> 		...
> 		break;
> 	default:
> 		...Oops...
> 		break; // or return -ERRNO
> 	}
>
> 	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> 				    cells_data, cells_size, NULL, 0, NULL);
>
Yeah I guess that's a bit obscure at first glance; alright, I'll follow
this to make it clearer what's happening there.
