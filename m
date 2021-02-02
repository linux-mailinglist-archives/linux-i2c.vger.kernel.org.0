Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D31830BB9E
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Feb 2021 11:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbhBBJ7I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 Feb 2021 04:59:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbhBBJ7B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 Feb 2021 04:59:01 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24DA2C061573;
        Tue,  2 Feb 2021 01:58:20 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id e15so1711501wme.0;
        Tue, 02 Feb 2021 01:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aRWlB17fgJ7FBH80ZaL2irHbFGq9l/cSPpFGGk65Sp0=;
        b=jr8Y7EVTubO4xkazVVobZAPzZmg2jsav0Qka/39DaINvgiuxy4NV2/s/+++Qf9qdRg
         a/whI2ECcaMWwxnNQybb2z7q6X/qeI4wVdaTJtkZKYEihuu4h+NP567Ok/H2+JD/5dhS
         EuZAQwvZxMIMyO4tZ5TiXJpqVBXAS8Y9qw+SIAIZZTnvvIUyfqHNT/O6IgB4URn6fmeL
         DMo5PDBVAI+hf5gb+kIdrMeNgDvfCkDSCdIzpu4ZaJWUXb84Nleks/nFL7gEffMqYr7b
         kLp51qp05OOClLpQR9NvyRaosH6kyPktIroXbKpr+/cJxRfN671HjNTbm9PoNdy6xm38
         QFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aRWlB17fgJ7FBH80ZaL2irHbFGq9l/cSPpFGGk65Sp0=;
        b=E3dhDC3G/NueOX1NJSK2qhx+Chqb9UZgPeSwj6R3nSCWnPToLWC8aTb1bwI/hz1TxO
         lPV90Wkn2kvCwuxhuhDvjDqvjG+puPK/djgfUAqpjLWjhyDIMo+qgUJT+FdR+RdB9KMS
         K8MtxQSDmqwgJ3m5hihBOx53C/0oUyCC8xvmxDfCBGPoQZHZI1uva03h/KC03bqmkS+i
         94MGF6XB6NAZohv0u6qLpqTd7nQ8o7G/8rWpx9lDtGCJHsWw52kOHZDRTnQCBkyrJttr
         i1rIfZPdhIT/FIxswPBuZEr8EzS9TvVaJmOkOeSTd+AQq+M/DidFKvrOm5zEzyueODec
         tRAg==
X-Gm-Message-State: AOAM532DyRuw3pWmbRAr5HJ8Qr4Coc+xjORdlFQyRu4xoDGIRcI+nbtC
        dn4AoTCszDu4eP/cc6+EdiA=
X-Google-Smtp-Source: ABdhPJzExWAL1lD8x9TqPU/EeGYBZQ9l6JLXhM07AU/7P3U6pjBm3uQII891MxzVZ/yfRYSAsOmKQA==
X-Received: by 2002:a1c:c356:: with SMTP id t83mr1417532wmf.99.1612259898784;
        Tue, 02 Feb 2021 01:58:18 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.123])
        by smtp.gmail.com with ESMTPSA id e16sm30913024wrp.24.2021.02.02.01.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 01:58:18 -0800 (PST)
Subject: Re: [PATCH v2 2/7] acpi: utils: Add function to fetch dependent
 acpi_devices
From:   Daniel Scally <djrscally@gmail.com>
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
 <ee8f6b58-55c8-e0a0-c161-bdef361f9e0a@gmail.com>
Message-ID: <d9ec0439-4323-51a2-70e7-c258fe63cd86@gmail.com>
Date:   Tue, 2 Feb 2021 09:58:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ee8f6b58-55c8-e0a0-c161-bdef361f9e0a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Rafael

On 21/01/2021 21:06, Daniel Scally wrote:
> 
> On 21/01/2021 18:08, Rafael J. Wysocki wrote:
>> On Thu, Jan 21, 2021 at 5:34 PM Daniel Scally <djrscally@gmail.com> wrote:
>>>
>>> On 21/01/2021 14:39, Rafael J. Wysocki wrote:
>>>> On Thu, Jan 21, 2021 at 1:04 PM Daniel Scally <djrscally@gmail.com> wrote:
>>>>> On 21/01/2021 11:58, Rafael J. Wysocki wrote:
>>>>>> On Thu, Jan 21, 2021 at 10:47 AM Daniel Scally <djrscally@gmail.com> wrote:
>>>>>>> Hi Rafael
>>>>>>>
>>>>>>> On 19/01/2021 13:15, Rafael J. Wysocki wrote:
>>>>>>>> On Mon, Jan 18, 2021 at 9:51 PM Daniel Scally <djrscally@gmail.com> wrote:
>>>>>>>>> On 18/01/2021 16:14, Rafael J. Wysocki wrote:
>>>>>>>>>> On Mon, Jan 18, 2021 at 1:37 AM Daniel Scally <djrscally@gmail.com> wrote:
>>>>>>>>>>> In some ACPI tables we encounter, devices use the _DEP method to assert
>>>>>>>>>>> a dependence on other ACPI devices as opposed to the OpRegions that the
>>>>>>>>>>> specification intends. We need to be able to find those devices "from"
>>>>>>>>>>> the dependee, so add a function to parse all ACPI Devices and check if
>>>>>>>>>>> the include the handle of the dependee device in their _DEP buffer.
>>>>>>>>>> What exactly do you need this for?
>>>>>>>>> So, in our DSDT we have devices with _HID INT3472, plus sensors which
>>>>>>>>> refer to those INT3472's in their _DEP method. The driver binds to the
>>>>>>>>> INT3472 device, we need to find the sensors dependent on them.
>>>>>>>>>
>>>>>>>> Well, this is an interesting concept. :-)
>>>>>>>>
>>>>>>>> Why does _DEP need to be used for that?  Isn't there any other way to
>>>>>>>> look up the dependent sensors?
>>>>>>>>
>>>>>>>>>> Would it be practical to look up the suppliers in acpi_dep_list instead?
>>>>>>>>>>
>>>>>>>>>> Note that supplier drivers may remove entries from there, but does
>>>>>>>>>> that matter for your use case?
>>>>>>>>> Ah - that may work, yes. Thank you, let me test that.
>>>>>>>> Even if that doesn't work right away, but it can be made work, I would
>>>>>>>> very much prefer that to the driver parsing _DEP for every device in
>>>>>>>> the namespace by itself.
>>>>>>> This does work; do you prefer it in scan.c, or in utils.c (in which case
>>>>>>> with acpi_dep_list declared as external var in internal.h)?
>>>>>> Let's put it in scan.c for now, because there is the lock protecting
>>>>>> the list in there too.
>>>>>>
>>>>>> How do you want to implement this?  Something like "walk the list and
>>>>>> run a callback for the matching entries" or do you have something else
>>>>>> in mind?
>>>>> Something like this (though with a mutex_lock()). It could be simplified
>>>>> by dropping the prev stuff, but we have seen INT3472 devices with
>>>>> multiple sensors declaring themselves dependent on the same device
>>>>>
>>>>>
>>>>> struct acpi_device *
>>>>> acpi_dev_get_next_dependent_dev(struct acpi_device *supplier,
>>>>>                 struct acpi_device *prev)
>>>>> {
>>>>>     struct acpi_dep_data *dep;
>>>>>     struct acpi_device *adev;
>>>>>     int ret;
>>>>>
>>>>>     if (!supplier)
>>>>>         return ERR_PTR(-EINVAL);
>>>>>
>>>>>     if (prev) {
>>>>>         /*
>>>>>          * We need to find the previous device in the list, so we know
>>>>>          * where to start iterating from.
>>>>>          */
>>>>>         list_for_each_entry(dep, &acpi_dep_list, node)
>>>>>             if (dep->consumer == prev->handle &&
>>>>>                 dep->supplier == supplier->handle)
>>>>>                 break;
>>>>>
>>>>>         dep = list_next_entry(dep, node);
>>>>>     } else {
>>>>>         dep = list_first_entry(&acpi_dep_list, struct acpi_dep_data,
>>>>>                        node);
>>>>>     }
>>>>>
>>>>>
>>>>>     list_for_each_entry_from(dep, &acpi_dep_list, node) {
>>>>>         if (dep->supplier == supplier->handle) {
>>>>>             ret = acpi_bus_get_device(dep->consumer, &adev);
>>>>>             if (ret)
>>>>>                 return ERR_PTR(ret);
>>>>>
>>>>>             return adev;
>>>>>         }
>>>>>     }
>>>>>
>>>>>     return NULL;
>>>>> }
>>>> That would work I think, but would it be practical to modify
>>>> acpi_walk_dep_device_list() so that it runs a callback for every
>>>> consumer found instead of or in addition to the "delete from the list
>>>> and free the entry" operation?
>>>
>>> I think that this would work fine, if that's the way you want to go.
>>> We'd just need to move everything inside the if (dep->supplier ==
>>> handle) block to a new callback, and for my purposes I think also add a
>>> way to stop parsing the list from the callback (so like have the
>>> callbacks return int and stop parsing on a non-zero return). Do you want
>>> to expose that ability to pass a callback outside of ACPI?
>> Yes.
>>
>>> Or just export helpers to call each of the callbacks (one to fetch the next
>>> dependent device, one to decrement the unmet dependencies counter)
>> If you can run a callback for every matching entry, you don't really
>> need to have a callback to return the next matching entry.  You can do
>> stuff for all of them in one go
> 
> Well it my case it's more to return a pointer to the dep->consumer's
> acpi_device for a matching entry, so my idea was where there's multiple
> dependents you could use this as an iterator...but it could just be
> extended to that if needed later; I don't actually need to do it right now.
> 
> 
>> note that it probably is not a good
>> idea to run the callback under the lock, so the for loop currently in
>> there is not really suitable for that
> 
> No problem;  I'll tweak that then

Slightly walking back my "No problem" here; as I understand this there's
kinda two options:

1. Walk over the (locked) list, when a match is found unlock, run the
callback and re-lock.

The problem with that idea is unless I'm mistaken there's no guarantee
that the .next pointer is still valid then (even using the *_safe()
methods) because either the next or the next + 1 entry could have been
removed whilst the list was unlocked and the callback was being ran, so
this seems a little unsafe.

2. Walk over the (locked) list twice, the first time counting matching
entries and using that to allocate a temporary buffer, then walk again
to store the matching entries into the buffer. Finally, run the callback
for everything in the buffer, free it and return.

Obviously that's a lot less efficient than the current function, which
isn't particularly palatable.

Apologies if I've missed a better option that would work fine; but
failing that do you still want me to go ahead and change
acpi_walk_dep_device_list() to do this (I'd choose #2 of the above), or
fallback to using acpi_dev_get_next_dependent_dev() described above? If
the latter, does acpi_walk_dep_device_list() maybe need re-naming to
make clear it's not a generalised function?
