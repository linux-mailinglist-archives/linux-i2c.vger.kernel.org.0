Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9AC136987F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Apr 2021 19:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbhDWRee (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Apr 2021 13:34:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47946 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231400AbhDWRed (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Apr 2021 13:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619199236;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u22w+RSynisaPd5cjgqVArOtH7V0gJivQPhfXsRScaw=;
        b=jGK8EU+/9lv8SKEj2kAmr/uNZFPcXkdndPC/O454juRYH5B7sRa7BrGcMGaz/AA1qcMMN8
        44J7f29wn9sYbekdghw8Re4I6cumV+b16+e7cHqtmuWaZydYhIvojso4dZvzQATd/vwVIa
        SeHHdjH6iBtXvIr52qVRH1v7tOsuPXM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-0yAEPXggN8SF7n1o5_84Vw-1; Fri, 23 Apr 2021 13:33:54 -0400
X-MC-Unique: 0yAEPXggN8SF7n1o5_84Vw-1
Received: by mail-ed1-f71.google.com with SMTP id i25-20020a50fc190000b0290384fe0dab00so13377207edr.6
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 10:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u22w+RSynisaPd5cjgqVArOtH7V0gJivQPhfXsRScaw=;
        b=QvYdK+WxT5lqRbD2ZOtWePtpXNU1EAsNNAGMOd/tVzkAji8Vg2D05NZ2PQt5hc+P3L
         IPrIIxgWrPO6M6hshh75ONhJ4Gxy9tIi3ztc7rcXyxkI+4hi2v1iaNugvmKecJwU8EWd
         W7CuCF8lOMYiaFr2TzMnsa7CkUMijinUzdf+1f2tfKWhqUXTOU0Y7rWduBw7uKe7Z+Zp
         n+mkSOwSZoZoHF6Cq+WRKmrKBWc8CGnePWgis+kADIJrx6XJaqa+SGqRk+1BhkW0EIcq
         CUdYLuTWjVXy+o7YDlcKoeOMJQkzlWuraj8MqYnM63FEC+DoBp1sZymAb850ZIlyWp/V
         hqag==
X-Gm-Message-State: AOAM5336GN/NKyIW+CxfrOdwMUg1X9Epj9wjrHmBL/YrF0SxYARZ3aaT
        0S8I4BWWn9hyi4sghrYCcWWE+8PXvOlBZlQAVFJwsedKTgS3TFW0cCHmPP7fdcfv5Cc3Zck1vWy
        VG9Q3XvM0VrtwjaUjLI+A
X-Received: by 2002:a17:906:eb4a:: with SMTP id mc10mr5462652ejb.392.1619199233720;
        Fri, 23 Apr 2021 10:33:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeiYnJN5V/hxrzJvjDvdcEqDPbWD0iFU40GKqTcCRu0jjmltVQfM6/bh5gUzMa0m8e5QhMbw==
X-Received: by 2002:a17:906:eb4a:: with SMTP id mc10mr5462646ejb.392.1619199233549;
        Fri, 23 Apr 2021 10:33:53 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ck29sm5316179edb.47.2021.04.23.10.33.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 10:33:53 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] i2c: cht-wc: Use fwnode for the controller and IRQ
 domain
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210223172231.2224-1-andriy.shevchenko@linux.intel.com>
 <fea7ce9a-01a9-cab8-8675-be5c44cb8a27@redhat.com>
 <YDZLuzNivBP4HcPd@smile.fi.intel.com>
 <7e5f8d81-0ee5-b8ad-ed72-06d4677cd8f7@redhat.com>
 <CAHp75VeNZ9REU5nCDJ-Rt4Wmsnsz+hcN-P_oopzN8LpVTkU74g@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0f395776-b14e-4fde-403e-633580b1d7f1@redhat.com>
Date:   Fri, 23 Apr 2021 19:33:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VeNZ9REU5nCDJ-Rt4Wmsnsz+hcN-P_oopzN8LpVTkU74g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 2/25/21 4:44 PM, Andy Shevchenko wrote:
> On Thu, Feb 25, 2021 at 5:11 AM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 2/24/21 1:51 PM, Andy Shevchenko wrote:
>>> On Tue, Feb 23, 2021 at 08:25:35PM +0100, Hans de Goede wrote:
>>>> On 2/23/21 6:22 PM, Andy Shevchenko wrote:
>>>>> It's better to describe the I²C controller and associated IRQ domain with
>>>>> fwnode, so they will find their place in the hierarchy in sysfs and also
>>>>> make easier to debug.
> 
> ...
> 
>>>>> +   set_primary_fwnode(&adap->adapter.dev, fwnode);
>>>>
>>>> So now we have the main PMIC device i2c-client, the platform-device instantiated
>>>> for the MFD-cell for the PMIC's builtin I2C-controller; and the device instantiated
>>>> for the adapter-device all 3 share the same ACPI-companion fwnode.
>>>
>>> Okay, this step in this patch maybe not needed (or should be a separate change,
>>> but I don't see clearly what would be the benefit out of it).
> 
> Shall I leave this or should be removed in v2?
> 
> ...
> 
>>>>> -   adap->irq_domain = irq_domain_add_linear(pdev->dev.of_node, 1,
>>>>> -                                            &irq_domain_simple_ops, NULL);
>>>>> +   adap->irq_domain = irq_domain_create_linear(fwnode, 1,
>>>>> +                                               &irq_domain_simple_ops, NULL);
>>>>
>>>> Hmm, not sure this is right, admittedly the old code looks weird too, but now we
>>>> are creating a second irq_domain at the same level as the irq_domain created for
>>>> the IRQ-chip part of the PMIC. But this is really more of a child-domain of just
>>>> the I2C-controller MFD-cell. The IRQ-CHIP part of the PMIC has a single IRQ for the
>>>> I2C controller which gets raised both on i2c-transfer completions and when the
>>>> pin on the PMIC which is reserved as input for the IRQ coming out of the charger-chip
>>>> gets triggered.
>>>>
>>>> IOW we have this:
>>>>
>>>>
>>>>                PMIC
>>>>                  |
>>>>     ------------------------------
>>>>     |       |        |           |
>>>>    IRQ1   IRQ2      IRQ3       I2C-IRQ
>>>>                                  |
>>>>                    ----------------------------------
>>>>                    |        |         |             |
>>>>                  READIRQ   WRIRQ    NACKIRQ     CLIENT-IRQ
>>>>
>>>> Where READIRQ, WRIRQ and NACKIRQ are directly consumed
>>>> and the CLIENT-IRQ is being represented as a single IRQ on
>>>> a new irqchip so that we can pass it along to the i2c-driver
>>>> for the charger-chip which is connected to the Whiskey Cove's
>>>> builtin I2C controller.
>>>>
>>>> But doing as you suggest would model the IRQs as:
>>>>
>>>>                PMIC
>>>>                  |
>>>>     --------------------------------------------------
>>>>     |       |        |           |                    |
>>>>    IRQ1   IRQ2      IRQ3       I2C-IRQ           CLIENT-IRQ
>>>>
>>>> Which is not the same really. I guess it is better then what we
>>>> have though ?
>>>
>>> Hmm... There should not be difference in the hierarchy. add_linear ==
>>> create_linear. The propagation of *device* (not an IRQ) fwnode is just
>>> convenient way to have IRQ domain be named (instead of 'unknown-N' or so).
>>> Maybe I have read __irq_domain_add() code wrongly.
>>
>> Sorry, this is probably my bad. The first ASCII-art which I posted is
>> how things actually work in HW. The second one is how I assumed that
>> things would look like in some nested representation of the IRQ-domains
>> given that all the IRQs mentioned in the ASCII-art now use the same fwnode
>> as parent for their domain. But poking around in sysfs I don't see any
>> hierarchical representation of the domains at all. Actually I cannot
>> find any representation of the IRQ domains inside sysfs (I've never
>> looked at / into this before) ?
> 
> I have enabled  GENERIC_IRQ_DEBUGFS to see some information.
> 
>> If what you say is right and the fwnode is only used to set a name (where can
>> I see those names ?) then your patch is probably correct.
> 
> I have checked again and I don't see anything except it uses it as a
> domain name and takes reference count.
> 
>>> Nevertheless, thinking more about it, why we don't add an IRQ chip via regmap
>>> IRQ API?
>>
>> There already is a regmap IRQ chip associated with the MFD device and the
>> IRQ handling required here is somewhat tricky (see the comments in the driver)
>> so I would prefer to keep this as is.
> 
> Ah, that makes things complicated a bit.
> 
>>>> Note I can test any changes made here, but I'm not 100% convinced that
>>>> the current version of this patch is correct.
>>>
>>> If we settle on the idea first. I'm (slowly) looking forward to check another
>>> CherryTrail device we have at the lab, but we lack of some (power) equipment
>>> right now to setup it properly. I hope it may have the Whiskey Cove PMIC there.
>>
>> More testing is always welcome :)   With that said, testing these changes really
>> is not a lot of work for me.
> 
> I would expect that we will have a clash with IRQ domain names and
> thus we would need our own fwnode here.
> 
> I will think about it, but it sounds like we need to create a
> hierarchy of the IRQ domains and take the device's fwnode as a parent
> here.
> 
> Overall, I stumbled over of_node use in pure ACPI case (simplest "fix"
> is to provide a NULL pointer there). If you think we can get rid of
> of_node as intermediate step, I will send v2 with that.

Sorry for being slow to respond.

I agree that the of_node use is weird, so a patch which simply replaces the
pdev->dev.of_node with NULL would be good. Otherwise I would just leave the
code as is.

Regards,

Hans

