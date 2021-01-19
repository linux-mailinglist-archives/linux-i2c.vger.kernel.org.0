Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 942242FC3B7
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 23:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388461AbhASOgi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 09:36:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389822AbhASKl0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jan 2021 05:41:26 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA02C061574;
        Tue, 19 Jan 2021 02:40:45 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id g10so829033wrx.1;
        Tue, 19 Jan 2021 02:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=F7MOlU8kHHn2XTukeIE9Iko2L8CsU70yAPMfznuhzSQ=;
        b=BojE+Im6fBBLyHM6bhmu9tWUn4QGwKAhFVUxD06vFWREB46B/xjgOanqAbclsG4gWF
         ZOLcpexq6KTGyjJfhrqgajkmVZaBtQRuNwJ1M9C+vljTN38mqDl0GkNGNYSEuc/2axCW
         DEC9vo/XnOe6Ju4ijcYDgKQcz8fpnxRRmx2Or+joYJf9MXwi3s8QlUOM66xC29EN+rdd
         XEpLrPV15RNw9qTISW3bmJaUcwqUmSCtzyXF8qYCW+vcaZkSB1BbVO/HmABHGALV/GMO
         Mmrr31h8ooFovmNNvHX5uRlOjx/d6YVPK4xL2ZKQxfgRuJJnsBpJmih6Wi043VAGJNxz
         oZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=F7MOlU8kHHn2XTukeIE9Iko2L8CsU70yAPMfznuhzSQ=;
        b=dxleFyRIDpDRY15e0xUr6dWE3HiMRLWhYnRVLvU73E8NDBZ4VC3WLy8LiJnRry21Jw
         FSwAK6rYQzkrdTj+/+ucmqnUV78z30PewmwIm3W522pZe+L04se2Vfe5hVWMlGI3Nzbu
         cY9Mww/5oMcwlcKlrFzOn3K0PX3GVAVOLsWogSkmR/Rjwke+P115sZhf/tpM+wQI0FHn
         A3yDtZnzlc9yVndcYyldhIh4NUfsk38Sw8vdVr4VMK0c9K/JT6PkJuc3CIUMx0zPngVW
         tqdoqc/RDdNSU43Qr32+Pfu6w/4Hu1TlVFtqh4RnuFAF0Qdd9vX++QyGMBMF55tJmun8
         UItA==
X-Gm-Message-State: AOAM530r1Cnj12BIdaIR+7qMNb0SWXipKWP0ARAcszx+mPR9US6ctVx/
        I985AdgyXlNfInXQjURzjo2symMRG7i3TA==
X-Google-Smtp-Source: ABdhPJzum3UBJX+dAAp2fxEMTCdW6oKCzvMipLNSVyk+wDODMyMNx8yhB1voskDMKUOSK6WBUMdQqg==
X-Received: by 2002:a5d:6cad:: with SMTP id a13mr3576739wra.275.1611052844461;
        Tue, 19 Jan 2021 02:40:44 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id z184sm3941017wmg.7.2021.01.19.02.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 02:40:43 -0800 (PST)
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
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
 <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
 <20210119092448.GN4077@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <a735380b-57ac-1950-b29a-07fe6cb708d2@gmail.com>
Date:   Tue, 19 Jan 2021 10:40:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210119092448.GN4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 19/01/2021 09:24, Andy Shevchenko wrote:
>>>>> +static struct i2c_driver int3472_tps68470 = {
>>>>> +	.driver = {
>>>>> +		.name = "int3472-tps68470",
>>>>> +		.acpi_match_table = int3472_device_id,
>>>>> +	},
>>>>> +	.probe_new = skl_int3472_tps68470_probe,
>>>>> +};
>>> I'm not sure we want to have like this. If I'm not mistaken the I²C driver can
>>> be separated without ACPI IDs (just having I²C IDs) and you may instantiate it
>>> via i2c_new_client_device() or i2c_acpi_new_device() whichever suits better...
>> Sorry, I'm a bit confused by this. The i2c device is already
>> present...we just want the driver to bind to them, so what role do those
>> functions have there?
> What I meant is something like
>
>  *_i2c.c
> 	real I²C driver for the TPS chip, but solely with I²C ID table, no ACPI
> 	involved (and it sounds like it should be mfd/tps one, in which you
> 	just cut out ACPI IDs and convert to pure I²C one, that what I had
> 	suggested in the first place)


Ahh; sorry - i misunderstood what you meant there. I understand now I
think, but there is one complication; the ACPI subsystem already creates
a client for that i2c adapter and address; i2c_new_client_device()
includes a check to see whether that adapter / address combination has
an i2c device already.  So we would have to have the platform driver
with ACPI ID first find the existing i2c_client and unregister it before
registering the new one...the existing clients have a name matching the
ACPI device instance name (e.g i2c-INT3472:00) which we can't use as an
i2c_device_id of course.

>
>  *_proxy.c
> 	GPIO proxy as library
>
>  *.c
> 	platform driver with ACPI ID, in which ->probe() we actually instantiate
> 	above via calling i2c_acpi_new_device(), *if needed*, along with GPIO
> 	proxy
>
> ...
>
>>>>> +struct int3472_gpio_clock {
>>>>> +	struct clk *clk;
>>>>> +	struct clk_hw clk_hw;
>>>>> +	struct clk_lookup *cl;
>>>>> +	struct gpio_desc *gpio;
>>>>> +};
>>>>> +static const struct clk_ops skl_int3472_clock_ops = {
>>>>> +	.prepare = skl_int3472_clk_prepare,
>>>>> +	.unprepare = skl_int3472_clk_unprepare,
>>>>> +	.enable = skl_int3472_clk_enable,
>>>>> +	.disable = skl_int3472_clk_disable,
>>>>> +};
>>> Wondering if this has some similarities with and actually can utilize clk-gpio
>>> driver.
>>> Yeah, sounds like reinventing clk-gpio.c.
>>>
>>> static const struct clk_ops clk_gpio_gate_ops = {
>>> 	.enable = clk_gpio_gate_enable,
>>> 	.disable = clk_gpio_gate_disable,
>>> 	.is_enabled = clk_gpio_gate_is_enabled,
>>> };
>>>
>>> Or is it mux? It has support there as well.
>>>
>> Hmm, yeah, this looks like it would work actually. So I think I'd need to:
>>
>>
>> 1. Make enabling INTEL_SKL_INT3472 also enable the clk-gpio driver
>>
>> 2. Register a platform device to bind to the clk-gpio driver
>>
>> 3. Register a gpio lookup table so that the clk-gpio driver can find the
>> gpio in question using gpiod_get()
>>
>> And that looks like it will work; I'll try it.
> You need to modify clk-gpio.c to export
>
> clk_hw_register_gpio_gate()
> clk_hw_register_gpio_mux()
>
> (perhaps it will require to add *_unregister() counterparts) and call it from
> your code.
>
> See, for example, how clk_hw_unregister_fixed_rate() is being used. Another
> case is to add a helper directly into clk-gpio and call it instead of
> clk_hw_*() one, see how clk_register_fractional_divider() is implemented and
> used.


I'll take a look, thanks


> ...
>
>>>>> +	/* Lenovo Miix 510-12ISK - OV5648, Rear */
>>>>> +	{ "GEFF150023R", REGULATOR_SUPPLY("avdd", "i2c-OVTI5648:00"), NULL},
>>>>> +	/* Surface Go 1&2 - OV5693, Front */
>>>>> +	{ "YHCU", REGULATOR_SUPPLY("avdd", "i2c-INT33BE:00"), NULL},
>>> I'm wondering if you should use same I2C format macro and create this
>>> dynamically? Or rather find a corresponding ACPI device instance and
>>> copy it's name? ...
>> The supply name needs hard-coding really, but the device name I suppose
>> can come from int3472->sensor_name.
> To be strict in terms you are using "device instance name" in the
> REGULATOR_SUPPLY() second parameter. Because "device name" is generic and
> doesn't point to the actual *instance* of the device in the system.
>
> So, and "device name instance" we may get only by traversing through the (ACPI)
> bus and find corresponding struct device and derive name from it. Same way like
> you have done in previous patch series.
>
> Because there is no guarantee that, e.g., i2c-INT33BE:00 will be present on
> the system and moreover there is no guarantee that if two INT33BE or more
> devices are present you will get :00 always for the one you need!


Mm, good point, hadn't considered two identical sensors on the same
platform.  Alright; I'll think about this in more detail, thank you.


>>>>> +		opregion_dev = skl_int3472_register_pdev("tps68470_pmic_opregion",
>>>>> +							 &client->dev);
>>>>> +		if (IS_ERR(opregion_dev)) {
>>>>> +			ret = PTR_ERR(opregion_dev);
>>>>> +			goto err_free_gpio;
>>>>> +		}
>>>>> +	}
>>>> I wonder if this could be simplified by using devm_mfd_add_devices. You
>>>> could have two arrays of mfd_cell, one for each case.
>>> Yeah, which effectively means that we should have some kind of mfd/tps68470 in
>>> place.
>> Can you expand on what you mean by that a little, please?
> The very first comment in this reply should hopefully shed a light on my idea.
>
It did, thanks
