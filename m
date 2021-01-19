Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40BE72FADF4
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 01:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403791AbhASAMZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 19:12:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391073AbhASAMY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 19:12:24 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8871C061573;
        Mon, 18 Jan 2021 16:11:43 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id v184so10947539wma.1;
        Mon, 18 Jan 2021 16:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=UmRvZt3oGsjKwYVRuTT29dplJG9vQFlA51PciylhdT4=;
        b=fMJtulXAbW3qKUY3hFbmK6kX9G0R4hQ1lpMr1alJgKiGJCAv5GOtj7P7Ak8HXUwjZy
         WBDOimIkLalIF5LY8qa293D6M/XMBtKaUXpTyvzlYAWFb8oTQKVnr7r/aDvQpFHKc1HL
         lIN+PQ7PZ8KGSNQHcTilKRO/mJl9ReoedCB7cAvZ577xDcar6GGR3WeZ5Z2C2HAi4JrI
         c0leQkiFumiFlSCVPP5U7QjGFXSlgejYcVz0g0b6W9KC83owivPPi+hHsGJ+twqxjQ9F
         vTCdugz2GCsMzLYHIZxg1VO10KKZpUG2nefmPk8mx5SNP74YeLQ9JQfX/LvwAevWSnqU
         xpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=UmRvZt3oGsjKwYVRuTT29dplJG9vQFlA51PciylhdT4=;
        b=pQZrsp7LCXAEh9F1x+XEL/b5Znt78vp1sn7RSZJCdKLkD+OUbkoc0Q7buXNeVKHHo4
         kEjyIo61/JBe7mb0du644hAbV+zdW+MgyFbsO062N/oXWVZLwHgAunjO5cz3cUWqj8Fe
         UPjC7TTFdHRTaLWo6EbHj8ER9CKdJB7FBx4AhtxJ3fvxRpttG2NJUcuNyk/4cVsD6B2n
         yR+kP0F5+OC4h/G7lDrtQ98eR7jWA4DdIPHyFjlGZ+XJPTahPPEoDc24O8Nrfd6tjKSH
         GGJd4fneHVYuSP/HYwqYSf/j3W8tvxnnLpHq1rUsn28pYBX8xyDc2AiYvXwyMmsdSVhU
         k6cw==
X-Gm-Message-State: AOAM531VU6fx5f1ZbgVLIN/7XhToT45eLv809v1l925z5e1WUxTGp/87
        a1g4dyiu0p8HAeg1mblaBVg=
X-Google-Smtp-Source: ABdhPJxDNT5AFpdigI+10S+0uFyqJYdarEOvAQTjwuqZcQO2G+MCLjnQCRCABvW3AMPSVeP932C7RQ==
X-Received: by 2002:a1c:2802:: with SMTP id o2mr1559574wmo.68.1611015102673;
        Mon, 18 Jan 2021 16:11:42 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id 62sm1825887wmd.34.2021.01.18.16.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 16:11:41 -0800 (PST)
Subject: Re: [PATCH v2 6/7] platform: x86: Add intel_skl_int3472 driver
From:   Daniel Scally <djrscally@gmail.com>
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
 <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
Message-ID: <1053125f-7cb2-8aa0-3204-24df62986184@gmail.com>
Date:   Tue, 19 Jan 2021 00:11:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <75e99a06-4579-44ee-5f20-8f2ee3309a68@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy, Laurent

On 18/01/2021 21:19, Daniel Scally wrote:
>>>> +static const struct clk_ops skl_int3472_clock_ops = {
>>>> +	.prepare = skl_int3472_clk_prepare,
>>>> +	.unprepare = skl_int3472_clk_unprepare,
>>>> +	.enable = skl_int3472_clk_enable,
>>>> +	.disable = skl_int3472_clk_disable,
>>>> +};
>> Yeah, sounds like reinventing clk-gpio.c.
>>
>> static const struct clk_ops clk_gpio_gate_ops = {
>> 	.enable = clk_gpio_gate_enable,
>> 	.disable = clk_gpio_gate_disable,
>> 	.is_enabled = clk_gpio_gate_is_enabled,
>> };
>>
>> (Or is it mux? It has support there as well.
>>
> Hmm, yeah, this looks like it would work actually. So I think I'd need to:
>
>
> 1. Make enabling INTEL_SKL_INT3472 also enable the clk-gpio driver
>
> 2. Register a platform device to bind to the clk-gpio driver
>
> 3. Register a gpio lookup table so that the clk-gpio driver can find the
> gpio in question using gpiod_get()
>
>
> And that looks like it will work; I'll try it.

I'm more and more confident that this will work, but it has some
knock-on effects:


The both clk and regulator gpio driver expects to be able to fetch the
GPIO using devm_gpiod_get(&pdev->dev, "enable", ...). That won't work of
course, so we need to add another GPIO lookup table so those drivers can
see the GPIOs. For that, we need to know what dev_name(&pdev->dev) will
be so we can set the .dev_id member of a gpiod_lookup_table to that
value, but that isn't set until _after_ the pdev is registered (because
it has to figure out the id, we can't manually set the IDs because there
could be more than one instance of int3472-discrete bound to multiple
PMIC devices, and we don't know which id the current one should have).
Finally, we can't wait until the device is registered because it
immediately probes, can't find the GPIO and then fails probe.


It's similar problem that causes us to need the i2c-acpi name format
macros, but complicated by the dynamic ID part of dev_name(&pdev->dev)


Solving it is a bit of a sticky one; perhaps something like moving the
dev_set_name() part of platform_device_add() [1] to its own function,
that's called in both platform_device_alloc() and
platform_device_register(). That way it would be available before the
device itself was registered, meaning we could create the lookup table
before it probes the driver.


(also, Laurent, if we did it this way we wouldn't be able to also handle
the led-indicator GPIO here without some fairly major rework)


[1]
https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c#L563

