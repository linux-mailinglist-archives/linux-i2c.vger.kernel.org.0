Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6A1A28EDFE
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Oct 2020 09:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729970AbgJOH4k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Oct 2020 03:56:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42923 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729661AbgJOH4k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Oct 2020 03:56:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602748599;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lWNaA05E0bjvzVKlR1ucmfy5mckn2Mxdb3rkeOgj3v8=;
        b=Lk9E2kuBVkXq7bKEua7M8dcj9OeLYyUGdeaT8wIiGuNySxPAQb4SOSjOu6/CCh8+YPhI0q
        5+DbDiTWhDWJ+sFvdkkUt8ccECTP6Bm1XG9fVARsUe26aHWZUSN/rDr/hfLMznIEIJPJHg
        66XyWR1f4k2AzdLWHrRwxBMcw4uoM4Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-kHIkZlvkOI2kwdGTyv3x0Q-1; Thu, 15 Oct 2020 03:56:36 -0400
X-MC-Unique: kHIkZlvkOI2kwdGTyv3x0Q-1
Received: by mail-ed1-f72.google.com with SMTP id n16so963261edw.19
        for <linux-i2c@vger.kernel.org>; Thu, 15 Oct 2020 00:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lWNaA05E0bjvzVKlR1ucmfy5mckn2Mxdb3rkeOgj3v8=;
        b=UEZB2U/IlqVy9IhPQCUxwBGQCNRm79mrWzAnjTTM3mN8HjD1lWX+zc56iNsFBRMAPZ
         N+v54eT5AXr3wzz2J3f/x7ldsprLRnsn3kUkQZocfyKcO2NXa1q5TSRCJg7WoYFcS2NV
         10C9HQGLIVxC1B3DC0ygqa5wX2WrM6RTtkwJ8DUY170SfHF4yN53m/KQwXLlCpT7uyg5
         RCkEy6xlk9Rbj8Tf33l16rOVKt3XgfR2r2/f8PHjutizZSHuHrarRrqeJ078Zlq5rY6k
         nhnc0BDBYiahVc8a/ncp6pIxvNBOA1m8q5W9HDQZ9w15jxBRecJ2x21+w/4CgMM50vOZ
         DzyQ==
X-Gm-Message-State: AOAM53321hmheJJ5vGgJVmzTE54WBlTmirLmtmHly6zyoPyiFuQrrhg8
        4rRDrfqjZrN/Ve9TS9TYqzJD+o4SS12zd5MEEaJEzQDeExE0knX5Xt+MjFw43kAP9+5pG0KtN6b
        KdKWilBOnNtE/kj5J/znb
X-Received: by 2002:a50:9e82:: with SMTP id a2mr2961693edf.117.1602748595122;
        Thu, 15 Oct 2020 00:56:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+cnoFKUBKPIGRsIQ7nLuaEGa/UjX9mK3UvgE9IY9oCCVGY+H7KOIq8L9ukTMNjwiiRvCvWQ==
X-Received: by 2002:a50:9e82:: with SMTP id a2mr2961678edf.117.1602748594885;
        Thu, 15 Oct 2020 00:56:34 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id k26sm1007904ejq.13.2020.10.15.00.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2020 00:56:34 -0700 (PDT)
Subject: Re: [Bug 209627] Touchscreen doesn't work anymore since commit
 21653a4181ff292480599dad996a2b759ccf050f (regression)
To:     Rainer Finke <rainer@finke.cc>, linux-i2c@vger.kernel.org
Cc:     mika.westerberg@linux.intel.com, wsa@kernel.org, sashal@kernel.org
References: <ab71ef62-64c8-ff31-c5aa-43ad454d1143@finke.cc>
 <cb544a8b-98e8-2f43-4984-bc0422a05703@redhat.com>
 <4dd2d096-a3dd-c151-01ff-346fd776351d@redhat.com>
 <7ddaf5ab-bca9-e634-d829-8965fb3be0ba@finke.cc>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <89fe20de-2488-caed-8783-1337155a441f@redhat.com>
Date:   Thu, 15 Oct 2020 09:56:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <7ddaf5ab-bca9-e634-d829-8965fb3be0ba@finke.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 10/15/20 12:35 AM, Rainer Finke wrote:
> Hi,
> 
> On 14.10.20 17:13, Hans de Goede wrote:
>> Hi,
>>
>> On 10/13/20 5:45 PM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 10/12/20 9:52 PM, Rainer Finke wrote:
>>>> After upgrading from Linux 5.4.68 to Linux 5.4.69, the touchscreen of my Huawei Matebook 12 doesn't work anymore. The same issue happens with Linux >= 5.8.13.
>>>>
>>>> I've compiled Linux from git to verify if it was fixed, but it doesn't help. But when reverting the commit 21653a4181ff292480599dad996a2b759ccf050f the touchscreen works fine again.
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v5.8.13&id=953fc770d069b167266d9d9ccfef0455fcfdc070
>>>>
>>>> For reference my bug reports:
>>>>
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=209627
>>>>
>>>> https://bugs.archlinux.org/task/68178#comment193400
>>>>
>>>>
>>>> Hardware:
>>>>
>>>> - CPU Intel Core m3-6Y30
>>>>
>>>> - GPU Intel Graphics 515
>>>
>>> Thank you for your bug report and I'm sorry to hear about this problem.
>>>
>>> The commit in question fixes the touchpad not working on several
>>> recent Lenovo models. What it does it makes the method (opregion) to
>>> access the i2c bus from ACPI code available to the ACPI code before
>>> calling the status method of ACPI devices on that i2c-bus.
>>> This status method tells us if the device is actually present or not
>>> and on those Thinkpads the status method did an i2c check, so we
>>> needed to register the i2c opregion before checking for new devices.
>>>
>>> Registering the i2c opregion earlier seemed like an obvious
>>> solution, but I was already afraid we would hit an issue on some
>>> device because of this, because of ACPI being ACPI.
>>>
>>> It seems that the ACPI status method for your device probably
>>> also does something with the i2c bus when the i2c opregion
>>> is available, but for some reason that is not working...
>>>
>>> The next step in debugging this would be to take a look at
>>> the ACPI tables for your device, can you please run:
>>>
>>> sudo acpidump -o acpidump.Huawei-Matebook-12
>>>
>>> And then send out an email with the generated
>>> acpidump.Huawei-Matebook-12 file attached?
>>>
>>> Note please drop the list from the Cc when sending the
>>> email with the attachment.
>>>
>>> What would also be useful (for a possible workaround) would
>>> be the output of:
>>>
>>> grep . /sys/class/dmi/id/* 2> /dev/null
>>>
>>> Please run this as a normal user (*) and copy and paste
>>> the output into your next email.
>>
>> In the mean time another issue triggered by the same
>> commit has shown up on Microsoft Surface Go models.
>>
>> With te help fo the reporters of that issue I have found
>> on issue with that commit.
>>
>> Can you please try a kernel with the troublesome commit
>> *included* with the attached patch added on top and see
>> if that fixes things?
>>
>> Regards,
>>
>> Hans
> 
> 
> I've compiled linux-git with the provided patch and it worked :-)
> 
> 
> Thank you very much for the great support!

Great thank you for reporting the bug and for fixing the issue.

Regards,

Hans

