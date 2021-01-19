Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A982FB9AB
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 15:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392075AbhASOhE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jan 2021 09:37:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393747AbhASN2x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jan 2021 08:28:53 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3B9C061573;
        Tue, 19 Jan 2021 05:28:11 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id c127so1260089wmf.5;
        Tue, 19 Jan 2021 05:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=5y8Ro1ypuMwid9mJ+5yTb8j+eAM7KPlRMembrO9vocc=;
        b=lx6zvICzjPPHETERikm0s4RqzxKqjLCL/yTU4tYQDIumZZt4FI6Zr0zXmBGkJ4xtSg
         Tpev99JjWdgHUg0pnM/bgFnJ1naDMnmNS+C4GOAxcA6U9nR7HAHbyT668vglCwGfXn7k
         mQrTwoyW3LrjUlLHMqNTTBDb5o8sw8NWZSuvNybzvMkicpDX10QKTtp5Eu5f8acMamf+
         kF9QqGU/8CINxLPv+UGKla0AoMuD0DXTAB4hbRfqV/SMTPm9/862zcSP7K+cAKuw/0U9
         YT6AEHteHr8n+n7FkZQslMfQdIogjDB/Lh1c2nanAh+bQzmIe2ezQ9LuuMGIlSbtXLbO
         id0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=5y8Ro1ypuMwid9mJ+5yTb8j+eAM7KPlRMembrO9vocc=;
        b=swUAc9o7nu6HWCv0ZiH0jmVg9uGGm5wU6OGmwiSclCNFZgkxIa18x4ZAEfNEqEPHMu
         Z9gfU3WJOmHPELuFyatHfCoAQa211GRxWc6uj2Qf9SmjDYiJCz47cMXLk3QwNh5MtGZU
         8Sh1tDtElzNydm3iu6Ce/9JfWntHxaM0SI6ytYEeTemai5TUWrBWVaXDIidmP0xuBv3L
         smzYcf744SFToYLod6etYOJTTc2mHKVKmNzWvX4HzDmNllfJxcj9jQpYz31BQDw0/eBK
         Ij+geNHkP9AUGFEpSnAsyHFNYW7Tw1mqr/8vJW2VfqdUxcpOYDyYcmFn4qgqrd6UVyn4
         hSWA==
X-Gm-Message-State: AOAM531CuP+sQsD4wLA5mamFJUYOWF4jzH1UOlvJLbNgRiRjR9nkglD5
        WRj1bNbfIlDestSCSSWqQ8I=
X-Google-Smtp-Source: ABdhPJyqV3r5lugb4G4AUkJpM01DH9xMik3Jbf10xwwURpVgVJLd2eqD2bWAvX85ZopBoeYJj6Z5Rg==
X-Received: by 2002:a7b:c08b:: with SMTP id r11mr2514749wmh.11.1611062890337;
        Tue, 19 Jan 2021 05:28:10 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id b64sm4518824wmb.26.2021.01.19.05.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jan 2021 05:28:09 -0800 (PST)
Subject: Re: [PATCH v2 2/7] acpi: utils: Add function to fetch dependent
 acpi_devices
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, andy@kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-3-djrscally@gmail.com>
 <CAJZ5v0gVQsZ4rxXW8uMidW9zfY_S50zpfrL-Gq0J3Z4-qqBiww@mail.gmail.com>
 <b381b48e-1bf2-f3e7-10a6-e51cd261f43c@gmail.com>
 <CAJZ5v0iU2m4Hs6APuauQ645DwbjYaB8nJFjYH0+7yQnR-FPZBQ@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <29f82122-8059-c9dc-15af-a6812e5509f7@gmail.com>
Date:   Tue, 19 Jan 2021 13:28:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0iU2m4Hs6APuauQ645DwbjYaB8nJFjYH0+7yQnR-FPZBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 19/01/2021 13:15, Rafael J. Wysocki wrote:
> On Mon, Jan 18, 2021 at 9:51 PM Daniel Scally <djrscally@gmail.com> wrote:
>> On 18/01/2021 16:14, Rafael J. Wysocki wrote:
>>> On Mon, Jan 18, 2021 at 1:37 AM Daniel Scally <djrscally@gmail.com> wrote:
>>>> In some ACPI tables we encounter, devices use the _DEP method to assert
>>>> a dependence on other ACPI devices as opposed to the OpRegions that the
>>>> specification intends. We need to be able to find those devices "from"
>>>> the dependee, so add a function to parse all ACPI Devices and check if
>>>> the include the handle of the dependee device in their _DEP buffer.
>>> What exactly do you need this for?
>> So, in our DSDT we have devices with _HID INT3472, plus sensors which
>> refer to those INT3472's in their _DEP method. The driver binds to the
>> INT3472 device, we need to find the sensors dependent on them.
>>
> Well, this is an interesting concept. :-)
>
> Why does _DEP need to be used for that?  Isn't there any other way to
> look up the dependent sensors?


If there is, I'm not aware of it, I don't see a reference to the sensor
in the INT3472 device (named "PMI0", with the corresponding sensor being
"CAM0") in DSDT  [1]

>>> Would it be practical to look up the suppliers in acpi_dep_list instead?
>>>
>>> Note that supplier drivers may remove entries from there, but does
>>> that matter for your use case?
>> Ah - that may work, yes. Thank you, let me test that.
> Even if that doesn't work right away, but it can be made work, I would
> very much prefer that to the driver parsing _DEP for every device in
> the namespace by itself.


Alright; I haven't looked too closely yet, but I think an iterator over
acpi_dep_list exported from the ACPI subsystem would also work in a
pretty similar way to the function introduced in this patch does,
without much work


[1]
https://gist.githubusercontent.com/djrscally/e64d112180517352fa3392878b0f4a7d/raw/88b90b3ea4204fd7845257b6666fdade47cc2981/dsdt.dsl

