Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89954322261
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 23:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232260AbhBVWvT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 17:51:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbhBVWvS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Feb 2021 17:51:18 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 508D4C061574;
        Mon, 22 Feb 2021 14:50:37 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id i9so680398wml.5;
        Mon, 22 Feb 2021 14:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uEqVaXzxZoPcvL56b/3dsUr6I9DjBbhnipXRDOEiD8s=;
        b=iHSxU3fhPjCYIOQuugrDmo0B7j2/Svv9qUhk6hhGRmUn5d3VwTuwgYpygu+E5j+4oL
         MXKPnc5y7xIN3gnQ03rj7vhoxOd9K0yiIbkzJQxz7IFU62jPZayjxeM467E0jvAT6L/9
         T+2H0XZoK5ZsNSdE0jISEINGUctd/NLGQUOAvrQRzEBuoP8wGjl0z8m7mS3CbvmvIUaO
         NR+xadw2Ip4uht7BLiCX/jVaEJwY4VUvb4yiwnp23lG/xMe/oNPT6eCTLUsId2/88srR
         Cc9LK3UOVPOV9TBam8KqC3NNQpHvXWk2xONippJR6ZOXjs+fzbKKX1LU8lCAPVRnP6yD
         I8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uEqVaXzxZoPcvL56b/3dsUr6I9DjBbhnipXRDOEiD8s=;
        b=o0D3vPP9PKU02eWYaSXKZi2yLNMldX2y8jP6B86R5nG+5QGgcaB+gzhTjvEP6QwEq1
         riclLAvI8d7C6DuuIBzNEQMFkrlFp9D1pryVosn2k5rd/m6rY6c34VdaIB/sQpHmFhgM
         NBupGlRhq1hVtKsV3UyCp7dBeRwykm2RxNraD0S60he5XSEXzvYyqGV21wYnpowk2C6j
         fiRYat0EtAxrkobf4LkrjvdSU10+bXjS4EFn+V3KHAE+IruMVau/r6YeUtLgGvQZsHY+
         erHhXEjxQ/I4NfRNCJjc4+gD3Ity1pdm4T1k0uZyFf5xRA2zNb5Lt0O6TEOTW5t3gsW1
         wryA==
X-Gm-Message-State: AOAM530V/0I/heoXYwAUdpzkerdg1M3IPrs4cmOKVMQ8fBjjgwV1LVbS
        y5j6QVPhFEP4SrjDLh42WCk=
X-Google-Smtp-Source: ABdhPJyr1xAXSpQ3GB788g0Paavvc+qpjPCBknL0nVmHvD8cp2tu8YZ9yZXQiMyYRvX/40ISvC2rVQ==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr22188543wml.100.1614034235968;
        Mon, 22 Feb 2021 14:50:35 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.123])
        by smtp.gmail.com with ESMTPSA id q140sm743525wme.0.2021.02.22.14.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 14:50:35 -0800 (PST)
Subject: Re: [PATCH v3 5/6] platform/x86: Add intel_skl_int3472 driver
To:     Hans de Goede <hdegoede@redhat.com>, tfiga@chromium.org,
        sakari.ailus@linux.intel.com, rajmohan.mani@intel.com,
        rjw@rjwysocki.net, lenb@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, mgross@linux.intel.com,
        luzmaximilian@gmail.com, robert.moore@intel.com,
        erik.kaneda@intel.com, me@fabwu.ch, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org
References: <20210222130735.1313443-1-djrscally@gmail.com>
 <20210222130735.1313443-6-djrscally@gmail.com>
 <04c106e3-fd95-c19d-115f-8acd07df4c0c@gmail.com>
 <f9620e2e-604e-01c9-0d72-3b415cf3fa88@redhat.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <5c90915d-1e11-c86a-0dc2-48840fc647e4@gmail.com>
Date:   Mon, 22 Feb 2021 22:50:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f9620e2e-604e-01c9-0d72-3b415cf3fa88@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hans, thanks for the input

On 22/02/2021 13:27, Hans de Goede wrote:
> Hi,
>
> On 2/22/21 2:19 PM, Daniel Scally wrote:
>> Hi all
>>
>> On 22/02/2021 13:07, Daniel Scally wrote:
>>> diff --git a/drivers/platform/x86/intel-int3472/Kconfig b/drivers/platform/x86/intel-int3472/Kconfig
>>> new file mode 100644
>>> index 000000000000..b94622245c21
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/intel-int3472/Kconfig
>>> @@ -0,0 +1,31 @@
>>> +config INTEL_SKL_INT3472
>>> +	tristate "Intel SkyLake ACPI INT3472 Driver"
>>> +	depends on ACPI
>>> +	depends on REGULATOR
>>> +	depends on GPIOLIB
>>> +	depends on COMMON_CLK && CLKDEV_LOOKUP
>>> +	depends on I2C
>>> +	select MFD_CORE
>>> +	select REGMAP_I2C
>>> +	help
>>> +	  This driver adds support for the INT3472 ACPI devices found on some
>>> +	  Intel SkyLake devices.
>>> +
>>> +	  The INT3472 is an Intel camera power controller, a logical device
>>> +	  found on some Skylake-based systems that can map to different
>>> +	  hardware devices depending on the platform. On machines
>>> +	  designed for Chrome OS, it maps to a TPS68470 camera PMIC. On
>>> +	  machines designed for Windows, it maps to either a TP68470
>>> +	  camera PMIC, a uP6641Q sensor PMIC, or a set of discrete GPIOs
>>> +	  and power gates.
>>> +
>>> +	  If your device was designed for Chrome OS, this driver will provide
>>> +	  an ACPI OpRegion, which must be available before any of the devices
>>> +	  using it are probed. For this reason, you should select Y if your
>>> +	  device was designed for ChromeOS. For the same reason the
>>> +	  I2C_DESIGNWARE_PLATFORM option must be set to Y too.
>>> +
>>> +	  Say Y or M here if you have a SkyLake device designed for use
>>> +	  with Windows or ChromeOS. Say N here if you are not sure.
>>> +
>>> +	  The module will be named "intel-skl-int3472"
>> The Kconfig option for the existing tps68470 driver is a bool which
>> depends on I2C_DESIGNWARE_PLATFORM=y, giving the following reason:
>>
>> This option is a bool as it provides an ACPI operation
>> region, which must be available before any of the devices
>> using this are probed. This option also configures the
>> designware-i2c driver to be built-in, for the same reason.
>>
>> One problem I've faced is that that scenario only applies to some
>> devices that this new driver can support, so hard-coding it as built in
>> didn't make much sense. For that reason I opted to set it tristate, but
>> of course that issue still exists for ChromeOS devices where the
>> OpRegion will be registered. I opted for simply documenting that
>> requirement, as is done in aaac4a2eadaa6: "mfd: axp20x-i2c: Document
>> that this must be builtin on x86", but that's not entirely satisfactory.
>> Possible alternatives might be setting "depends on
>> I2C_DESIGNWARE_PLATFORM=y if CHROME_PLATFORMS" or something similar,
>> though of course the User would still have to realise they need to
>> build-in the INTEL_SKL_INT3472 Kconfig option too.
>>
>> Feedback around this issue would be particularly welcome, as I'm not
>> sure what the best approach might be.
> This is a tricky area, I actually wrote the "mfd: axp20x-i2c: Document
> that this must be builtin on x86" patch you refer to. At first I tried
> to express the dependency in Kconfig language but things got too complex
> and Kconfig sometimes became unhappy about circular deps (or something
> like that).


Yes, I had a go too; with similar results

> The most important thing here is to make sure that the generic configs
> shipped by distros get this right; and we can hope that people creating
> those configs at least read the help text...
>
> So all in all I believe that just documenting the requirement is fine.


OK - that's what I'm hoping is the consensus, as I don't think it can be
made _entirely_ seamless through dependencies or whatever anyway, in
which case documenting it seems like the cleanest approach to me.

>
> The alternative would be to just change I2C_DESIGNWARE_PLATFORM (and the
> core) to a bool, or at least make it not selectable as module when
> X86 and ACPI are set... That would be a bit of a big hammer but might
> not be the worst idea actually.
>
> Regards,
>
> Hans
>
