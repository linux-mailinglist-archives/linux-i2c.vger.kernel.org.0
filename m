Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA7161BE557
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 19:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgD2ReV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Apr 2020 13:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726423AbgD2ReU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Apr 2020 13:34:20 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4913FC03C1AE;
        Wed, 29 Apr 2020 10:34:20 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id y4so3506762ljn.7;
        Wed, 29 Apr 2020 10:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x1AFbLndQ8YqHGnJDb3MA42SAMhniur+u9+ugWrG7Fk=;
        b=t4M+LEfkvpdZKXDogmoVp+QhskKxi/S9RB5zs+sqXpM6x1Ex1srgxxvU67UcYoHRdh
         IxF2IMU0IxyI6qWv08vTKlcAxi3prmITml/CVeG7HHbA6zZ/rSVjZJ2MJJaUIMrFe3DX
         PPHgzLxt9x2GGCMT4Q9QjSU/fZJ5LdwfWpKcwYQUiGdbgnhG+dzV4ZIDSR3FeZwOJYe+
         MYb++17FdBTr6TVcU+w5N6rP2QEh4ZNIcRnij5g8dAZ9rY3HW4Qh6ViDFiyoX0Db1eOK
         SUX7O0dXFJa2bxdaNBMIM5N2qpml//BP4rc3xoHWuA/IYGOGDJ0NBblkWF0rf5FCnhXT
         GyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x1AFbLndQ8YqHGnJDb3MA42SAMhniur+u9+ugWrG7Fk=;
        b=ichZAMTDV194vJW3MlEC3h3xzhgpIwTfXM9RYrZQ8YhGsvcCIUnDjU4hik+GToa9jm
         FIB0gz1aLdWU+Qi52X6NwHmTbIvdcg6AvGkk2oOke++PNMCu0ZeTbIM6wsrNyaarR/LF
         2XvfwY60vJ9rNvsPCoWGZKJxgSaaJZqOlgGHfgYt8fO/FhbFmTpFH0StP069buhk5R6h
         q/+fdUy9OIVBA+DH14TFoV3JanplbVq2KewLZWwAIr73SwJD8jcCEYPnLx2lIg9F7Uey
         Mb75hvdC1LfYd0KDcqtvMDly+/0jTVPRIFXkJugp7+1HVljAIY2c6y7tH0SKt1DC2rt3
         xFhw==
X-Gm-Message-State: AGi0PuYRYpjgXNXifAuDDnPIBDHxrEiTcioq7jyiU5V1tZLO/RqCm9eP
        8ecv4/rASOkM9lvIyjCAW9Wwjb+h
X-Google-Smtp-Source: APiQypJi65P6DNd1r0b4JeH7f8LZbvQHODxwAIU6idCBvOX9B5zVqyVAw9pfoEfsE+4YIMcfMKECjA==
X-Received: by 2002:a2e:5847:: with SMTP id x7mr21345240ljd.61.1588181658244;
        Wed, 29 Apr 2020 10:34:18 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id e4sm1816587lfn.37.2020.04.29.10.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 10:34:17 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
 <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
 <20200427151234.GE3464906@ulmo>
 <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
 <20200429081448.GA2345465@ulmo> <20200429085502.GB2345465@ulmo>
 <9e36c4ec-ca02-bd15-d765-15635f09db4b@gmail.com>
 <20200429163020.GB3157354@ulmo>
 <bd622667-9364-abfa-ad98-5ed51919ca09@gmail.com>
Message-ID: <31976259-f420-9ebf-f799-e5c6f4bd8921@gmail.com>
Date:   Wed, 29 Apr 2020 20:34:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <bd622667-9364-abfa-ad98-5ed51919ca09@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

29.04.2020 19:54, Dmitry Osipenko пишет:
> 29.04.2020 19:30, Thierry Reding пишет:
>> On Wed, Apr 29, 2020 at 03:35:26PM +0300, Dmitry Osipenko wrote:
>>> 29.04.2020 11:55, Thierry Reding пишет:
>>> ...
>>>>>> It's not "papering over an issue". The bug can't be fixed properly
>>>>>> without introducing I2C atomic transfers support for a late suspend
>>>>>> phase, I don't see any other solutions for now. Stable kernels do not
>>>>>> support atomic transfers at all, that proper solution won't be backportable.
>>>>>
>>>>> Hm... on a hunch I tried something and, lo and behold, it worked. I can
>>>>> get Cardhu to properly suspend/resume on top of v5.7-rc3 with the
>>>>> following sequence:
>>>>>
>>>>> 	revert 9f42de8d4ec2 i2c: tegra: Fix suspending in active runtime PM state
>>>>> 	apply http://patchwork.ozlabs.org/project/linux-tegra/patch/20191213134417.222720-1-thierry.reding@gmail.com/
>>>>>
>>>>> I also ran that through our test farm and I don't see any other issues.
>>>>> At the time I was already skeptical about pm_runtime_force_suspend() and
>>>>> pm_runtime_force_resume() and while I'm not fully certain why exactly it
>>>>> doesn't work, the above on top of v5.7-rc3 seems like a good option.
>>>>>
>>>>> I'll try to do some digging if I can find out why exactly force suspend
>>>>> and resume doesn't work.
>>>>
>>>> Ah... so it looks like pm_runtime_force_resume() never actually does
>>>> anything in this case and then disable_depth remains at 1 and the first
>>>> tegra_i2c_xfer() will then fail to runtime resume the controller.
>>>
>>> That's the exactly expected behaviour of the RPM force suspend/resume.
>>> The only unexpected part for me is that the tegra_i2c_xfer() runtime
>>> resume then fails in the NOIRQ phase.
>>>
>>> Anyways, again, today it's wrong to use I2C in the NOIRQ phase becasue
>>> I2C interrupt is disabled. It's the PCIe driver that should be fixed.
>>
>> I don't think so. Everything works perfectly fine if we fix system
>> suspend/resume not to rely on pm_runtime_force_{suspend,resume}() and
>> directly call the runtime suspend/resume implementations.
> 
> It should "work" only in conjunction with my I2C patch, otherwise you'll
> get a spurious I2C timeout error. And it will "work" only because
> interrupt is handled manually after the timeout, meaning that yours
> suspending time will take few hundreds ms more.
> 
>> So can we please stop deflecting and fix the damn I2C driver. From my
>> perspective we have two choices:
>>
>>   1) do what I suggested above and revert the force suspend/resume patch
>>      and apply the "manual" suspend/resume patch instead
>>
>>   2) revert this patch and go back to the drawing board
>>
>> I suspect that with 2) we'd end up back where we started and have to do
>> 1) anyway.
>>
>> An alternative that I'd prefer even more would be to do 2) now for v5.7
>> and then we do 1) for v5.8 and give this some more soaking time.
> 
> I2C driver isn't broken, PCIe driver is. IMO.
> 
> Both yours variants are not going to be a backportable fix for the
> stable kernels, they won't fix the suspended interrupt problem. What I'm
> missing?
> 

My proposal:

1. Fix PCIe driver by keeping regulator always-ON, propagate it to
stable kernels.

2. Make I2C driver usable in NOIRQ phase.

3. Make PCIe driver to handle errors properly.

4. Revert the PCIe driver "fix".
