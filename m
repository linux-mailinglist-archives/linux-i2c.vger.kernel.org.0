Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEF71BABBE
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 19:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgD0Rzd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 13:55:33 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44993 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726226AbgD0Rzd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 13:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588010131;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=etwvjvChJYw2xD2Q59uDFZcN9+Aabm9ep74Qu3G2FyU=;
        b=MmKCFwdrwhpnMuJQPI9XheTtU64jMw8DJbYr02fAIcBn2JUQUjLn1YN4nQ5DBfVQBdinah
        Rk4A6pbEnFu9hOUOUK8IcOVR5nEiqKuEV+AkkSVAtdX3YKmnSyx+HWry/laBWLQ5/WoCds
        Ic4vVUuFUDYR+EnACVCL+ep0P7Kt3MQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-y4J8H6NfPuCdGgSlFHHCgw-1; Mon, 27 Apr 2020 13:55:30 -0400
X-MC-Unique: y4J8H6NfPuCdGgSlFHHCgw-1
Received: by mail-wm1-f69.google.com with SMTP id t62so202877wma.0
        for <linux-i2c@vger.kernel.org>; Mon, 27 Apr 2020 10:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=etwvjvChJYw2xD2Q59uDFZcN9+Aabm9ep74Qu3G2FyU=;
        b=ISojYxhCXVk2idYCbYlaVwZe6wcSn/dr4V1V/cVMpLmPTIRTEecwHevJR4ViszRX9p
         FpTzevOS2Y3SvSNRDOwngFmZsXdHciXt0JQkx3wrgxjeJ6iv+7rd1wBRSx7L9ItsyjNR
         fADmiIFJCqDdwXHwHYgrqHIWz2LEFp2SN2dw3XLK0t9Wy09eNqLC7Dkqn/n/5Q1UJ7gU
         CPKMMWcRDH+QpKMe6yU/Z8oKwYkL4b53noQLeb5S8S8qxPx5s1uGevZGaazAfzKrJqfb
         luKX72vHpWfJPv3DvlXmqFnVoIAF9teqoNaGBoZg+cr12PWQwSwj8fGQTOcVAaCTO+YP
         lNvQ==
X-Gm-Message-State: AGi0PuZ5tOCrGBHIe6HNTF3BRPETqAioRdca1i2oVjxH17jOv0+hXXxg
        cMUuZ+4hn1Po0owmUGRbN8ZfMNZHQrWx8zJbbmfDaULr9PYZNcERdvv98m3s9Y/5HF/GMEYFrnf
        DfNbqnVfVNBvAwkzWnGQb
X-Received: by 2002:a05:600c:2:: with SMTP id g2mr687291wmc.85.1588010128566;
        Mon, 27 Apr 2020 10:55:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypI0OH8BXfOTJ2wc6HvDgQlRE9KFIPKjY7PC2sok3Pju9+X4KF44Ou9hGNexFtkytPBuJbtyxQ==
X-Received: by 2002:a05:600c:2:: with SMTP id g2mr687258wmc.85.1588010128265;
        Mon, 27 Apr 2020 10:55:28 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id u188sm16303627wmg.37.2020.04.27.10.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 10:55:27 -0700 (PDT)
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c5425938-cf0d-3bc5-d8e8-e8c6e8da8d24@redhat.com>
Date:   Mon, 27 Apr 2020 19:55:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcBf1OYQ=W+k1ygHnXkNbA+NuZoiSOQOq6g7SJNc2iFiA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 4/27/20 7:33 PM, Andy Shevchenko wrote:
> On Mon, Apr 27, 2020 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 4/27/20 3:18 PM, Andy Shevchenko wrote:
>>> On Mon, Apr 27, 2020 at 3:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>> On 4/26/20 7:59 PM, Andy Shevchenko wrote:
>>>>> On Sun, Apr 26, 2020 at 1:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>>>>>> In some cases the driver for the i2c_client-s which i2c-multi-instantiate
>>>>>> instantiates may need access some fields / methods from to the ACPI fwnode
>>>>>> for which i2c_clients are being instantiated.
>>>>>>
>>>>>> An example of this are CPLM3218 ACPI device-s. These contain CPM0 and
>>>>>> CPM1 packages with various information (e.g. register init values) which
>>>>>> the driver needs.
>>>>>>
>>>>>> Passing the fwnode through the i2c_board_info struct also gives the
>>>>>> i2c-core access to it, and if we do not pass an IRQ then the i2c-core
>>>>>> will use the fwnode to get an IRQ, see i2c_acpi_get_irq().
>>>>>
>>>>> I'm wondering, can we rather do it in the same way like we do for
>>>>> GPIO/APIC case here.
>>>>> Introduce IRQ_RESOURCE_SHARED (or so) and
>>>>>
>>>>> case _SHARED:
>>>>>     irq = i2c_acpi_get_irq();
>>>>> ...
>>>>>
>>>>> ?
>>>>
>>>> I think you are miss-understanding the problem. The problem is not that
>>>> we want to share the IRQ, the problem is that we want to pass the single
>>>> IRQ in the resources to only 1 of the instantiated I2C-clients. But if we
>>>> do not pass an IRQ (we leave it at 0) and we do pass the fwnode then
>>>> i2c-core-base.c will see that there is an ACPI-node attached to the
>>>> device and will call i2c_acpi_get_irq().
>>>
>>> Do we know ahead which device should take IRQ resource and which should not?
>>> Can we use current _NONE flag for them?
>>
>> The problem is not internal to i2c-multi-instantiate.c, the problem
>> (once we pass a fwnode) is the API between i2c-multi-instantiate.c and
>> the i2c-core. For the IRQ_RESOURCE_NONE case i2c-multi-instantiate.c
>> sets board_info.irq to 0, which is the correct way to specify that
>> we do not have an IRQ, but if don't pass an IRQ then the i2c-core
>> will try to find one itself.  And once we pass the fwnode, then
>> the "try to find one itself" code will call i2c_acpi_get_irq()
>> and find the same IRQ for clients we instantiate, leading to
>> the earlier mentioned IRQ conflict.
> 
> I'm missing something here. Why we need to pass an fwnode in the first place?
> Seems you would like to access to methods from the driver.

Right, the cm32181 code needs access to the CPM0 and CPM1 ACPI
objects, which requires access to the fwnode.

> But if you simple enumerate the driver in ACPI multi-instantiate won't
> be needed. >
> As far as I understand, the actual driver consumes *both* I²C
> resources. It's not a multi-instantiate in this case.

On systems where there are 2 resources, the driver only attaches
to the second resouce. It does detect when it gets called for
the first resource (it detects the ARA address) and then returns
-ENODEV.

Another approach might be for the driver to call i2c_acpi_new_device
itself when it detects the ARA address, but that is quite ugly, then
we get:

-ACPI subsys instantiates i2c-client
  -cm32181_probe
   -cm32181_probe instantiates i2c-client for second resource
    -cm32181 probe (for second resource)
    -cm32181 probe returns 0
   -cm32181 probe returns -ENODEV

So the end result is the same (2 clients instantiated, one
bound to the cm32181 driver). But the nested probe calls to me
look quite ugly and since this solution actually still does
multi-instantiation using i2c-multi-inst seems like the more
clean solution to me.

Note that we need to likely solve the fwnode passing problem
sooner or later anyways. One of these days a driver for an
i2c-client instantiated by the i2c-multi-inst code is going
to need access to some methods or objects from the ACPI
device.

Since you do not like the PASS_FWNODE flag, one solution
would be this change:

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index a66912782064..365864e8bfd5 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -341,12 +341,12 @@ static int i2c_device_probe(struct device *dev)
  		if (irq == -EPROBE_DEFER)
  			return irq;

-		if (irq < 0)
-			irq = 0;
-
  		client->irq = irq;
  	}

+	if (client->irq < 0)
+		client->irq = 0;
+
  	/*
  	 * An I2C ID table is not mandatory, if and only if, a suitable OF
  	 * or ACPI ID table is supplied for the probing device.


This allows us to set board_info.irq to -ENOENT in the i2c-multi-inst
code, causing the core to skip trying to get the irq from the fwnode
itself, while still making drivers see 0 as irq value (which they
expect when there is no irq).

With this change i2c-multi-inst can pass the fwnode unconditionally.

Regards,

Hans

