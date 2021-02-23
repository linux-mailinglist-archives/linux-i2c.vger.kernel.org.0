Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E7E322B25
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Feb 2021 14:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbhBWNHO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Feb 2021 08:07:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232757AbhBWNGz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Feb 2021 08:06:55 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34739C061574;
        Tue, 23 Feb 2021 05:06:15 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id 7so22531429wrz.0;
        Tue, 23 Feb 2021 05:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=f+onw66c3J/jwc8hln7Yc6aR0hW3T4faLeLEwbwBKYs=;
        b=TFyUfxFL62HVqE4YCdeQXL5jm/2STgwp6pGk3otQDBqmx86ntU/1+v/G630hS2UBk5
         pu+TPzSK9FECkMxiRSqG4FL3jtm0V/NzJApH9Mcir64rKExgmueFIIBf9s5AGXntRGZW
         OUomToxQx1vYlpz5TsUPQD/Fn+0goj/QOJGAt7rf5NYNPmbaxGUurkGxE2Xx2dOk2Jus
         LmOH6AFs42hYCJ0h9UXRzBnoB87qyCR4O6ZlV7gWjluIpcaYV/JW0ET6w2kWGEbUWadf
         XMlmKJP+Tp7Ckj49FBlkI0rXgaMTi+DSlS/fYcsafXhOv3ERHs0TRqslgZiFWpN5CE07
         FljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=f+onw66c3J/jwc8hln7Yc6aR0hW3T4faLeLEwbwBKYs=;
        b=UZLr9cTHYYjOja55LQiifMcfupjU11ahGKOFUopXyvmphyh8DXvLvepMEfEK/drAwG
         GzRxZl1xdafykg3EO0y4wCmX0pap4jbD98FmIh/A5LI2BAo/JVru9Vksn8KRMPIV4hmy
         cq2FciOGJK+wFlhBoeHc7+HRW5E5D43dCk6b+JDdvbA9Ch3sNb63XHTza9F5Vgrh/Z6o
         95iolis+Qg6MTtTi1jWxX9aadKzMLl+/L+KljxSLKcgnjTR/3uR5th9FqlKZKipcxdfV
         znp1Qo2M23xYxdzavposcLs7DPcN9GtYyj5VGdHZkU7OtAnoTbU3EX+0lA1oa7Oks7Vi
         QYGQ==
X-Gm-Message-State: AOAM532li4HvzVXzxZNMudPsUqaLDgXoeuMldPDtMirPjaya83meIkhA
        LWeXHw3qlsNGL7w9vB84EcQ=
X-Google-Smtp-Source: ABdhPJz3ywr56dS7+CyMfJ0kNbrNBD5f8qjIPD60ufZOBpaKV94f9x5i2IiFyfLGSsl022RxnETTgA==
X-Received: by 2002:a5d:524b:: with SMTP id k11mr5485275wrc.122.1614085573922;
        Tue, 23 Feb 2021 05:06:13 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.123])
        by smtp.gmail.com with ESMTPSA id 2sm32080219wre.24.2021.02.23.05.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 05:06:13 -0800 (PST)
Subject: Re: [PATCH v3 5/6] platform/x86: Add intel_skl_int3472 driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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
 <534849f6-c7b5-19b0-a09f-cd410cde93bd@gmail.com>
 <YDTuldAG9FB8+RAd@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <febc7af6-96ee-a5a0-f0c9-6e7f89908535@gmail.com>
Date:   Tue, 23 Feb 2021 13:06:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YDTuldAG9FB8+RAd@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23/02/2021 12:01, Andy Shevchenko wrote:
>>>> +       if (ares->type != ACPI_RESOURCE_TYPE_GPIO ||
>>>> +           ares->data.gpio.connection_type != ACPI_RESOURCE_GPIO_TYPE_IO)
>>>> +               return 1; /* Deliberately positive so parsing continues */
>>> I don't like to lose control over ACPI_RESOURCE_TYPE_GPIO, i.e.
>>> spreading it over kernel code (yes, I know about one existing TS
>>> case).
>>> Consider to provide a helper in analogue to acpi_gpio_get_irq_resource().
>> Sure, but I probably name it acpi_gpio_is_io_resource() - a function
>> named "get" which returns a bool seems a bit funny to me.
> But don't you need the resource itself?
>
> You may extract and check resource at the same time as
> acpi_gpio_get_irq_resource() does.


Oh! Reading comprehension fail; I didn't notice it was returning the
pointer through agpio; you're right of course.

>
> ...
>
>>>> +       struct int3472_discrete_device *int3472 = platform_get_drvdata(pdev);
>>>> +       if (int3472->gpios.dev_id)
>>>> +               gpiod_remove_lookup_table(&int3472->gpios);
>>> gpiod_remove_lookup_table() is now NULL-aware.
>>> But in any case I guess you don't need the above check.
>> Sorry; forgot to call out that I didn't follow that suggestion;
>> int3472->gpios is a _struct_ rather than a pointer, so &int3472->gpios
>> won't be NULL, even if I haven't filled anything in to there yet because
>> it failed before it got to that point. So, not sure that it quite works
>> there.
> I think if you initialize the ->list member you can remove without check.


I'll give that a try - thanks

>
