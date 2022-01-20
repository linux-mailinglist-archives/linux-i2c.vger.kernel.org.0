Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A6E4951DD
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 16:58:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376814AbiATP5R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 10:57:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44911 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1376808AbiATP5O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 10:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642694233;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ncSIv9Qae13/wQ5rHHLLiGBIqzhbfDIHbz6NP0GvHDs=;
        b=WD+JA4YxZsTkM4iAy9agb3D9clvnLn+4bfZjmEKVG3dY3GExpgm/1LMEvVpahIJpzFpJIh
        8B1xKpOCDJXQyEoVL3NAvsA2VsoNrP3418ElQAfq8k3xuMY+Fh5kWJThngQZRuWrGhehBd
        xkCIRd/zR4LKNaJRKixfrs1sy0Dv1QQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-hY3EzaXgMIq3bwaml809sA-1; Thu, 20 Jan 2022 10:57:12 -0500
X-MC-Unique: hY3EzaXgMIq3bwaml809sA-1
Received: by mail-ed1-f70.google.com with SMTP id o10-20020a056402438a00b00403212b6b1aso6249655edc.13
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jan 2022 07:57:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ncSIv9Qae13/wQ5rHHLLiGBIqzhbfDIHbz6NP0GvHDs=;
        b=OcMmwF61x7aVlej4g9BFThy3VuTKanBcSP3Wn16yEsYQ14HxjO6r8tErBFJSYz/5ar
         qMJHaIil1QDnT4MF/Y/pLYTkp4XJ4WY9x46cFma5JwGm93EXEjBfX62H5cw7FF1ukgBC
         t2i4vgGWqqM2YenrkTqAWCIfJPm2ba6XozvVjd0pXk/oyAJXrM5PQfheLtdELPsZi/Ik
         sv+0Din2XPtoBUWF1aSRYse7WMjCXplqsVrMSBsMtpA8SvJXSW4nmCm+rp+QEUnUgbZe
         xuVh5FJkPlSXHyFn7ROH3LNMmcBXvKwxsju0mu8JEcIBwLD8XCmwfZwM5PxvuYTDfrv7
         qEzg==
X-Gm-Message-State: AOAM533SDguw4xhayFvVperiuP7VdebpJUhmCgcHM95s3v1YPqG0nmLG
        3SsLq8AbuvYDHyZr3qf8Fykuk1O98slabpd4G3K5cTbyJmrV8zK4H/uY2CFzE9vq+L9VjrOxpwl
        Qb7Vh+QWnkLyyvQuov08N
X-Received: by 2002:a05:6402:2790:: with SMTP id b16mr36482772ede.354.1642694231468;
        Thu, 20 Jan 2022 07:57:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1f+9IjLgmn90qmg+Uq2mDLzeIJJJyNPNIBdUZMI+Tw+q/nAKduF/6mR8+9rg5cnNWd0+X+A==
X-Received: by 2002:a05:6402:2790:: with SMTP id b16mr36482755ede.354.1642694231202;
        Thu, 20 Jan 2022 07:57:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id lf15sm1164253ejb.83.2022.01.20.07.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jan 2022 07:57:10 -0800 (PST)
Message-ID: <7f165170-ed25-7804-b756-4944a4067b8a@redhat.com>
Date:   Thu, 20 Jan 2022 16:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/2] i2c-designware: Add support for AMD PSP semaphore
Content-Language: en-US
To:     =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com
References: <20220120001621.705352-1-jsd@semihalf.com>
 <2f7610dc-ab57-ddbf-277f-e84680da71bd@redhat.com>
 <CAOtMz3MDntus2OzRS_QDfnFpzrVjj4swQjTkgkFYMGuwgbZcWA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAOtMz3MDntus2OzRS_QDfnFpzrVjj4swQjTkgkFYMGuwgbZcWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 1/20/22 13:29, Jan Dąbroś wrote:
> Hi Hans,
> 
> 
> czw., 20 sty 2022 o 12:15 Hans de Goede <hdegoede@redhat.com> napisał(a):
>>
>> Hi Jan,
>>
>> On 1/20/22 01:16, Jan Dabros wrote:
>>> This patchset comprises support for new i2c-designware controller setup on some
>>> AMD Cezanne SoCs, where x86 is sharing i2c bus with PSP. PSP uses the same
>>> controller and acts as an i2c arbitrator there (x86 is leasing bus from it).
>>>
>>> First commit aims to improve generic i2c-designware code by adding extra locking
>>> on probe() and disable() paths. I would like to ask someone with access to
>>> boards which use Intel BayTrail(CONFIG_I2C_DESIGNWARE_BAYTRAIL) to verify
>>> behavior of my changes on such setup.
>>>
>>> Second commit adds support for new PSP semaphore arbitration mechanism.
>>> Implementation is similar to the one from i2c-designware-baytrail.c however
>>> there are two main differences:
>>> 1) Add new ACPI ID in order to protect against silent binding of the old driver
>>> to the setup with PSP semaphore. Extra flag ARBITRATION_SEMAPHORE added to this
>>> new _HID allows to recognize setup with PSP.
>>> 2) Beside acquire_lock() and release_lock() methods we are also applying quirks
>>> to the lock_bus() and unlock_bus() global adapter methods. With this in place
>>> all i2c clients drivers may lock i2c bus for a desired number of i2c
>>> transactions (e.g. write-wait-read) without being aware of that such bus is
>>> shared with another entity.
>>>
>>> This patchset is a follow-up to the RFC sent earlier on LKML [1], with review
>>> comments applied.
>>>
>>> Looking forward to some feedback.
>>>
>>> [1] https://lkml.org/lkml/2021/12/22/219
>>
>>
>> Thank you for your patch series.
>>
>> As you may have seen I've done a lot of work on the Bay Trail semaphore
>> thing. I also own several Bay Trail and Cherry Trail based devices which
>> use this setup.
>>
>> I'll add your patches to my personal WIP tree which I regularly run
>> on these devices and I'll report back if I notice any issues.
> 
> Thanks in advance, this will be really helpful! I don't have Bay
> Trail/Cherry Trail, so I've only tested that build of Bay Trail
> semaphore isn't broken.
> 
> I would like to point to new locks in i2c_dw_disable() method as
> something to be the most fragile and error-prone, will be great if you
> can verify this thoroughly. This function is invoked on both
> dw_i2c_driver.remove() and dw_i2c_plat_suspend() paths. Considering
> that Bay Trail semaphore means that i2c bus is shared with PMIC, I'm
> not sure whether all corner cases are secured especially on platform
> suspend.

You are right that the whole sharing of the bus to the PMIC between
the SoC's internal power-management microcontroller (P-Unit) and
the OS is a bit fragile (it really is a bit crazy design IMHO).

You are also right that disabling the controller on suspend
is a problem, because once everything is suspended and we hit
deeper power-saving states then the P-Unit actually needs the
controller to tell the PMIC to disable certain regulators; and
the P-Unit is not prepared for us having turned the controller off,
therefor dw_i2c_plat_suspend() looks like this:

static int dw_i2c_plat_suspend(struct device *dev)
{
        struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);

        i_dev->suspended = true;

        if (i_dev->shared_with_punit)
                return 0;

	...


Note the shared_with_punit flag, so on the Bay Trail case
i2c_dw_disable() never gets called on suspend, so that should
not be an issue.

So all in all I don't really expect any problems, still thank
you for Cc-ing me.

Regards,

Hans



>> One remark, I notice that there are no AMD people in the Cc, it
>> would be good if you can find someone from AMD to look at this,
>> also see my remarks to the 2nd patch in my reply to that patch.
> 
> This was partially discussed with AMD folks and you are right that I
> should include someone from AMD to take a look at this. Thanks for all
> your comments!
> 
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>>
>>> Jan Dabros (2):
>>>   i2c: designware: Add missing locks
>>>   i2c: designware: Add AMD PSP I2C bus support
>>>
>>>  MAINTAINERS                                  |   1 +
>>>  drivers/acpi/acpi_apd.c                      |   1 +
>>>  drivers/i2c/busses/Kconfig                   |  10 +
>>>  drivers/i2c/busses/Makefile                  |   1 +
>>>  drivers/i2c/busses/i2c-designware-amdpsp.c   | 357 +++++++++++++++++++
>>>  drivers/i2c/busses/i2c-designware-baytrail.c |  10 +-
>>>  drivers/i2c/busses/i2c-designware-common.c   |  12 +
>>>  drivers/i2c/busses/i2c-designware-core.h     |  18 +-
>>>  drivers/i2c/busses/i2c-designware-master.c   |   6 +
>>>  drivers/i2c/busses/i2c-designware-platdrv.c  |  61 ++++
>>>  10 files changed, 469 insertions(+), 8 deletions(-)
>>>  create mode 100644 drivers/i2c/busses/i2c-designware-amdpsp.c
>>>
>>
> 

