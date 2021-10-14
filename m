Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B206E42DEBE
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Oct 2021 17:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233054AbhJNP5l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Oct 2021 11:57:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46119 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231764AbhJNP5k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Oct 2021 11:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634226934;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JWnmViuZzS5vCJpHwulEVTRMqyjB1ka4+dw1VkAiD4g=;
        b=ba42NLyfzebB0jQTUcd1Sdh3WTOfH5tu03hTK4jz/PovJC5oMvDdT0YAmw0lfQJTBFLNse
        RzJMIS4Pp/pb4CVWFYd1q1/aYj3EleaJt1M0t8yiHEix5F3Z5+vXrIEBSMTo9kEA7TVmhJ
        ouA7o4XXeiyhVkB3DugFx2eSxOHh20A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-_2l-s_SANs22dLXFU5i4pw-1; Thu, 14 Oct 2021 11:55:33 -0400
X-MC-Unique: _2l-s_SANs22dLXFU5i4pw-1
Received: by mail-ed1-f72.google.com with SMTP id l22-20020aa7c316000000b003dbbced0731so5590963edq.6
        for <linux-i2c@vger.kernel.org>; Thu, 14 Oct 2021 08:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JWnmViuZzS5vCJpHwulEVTRMqyjB1ka4+dw1VkAiD4g=;
        b=gV9+7akbDh2bVI/sBsaetdiebg4iEmIGbkRv4vBR+E1OuHp9zo+ioiHMcyqy6r591V
         IHUqneQfUTW+V1FCcYm5pjLXtLSe/lsCzBRMhmCC33uknhbzp1zog99lEeXMpRCtwTES
         zAvc9mPILs7JQdtdhIpIiUWK65COA/gee8wsWHAO3h7DE2Uk+2zPTwRbcRmbDHbJGuna
         8LlBFwXC9zAoiEpY51c8FKsLGQDRRIyeqSx0lEXSOFzOSxznAUpghrhh3w0RjGqjf34a
         NvioZXXNMTkt7I9axlY5sMF7zzzYHsj6ouAlbb/DTx5LdjsJBrMk6hkZX0PxZLqKK4gy
         gF2w==
X-Gm-Message-State: AOAM530ZHZzSP1GmaXwkgMdH/b+GCiPtu1kTRkrFfd8aP2lVIdiypaSN
        WXw/eAnh/NzTeE1JHCGX1+aDFzIb3BuhvqsI3tTdev3+SdcP0U8pGSeluhBPUCbQhk7AYxzDBVT
        SFXLkWx0PIbkynEmrDxSF
X-Received: by 2002:a50:ccc4:: with SMTP id b4mr9996615edj.83.1634226931933;
        Thu, 14 Oct 2021 08:55:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7Wah1Y7cQHvDtlggE1t5rDd38gt88Yx5v6/TAUaNgjI2VtkWMOwkydRXvi/iQjcjEunuzVg==
X-Received: by 2002:a50:ccc4:: with SMTP id b4mr9996587edj.83.1634226931676;
        Thu, 14 Oct 2021 08:55:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b2sm2587687edv.73.2021.10.14.08.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 08:55:31 -0700 (PDT)
Subject: Re: [PATCH v3 01/11] ACPI: delay enumeration of devices with a _DEP
 pointing to an INT3472 device
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20211010185707.195883-1-hdegoede@redhat.com>
 <20211010185707.195883-2-hdegoede@redhat.com>
 <CAJZ5v0i0NR8faABuZVe7V6sKgM4+1kOh-S56usj2WyeiDnfy9g@mail.gmail.com>
 <0c90d1dd-8e03-714a-1dbf-51b09241a23c@redhat.com>
 <CAJZ5v0gN-o6O8daABdtD7ShnUkEgvknAa-VyzS7DG6jX2h8=uA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <24f113e8-3af1-7c85-b8b8-584f5663a909@redhat.com>
Date:   Thu, 14 Oct 2021 17:55:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gN-o6O8daABdtD7ShnUkEgvknAa-VyzS7DG6jX2h8=uA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 10/13/21 8:48 PM, Rafael J. Wysocki wrote:
> On Wed, Oct 13, 2021 at 8:23 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 10/13/21 7:29 PM, Rafael J. Wysocki wrote:
>>> On Sun, Oct 10, 2021 at 8:57 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> The clk and regulator frameworks expect clk/regulator consumer-devices
>>>> to have info about the consumed clks/regulators described in the device's
>>>> fw_node.
>>>>
>>>> To work around cases where this info is not present in the firmware tables,
>>>> which is often the case on x86/ACPI devices, both frameworks allow the
>>>> provider-driver to attach info about consumers to the clks/regulators
>>>> when registering these.
>>>>
>>>> This causes problems with the probe ordering wrt drivers for consumers
>>>> of these clks/regulators. Since the lookups are only registered when the
>>>> provider-driver binds, trying to get these clks/regulators before then
>>>> results in a -ENOENT error for clks and a dummy regulator for regulators.
>>>>
>>>> One case where we hit this issue is camera sensors such as e.g. the OV8865
>>>> sensor found on the Microsoft Surface Go. The sensor uses clks, regulators
>>>> and GPIOs provided by a TPS68470 PMIC which is described in an INT3472
>>>> ACPI device. There is special platform code handling this and setting
>>>> platform_data with the necessary consumer info on the MFD cells
>>>> instantiated for the PMIC under: drivers/platform/x86/intel/int3472.
>>>>
>>>> For this to work properly the ov8865 driver must not bind to the I2C-client
>>>> for the OV8865 sensor until after the TPS68470 PMIC gpio, regulator and
>>>> clk MFD cells have all been fully setup.
>>>>
>>>> The OV8865 on the Microsoft Surface Go is just one example, all X86
>>>> devices using the Intel IPU3 camera block found on recent Intel SoCs
>>>> have similar issues where there is an INT3472 HID ACPI-device, which
>>>> describes the clks and regulators, and the driver for this INT3472 device
>>>> must be fully initialized before the sensor driver (any sensor driver)
>>>> binds for things to work properly.
>>>>
>>>> On these devices the ACPI nodes describing the sensors all have a _DEP
>>>> dependency on the matching INT3472 ACPI device (there is one per sensor).
>>>>
>>>> This allows solving the probe-ordering problem by delaying the enumeration
>>>> (instantiation of the I2C-client in the ov8865 example) of ACPI-devices
>>>> which have a _DEP dependency on an INT3472 device.
>>>>
>>>> The new acpi_dev_ready_for_enumeration() helper used for this is also
>>>> exported because for devices, which have the enumeration_by_parent flag
>>>> set, the parent-driver will do its own scan of child ACPI devices and
>>>> it will try to enumerate those during its probe(). Code doing this such
>>>> as e.g. the i2c-core-acpi.c code must call this new helper to ensure
>>>> that it too delays the enumeration until all the _DEP dependencies are
>>>> met on devices which have the new honor_deps flag set.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  drivers/acpi/scan.c     | 36 ++++++++++++++++++++++++++++++++++--
>>>>  include/acpi/acpi_bus.h |  5 ++++-
>>>>  2 files changed, 38 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
>>>> index 5b54c80b9d32..efee6ee91c8f 100644
>>>> --- a/drivers/acpi/scan.c
>>>> +++ b/drivers/acpi/scan.c
>>>> @@ -796,6 +796,12 @@ static const char * const acpi_ignore_dep_ids[] = {
>>>>         NULL
>>>>  };
>>>>
>>>> +/* List of HIDs for which we honor deps of matching ACPI devs, when checking _DEP lists. */
>>>> +static const char * const acpi_honor_dep_ids[] = {
>>>> +       "INT3472", /* Camera sensor PMIC / clk and regulator info */
>>>> +       NULL
>>>> +};
>>>> +
>>>>  static struct acpi_device *acpi_bus_get_parent(acpi_handle handle)
>>>>  {
>>>>         struct acpi_device *device = NULL;
>>>> @@ -1757,8 +1763,12 @@ static void acpi_scan_dep_init(struct acpi_device *adev)
>>>>         struct acpi_dep_data *dep;
>>>>
>>>>         list_for_each_entry(dep, &acpi_dep_list, node) {
>>>> -               if (dep->consumer == adev->handle)
>>>> +               if (dep->consumer == adev->handle) {
>>>> +                       if (dep->honor_dep)
>>>> +                               adev->flags.honor_deps = 1;
>>>
>>> Any concerns about doing
>>>
>>> adev->flags.honor_deps = dep->honor_dep;
>>>
>>> here?
>>
>> The idea is to set adev->flags.honor_deps even if the device has
>> multiple deps and only one of them has the honor_dep flag set.
>>
>> If we just do:
>>
>>         adev->flags.honor_deps = dep->honor_dep;
>>
>> Then adev->flags.honor_deps ends up having the honor_dep
>> flag of the last dependency checked.
> 
> OK, but in that case dep_unmet may be blocking the enumeration of the
> device even if the one in the acpi_honor_dep_ids[] list has probed
> successfully.
> 
> Isn't that a concern?

For the devices where we set the dep->honor_dep flag this is
not a concern (based on the DSDTs which I've seen).

I also don't expect it to be a concern for other cases where we may
set that flag in the future either. This is an opt-in thing, so
I expect that in cases where we opt in to this, we also ensure that
any other _DEPs are also met (by having a Linux driver which calls
acpi_dev_clear_dependencies() for them).

And now a days we also have the acpi_ignore_dep_ids[] list so if
in the future there are some _DEP-s which never get fulfilled/met
on a device where we set the adev->flags.honor_deps flag, then we
can always add the ACPI HIDs for those devices to that list.

>>>> +
>>>>                         adev->dep_unmet++;
>>>> +               }
>>>>         }
>>>>  }
>>>>
>>>> @@ -1962,7 +1972,7 @@ static u32 acpi_scan_check_dep(acpi_handle handle, bool check_dep)
>>>>         for (count = 0, i = 0; i < dep_devices.count; i++) {
>>>>                 struct acpi_device_info *info;
>>>>                 struct acpi_dep_data *dep;
>>>> -               bool skip;
>>>> +               bool skip, honor_dep;
>>>>
>>>>                 status = acpi_get_object_info(dep_devices.handles[i], &info);
>>>>                 if (ACPI_FAILURE(status)) {
>>>> @@ -1971,6 +1981,7 @@ static u32 acpi_scan_check_dep(acpi_handle handle, bool check_dep)
>>>>                 }
>>>>
>>>>                 skip = acpi_info_matches_ids(info, acpi_ignore_dep_ids);
>>>> +              honor_dep = acpi_info_matches_ids(info, acpi_honor_dep_ids);
>>>>                 kfree(info);
>>>>
>>>>                 if (skip)
>>>> @@ -1984,6 +1995,7 @@ static u32 acpi_scan_check_dep(acpi_handle handle, bool check_dep)
>>>>
>>>>                 dep->supplier = dep_devices.handles[i];
>>>>                 dep->consumer = handle;
>>>> +               dep->honor_dep = honor_dep;
>>>>
>>>>                 mutex_lock(&acpi_dep_list_lock);
>>>>                 list_add_tail(&dep->node , &acpi_dep_list);
>>>> @@ -2071,6 +2083,9 @@ static acpi_status acpi_bus_check_add_2(acpi_handle handle, u32 lvl_not_used,
>>>>
>>>>  static void acpi_default_enumeration(struct acpi_device *device)
>>>>  {
>>>> +       if (!acpi_dev_ready_for_enumeration(device))
>>>> +               return;
>>>
>>> I'm not sure about this.
>>>
>>> First of all, this adds an acpi_device_is_present() check here which
>>> potentially is a change in behavior and I'm not sure how it is related
>>> to the other changes in this patch (it is not mentioned in the
>>> changelog AFAICS).
>>>
>>> I'm saying "potentially", because if we get here at all,
>>> acpi_device_is_present() has been evaluated already by
>>> acpi_bus_attach().
>>
>> Right the idea was that for this code-path the extra
>> acpi_device_is_present() check is a no-op since the only
>> caller of acpi_default_enumeration() has already done
>> that check before calling acpi_default_enumeration(),
>> where as the is_present check is useful for users outside
>> of the ACPI core code, like e.g. the i2c ACPI enumeration
>> code.
>>
>> Although I see this is also called from
>> acpi_generic_device_attach which comes into play when there
>> is devicetree info embedded inside the ACPI tables.
> 
> That too, but generally speaking this change should at least be
> mentioned in the changelog.
> 
>>> Now, IIUC, the new acpi_dev_ready_for_enumeration() is kind of an
>>> extension of acpi_device_is_present(), so shouldn't it be called by
>>> acpi_bus_attach() instead of the latter rather than from here?
>>
>> That is an interesting proposal. I assume you want this to replace
>> the current acpi_device_is_present() call in acpi_bus_attach()
>> then ?
> 
> That seems consistent to me.
> 
>> For the use-case at hand here that should work fine and it would also
>> make the honor_deps flag work for devices which bind to the actual
>> acpi_device (because we delay the device_attach()) or
>> use an acpi_scan_handler.
>>
>> This would mean though that we can now have acpi_device-s where
>> acpi_device_is_present() returns true, but which are not
>> initialized (do not have device->flags.initialized set)
>> that would be a new acpi_device state which we have not had
>> before. I do not immediately forsee this causing issues,
>> but still...
>>
>> If you want me to replace the current acpi_device_is_present() call
>> in acpi_bus_attach() with the new acpi_dev_ready_for_enumeration()
>> helper, let me know and I'll prepare a new version with this change
>> (and run some tests with that new version).
> 
> I would prefer doing that to making acpi_default_enumeration() special
> with respect to the handling of dependencies.

Ok I will make this change in the next version (ETA sometime next week).

Regards,

Hans

