Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01F171BD07E
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 01:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgD1XMZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 19:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726353AbgD1XMY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Apr 2020 19:12:24 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6EB3C03C1AC;
        Tue, 28 Apr 2020 16:12:22 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w20so676237ljj.0;
        Tue, 28 Apr 2020 16:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6P7WzGBiHEr5uhGVSITr/j0wctT9fpeZLBZyyf1Fw1k=;
        b=S76q+rlt/auXPp4GDSRpyJpbBSY12P4j6JLqQs1vVhCkZF5A/jFHngm1Td0EW1KWHK
         s93iCo6QfN9Tq9kPfebgbej+Lry5DmYZevnnmxBA79pPC86O6blWD8p6bfP+Flcs9OfX
         noLDnv4QryvscyimHKbpMrqem0zEMPMahWPTEeFoCe2txw0EebDslsx2WDlZhK3qqX8T
         e/QApV1Qj8iw78AHJsZtZQ8zQtFfxvjUaKcxcHuMAWQMaUtOoORYyHZ9ZeE7xhFUw2QS
         iMx+qWGl9cLr0R57iFBCwAQwNknoQMjxqiRYYBbt+X9K1K0KK5DX74TphyelHOntOF8n
         7W2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6P7WzGBiHEr5uhGVSITr/j0wctT9fpeZLBZyyf1Fw1k=;
        b=ZoiaHrnAtIlVhqaPdc29yiDMcAW3MREpM/GEfipp80iG1xMQjk1AqzLkh7kvPniTjm
         4wcCRHSG3o06bwjdGuxvfU1axsVCCmILJWGXNHuFvQdB5sOQGz0NFTdmycu9fLdbOXbL
         p91Nxf7uT1wbPrzLSRl7bBowUDx2iD6F3wxlMbkIm5RDJ0BBzVOH7Y4uczEnE4FP8zTY
         SWt+3HFLIESt2gLcCLOUhIdeYgwoNnRRPVjwe7y4JLkxPhAiuaab+poUb8iYLk9tz4ge
         DQ7npxIhOnP0+WoW2teVUgqEBq0jhJrsTVwA60Lnik/D7f46VXB8U1/ZJWWN+b/2SCoq
         pCYQ==
X-Gm-Message-State: AGi0PuZCZ1NZwrPIDZ88/x+QFTTxM/38FzfRxijSLXsyw7ZdFiHbjN5s
        tHdUDUi6v0GDAEclAhxyl80=
X-Google-Smtp-Source: APiQypJOg7n8/mp8InW56gJmkJY1ulFQopMwThYZvdoFzsplfHW1axUO+/QpMTvcSgIRMzbjVlvTgg==
X-Received: by 2002:a2e:9207:: with SMTP id k7mr18997020ljg.124.1588115541253;
        Tue, 28 Apr 2020 16:12:21 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id a26sm673593lfl.66.2020.04.28.16.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 16:12:20 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
 <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
 <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
 <db1132ce-53a8-371c-98e0-cb7cd91d5c7d@gmail.com>
 <fa344989-4cce-0d2c-dc93-4ca546823160@nvidia.com>
 <bba0a93a-8ec4-eda6-97f3-fb2ab0b9b503@gmail.com>
 <6f07e5c8-7916-7ea2-2fe7-d05f8f011471@nvidia.com>
 <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <da5985f4-44b3-336d-207d-4c0388806f95@gmail.com>
 <5fc71168-e4ac-11f6-dbf1-e80f4fae8d1a@gmail.com>
 <090241c4-e026-aea4-e1e9-a2a661b2c27e@gmail.com>
 <9a3d283c-d4ff-c55a-3ebf-4e08d35792ec@gmail.com>
 <f78bb10c-0744-4a23-c584-0212dd9fb491@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <03b74a48-aa9e-d08a-a735-b9fbfc6d5ec6@gmail.com>
Date:   Wed, 29 Apr 2020 02:12:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f78bb10c-0744-4a23-c584-0212dd9fb491@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

28.04.2020 11:02, Jon Hunter пишет:
> 
> On 27/04/2020 16:38, Dmitry Osipenko wrote:
>> 27.04.2020 17:45, Dmitry Osipenko пишет:
>>> 27.04.2020 17:13, Dmitry Osipenko пишет:
>>>> 27.04.2020 15:46, Dmitry Osipenko пишет:
>>>>> 23.04.2020 13:56, Jon Hunter пишет:
>>>>>>>> So I think that part of the problem already existed prior to these
>>>>>>>> patches. Without your patches I see ...
>>>>>>>>
>>>>>>>> [   59.543528] tegra-i2c 7000d000.i2c: i2c transfer timed out
>>>>>>>> [   59.549036] vdd_sata,avdd_plle: failed to disable
>>>>>>>> [   59.553778] Failed to disable avdd-plle: -110
>>>>>>>> [   59.558150] tegra-pcie 3000.pcie: failed to disable regulators: -110
>>>>>>> Does this I2C timeout happen with my patches? Could you please post full
>>>>>>> logs of an older and the recent kernel versions?
>>>>>> I believe that it does, but I need to check.
>>>>>>
>>>>>
>>>>> Jon, could you please confirm that you're seeing those regulator-disable
>>>>> errors with my patch? I don't see those errors in yours original log [1].
>>>>>
>>>>> [1]
>>>>> https://lore.kernel.org/lkml/1e259e22-c300-663a-e537-18d854e0f478@nvidia.com/
>>>>>
>>>>> Again, could you please post the *full* logs?
>>>>>
>>>>> If regulator's disabling was "failing" before without my patch because
>>>>> of the I2C interrupt being force-disabled during of NOIRQ phase, and now
>>>>> regulator's disabling succeeds with my patch because IRQ is manually
>>>>> handled after the timeout, then this could be bad. It means that
>>>>> regulator was actually getting disabled, but I2C driver was timing out
>>>>> because interrupt couldn't be handled in NOIRQ phase, which should
>>>>> result in a dead PCIe on a resume from suspend since regulator's core
>>>>> thinks that regulator is enabled (I2C said it failed to disable), while
>>>>> it is actually disabled.
>>>>>
>>>>> Do you have anything plugged into the PCIe slot in yours testing farm?
>>>>> It wouldn't surprise me if the plugged card isn't functional after
>>>>> resume from suspend on a stable kernels.
>>>>>
>>>>
>>>> I actually now see that interrupt is not allowed to be enabled during
>>>> the NOIRQ phase:
>>>>
>>>> https://elixir.bootlin.com/linux/v5.7-rc3/source/kernel/irq/manage.c#L640
>>>>
>>>> it should be worthwhile to turn it into a WARN_ON.
>>>>
>>>
>>> Oh, wait! There is already a warning there.. hmm.
>>>
>>
>> Aha, the disable depth for the I2C interrupt is 2 after
>> suspend_device_irq(), that's why there is no warning.
>>
>> This should catch the bug and trigger the warning:
>>
>> --- >8 ---
>> diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
>> index 453a8a0f4804..fe25104d8b22 100644
>> --- a/kernel/irq/manage.c
>> +++ b/kernel/irq/manage.c
>> @@ -653,6 +653,8 @@ void __enable_irq(struct irq_desc *desc)
>>  		break;
>>  	}
>>  	default:
>> +		if (desc->istate & IRQS_SUSPENDED)
>> +			goto err_out;
>>  		desc->depth--;
>>  	}
>>  }
>> --- >8 ---
>>
>> Jon could you please give it a try? Will this change produce a warning
>> for the I2C driver on a PCIe suspend for the v5.6 kernel?
> 
> 
> Yes I can test, but I still want to know why resume is currently broken.

BTW, I guess we could use the IRQF_NO_SUSPEND flag for I2C interrupt.
Then it should be possible to use I2C in the late suspend without the
need for atomic transfers, once RPM is resolved.
