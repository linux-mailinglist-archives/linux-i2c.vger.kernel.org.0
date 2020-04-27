Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB6D11BACA1
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 20:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgD0S3P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 14:29:15 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29150 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726517AbgD0S3O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 14:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588012152;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hDBXSYkz2nA3787x0VfSARGIL3W7iaS/5KttVjKiCzU=;
        b=SeQmLk8QQKvoeeU+LFXX9KtQSittvMrsa7rO2twhCUoNjcZyjsoh3XUX5iXRpV1fYcq2GU
        mTcEr+OAjqBb97fb1P3awMgHMVa8NZ+/IokPnCfVpc2n8Hv8Ivf1/dwrUSx3txeGGELQCr
        /Dqh9t6LLkCTVKs0xoI1nOY8Cn5cSGI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-Bzk0s1ErPLm5DQbOU3R97Q-1; Mon, 27 Apr 2020 14:29:11 -0400
X-MC-Unique: Bzk0s1ErPLm5DQbOU3R97Q-1
Received: by mail-wm1-f70.google.com with SMTP id n127so227238wme.4
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 11:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hDBXSYkz2nA3787x0VfSARGIL3W7iaS/5KttVjKiCzU=;
        b=j9WPc/MYvznrlD1BAiINcMfupFds456+EeuH9Gq9cLgHWrQ2SOezyY+sHlwEBNx+W6
         ErHvkSyetCrRF1Xm9Nghplt4EykHJKprl53t9KxN2v0hAoaLBO3bh9MtrGMphcZxBHhr
         bHKAalz4EC1cM+j0NCS7qXhRZwVA1UOBWxzJ/5EAUBYn9JunelCp3evGBggVwWNSu7vN
         cy6GfCV72gbuYj7XXxdAoEXpww6T0nb0Wkl5uRfCD/lnf4aBWWQz1+GLSbxKwsKCl306
         xOa4fP21WXZkC9dpph8C3PGksmr6Sw9obfx9IRf8abUtm5aWZyNkDPqBM3xozXZOY4Q4
         Ns8w==
X-Gm-Message-State: AGi0PuaJY0ysOXHcG8Il08VDo6aN5PrLFkV5tb2938/7g1727OPuZAT/
        NCsZLE+82CB7b0w2adU++lJBKeo8ate8wNbeIae4uDD+4clwlum8u5ULLNbHcWCT9ihWpOvgS7l
        7O9wMSgvmEAID6v69XNnQ
X-Received: by 2002:adf:fdc1:: with SMTP id i1mr31585887wrs.158.1588012149615;
        Mon, 27 Apr 2020 11:29:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypLfZ53b97VqyDJHC6L4uIP1YPNyM6CYZAwDFhyj7SaSepVLHviULIc+kqsuGvA2aUB3fFRZiQ==
X-Received: by 2002:adf:fdc1:: with SMTP id i1mr31585855wrs.158.1588012149348;
        Mon, 27 Apr 2020 11:29:09 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id n9sm21927331wrx.61.2020.04.27.11.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 11:29:08 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] platform/x86: i2c-multi-instantiate: Add flag for
 passing fwnode
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
References: <20200426104713.216896-1-hdegoede@redhat.com>
 <20200426104713.216896-2-hdegoede@redhat.com>
 <CAHp75VdOd6C36oR7HAnqrKiinVBr4YcqqJ=dv3NpR3=Xp0QQ-Q@mail.gmail.com>
 <b5bdffb4-0af2-abb7-21f7-2f5da56d5dc6@redhat.com>
 <CAHp75VegakBqAzxn1e+MzF3EgB6fNya3L0eZHMh11yct6HHNKw@mail.gmail.com>
 <66619a61-c398-5a8a-4ee0-13dbe5d2c559@redhat.com>
 <CAHp75VcBf1OYQ=W+k1ygHnXkNbA+NuZoiSOQOq6g7SJNc2iFiA@mail.gmail.com>
 <c5425938-cf0d-3bc5-d8e8-e8c6e8da8d24@redhat.com>
Message-ID: <b00835fa-8b8f-c1f3-f418-a2c1f314d118@redhat.com>
Date:   Mon, 27 Apr 2020 20:29:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <c5425938-cf0d-3bc5-d8e8-e8c6e8da8d24@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 4/27/20 7:55 PM, Hans de Goede wrote:
> Hi,
> 
> On 4/27/20 7:33 PM, Andy Shevchenko wrote:
>> On Mon, Apr 27, 2020 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>> On 4/27/20 3:18 PM, Andy Shevchenko wrote:
>>>> On Mon, Apr 27, 2020 at 3:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>> On 4/26/20 7:59 PM, Andy Shevchenko wrote:
>>>>>> On Sun, Apr 26, 2020 at 1:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>>>>>>> In some cases the driver for the i2c_client-s which i2c-multi-instantiate
>>>>>>> instantiates may need access some fields / methods from to the ACPI fwnode
>>>>>>> for which i2c_clients are being instantiated.
>>>>>>>
>>>>>>> An example of this are CPLM3218 ACPI device-s. These contain CPM0 and
>>>>>>> CPM1 packages with various information (e.g. register init values) which
>>>>>>> the driver needs.
>>>>>>>
>>>>>>> Passing the fwnode through the i2c_board_info struct also gives the
>>>>>>> i2c-core access to it, and if we do not pass an IRQ then the i2c-core
>>>>>>> will use the fwnode to get an IRQ, see i2c_acpi_get_irq().
>>>>>>
>>>>>> I'm wondering, can we rather do it in the same way like we do for
>>>>>> GPIO/APIC case here.
>>>>>> Introduce IRQ_RESOURCE_SHARED (or so) and
>>>>>>
>>>>>> case _SHARED:
>>>>>>     irq = i2c_acpi_get_irq();
>>>>>> ...
>>>>>>
>>>>>> ?
>>>>>
>>>>> I think you are miss-understanding the problem. The problem is not that
>>>>> we want to share the IRQ, the problem is that we want to pass the single
>>>>> IRQ in the resources to only 1 of the instantiated I2C-clients. But if we
>>>>> do not pass an IRQ (we leave it at 0) and we do pass the fwnode then
>>>>> i2c-core-base.c will see that there is an ACPI-node attached to the
>>>>> device and will call i2c_acpi_get_irq().
>>>>
>>>> Do we know ahead which device should take IRQ resource and which should not?
>>>> Can we use current _NONE flag for them?
>>>
>>> The problem is not internal to i2c-multi-instantiate.c, the problem
>>> (once we pass a fwnode) is the API between i2c-multi-instantiate.c and
>>> the i2c-core. For the IRQ_RESOURCE_NONE case i2c-multi-instantiate.c
>>> sets board_info.irq to 0, which is the correct way to specify that
>>> we do not have an IRQ, but if don't pass an IRQ then the i2c-core
>>> will try to find one itself.  And once we pass the fwnode, then
>>> the "try to find one itself" code will call i2c_acpi_get_irq()
>>> and find the same IRQ for clients we instantiate, leading to
>>> the earlier mentioned IRQ conflict.
>>
>> I'm missing something here. Why we need to pass an fwnode in the first place?
>> Seems you would like to access to methods from the driver.
> 
> Right, the cm32181 code needs access to the CPM0 and CPM1 ACPI
> objects, which requires access to the fwnode.
> 
>> But if you simple enumerate the driver in ACPI multi-instantiate won't
>> be needed. >
>> As far as I understand, the actual driver consumes *both* I²C
>> resources. It's not a multi-instantiate in this case.
> 
> On systems where there are 2 resources, the driver only attaches
> to the second resouce. It does detect when it gets called for
> the first resource (it detects the ARA address) and then returns
> -ENODEV.
> 
> Another approach might be for the driver to call i2c_acpi_new_device
> itself when it detects the ARA address, but that is quite ugly, then
> we get:
> 
> -ACPI subsys instantiates i2c-client
>   -cm32181_probe
>    -cm32181_probe instantiates i2c-client for second resource
>     -cm32181 probe (for second resource)
>     -cm32181 probe returns 0
>    -cm32181 probe returns -ENODEV
> 
> So the end result is the same (2 clients instantiated, one
> bound to the cm32181 driver). But the nested probe calls to me
> look quite ugly and since this solution actually still does
> multi-instantiation using i2c-multi-inst seems like the more
> clean solution to me.

Ok so thinking more about this, you are right. The ACPI
resources describe a single chip here, so this really
should not use the i2c-multi-instantiate code.

Self-nack for this series.

I still think we may want to eventually pass the fwnode
through to the clients instantiated from the
i2c-multi-instantiate code, so my below proposal still stands:

> Note that we need to likely solve the fwnode passing problem
> sooner or later anyways. One of these days a driver for an
> i2c-client instantiated by the i2c-multi-inst code is going
> to need access to some methods or objects from the ACPI
> device.
> 
> Since you do not like the PASS_FWNODE flag, one solution
> would be this change:
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index a66912782064..365864e8bfd5 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -341,12 +341,12 @@ static int i2c_device_probe(struct device *dev)
>           if (irq == -EPROBE_DEFER)
>               return irq;
> 
> -        if (irq < 0)
> -            irq = 0;
> -
>           client->irq = irq;
>       }
> 
> +    if (client->irq < 0)
> +        client->irq = 0;
> +
>       /*
>        * An I2C ID table is not mandatory, if and only if, a suitable OF
>        * or ACPI ID table is supplied for the probing device.
> 
> 
> This allows us to set board_info.irq to -ENOENT in the i2c-multi-inst
> code, causing the core to skip trying to get the irq from the fwnode
> itself, while still making drivers see 0 as irq value (which they
> expect when there is no irq).
> 
> With this change i2c-multi-inst can pass the fwnode unconditionally.

Regards,

Hans

