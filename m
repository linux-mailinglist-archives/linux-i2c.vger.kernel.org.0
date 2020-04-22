Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92E01B4661
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Apr 2020 15:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgDVNkT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Apr 2020 09:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbgDVNkT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Apr 2020 09:40:19 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE081C03C1A9;
        Wed, 22 Apr 2020 06:40:18 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id j14so1677298lfg.9;
        Wed, 22 Apr 2020 06:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BnarLNPnA1/R0wZBgGmEsfEPeXEVYC63VMJMyo6Q/N0=;
        b=DvxbfuLz0E9rL/vHF7c2ZbOblwrB5LvZqVLimIMCF348Ksh5frDPVO307ilu4QK1wo
         Yws05l4O3dfmb4X533m0ZstmboDE4Xvxpc4/Lei0y3vEoRSBvQUSRKc9RvWnBoOKAeov
         VA62jVXOicDRy979tfb6wK+UK3+P0Wvdjh+8Ff+p9K5OywcAwnICQD6rzjce06kXWJKR
         6evrzh6rhUHV6dHOF8NBUhy4gnbBMBWeLN4ppUJ807L6d8hCn+JWsJyIP1DR4vfCWomQ
         MTFVxrfvl95+idj9WbmNm9RXjxfg9m4mdDYjOCk7vPcVzR4N/0JFnVtiSN9kK8GviPIA
         s1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BnarLNPnA1/R0wZBgGmEsfEPeXEVYC63VMJMyo6Q/N0=;
        b=NuM8waEvJgbDGBHRb/9T/dpSdnpC9eeKkQb7gLIaXcGglkVflwH3m8kpUFBG6PAU2O
         2YPYh5ghbDHYQrtNTFvBSW29S6z90IoZiSysLyZ2u3Nji2X06sW1M5T1RrvQAEspi9PF
         mZR3ukVuLu2fzGoiF93PmvDpElKmfeR9h5OtufsXZZIiXroPXMmDGuxftwoMx3d2VDMC
         mil6b2suqMQHmaNRuZGc4sLoFWuQK+e9acK276x4tyxKdZno1pPps7hG6rHVt1k32f9v
         GDMzXh6KCj9h/3xiauqC7ShQjzeYnyEBz+29a9agOFXXFAk1MbQHR0JjRD4bw1FzvGep
         VaBg==
X-Gm-Message-State: AGi0PuapEAcqp6YIO0BsY42nYZZKy/W0sUJQ/t+OdFm4z4Irxujr56sF
        xY5cepytGkPzu22bjAJgY5HcBZI2
X-Google-Smtp-Source: APiQypJ7dS38hxSyLhLF0M3xEzBM3WCs8zGXZNlgA0xIBfi8aiTOPAJ69EUyF/lljFkxC77qjmdB9A==
X-Received: by 2002:ac2:46e5:: with SMTP id q5mr17303997lfo.11.1587562816899;
        Wed, 22 Apr 2020 06:40:16 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id b9sm5172629lfp.27.2020.04.22.06.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 06:40:15 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
Date:   Wed, 22 Apr 2020 16:40:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6f07e5c8-7916-7ea2-2fe7-d05f8f011471@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

21.04.2020 22:42, Jon Hunter пишет:
> 
> On 21/04/2020 16:08, Dmitry Osipenko wrote:
>> 21.04.2020 17:40, Jon Hunter пишет:
>>>
>>> On 21/04/2020 14:25, Dmitry Osipenko wrote:
>>>> 21.04.2020 12:49, Jon Hunter пишет:
>>>> ...
>>>>> I can try the above, but I agree it would be best to avoid messing with
>>>>> the suspend levels if possible.
>>>>
>>>> Will be awesome if you could try it and report back the result.
>>>>
>>>
>>> I gave it a try but suspend still fails.
>>
>> Perhaps the RPM's -EACCES is returned from here:
>>
>> https://elixir.free-electrons.com/linux/v5.7-rc2/source/drivers/base/power/runtime.c#L723
>>
>> Which suggests that I2C is accessed after being suspended. I guess the
>> PCIe driver suspends after the I2C and somehow my change affected the
>> suspension order, although not sure how.
>>
>> Jon, could you please try to enable PM logging and post the log? Please
>> also post log of the working kernel version, so that we could compare
>> the PM sequence.
>>
>> Something like this should enable the logging: "echo 1 >
>> /sys/power/pm_trace" + there is RPM tracing.
> 
> Unfortunately, after enabling that I don't any output and so no help there.

1. I now tried to check the pm_trace myself and found that it's
available only on X86, my bad.

2. Jon, could you please clarify what exactly you were trying to test?

3. Is it only the Cardhu board that is affected by this problem?

4. Could you please try to add this to the kernel's cmdline and post the
logs:

tp_printk
trace_event=rpm_suspend,rpm_resume,rpm_usage,rpm_idle,rpm_return_int


