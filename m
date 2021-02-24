Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64E7324476
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Feb 2021 20:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234468AbhBXTPN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Feb 2021 14:15:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43810 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236146AbhBXTOE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Feb 2021 14:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614193956;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R1nPZdLLEujUDoG3y2UCPe4/5w/0ZZBej+r55eTDHpI=;
        b=Zgj6nz6DLbLM83GNetM7RSMBJM5RIUfFDyxmO5DEd4I7mmiKs0zOARkRhXL8oL7eaW5VGG
        iUcNuUrDKRwde80n/KT7IfPtGQ2XKTF20zGJHZcxAYPSKUPN9/NIjhnIIhrZ0L/ywOZn49
        vZizv2bzlVIoDVUqyj/3pLAu4rLkkCw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-awzbp7HjPGeNlnSi5oOmfA-1; Wed, 24 Feb 2021 14:12:34 -0500
X-MC-Unique: awzbp7HjPGeNlnSi5oOmfA-1
Received: by mail-ed1-f69.google.com with SMTP id t9so1427484edd.3
        for <linux-i2c@vger.kernel.org>; Wed, 24 Feb 2021 11:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R1nPZdLLEujUDoG3y2UCPe4/5w/0ZZBej+r55eTDHpI=;
        b=THiDAf3So+qGUoJkAHiWoiK5+QchClP0Yi8ft1mwjerJIOyLq17CIqLgONStcdoBum
         WK95ODAQwtCkwWCS7rJMLHZgeRJHsowMY0nunPSQ16fjZ7KM8MjSUqq65shZMG460MJ4
         8oeiT+EmcGZptP7VaOkHPHdsyE9UzRQcBKM/CEpl589C1uGIgkvKs2At7tDce7wFmnnF
         mmyu1F3cxgDJhqbTFNDPEE7+axg0Pf0GiSgvJx7JmTB03CQbslmSscj77s5AiQ9oZ/tP
         qoEbDNbFtIvVK9mzfWkV+y+cDt1D+Tfz2jr70KNhBBAz9HVcDEs5Gk6hOs8xW/mdEe9e
         eB+g==
X-Gm-Message-State: AOAM530nfsjDyEwWylZgy236D2r0LNAPO+5pvOXdC8kVAeLYWiFTXGNP
        WyqQ8rgPpWEkU9/r1ibQyzmDPDXk1mGre/F7jQb29HqtkVJJI1B1n4uEj59DAKDXrmmgJfbHr1e
        Y8KqrumBZvks49hycd0b3
X-Received: by 2002:a17:907:d86:: with SMTP id go6mr31329724ejc.337.1614193953163;
        Wed, 24 Feb 2021 11:12:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4SdbV/WPoy9YHkKBQTsJjahnYzDnHy531S+6gpK15yqgaq/hV6zbmyh3pNUTPOADdv2mN3Q==
X-Received: by 2002:a17:907:d86:: with SMTP id go6mr31329711ejc.337.1614193952968;
        Wed, 24 Feb 2021 11:12:32 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id lu26sm227422ejb.33.2021.02.24.11.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 11:12:32 -0800 (PST)
Subject: Re: [PATCH v1 1/1] i2c: cht-wc: Use fwnode for the controller and IRQ
 domain
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210223172231.2224-1-andriy.shevchenko@linux.intel.com>
 <fea7ce9a-01a9-cab8-8675-be5c44cb8a27@redhat.com>
 <YDZLuzNivBP4HcPd@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7e5f8d81-0ee5-b8ad-ed72-06d4677cd8f7@redhat.com>
Date:   Wed, 24 Feb 2021 20:12:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDZLuzNivBP4HcPd@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 2/24/21 1:51 PM, Andy Shevchenko wrote:
> On Tue, Feb 23, 2021 at 08:25:35PM +0100, Hans de Goede wrote:
>> On 2/23/21 6:22 PM, Andy Shevchenko wrote:
>>> It's better to describe the I²C controller and associated IRQ domain with
>>> fwnode, so they will find their place in the hierarchy in sysfs and also
>>> make easier to debug.
>>>
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> ---
>>>
>>> Hans, unfortunately I have no device at hand with INT34D3. This is only compile
>>> tested in that sense. Also I would like to hear if you like the idea in general.
>>>
>>>  drivers/i2c/busses/i2c-cht-wc.c | 6 ++++--
>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-cht-wc.c b/drivers/i2c/busses/i2c-cht-wc.c
>>> index f80d79e973cd..dbf55842b0dc 100644
>>> --- a/drivers/i2c/busses/i2c-cht-wc.c
>>> +++ b/drivers/i2c/busses/i2c-cht-wc.c
>>> @@ -303,6 +303,7 @@ static struct bq24190_platform_data bq24190_pdata = {
>>>  static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
>>>  {
>>>  	struct intel_soc_pmic *pmic = dev_get_drvdata(pdev->dev.parent);
>>> +	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
>>
>> So this will point to the ACPi-companion fwnode of the CHT Whiskey Cove PMIC
>> controller.
> 
> Right.
> 
>>>  	struct cht_wc_i2c_adap *adap;
>>>  	struct i2c_board_info board_info = {
>>>  		.type = "bq24190",
>>> @@ -333,6 +334,7 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
>>>  	strlcpy(adap->adapter.name, "PMIC I2C Adapter",
>>>  		sizeof(adap->adapter.name));
>>>  	adap->adapter.dev.parent = &pdev->dev;
>>> +	set_primary_fwnode(&adap->adapter.dev, fwnode);
>>
>> So now we have the main PMIC device i2c-client, the platform-device instantiated
>> for the MFD-cell for the PMIC's builtin I2C-controller; and the device instantiated
>> for the adapter-device all 3 share the same ACPI-companion fwnode.
> 
> Okay, this step in this patch maybe not needed (or should be a separate change,
> but I don't see clearly what would be the benefit out of it).
> 
>>>  	/* Clear and activate i2c-adapter interrupts, disable client IRQ */
>>>  	adap->old_irq_mask = adap->irq_mask = ~CHT_WC_EXTCHGRIRQ_ADAP_IRQMASK;
>>> @@ -350,8 +352,8 @@ static int cht_wc_i2c_adap_i2c_probe(struct platform_device *pdev)
>>>  		return ret;
>>>  
>>>  	/* Alloc and register client IRQ */
>>> -	adap->irq_domain = irq_domain_add_linear(pdev->dev.of_node, 1,
>>> -						 &irq_domain_simple_ops, NULL);
>>> +	adap->irq_domain = irq_domain_create_linear(fwnode, 1,
>>> +						    &irq_domain_simple_ops, NULL);
>>
>> Hmm, not sure this is right, admittedly the old code looks weird too, but now we
>> are creating a second irq_domain at the same level as the irq_domain created for
>> the IRQ-chip part of the PMIC. But this is really more of a child-domain of just
>> the I2C-controller MFD-cell. The IRQ-CHIP part of the PMIC has a single IRQ for the
>> I2C controller which gets raised both on i2c-transfer completions and when the
>> pin on the PMIC which is reserved as input for the IRQ coming out of the charger-chip
>> gets triggered.
>>
>> IOW we have this:
>>
>>
>>                PMIC
>>                  |
>>     ------------------------------
>>     |       |        |           |
>>    IRQ1   IRQ2      IRQ3       I2C-IRQ
>>                                  |
>>                    ----------------------------------
>>                    |        |         |             |
>>                  READIRQ   WRIRQ    NACKIRQ     CLIENT-IRQ
>>
>> Where READIRQ, WRIRQ and NACKIRQ are directly consumed
>> and the CLIENT-IRQ is being represented as a single IRQ on
>> a new irqchip so that we can pass it along to the i2c-driver
>> for the charger-chip which is connected to the Whiskey Cove's
>> builtin I2C controller.
>>
>> But doing as you suggest would model the IRQs as:
>>
>>                PMIC
>>                  |
>>     --------------------------------------------------
>>     |       |        |           |                    |
>>    IRQ1   IRQ2      IRQ3       I2C-IRQ           CLIENT-IRQ
>>
>> Which is not the same really. I guess it is better then what we
>> have though ?
> 
> Hmm... There should not be difference in the hierarchy. add_linear ==
> create_linear. The propagation of *device* (not an IRQ) fwnode is just
> convenient way to have IRQ domain be named (instead of 'unknown-N' or so).
> Maybe I have read __irq_domain_add() code wrongly.

Sorry, this is probably my bad. The first ASCII-art which I posted is
how things actually work in HW. The second one is how I assumed that
things would look like in some nested representation of the IRQ-domains
given that all the IRQs mentioned in the ASCII-art now use the same fwnode
as parent for their domain. But poking around in sysfs I don't see any
hierarchical representation of the domains at all. Actually I cannot
find any representation of the IRQ domains inside sysfs (I've never
looked at / into this before) ?

If what you say is right and the fwnode is only used to set a name (where can
I see those names ?) then your patch is probably correct.

> Nevertheless, thinking more about it, why we don't add an IRQ chip via regmap
> IRQ API?

There already is a regmap IRQ chip associated with the MFD device and the
IRQ handling required here is somewhat tricky (see the comments in the driver)
so I would prefer to keep this as is.

>> Note I can test any changes made here, but I'm not 100% convinced that
>> the current version of this patch is correct.
> 
> If we settle on the idea first. I'm (slowly) looking forward to check another
> CherryTrail device we have at the lab, but we lack of some (power) equipment
> right now to setup it properly. I hope it may have the Whiskey Cove PMIC there.

More testing is always welcome :)   With that said, testing these changes really
is not a lot of work for me.

Regards,

Hans

