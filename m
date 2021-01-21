Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 275102FE9A1
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Jan 2021 13:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbhAUMJ7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Jan 2021 07:09:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730864AbhAUMFR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Jan 2021 07:05:17 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09234C061757;
        Thu, 21 Jan 2021 04:04:33 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id y187so1310093wmd.3;
        Thu, 21 Jan 2021 04:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NPaJmIoqOQ2ZtBkLTXast52ZNe1Rt1J2mdt0JMfHVxE=;
        b=MMEoBFia73Ara9Y6z+76gKokEEI1bzPJ9TpoHM+qHnrUCVU0RGG3mYhqcZl36/rgK0
         ca92dJ7ZDT7DUMqo6tSKr1pxGQZK3zYyHHqPhjtDvCbMdumYU6g06q+z+sJVAqtP9USN
         XoTGkadKrFekrw0EnRDNFXSUBCXIk/z3TkxjgdKzsOWd38Ffl2PHDK/ANcQzDS4Yn4lM
         hHXDqH5yGHBK6+xyNVWrLs5Z/Uwz6jv84fokQ6IiCGkuy4+gYYGSvHvVcr8hTwZr7wIU
         kq8PlZ/Wia4iPy4CjGhFIsvUPZ2CYiBctH7AaPAEacWwR5IoYnBjc6fi1pPzvtkGD82j
         HbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NPaJmIoqOQ2ZtBkLTXast52ZNe1Rt1J2mdt0JMfHVxE=;
        b=G1+U4J6u4tkCd/LYMiyQ3IjD7/ByW7KdWYs8Fx45oOYDOsqZj0kp6cur7F30i9U49J
         CdR2tDM8/m1jgrtnRnhcNa1m7qqRqdOVoJ8bnI57xZ8oAowmLEJfbeOIDv7eYXdM0BtX
         m+djLA1sfuDqSTZFJ5he9DtlKNuhoDGHQn/gcP1gNHCbHrpIbQqoWSj1cO4Ut4fiKDBD
         dxLSd178pWCHoV0qD5EO9ivgtq1tM5Z5eXUIANBCcQjK8BM4BTNHRiHZcz7W13w9uyw7
         v5v/+V4/MMQFDRrJUGUetx6I+mNX15k7B2o2KnpuAbGMHJ9Q7ydiVoCxalW4no1W3ZSf
         iJjA==
X-Gm-Message-State: AOAM5334wnc3JTPqeWQZVUwtPvKwh8uDgw8jd6jIBbyVBtK1KyoDAKBf
        JzHu8LfQ8e4BkMwoIVtrq08=
X-Google-Smtp-Source: ABdhPJwLdBKcGRNBAVpRiCip7CUbIQZuIXcYHBeps2IOw9tAKoPEKqtROcIFSlKGeTrZSbBGNejK9g==
X-Received: by 2002:a1c:18e:: with SMTP id 136mr8788559wmb.69.1611230671786;
        Thu, 21 Jan 2021 04:04:31 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id m2sm7632951wml.34.2021.01.21.04.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jan 2021 04:04:31 -0800 (PST)
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
 <e2d7e5e9-920f-7227-76a6-b166e30e11e5@gmail.com>
 <CAJZ5v0gg5oXG3yOO9iDvPKSsadYrFojW6JcKfZcQbFFpO78zAQ@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <85ccf00d-7c04-b1da-a4bc-82c805df69c9@gmail.com>
Date:   Thu, 21 Jan 2021 12:04:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gg5oXG3yOO9iDvPKSsadYrFojW6JcKfZcQbFFpO78zAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 21/01/2021 11:58, Rafael J. Wysocki wrote:
> On Thu, Jan 21, 2021 at 10:47 AM Daniel Scally <djrscally@gmail.com> wrote:
>> Hi Rafael
>>
>> On 19/01/2021 13:15, Rafael J. Wysocki wrote:
>>> On Mon, Jan 18, 2021 at 9:51 PM Daniel Scally <djrscally@gmail.com> wrote:
>>>> On 18/01/2021 16:14, Rafael J. Wysocki wrote:
>>>>> On Mon, Jan 18, 2021 at 1:37 AM Daniel Scally <djrscally@gmail.com> wrote:
>>>>>> In some ACPI tables we encounter, devices use the _DEP method to assert
>>>>>> a dependence on other ACPI devices as opposed to the OpRegions that the
>>>>>> specification intends. We need to be able to find those devices "from"
>>>>>> the dependee, so add a function to parse all ACPI Devices and check if
>>>>>> the include the handle of the dependee device in their _DEP buffer.
>>>>> What exactly do you need this for?
>>>> So, in our DSDT we have devices with _HID INT3472, plus sensors which
>>>> refer to those INT3472's in their _DEP method. The driver binds to the
>>>> INT3472 device, we need to find the sensors dependent on them.
>>>>
>>> Well, this is an interesting concept. :-)
>>>
>>> Why does _DEP need to be used for that?  Isn't there any other way to
>>> look up the dependent sensors?
>>>
>>>>> Would it be practical to look up the suppliers in acpi_dep_list instead?
>>>>>
>>>>> Note that supplier drivers may remove entries from there, but does
>>>>> that matter for your use case?
>>>> Ah - that may work, yes. Thank you, let me test that.
>>> Even if that doesn't work right away, but it can be made work, I would
>>> very much prefer that to the driver parsing _DEP for every device in
>>> the namespace by itself.
>>
>> This does work; do you prefer it in scan.c, or in utils.c (in which case
>> with acpi_dep_list declared as external var in internal.h)?
> Let's put it in scan.c for now, because there is the lock protecting
> the list in there too.
>
> How do you want to implement this?  Something like "walk the list and
> run a callback for the matching entries" or do you have something else
> in mind?


Something like this (though with a mutex_lock()). It could be simplified
by dropping the prev stuff, but we have seen INT3472 devices with
multiple sensors declaring themselves dependent on the same device


struct acpi_device *
acpi_dev_get_next_dependent_dev(struct acpi_device *supplier,
                struct acpi_device *prev)
{
    struct acpi_dep_data *dep;
    struct acpi_device *adev;
    int ret;

    if (!supplier)
        return ERR_PTR(-EINVAL);

    if (prev) {
        /*
         * We need to find the previous device in the list, so we know
         * where to start iterating from.
         */
        list_for_each_entry(dep, &acpi_dep_list, node)
            if (dep->consumer == prev->handle &&
                dep->supplier == supplier->handle)
                break;

        dep = list_next_entry(dep, node);
    } else {
        dep = list_first_entry(&acpi_dep_list, struct acpi_dep_data,
                       node);
    }


    list_for_each_entry_from(dep, &acpi_dep_list, node) {
        if (dep->supplier == supplier->handle) {
            ret = acpi_bus_get_device(dep->consumer, &adev);
            if (ret)
                return ERR_PTR(ret);

            return adev;
        }
    }

    return NULL;
}

