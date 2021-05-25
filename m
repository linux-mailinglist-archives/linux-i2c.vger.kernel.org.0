Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD52390CAD
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 01:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231837AbhEYXE5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 19:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbhEYXE5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 May 2021 19:04:57 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D54C061574;
        Tue, 25 May 2021 16:03:26 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id u4-20020a05600c00c4b02901774b80945cso14411752wmm.3;
        Tue, 25 May 2021 16:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4EHmYkGshIC3oll6QN+CKRJkNhLPbP3P/9v9afF8x4A=;
        b=Ci3AD0CWjfzF7rZgPEbDvs1YbkQ45yIUGn4YZErB3sstloTsd4ygxR+f6pvNRhtKex
         BN+p5mg4PxrR3SNOvHUHtLDPnH1bcfvxtnnda/TRbykUEoqoF6igXvOU8sgBGGRGT7y7
         VVzKiFcelsXTYzcKPv1TO1zAFbLStb/W5jmpwoumzxlCeUSxHJJZcAHgh6FCSAynFdBo
         80smj1sJoJLWKCg+DgsW+gju1QdI0phCgNgq6VWucqZKqpp5+JUtgxOlhrraqQmjczE9
         /hW+M/TvW/8dLEbaMPTx2HXsn57geMk8dACo53u1jtc5fKN+bLkaTDZwG+MqlI6zOVUk
         N4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4EHmYkGshIC3oll6QN+CKRJkNhLPbP3P/9v9afF8x4A=;
        b=gJVHi9xlZSeQnUvVguLQBQDWrtfwuDGLAmOUkdJstdzA1WZJmXpwlg3KHbu/jWKagQ
         wSTtBEM580SMhBOmd38gNVDmXU6FOrJv/pmJIfMuBqREQXeNxewG+J5mqPK1yrSBaquL
         fIvNemwnCHYE0OLtwL1NJSzPO3E7sSTn3zc04iJXt0kGJv4MyvTUr31owCNXZfxciX2r
         BVvHe8hjo69SxTbPla35TPjxTddoD8Q6gBFOoGxyA4cQEbWVQipNF2wMAJHQYplYw/lL
         F7l3TnECurmwZekLhZ2hITE50dF12pSc+BbAf+W9NHZxa2/KnkFj0Sc7g3gA2gh0Mnmy
         ZoCw==
X-Gm-Message-State: AOAM533VKGLG76sHfE2WVJ50buhccS5oYn3iYyBL0w9rPq25vZYrPXxs
        uv9GgH0sz5oaNRBm1w+4GG4=
X-Google-Smtp-Source: ABdhPJx51rBU/rVj68kvEO6PrNXeyN6VkTRmnWmI/0fJneiHByBt+MxfL1RT/Bf31Mt5NVigNKjyEQ==
X-Received: by 2002:a7b:c20b:: with SMTP id x11mr26634411wmi.150.1621983804609;
        Tue, 25 May 2021 16:03:24 -0700 (PDT)
Received: from [192.168.1.211] ([91.110.20.117])
        by smtp.gmail.com with ESMTPSA id s15sm21429865wrt.54.2021.05.25.16.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 16:03:24 -0700 (PDT)
Subject: Re: [PATCH v4 0/8] Introduce intel_skl_int3472 module
To:     Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org
Cc:     Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20210520140928.3252671-1-djrscally@gmail.com>
 <f2d8e74f-f33b-2489-1b90-b11bf7465d19@redhat.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <f4664310-0975-335d-8dc3-95726f53ab67@gmail.com>
Date:   Wed, 26 May 2021 00:03:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f2d8e74f-f33b-2489-1b90-b11bf7465d19@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hans

On 25/05/2021 14:10, Hans de Goede wrote:
> Hi Daniel,
>
> On 5/20/21 4:09 PM, Daniel Scally wrote:
>> Hello all
>>
>> Apologies for the long delay since the last version of this series; the time I
>> had free to work on it became somewhat restrained.
> No worries, thank you for all the work you are putting into this.


My pleasure

> I have not taken a close look at the code yet, but I see that Andy has and
> the amount of remarks which he has on patch 7/8 which is the big one seems
> to be limited, so I believe that we are getting close to this being ready
> for merging.
>
> This touches a lot of subsystems, so we need to come up with a plan to
> merge this. Here is my proposal for how to do this:
>
> 1/8   ACPI: scan: Extend acpi_walk_dep_device_list()
> 2/8   ACPI: scan: Add function to fetch dependent of acpi device
> 3/8   i2c: core: Add a format macro for I2C device names
> 4/8   gpiolib: acpi: Export acpi_get_gpiod()
> 5/8   clkdev: Make clkdev_drop() null aware
> 6/8   gpiolib: acpi: Add acpi_gpio_get_io_resource()
> 7/8   platform/x86: Add intel_skl_int3472 driver
> 8/8   mfd: tps68470: Remove tps68470 MFD driver
>
> Rafael already indicated that he wants to merge 1/8 (and presumably also 2/8)
> through his tree and that he will provide an immutable branch with those
> for merging into the pdx86 tree.


I'll send a v5 with the renames asap, might try and do the other changes
and send the whole series, depends how much time I get to work on it
over the next few days...

> 4/8 and 6/8 are both gpiolib-acpi patches and seem to be ready for merging
> now, perhaps the gpiolib-acpi maintainers can already merge these and also
> provide an immutable branch ?  Andy/Mika ?


So, Andy, you'd prefer I re-order these so they're consecutive...did I
understand that right?

> 3/8 and 5/8 seem to be nice cleanups, but not really necessary. IMHO it
> would be best to park these cleanups for later and for 3/8 add the following
> where necessary for now:
>
> /* FIXME drop this once the I2C_DEV_NAME_FORMAT macro has been added to include/linux/i2c.h */
> #ifndef I2C_DEV_NAME_FORMAT
> #define I2C_DEV_NAME_FORMAT		"i2c-%s"
> #endif
>
> This is not the prettiest but it reduces all the subsys cross-deps and things
> like this have been done before for similar reasons.
>
> Likewise it would be good if you can add if (foo) as condition before any
> clkdev_drop(foo) calls in this patch-set and then merge
> 5/8 "clkdev: Make clkdev_drop() null aware" independently of this and then
> once both are in Linux tree follow-up with a cleanup patch dropping the if (foo)
> guards.


This is fine by me if people are happy for it to go in like that; I'll
just fix it up later.

> So this would leave as deps for 7/8 just the 2 ACPI and 2 gpiolib-acpi patches
> which I can hopefully pull-in via immutable branches and then we are good.
>
> AFAICT patch 8/8 can be merged independently once 7/8 hits for-next (IOW once
> we are sure the next kernel will have 7/8).
>
>
>
> Or alternatively one of the involved subsys maintainers just merges the entire
> set (once it is ready) and then provides an immutable branch with the entire set
> on top of 5.13-rc1 (or 5.14-rc1). But that requires acks from all the other
> subsys maintainers. Note I'm fine with either approach.

