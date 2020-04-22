Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F18321B46D4
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Apr 2020 16:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgDVOHc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Apr 2020 10:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbgDVOHc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Apr 2020 10:07:32 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A6FC03C1A9;
        Wed, 22 Apr 2020 07:07:30 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id f18so2379182lja.13;
        Wed, 22 Apr 2020 07:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sGFsUbHKcZdDejmr78iBjwIpQAyRNSoI/t3r9/k3A3A=;
        b=rPjsmnfI0GJwWjNcs6Rpr3ZBKQl32nRgHSOSMlhg/qNHEu0aCQmCXVRKzV2BpbnY29
         VN2W/sxMEpsQU7Cyb3Iq7CuS4xRhobmyj289o686dJt2/TLKo5/d/hlhg64aQyWnwvZX
         s8irlUQRkAjHjg5ZDKTg9vjpmG4PtUp5wftQdU045JEZVH4UCkzOm7oLn2HvuHDkaUOT
         BWVO+ARGLNgo+E1RUcs6nU2S9t2/cvg+/P6s+OQPk+lAwipVRvbAIRoFFcbkfFirD0NG
         w4hDVnQ/sYmVl9L26HpTKP4wjHVvLuiLd+7YlkcmWXks+WNp5+3GfHspjCdYzE1QWPbr
         +jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sGFsUbHKcZdDejmr78iBjwIpQAyRNSoI/t3r9/k3A3A=;
        b=DK/gt9KgNDZTFV4Ta9DF6styz57Babx1Knfx6XOtL771Zp8W9IZWiigWHwyqJHJukm
         endHB8zVhsl6vepDA4p1No8Qz6e3/Duon/nIQ+SXNe1511z3gLNgFHOccLtjKIsqDc2/
         ElWPNxv4X+HqoOFX094s2njWVmdWKTaVk0tbQX3AUebdcM7WA9d3UDFEwwT2jI45WkHt
         3hnyfDc9WqK0GKtAXNngHExdRMdYCSNFauMF/XoKeYbJLoVsI8a73CSRXCPZbDRh8N78
         DgMpqsiKZ5yqC+zWTp4/rPawgIlm7j9TjFAoCjjATQK6ykqO+w5yoDEgDhmbxz/fQdpF
         OOkA==
X-Gm-Message-State: AGi0PuYiaQpp6QUlK+f1/g6IPG1hm7x/esNNnwhjd/8DVfLpu88B9nFa
        lxwdgiyvsa+c1T2WOkB1ZQDd3prk
X-Google-Smtp-Source: APiQypI9yRUvS3Meb2Cbw5syBXnTe9EEJglLSIP4ty1U07mF2D7n0RENW98m4VhcK4w9eSEJRQ1t8w==
X-Received: by 2002:a2e:87d9:: with SMTP id v25mr11704447ljj.241.1587564448475;
        Wed, 22 Apr 2020 07:07:28 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id a26sm4773980lfl.66.2020.04.22.07.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 07:07:27 -0700 (PDT)
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
 <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
Date:   Wed, 22 Apr 2020 17:07:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

22.04.2020 16:59, Jon Hunter пишет:
> 
> On 22/04/2020 14:40, Dmitry Osipenko wrote:
>> 21.04.2020 22:42, Jon Hunter пишет:
>>>
>>> On 21/04/2020 16:08, Dmitry Osipenko wrote:
>>>> 21.04.2020 17:40, Jon Hunter пишет:
>>>>>
>>>>> On 21/04/2020 14:25, Dmitry Osipenko wrote:
>>>>>> 21.04.2020 12:49, Jon Hunter пишет:
>>>>>> ...
>>>>>>> I can try the above, but I agree it would be best to avoid messing with
>>>>>>> the suspend levels if possible.
>>>>>>
>>>>>> Will be awesome if you could try it and report back the result.
>>>>>>
>>>>>
>>>>> I gave it a try but suspend still fails.
>>>>
>>>> Perhaps the RPM's -EACCES is returned from here:
>>>>
>>>> https://elixir.free-electrons.com/linux/v5.7-rc2/source/drivers/base/power/runtime.c#L723
>>>>
>>>> Which suggests that I2C is accessed after being suspended. I guess the
>>>> PCIe driver suspends after the I2C and somehow my change affected the
>>>> suspension order, although not sure how.
>>>>
>>>> Jon, could you please try to enable PM logging and post the log? Please
>>>> also post log of the working kernel version, so that we could compare
>>>> the PM sequence.
>>>>
>>>> Something like this should enable the logging: "echo 1 >
>>>> /sys/power/pm_trace" + there is RPM tracing.
>>>
>>> Unfortunately, after enabling that I don't any output and so no help there.
>>
>> 1. I now tried to check the pm_trace myself and found that it's
>> available only on X86, my bad.
>>
>> 2. Jon, could you please clarify what exactly you were trying to test?
>>
>> 3. Is it only the Cardhu board that is affected by this problem?
>>
>> 4. Could you please try to add this to the kernel's cmdline and post the
>> logs:
>>
>> tp_printk
>> trace_event=rpm_suspend,rpm_resume,rpm_usage,rpm_idle,rpm_return_int
> 
> 
> So I think that part of the problem already existed prior to these
> patches. Without your patches I see ...
> 
> [   59.543528] tegra-i2c 7000d000.i2c: i2c transfer timed out

Does this I2C timeout happen with my patches? Could you please post full
logs of an older and the recent kernel versions?

> [   59.549036] vdd_sata,avdd_plle: failed to disable
> 
> [   59.553778] Failed to disable avdd-plle: -110
> 
> [   59.558150] tegra-pcie 3000.pcie: failed to disable regulators: -110
> 
> 
> However, now with your patches the i2c is failing to resume and this
> breaks system suspend completely for Tegra30. So far this is the only
> board that appears to break.
> 
> So the above issue needs to be fixed and I will chat to Thierry about this.

Okay
