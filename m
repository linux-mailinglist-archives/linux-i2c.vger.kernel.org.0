Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE2812FF6CA
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Jan 2021 22:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbhAUVHM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Jan 2021 16:07:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbhAUVGt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Jan 2021 16:06:49 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8C34C0613D6;
        Thu, 21 Jan 2021 13:06:08 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id q7so3081583wre.13;
        Thu, 21 Jan 2021 13:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=c32MJxHbMXKIzSN7o1VmWc7TXb9b5e1CGXL5LOjwT6g=;
        b=u4djjoC9hSNDXFyCd/ImL8m1DEWuw8KUuPgFO4phIYc7TOTB4CPy+dLgKxjevXx5mT
         aMDyGnjPAbpkNoz0XiEu1zkYimth4y6ArIV6H2SfbowC+6byq4OvFu5Wb8irSEEPzC5s
         ChEql7/rDpn97TdjI8DAiFkTWaMWOfkSeQyAI70Tfm2EoN8crnvZiL0IiayzLCm45GjT
         ki+OV8OG6dB1C/BZCYmEhG3ve23znznRaL3Sc7a4LKQDcXH+mgJaC8/DKhFeB/GJICM3
         OtAquWWmeL0gjKWo6uNRBPgh17Qm9UVJBPq8mPuXHWCMrZwOY4OvyN0gA/Krbv0V7TJ+
         XvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=c32MJxHbMXKIzSN7o1VmWc7TXb9b5e1CGXL5LOjwT6g=;
        b=g1NQiNlZiJlRRMxj93JRs0N5hd+NtSqYKxF5OOZ8UEUb4Z48tPfFaxUG9o0sRdijGa
         r11XhPAZOP9NhXtakUDGtB7vqlS8A/L7362IyaxD+Zz/JsCT1vJm6ihhT6J41h0lLVwl
         KSRNe2XD6o18nIA+gmTiKK9T3a4V0YVLHH7xdSdaBnZC7muJngD0OuX8JYTYAfeGiv32
         mxFNOXA6u+7CN3s0dV6v9SdSGe1Phhb0s3Pd4zGRpBVSFpoX+QTTQ1sbt1Xf6pbL+JNL
         5KTLh5ZCYk6x68fK3viEzqn7ijBuFGyIw2x9IaolBgTAEfp0he7y6azesP2t4SGQiHE7
         2F3w==
X-Gm-Message-State: AOAM532Fp5ElwFkaJlPEhv6LGoZECY0OKyHj/ILLMdfRBpAHYJlxzpOx
        ps4vA/iX4dveTB+hALo6e/U=
X-Google-Smtp-Source: ABdhPJyvMM67co17b2bl8bFHYOAqV+64lTyRfq/UMtWF4DXtiVki1RKalX7zaoMBeipjrKk8oZCZwg==
X-Received: by 2002:adf:ba49:: with SMTP id t9mr1251120wrg.183.1611263167561;
        Thu, 21 Jan 2021 13:06:07 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id a130sm9049021wmf.4.2021.01.21.13.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jan 2021 13:06:06 -0800 (PST)
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
 <85ccf00d-7c04-b1da-a4bc-82c805df69c9@gmail.com>
 <CAJZ5v0jO9O1zhBMNRNB5kRt1o86BTjr1kRuFUe=nNVTDwBQhEg@mail.gmail.com>
 <0fac24d2-e8fc-7dc8-0f2f-44c7aadb1daf@gmail.com>
 <CAJZ5v0jVxMMGh6k-vXeBRsCtD0L14poNUrg4kZOpCfOz2sZGZQ@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <ee8f6b58-55c8-e0a0-c161-bdef361f9e0a@gmail.com>
Date:   Thu, 21 Jan 2021 21:06:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0jVxMMGh6k-vXeBRsCtD0L14poNUrg4kZOpCfOz2sZGZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 21/01/2021 18:08, Rafael J. Wysocki wrote:
> On Thu, Jan 21, 2021 at 5:34 PM Daniel Scally <djrscally@gmail.com> wrote:
>>
>> On 21/01/2021 14:39, Rafael J. Wysocki wrote:
>>> On Thu, Jan 21, 2021 at 1:04 PM Daniel Scally <djrscally@gmail.com> wrote:
>>>> On 21/01/2021 11:58, Rafael J. Wysocki wrote:
>>>>> On Thu, Jan 21, 2021 at 10:47 AM Daniel Scally <djrscally@gmail.com> wrote:
>>>>>> Hi Rafael
>>>>>>
>>>>>> On 19/01/2021 13:15, Rafael J. Wysocki wrote:
>>>>>>> On Mon, Jan 18, 2021 at 9:51 PM Daniel Scally <djrscally@gmail.com> wrote:
>>>>>>>> On 18/01/2021 16:14, Rafael J. Wysocki wrote:
>>>>>>>>> On Mon, Jan 18, 2021 at 1:37 AM Daniel Scally <djrscally@gmail.com> wrote:
>>>>>>>>>> In some ACPI tables we encounter, devices use the _DEP method to assert
>>>>>>>>>> a dependence on other ACPI devices as opposed to the OpRegions that the
>>>>>>>>>> specification intends. We need to be able to find those devices "from"
>>>>>>>>>> the dependee, so add a function to parse all ACPI Devices and check if
>>>>>>>>>> the include the handle of the dependee device in their _DEP buffer.
>>>>>>>>> What exactly do you need this for?
>>>>>>>> So, in our DSDT we have devices with _HID INT3472, plus sensors which
>>>>>>>> refer to those INT3472's in their _DEP method. The driver binds to the
>>>>>>>> INT3472 device, we need to find the sensors dependent on them.
>>>>>>>>
>>>>>>> Well, this is an interesting concept. :-)
>>>>>>>
>>>>>>> Why does _DEP need to be used for that?  Isn't there any other way to
>>>>>>> look up the dependent sensors?
>>>>>>>
>>>>>>>>> Would it be practical to look up the suppliers in acpi_dep_list instead?
>>>>>>>>>
>>>>>>>>> Note that supplier drivers may remove entries from there, but does
>>>>>>>>> that matter for your use case?
>>>>>>>> Ah - that may work, yes. Thank you, let me test that.
>>>>>>> Even if that doesn't work right away, but it can be made work, I would
>>>>>>> very much prefer that to the driver parsing _DEP for every device in
>>>>>>> the namespace by itself.
>>>>>> This does work; do you prefer it in scan.c, or in utils.c (in which case
>>>>>> with acpi_dep_list declared as external var in internal.h)?
>>>>> Let's put it in scan.c for now, because there is the lock protecting
>>>>> the list in there too.
>>>>>
>>>>> How do you want to implement this?  Something like "walk the list and
>>>>> run a callback for the matching entries" or do you have something else
>>>>> in mind?
>>>> Something like this (though with a mutex_lock()). It could be simplified
>>>> by dropping the prev stuff, but we have seen INT3472 devices with
>>>> multiple sensors declaring themselves dependent on the same device
>>>>
>>>>
>>>> struct acpi_device *
>>>> acpi_dev_get_next_dependent_dev(struct acpi_device *supplier,
>>>>                 struct acpi_device *prev)
>>>> {
>>>>     struct acpi_dep_data *dep;
>>>>     struct acpi_device *adev;
>>>>     int ret;
>>>>
>>>>     if (!supplier)
>>>>         return ERR_PTR(-EINVAL);
>>>>
>>>>     if (prev) {
>>>>         /*
>>>>          * We need to find the previous device in the list, so we know
>>>>          * where to start iterating from.
>>>>          */
>>>>         list_for_each_entry(dep, &acpi_dep_list, node)
>>>>             if (dep->consumer == prev->handle &&
>>>>                 dep->supplier == supplier->handle)
>>>>                 break;
>>>>
>>>>         dep = list_next_entry(dep, node);
>>>>     } else {
>>>>         dep = list_first_entry(&acpi_dep_list, struct acpi_dep_data,
>>>>                        node);
>>>>     }
>>>>
>>>>
>>>>     list_for_each_entry_from(dep, &acpi_dep_list, node) {
>>>>         if (dep->supplier == supplier->handle) {
>>>>             ret = acpi_bus_get_device(dep->consumer, &adev);
>>>>             if (ret)
>>>>                 return ERR_PTR(ret);
>>>>
>>>>             return adev;
>>>>         }
>>>>     }
>>>>
>>>>     return NULL;
>>>> }
>>> That would work I think, but would it be practical to modify
>>> acpi_walk_dep_device_list() so that it runs a callback for every
>>> consumer found instead of or in addition to the "delete from the list
>>> and free the entry" operation?
>>
>> I think that this would work fine, if that's the way you want to go.
>> We'd just need to move everything inside the if (dep->supplier ==
>> handle) block to a new callback, and for my purposes I think also add a
>> way to stop parsing the list from the callback (so like have the
>> callbacks return int and stop parsing on a non-zero return). Do you want
>> to expose that ability to pass a callback outside of ACPI?
> Yes.
>
>> Or just export helpers to call each of the callbacks (one to fetch the next
>> dependent device, one to decrement the unmet dependencies counter)
> If you can run a callback for every matching entry, you don't really
> need to have a callback to return the next matching entry.  You can do
> stuff for all of them in one go

Well it my case it's more to return a pointer to the dep->consumer's
acpi_device for a matching entry, so my idea was where there's multiple
dependents you could use this as an iterator...but it could just be
extended to that if needed later; I don't actually need to do it right now.


> note that it probably is not a good
> idea to run the callback under the lock, so the for loop currently in
> there is not really suitable for that

No problem;  I'll tweak that then

>> Otherwise, I'd just need to update the 5 users of that function either
>> to use the new helper or else to also pass the decrement dependencies
>> callback.
> Or have a wrapper around it passing the decrement dependencies
> callback for the "typical" users.


Yeah that's what I mean by helper; I'll do that then; thanks

