Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7993318DD
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 21:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhCHUtx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 15:49:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbhCHUtn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Mar 2021 15:49:43 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19EDDC06174A;
        Mon,  8 Mar 2021 12:49:43 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo4624613wmq.4;
        Mon, 08 Mar 2021 12:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=u6BZPIdvgWtIEd689VvS5QtUOzKg7WXaBx7o4om4Ymc=;
        b=E8VIeiOpY9O4jeKN+/hmU8YFMSGRUwp2id5mjymFQa49+OkplP2mo3xIIok+8lDXA2
         r99PiTax3vzFA5X3M8WVGwmmuyopeBcVwOt5sfvGYCkdn4e70b7vQ10bk+K92+BWnjdy
         Exv2JROEMEjwAr0/AJHyxvGDEeUe/4jthIDRqJSdRCIQDU8fdhq3K2BsWpQ1NlRj3Lrp
         89ZW3Ql+bL+kUH9/zF1jaiKFlSSs8azNzvx9dKzbsPipUTPX9DAl0q/fZKPmzBqKgLpY
         q5TVg9txYqA+MzyOaWVEMWWtwb0udL+vL0xfROjeKfkKwSNHky3hrqbhZQZ+nWsgcgAz
         N58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=u6BZPIdvgWtIEd689VvS5QtUOzKg7WXaBx7o4om4Ymc=;
        b=EBdTJZl3VkULD2noN+XLj1w4GPKlSKtkiId89i7k3fIbmUij/ImWQ5Y2VUZCx7iLid
         qeVu9ZSRTJ+mtofPyYZHmY8791mTbzRyqcpVb2pIV14O8lZS/UG3EbcJ9J21XTEGicqS
         MeirSP8+Iyfbi/IXlrJl3N44JLIWan9Bywd/yUzsZ8jP7xkpKbAcNcBWIiO1Mn5b71hT
         nnMIG5zW4LhpDnGdhry/27ZvOWBpxe47cf/wz+dh/wfIwjbKL73PkZKByi0eZQRSPBcU
         LbnV63wkVv+H86AXacdW2kk2VGGerVVrMcs6dgkJ8rVWqVpRcS8Q5iJl4zppfk+e/7Mw
         l0QQ==
X-Gm-Message-State: AOAM5338rj4BnbbD1KTIhM59MCW9k3JpDuwN7CfwAPd3hiTF5ARelPVn
        BS4ExM0LzqUryXXUsER6T2s=
X-Google-Smtp-Source: ABdhPJxUeGSjsLbhLGHOOPieUUpb8j0uvTlHEwi5jFjQBMLQGNpi4Au4ginO2ZzOyZRAs2e0ejLGYQ==
X-Received: by 2002:a7b:cdef:: with SMTP id p15mr610310wmj.0.1615236581888;
        Mon, 08 Mar 2021 12:49:41 -0800 (PST)
Received: from [192.168.1.211] ([2.26.187.30])
        by smtp.gmail.com with ESMTPSA id a131sm640669wmc.48.2021.03.08.12.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 12:49:41 -0800 (PST)
Subject: Re: [PATCH v3 1/6] ACPI: scan: Extend acpi_walk_dep_device_list()
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
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
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <20210222130735.1313443-2-djrscally@gmail.com>
 <CAHp75VfPuDjt=ZfHkwErF7_6Ks6wpqXO8mtq-2KjV+mU_PXFtg@mail.gmail.com>
 <615bad5e-6e68-43c9-dd0b-f26d2832d52f@gmail.com>
 <CAHp75Vc2iwvh1RiYmQDPSvgNvGT_gBcGTK67F+MhWgXyoxqn0A@mail.gmail.com>
 <CAJZ5v0ijOhT3PVm6-gqnqycE-YZhD00dGbtK1UEV5nfrOF5Obw@mail.gmail.com>
 <YEYtME2AxpXBq6iF@smile.fi.intel.com>
 <CAJZ5v0i+suMNWhUc=v0pnpabS-Ew-CMeSH945JB0YKnQAbi4Wg@mail.gmail.com>
 <CAJZ5v0iyGGLjhYnQxQTokib5Dyiuz_ApvaWb13qz8=U3V44vFg@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <3138da4c-7e1b-d75e-b0a3-014bdc5147c1@gmail.com>
Date:   Mon, 8 Mar 2021 20:49:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0iyGGLjhYnQxQTokib5Dyiuz_ApvaWb13qz8=U3V44vFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rafael

On 08/03/2021 17:23, Rafael J. Wysocki wrote:
> On Mon, Mar 8, 2021 at 4:45 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>> On Mon, Mar 8, 2021 at 2:57 PM Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>> On Mon, Mar 08, 2021 at 02:36:27PM +0100, Rafael J. Wysocki wrote:
>>>> On Sun, Mar 7, 2021 at 9:39 PM Andy Shevchenko
>>>> <andy.shevchenko@gmail.com> wrote:
>>>>> On Sun, Mar 7, 2021 at 3:36 PM Daniel Scally <djrscally@gmail.com> wrote:
>>>>>> On 22/02/2021 13:34, Andy Shevchenko wrote:
>>>>>>> On Mon, Feb 22, 2021 at 3:12 PM Daniel Scally <djrscally@gmail.com> wrote:
>>>>>>>> The acpi_walk_dep_device_list() is not as generalisable as its name
>>>>>>>> implies, serving only to decrement the dependency count for each
>>>>>>>> dependent device of the input. Extend the function to instead accept
>>>>>>>> a callback which can be applied to all the dependencies in acpi_dep_list.
>>>>>>>> Replace all existing calls to the function with calls to a wrapper, passing
>>>>>>>> a callback that applies the same dependency reduction.
>>>>>>> The code looks okay to me, if it was the initial idea, feel free to add
>>>>>>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>>> ...
>>>
>>>>>>>> +void acpi_dev_flag_dependency_met(acpi_handle handle)
>>>>>>> Since it's acpi_dev_* namespace, perhaps it should take struct acpi_device here?
>>>>>> I can do this, but I avoided it because in most of the uses in the
>>>>>> kernel currently there's no struct acpi_device, they're just passing
>>>>>> ACPI_HANDLE(dev) instead, so I'd need to get the adev with
>>>>>> ACPI_COMPANION() in each place. It didn't seem worth it...
>>>> It may not even be possible sometimes, because that function may be
>>>> called before creating all of the struct acpi_device objects (like in
>>>> the case of deferred enumeration).
>>>>
>>>>>> but happy to
>>>>>> do it if you'd prefer it that way?
>>>>> I see, let Rafael decide then. I'm not pushing here.
>>>> Well, it's a matter of correctness.
>>> Looking at your above comment it is indeed. Thanks for clarification!
>> Well, actually, the struct device for the object passed to this
>> function should be there already, because otherwise it wouldn't make
>> sense to update the list.  So my comment above is not really
>> applicable to this particular device and the function could take a
>> struct acpi_device pointer argument.  Sorry for the confusion.
>>
>>> But should we have acpi_dev_*() namespace for this function if it takes handle?
>> It takes a device object handle.
>>
>> Anyway, as per the above, it can take a struct acpi_device pointer
>> argument in which case the "acpi_dev_" prefix should be fine.


OK, so the conclusion there is change the argument to a struct
acpi_device pointer and update all the uses.

>>> For time being nothing better than following comes to my mind:
>>>
>>> __acpi_dev_flag_dependency_met() => __acpi_flag_device_dependency_met()
>>> acpi_dev_flag_dependency_met() => acpi_flag_device_dependency_met()
>> The above said, the name is somewhat confusing overall IMV.
>>
>> Something like acpi_dev_clear_dependencies() might be better.
>>
>> So lets make it something like
>>
>> void acpi_dev_clear_dependencies(struct acpi_device *supplier);
> To be precise, there are two functions in the patch,
> acpi_dev_flag_dependency_met() which invokes
> acpi_walk_dep_device_list() and __acpi_dev_flag_dependency_met()
> invoked by the latter as a callback.
>
> Above I was talking about the first one.
>
> The callback should still take a struct acpi_dep_data pointer argument
> and I would call it acpi_scan_clear_dep() or similar.


OK, works for me, I'll make those changes - thanks

