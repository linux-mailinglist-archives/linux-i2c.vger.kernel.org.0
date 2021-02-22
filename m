Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9D8F322235
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 23:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbhBVWg3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 17:36:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbhBVWg2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Feb 2021 17:36:28 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944C9C061574;
        Mon, 22 Feb 2021 14:35:48 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id v15so20720551wrx.4;
        Mon, 22 Feb 2021 14:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=hO/iiMeUtUrubEhMSPfy/Z384ysScoWYaqMvzBAHZRM=;
        b=mkygltqJ9S5V+2B2+aiZ6ePGb8849nQJyMcN/4bNV2P8CT1tdB+tJ5pjgjl9FK3ba3
         /dmck+OCcbHjhvwkZff5Vss1zpjWi8DOtSnmnbGqZXC3yal8J65yTlvtnWi1lgGDYUY8
         pTtEU3ovSjnsmCVyIq3qAd1UOmtt6jcuJtkbSlvVYSDPLiUBn8JAAnLmd7db7HHYwp8Q
         XoZq1Ik1X8TpiJSipcfWDLHSOCKMWP+lGpbt3+BucYMU4IDtY82+LZK9kZPTxbTUQUOK
         WVyb0kUcKyUwxBje3KPW4Te4bVSh3xnJYdT2GbaE9R9/g7kGHsoskUSrAUPxSQ1VR/BH
         7Adw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=hO/iiMeUtUrubEhMSPfy/Z384ysScoWYaqMvzBAHZRM=;
        b=hKYSymTTphh/+CsyMH1tOhU7KxbM5ijZGRuAO/wqJfHXR3vldGgNb2YdMWBg/Bv5UZ
         xQwyJUUlPZF6WxfTVxae1nsG9Zt/Ra4GJ979hy+oLsxrllc3zM1Ui9fdW4lChtziVazc
         LxHLcYjOIhjtvZ+Ng6UQHaL/vnI1BdmPQUXLQYFF6//CJaZlC9mbrPnmUtHr2g2U5fE3
         cHSu87ihhg7RyyaIbSn48DszmkJCMvvw/JvJvC44Q7Uq0kHjkDOIRgP3BEqiKhX7hzFU
         zrIAvaxKn7uafjaC5ZlV750buwtFTGoXZDPhbG1pVZGBYavzMNbF/PZGYGvRDEmXMpPY
         kYww==
X-Gm-Message-State: AOAM533gUXX4v5DNcmKJkf5beD6UfcLEFC3Vctnk6LRM/nUX8HtS30wr
        usouYr3wDaf+k5l7fgn5UnQ=
X-Google-Smtp-Source: ABdhPJyKJkn/vXuQKygH8ksuLlO5olbE5JT8c5cUqia3cOcUj5toK65Vo7TeqIm0oheh2ALxhiSNfA==
X-Received: by 2002:adf:9031:: with SMTP id h46mr23789637wrh.19.1614033347140;
        Mon, 22 Feb 2021 14:35:47 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.123])
        by smtp.gmail.com with ESMTPSA id r64sm632232wma.33.2021.02.22.14.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 14:35:46 -0800 (PST)
Subject: Re: [PATCH v3 5/6] platform/x86: Add intel_skl_int3472 driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        kieran.bingham+renesas@ideasonboard.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>, me@fabwu.ch,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        devel@acpica.org
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <20210222130735.1313443-6-djrscally@gmail.com>
 <CAHp75Vd2Dc2Poq7VNRXRT-0VjkYdEFY2WKpz8fWpAQViQRO4jA@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <534849f6-c7b5-19b0-a09f-cd410cde93bd@gmail.com>
Date:   Mon, 22 Feb 2021 22:35:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd2Dc2Poq7VNRXRT-0VjkYdEFY2WKpz8fWpAQViQRO4jA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy - thanks for comments!

On 22/02/2021 14:58, Andy Shevchenko wrote:
> On Mon, Feb 22, 2021 at 3:12 PM Daniel Scally <djrscally@gmail.com> wrote:
>> ACPI devices with _HID INT3472 are currently matched to the tps68470
>> driver, however this does not cover all situations in which that _HID
>> occurs. We've encountered three possibilities:
>>
>> 1. On Chrome OS devices, an ACPI device with _HID INT3472 (representing
>> a physical TPS68470 device) that requires a GPIO and OpRegion driver
>> 2. On devices designed for Windows, an ACPI device with _HID INT3472
>> (again representing a physical TPS68470 device) which requires GPIO,
>> Clock and Regulator drivers.
>> 3. On other devices designed for Windows, an ACPI device with _HID
>> INT3472 which does **not** represent a physical TPS68470, and is instead
>> used as a dummy device to group some system GPIO lines which are meant
>> to be consumed by the sensor that is dependent on this entry.
>>
>> This commit adds a new module, registering a platform driver to deal
>> with the 3rd scenario plus an i2c driver to deal with #1 and #2, by
>> querying the CLDB buffer found against INT3472 entries to determine
>> which is most appropriate.
> Can you split CLK parts (and maybe regulators as well) to something
> like intel_skl_int3472_clk.c?


Sure, no problem

>
>> +#include <linux/acpi.h>
>> +#include <linux/i2c.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/slab.h>
>> +               dev_err(&adev->dev, "%s object is not an ACPI buffer\n", id);
> Perhaps acpi_handle_err() et al. instead of dev_*(&adev->dev, ...)
> where it's applicable?


Ah - yes, ok, thanks. TIL those exist

>> +       if (obj->buffer.length > sizeof(*cldb)) {
>> +               dev_err(&adev->dev, "The CLDB buffer is too large\n");
>> +               ret = -EINVAL;
> ENOSPC? ENOMEM?


I still think EINVAL actually, as in this case the problem isn't that
space couldn't be allocated but that the buffer in the SSDB is larger
than I expect it to be, which means the definition of it has changed /
this device isn't actually supported.

>> +       ret = platform_driver_register(&int3472_discrete);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = i2c_register_driver(THIS_MODULE, &int3472_tps68470);
>> +       if (ret)
>> +               platform_driver_unregister(&int3472_discrete);
> Not a fan of the above, but let's see what others will say...


Yeah; happy to discuss this more if needed.

>> +#include <linux/clk-provider.h>
> This is definitely not for *.h. (Not all C files needed this)
>
>> +#include <linux/gpio/machine.h>
> Ditto.
>
>> +#include <linux/regulator/driver.h>
>> +#include <linux/regulator/machine.h>
> Ditto.


Yep; I'll move them to *_clk.c and *_regulator.c files.

>> +static int skl_int3472_clk_prepare(struct clk_hw *hw)
>> +{
>> +       struct int3472_gpio_clock *clk = to_int3472_clk(hw);
>> +
>> +       gpiod_set_value(clk->ena_gpio, 1);
>> +       if (clk->led_gpio)
> Make it optional and drop this check. Same for other places of use of this GPIO.


Oops, of course, thanks

>> +static int skl_int3472_clk_enable(struct clk_hw *hw)
>> +{
>> +       /*
>> +        * We're just turning a GPIO on to enable, which operation has the
>> +        * potential to sleep. Given enable cannot sleep, but prepare can,
>> +        * we toggle the GPIO in prepare instead. Thus, nothing to do here.
>> +        */
> Missed . and / or  () in some words? (Describing callbacks, personally
> I use the form "->callback()" in such cases)


OK, I'll fix the comment to match that style.


>> +static unsigned int skl_int3472_get_clk_frequency(struct int3472_discrete_device *int3472)
>> +{
>> +       union acpi_object *obj;
>>
>> +       unsigned int ret = 0;
> unsigned for ret is unusual. Looking into the code, first of all it
> doesn't need this assignment; second, it probably can gain a better
> name: "frequency"?


Yep ok, I'll rename to freq/frequency

>> +       if (!IS_ERR_OR_NULL(sensor_config) && sensor_config->function_maps) {
> Hmm...
>
> Would
>
> if (IS_ERR_OR_NULL(sensor_config))
>   return 0;
>
> if (!_maps)
>   return 0;
>
> with respective comments working here?


No, because the absence of either sensor_config or
sensor_config->function_maps is not a failure mode. We only need to
provide sensor_configs for some platforms, and function_maps for even
fewer. So if that check is false, the rest of the function should still
execute.

>> +static int skl_int3472_register_clock(struct int3472_discrete_device *int3472)
>> +{
>> +       struct clk_init_data init = {
>> +               .ops = &skl_int3472_clock_ops,
>> +               .flags = CLK_GET_RATE_NOCACHE,
>> +       };
>> +       int ret = 0;
>> +
>> +       init.name = kasprintf(GFP_KERNEL, "%s-clk",
>> +                             acpi_dev_name(int3472->adev));
> devm_*() ? Or is the lifetime different?


No it's not; I'll use devm_*(), thanks

>> +       sensor_config = int3472->sensor_config;
>> +       if (IS_ERR_OR_NULL(sensor_config)) {
>> +               dev_err(int3472->dev, "No sensor module config\n");
>> +               return PTR_ERR(sensor_config);
> NULL -> 0. Is it okay?


Ah, no it's not - good catch thank you.

>> +       if (ares->type != ACPI_RESOURCE_TYPE_GPIO ||
>> +           ares->data.gpio.connection_type != ACPI_RESOURCE_GPIO_TYPE_IO)
>> +               return 1; /* Deliberately positive so parsing continues */
> I don't like to lose control over ACPI_RESOURCE_TYPE_GPIO, i.e.
> spreading it over kernel code (yes, I know about one existing TS
> case).
> Consider to provide a helper in analogue to acpi_gpio_get_irq_resource().


Sure, but I probably name it acpi_gpio_is_io_resource() - a function
named "get" which returns a bool seems a bit funny to me.

>> +       if (ret < 0 && ret != -EPROBE_DEFER)
>> +               dev_err(int3472->dev, err_msg);
> dev_err_probe() will make the above conditional go away. And you may even do...


Ah-ha - thought that must exist but couldn't find it - thank you.

>> +       if (int3472->clock.ena_gpio) {
> Not sure you need this here.


We haven't seen a device that lacks a clock enable GPIO it's true, but
since all the other kinds seem optional it didn't seem impossible that
that one is optional too. I can remove if you prefer and we can just
deal with it when we encounter one like that though?

>> +       /* Max num GPIOs we've seen plus a terminator */
>> +       int3472 = kzalloc(struct_size(int3472, gpios.table,
>> +                         INT3472_MAX_SENSOR_GPIOS + 1), GFP_KERNEL);
> Wonder of you can use devm_*() APIs in this function.


Yeah I can, I'll switch to that.


>> +int skl_int3472_discrete_remove(struct platform_device *pdev)
>> +{
>> +       struct int3472_discrete_device *int3472 = platform_get_drvdata(pdev);
>> +       if (int3472->gpios.dev_id)
>> +               gpiod_remove_lookup_table(&int3472->gpios);
> gpiod_remove_lookup_table() is now NULL-aware.
> But in any case I guess you don't need the above check.


Sorry; forgot to call out that I didn't follow that suggestion;
int3472->gpios is a _struct_ rather than a pointer, so &int3472->gpios
won't be NULL, even if I haven't filled anything in to there yet because
it failed before it got to that point. So, not sure that it quite works
there.

>
>> +       if (!IS_ERR(int3472->regulator.rdev))
>> +               regulator_unregister(int3472->regulator.rdev);
> Shouldn't it be the pointer to the regulator itself?
int3472->regulator is type struct int3472_gpio_regulator, the .rdev is
the normal regulator_dev


>
>> +       if (!IS_ERR(int3472->clock.clk))
> If you get it optional, you won't need this additional check.


Yes - here it will definitely work; thanks, I'll add that patch

>> +       ret = skl_int3472_fill_cldb(adev, &cldb);
>> +       if (!ret && cldb.control_logic_type != 2) {
>> +               dev_err(&client->dev, "Unsupported control logic type %u\n",
>> +                       cldb.control_logic_type);
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (ret)
>> +               cldb_present = false;
> if (ret)
>   ...
> else if (...)  {
>   ...
>   return ...;
> }


Oh yeah...now you point that out I have no idea what I was thinking there...

