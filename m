Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D32F2FAC7C
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 22:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394588AbhARVUj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 16:20:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394581AbhARVUg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 16:20:36 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F228C0613C1;
        Mon, 18 Jan 2021 13:19:56 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id i63so14775839wma.4;
        Mon, 18 Jan 2021 13:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=QeTGjTOjovKjwl3obfQQbrmZun7B3WQGrzr0gIWDHE4=;
        b=D/dXT5h0UbpIkNvnAPEIoLqZvcKvZrdFQCUpqlZ73sksgcXetxd2IkJXgikBc0QSzV
         i1VPRYfpWyJK5qhnIfi9HlSYUnFR3K99kJ1oYBUmG8dUMPN4F01kOF1Yr1uj8XoOeDhO
         GYbMTRFnTVremA+ZyuWuu4XZC1n0MTwL71vn7+fb3zlJ0Z2RupYQ2tu4Bwia8pLECmKG
         o/unD9A8yZTD3FyEVD/nlt5LhSep1HeeNfyY17Netlh1Xwt7+y9Kzpmi10gwfkLGXNDC
         fpu35+agLRAXJCHyGNt8NF0GY5ocqTXvMtKu98f72NJSVcU25dl6Z0tzA6gqzt47fBgl
         k1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QeTGjTOjovKjwl3obfQQbrmZun7B3WQGrzr0gIWDHE4=;
        b=H7vi7rcRNugp24yLdGWF2nTfkNNzFYbF/cMJKlk2wp4yBvPRaLEF8MIC0xND8tT9DJ
         1JB/9St3D8gF/D1DP51KWR+Hx/Kt6XqGriOpmX9OpBko3UPYfKH9VMfqD1u0xgU75xMl
         z4mB3B3cIaXOT2zyGpC48pssohLCciQgva50hq8cMXnszbNHx/eaJarX4Dy0ZecCvfMA
         Bt2704RCW97BR20wy6Ss0fNMK075arMtc1usjVgJib6sTyqeiEzWp0zSpyYOu9bX5Zsk
         Q4Ma/+AyH2m4nZvEDnta5F33C3dQ+Kkyg3XMriDk9bpvYQ4b4jRsBE3PMw9qota5hnzc
         yH3A==
X-Gm-Message-State: AOAM531tulwtDwYcD0iDKIhV9GQVW4q3Zw7QqyIZ9x+fJa2Gsbuj4hBr
        dBaC8Qjd9R9JDcwbYK80jo0=
X-Google-Smtp-Source: ABdhPJxLmvZG+vXqjOu+Bjm1wWXUvDoxzDi4PKRTqpskAfgFHzzy4MXdi/LoyUa8nB7QdU1Wq2iS5A==
X-Received: by 2002:a1c:7fcf:: with SMTP id a198mr1073794wmd.121.1611004794792;
        Mon, 18 Jan 2021 13:19:54 -0800 (PST)
Received: from [192.168.1.158] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id y6sm30894095wrp.6.2021.01.18.13.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 13:19:54 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, kieran.bingham@ideasonboard.com
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-7-djrscally@gmail.com>
 <YAVRqWeUsLjvU62P@pendragon.ideasonboard.com>
 <20210118144606.GO4077@smile.fi.intel.com>
Message-ID: <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
Date:   Mon, 18 Jan 2021 21:19:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210118144606.GO4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy - thanks as always for the comments


Some responses below, but if not mentioned I'll follow your suggestion
of course

On 18/01/2021 14:46, Andy Shevchenko wrote:
> On Mon, Jan 18, 2021 at 11:15:21AM +0200, Laurent Pinchart wrote:
>> On Mon, Jan 18, 2021 at 12:34:27AM +0000, Daniel Scally wrote:
> My comments on top of Laurent's to avoid dups.
>
> First of all, PDx86 has its own prefix pattern: "platform/x86: ..."


Sorry, I probably should have put more effort into figuring out the
right pattern for those


>>> +config INTEL_SKL_INT3472
>>> +	tristate "Intel SkyLake ACPI INT3472 Driver"
>>> +	depends on X86 && ACPI
> X86 is a dup. Entire lot of PDx86 is a priory dependent on it (find "if X86"
> line in Kconfig).


Ah, oh yeah - thanks. I'll watch for that in future


>>> +static struct i2c_driver int3472_tps68470 = {
>>> +	.driver = {
>>> +		.name = "int3472-tps68470",
>>> +		.acpi_match_table = int3472_device_id,
>>> +	},
>>> +	.probe_new = skl_int3472_tps68470_probe,
>>> +};
> I'm not sure we want to have like this. If I'm not mistaken the I²C driver can
> be separated without ACPI IDs (just having I²C IDs) and you may instantiate it
> via i2c_new_client_device() or i2c_acpi_new_device() whichever suits better...


Sorry, I'm a bit confused by this. The i2c device is already
present...we just want the driver to bind to them, so what role do those
functions have there?


>>> +struct int3472_gpio_clock {
>>> +	struct clk *clk;
>>> +	struct clk_hw clk_hw;
>>> +	struct clk_lookup *cl;
>>> +	struct gpio_desc *gpio;
>>> +};
> Wondering if this has some similarities with and actually can utilize clk-gpio
> driver.
>
>
>
>>> +static const struct clk_ops skl_int3472_clock_ops = {
>>> +	.prepare = skl_int3472_clk_prepare,
>>> +	.unprepare = skl_int3472_clk_unprepare,
>>> +	.enable = skl_int3472_clk_enable,
>>> +	.disable = skl_int3472_clk_disable,
>>> +};
> Yeah, sounds like reinventing clk-gpio.c.
>
> static const struct clk_ops clk_gpio_gate_ops = {
> 	.enable = clk_gpio_gate_enable,
> 	.disable = clk_gpio_gate_disable,
> 	.is_enabled = clk_gpio_gate_is_enabled,
> };
>
> (Or is it mux? It has support there as well.
>
Hmm, yeah, this looks like it would work actually. So I think I'd need to:


1. Make enabling INTEL_SKL_INT3472 also enable the clk-gpio driver

2. Register a platform device to bind to the clk-gpio driver

3. Register a gpio lookup table so that the clk-gpio driver can find the
gpio in question using gpiod_get()


And that looks like it will work; I'll try it.


>>> +	/* Lenovo Miix 510-12ISK - OV5648, Rear */
>>> +	{ "GEFF150023R", REGULATOR_SUPPLY("avdd", "i2c-OVTI5648:00"), NULL},
>>> +	/* Surface Go 1&2 - OV5693, Front */
>>> +	{ "YHCU", REGULATOR_SUPPLY("avdd", "i2c-INT33BE:00"), NULL},
> I'm wondering if you should use same I2C format macro and create this
> dynamically? Or rather find a corresponding ACPI device instance and
> copy it's name? ... 


The supply name needs hard-coding really, but the device name I suppose
can come from int3472->sensor_name.


>>> +static struct int3472_sensor_config *
>>> +skl_int3472_get_sensor_module_config(struct int3472_device *int3472)
>>> +{
>>> +	unsigned int i = ARRAY_SIZE(int3472_sensor_configs);
>>> +	struct int3472_sensor_config *ret;
>>> +	union acpi_object *obj;
>>> +
>>> +	obj = acpi_evaluate_dsm_typed(int3472->sensor->handle,
>>> +				      &cio2_sensor_module_guid, 0x00,
>>> +				      0x01, NULL, ACPI_TYPE_STRING);
>>> +
>>> +	if (!obj) {
>>> +		dev_err(&int3472->pdev->dev,
>>> +			"Failed to get sensor module string from _DSM\n");
>>> +		return ERR_PTR(-ENODEV);
>>> +	}
>>> +
>>> +	if (obj->string.type != ACPI_TYPE_STRING) {
>>> +		dev_err(&int3472->pdev->dev,
>>> +			"Sensor _DSM returned a non-string value\n");
>>> +		ret = ERR_PTR(-EINVAL);
>>> +		goto out_free_obj;
> And after below change you can turn this to
>
> 	ACPI_FREE(obj);
> 	return ERR_PTR(-EINVAL);
>
> and remove label completely, but it's up to you.
>
>>> +	}
>>> +	ret = ERR_PTR(-ENODEV);
> This seems redundant. Or are you expecting ARRAY_SIZE() to be 0?
> If no, you may add static_assert() near to the array definition.


It **could** become 0, if the entries I've added are removed in future
because the sensors are no longer supported or something. There might be
no sensor_module_config for a given device. We only need to supply one if


a) The platform has a 0x0b type GPIO, which means we need to define a
supply name the driver is expecting

b) The GPIO functions deviate from documented purpose, which means we
need to supply a remapping struct


Otherwise, there's no need for it.


>>> +
>>> +	int3472->regulator.rdev = regulator_register(&int3472->regulator.rdesc,
>>> +						     &cfg);
>>> +	if (IS_ERR(int3472->regulator.rdev)) {
>>> +		ret = PTR_ERR(int3472->regulator.rdev);
>>> +		goto err_free_gpio;
>>> +	}
> Similar here, can we utilize gpio-regulator.c?
>

Also yes probably, with the same steps as for the clocks. Again, I'll
try that out, thanks very much.


>>> +		dev_warn(&int3472->pdev->dev,
>>> +			 "GPIO type 0x%llx unknown; the sensor may not work\n",
>>> +			 (obj->integer.value & 0xff));
>> No need for parentheses.
> And instead of "%llx" with " & 0xff" you may use "%x" with "(u8)" cast.
> However, I don't think we need to show only last byte, because it may give
> wrong impression on values like "0x100".


But in this case only the last byte holds the type information, second
lowest byte is the pin number. So as we understand it, 0x100 would be
invalid anyway.


>>> +	int3472 = kzalloc(sizeof(*int3472) +
>>> +			 ((INT3472_MAX_SENSOR_GPIOS + 1) * sizeof(struct gpiod_lookup)),
>> One more space for the indentation, and the outer parentheses are not
>> needed.
> And use struct_size() from overflow.h.

TIL! Thank you


>>> +	if (int3472->gpios_mapped)
>>> +		gpiod_remove_lookup_table(&int3472->gpios);
>> You could avoid the need for the gpios_mapped field by checking for
>>
>> 	if (int3472->gpios.list.next)
> I think this is an intrusion to GPIO realm.
> Instead would you consider to drop the check completely and use ->gpios to be
> NULL / not-NULL (and yes, you won't need gpios_mapped flag)?
>
> d321ad1286d2 ("gpiolib: Follow usual pattern for gpiod_remove_lookup_table() call")
>
> in I²C tree makes it possible.

That's also fine by me; or I guess also check int3472->gpiods.dev_id,
and only set the pointer the first time a GPIO is mapped.


I'll rework it, thanks.


>>> +		return -EINVAL;
>>> +
>>> +	if (ret)
>>> +		cldb_present = false;
>>> +
>>> +	gpio_dev = skl_int3472_register_pdev("tps68470-gpio", &client->dev);
>>> +	if (IS_ERR(gpio_dev))
>>> +		return PTR_ERR(gpio_dev);
>>> +
>>> +	if (cldb_present) {
>>> +		clk_dev = skl_int3472_register_pdev("tps68470-clk",
>>> +						    &client->dev);
>>> +		if (IS_ERR(clk_dev)) {
>>> +			ret = PTR_ERR(clk_dev);
>>> +			goto err_free_gpio;
>>> +		}
>>> +
>>> +		regulator_dev = skl_int3472_register_pdev("tps68470-regulator",
>>> +							  &client->dev);
>>> +		if (IS_ERR(regulator_dev)) {
>>> +			ret = PTR_ERR(regulator_dev);
>>> +			goto err_free_clk;
>>> +		}
>>> +	} else {
>>> +		opregion_dev = skl_int3472_register_pdev("tps68470_pmic_opregion",
>>> +							 &client->dev);
>>> +		if (IS_ERR(opregion_dev)) {
>>> +			ret = PTR_ERR(opregion_dev);
>>> +			goto err_free_gpio;
>>> +		}
>>> +	}
>> I wonder if this could be simplified by using devm_mfd_add_devices. You
>> could have two arrays of mfd_cell, one for each case.
> Yeah, which effectively means that we should have some kind of mfd/tps68470 in
> place.


Can you expand on what you mean by that a little, please?

