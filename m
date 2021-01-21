Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6F52FF07C
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Jan 2021 17:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387916AbhAUQfj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Jan 2021 11:35:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387904AbhAUQfW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Jan 2021 11:35:22 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19CBC061756;
        Thu, 21 Jan 2021 08:34:39 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id c12so2365189wrc.7;
        Thu, 21 Jan 2021 08:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=YlHLVnRR0WKe78VA0AWZic/mxYHhEfei59jaU+AgjMQ=;
        b=LHkxrpTK325aR3GoREcT0iu2gmRw30nISJ6T2HCmZuC4Soi5CcJavgt5FEhbbWj5W0
         drfbkA7ocXITcm4yOOUsj2gX14C8A1iX8UdduwhCkSlLyM2gi2vsLhJVYqeDg+BOzG18
         XXuuNBH+1MezzfJ/yiMxNdKlULushk79pH2sBzWCbCWfYomYQbz0keojZdcVfOWqOgmA
         fo6A5tjEc+y1PDIUIsW1DsK9MdK2GVhW10israYRPBrUVe2z7BzwdVn3/JccEEHCeAuP
         KGzHC3TkCRQz5xOZu0kalBHLk3bi2YOe2nNnPyOCQY6hUVNz6m4dvciFXLXmXHS7A4r8
         zcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=YlHLVnRR0WKe78VA0AWZic/mxYHhEfei59jaU+AgjMQ=;
        b=aSomIlcgqM85suz+RXh04OpXL9JmMVNvTyd6+R0+hYNooxrYdJQAEY2Jueur5//WBK
         cQa16XAO7Jktgashb56jQDG2eCWdMP/sPVeO3y9cf6jZLMct12EAbaHJFzJcDePPjERl
         iDQg14M32vcwq4Ngc9blrBFoHtslNb+fBDup+3uxo1Du45qEwfbr2sNCIgtgNTrtEje6
         U4pjFhePuVH/4uTnppFeXC+wJSsGpcNTxL7Ge+EZK/NTiRTaiVD3t+O90KGBPfYLc0qz
         Y8zPK1viyp1YQjrTQyiL5b9Jnz0XsqQpGOPIMIsXuoQUGdsvT9rXbW6x8cMpG5wp2rJZ
         GMrQ==
X-Gm-Message-State: AOAM530HhhxG5M60jw68C30oSaZBjqmq2ss+PBnrtuWAilkpQh2w6sxt
        4C84JMKsa0qJ32PFqSWRMuY=
X-Google-Smtp-Source: ABdhPJzJH7xRVK5uCUcH3hOOY9JvWe9hwD1lAGxZ5+zzt5t/3cUyk9Y/LnRu4HUOk/BIg9MoVMIWMA==
X-Received: by 2002:a5d:434d:: with SMTP id u13mr324307wrr.6.1611246878638;
        Thu, 21 Jan 2021 08:34:38 -0800 (PST)
Received: from [192.168.1.211] ([2.29.208.120])
        by smtp.gmail.com with ESMTPSA id h23sm8462795wmi.26.2021.01.21.08.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jan 2021 08:34:38 -0800 (PST)
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
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <0fac24d2-e8fc-7dc8-0f2f-44c7aadb1daf@gmail.com>
Date:   Thu, 21 Jan 2021 16:34:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0jO9O1zhBMNRNB5kRt1o86BTjr1kRuFUe=nNVTDwBQhEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 21/01/2021 14:39, Rafael J. Wysocki wrote:
> On Thu, Jan 21, 2021 at 1:04 PM Daniel Scally <djrscally@gmail.com> wrote:
>>
>> On 21/01/2021 11:58, Rafael J. Wysocki wrote:
>>> On Thu, Jan 21, 2021 at 10:47 AM Daniel Scally <djrscally@gmail.com> wrote:
>>>> Hi Rafael
>>>>
>>>> On 19/01/2021 13:15, Rafael J. Wysocki wrote:
>>>>> On Mon, Jan 18, 2021 at 9:51 PM Daniel Scally <djrscally@gmail.com> wrote:
>>>>>> On 18/01/2021 16:14, Rafael J. Wysocki wrote:
>>>>>>> On Mon, Jan 18, 2021 at 1:37 AM Daniel Scally <djrscally@gmail.com> wrote:
>>>>>>>> In some ACPI tables we encounter, devices use the _DEP method to assert
>>>>>>>> a dependence on other ACPI devices as opposed to the OpRegions that the
>>>>>>>> specification intends. We need to be able to find those devices "from"
>>>>>>>> the dependee, so add a function to parse all ACPI Devices and check if
>>>>>>>> the include the handle of the dependee device in their _DEP buffer.
>>>>>>> What exactly do you need this for?
>>>>>> So, in our DSDT we have devices with _HID INT3472, plus sensors which
>>>>>> refer to those INT3472's in their _DEP method. The driver binds to the
>>>>>> INT3472 device, we need to find the sensors dependent on them.
>>>>>>
>>>>> Well, this is an interesting concept. :-)
>>>>>
>>>>> Why does _DEP need to be used for that?  Isn't there any other way to
>>>>> look up the dependent sensors?
>>>>>
>>>>>>> Would it be practical to look up the suppliers in acpi_dep_list instead?
>>>>>>>
>>>>>>> Note that supplier drivers may remove entries from there, but does
>>>>>>> that matter for your use case?
>>>>>> Ah - that may work, yes. Thank you, let me test that.
>>>>> Even if that doesn't work right away, but it can be made work, I would
>>>>> very much prefer that to the driver parsing _DEP for every device in
>>>>> the namespace by itself.
>>>> This does work; do you prefer it in scan.c, or in utils.c (in which case
>>>> with acpi_dep_list declared as external var in internal.h)?
>>> Let's put it in scan.c for now, because there is the lock protecting
>>> the list in there too.
>>>
>>> How do you want to implement this?  Something like "walk the list and
>>> run a callback for the matching entries" or do you have something else
>>> in mind?
>>
>> Something like this (though with a mutex_lock()). It could be simplified
>> by dropping the prev stuff, but we have seen INT3472 devices with
>> multiple sensors declaring themselves dependent on the same device
>>
>>
>> struct acpi_device *
>> acpi_dev_get_next_dependent_dev(struct acpi_device *supplier,
>>                 struct acpi_device *prev)
>> {
>>     struct acpi_dep_data *dep;
>>     struct acpi_device *adev;
>>     int ret;
>>
>>     if (!supplier)
>>         return ERR_PTR(-EINVAL);
>>
>>     if (prev) {
>>         /*
>>          * We need to find the previous device in the list, so we know
>>          * where to start iterating from.
>>          */
>>         list_for_each_entry(dep, &acpi_dep_list, node)
>>             if (dep->consumer == prev->handle &&
>>                 dep->supplier == supplier->handle)
>>                 break;
>>
>>         dep = list_next_entry(dep, node);
>>     } else {
>>         dep = list_first_entry(&acpi_dep_list, struct acpi_dep_data,
>>                        node);
>>     }
>>
>>
>>     list_for_each_entry_from(dep, &acpi_dep_list, node) {
>>         if (dep->supplier == supplier->handle) {
>>             ret = acpi_bus_get_device(dep->consumer, &adev);
>>             if (ret)
>>                 return ERR_PTR(ret);
>>
>>             return adev;
>>         }
>>     }
>>
>>     return NULL;
>> }
> That would work I think, but would it be practical to modify
> acpi_walk_dep_device_list() so that it runs a callback for every
> consumer found instead of or in addition to the "delete from the list
> and free the entry" operation?


I think that this would work fine, if that's the way you want to go.
We'd just need to move everything inside the if (dep->supplier ==
handle) block to a new callback, and for my purposes I think also add a
way to stop parsing the list from the callback (so like have the
callbacks return int and stop parsing on a non-zero return). Do you want
to expose that ability to pass a callback outside of ACPI? Or just
export helpers to call each of the callbacks (one to fetch the next
dependent device, one to decrement the unmet dependencies counter)


Otherwise, I'd just need to update the 5 users of that function either
to use the new helper or else to also pass the decrement dependencies
callback.

