Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4B81DD2AD
	for <lists+linux-i2c@lfdr.de>; Thu, 21 May 2020 18:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729692AbgEUQDC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 May 2020 12:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727973AbgEUQDC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 May 2020 12:03:02 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEEB2C061A0E;
        Thu, 21 May 2020 09:03:01 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id x27so4742175lfg.9;
        Thu, 21 May 2020 09:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AecFw995CGTDfnePAAOzk4LDHP1RvUGJS5STI29B3ks=;
        b=qA78Is6dG4HSJwfBk5tz9QkYGepUu6p33PJrkqAiFW402bQWY9x2hwUyzdEI46nsxd
         mMn63fvDnYUEFb+B7Q/t5kXqg8RLfW+1P3qrAr5VXJzPY2LHyi/ARWMKQ0THz4P8v4Dp
         LInkYsDBa8aM32/QPW0u/fEXwTLtXz4BuERhOztUPHOdnK/R+RtYsKIkr/RKHjOSDuvg
         8wfPemWlLha50jnkTXwzB5PLHtHtFdJ5yg3n7oituX0yX8LDcuDi9sMSwDS2sx6amLIa
         dPYWeQv2F7JMUQ+fyhBdOYowxs5Zo7wh+0fXYM6BYtHjCcr3f5lZdgDIlOxSHUNp6+YM
         gVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AecFw995CGTDfnePAAOzk4LDHP1RvUGJS5STI29B3ks=;
        b=eN2vEyRXEiASzggjwqQqBJUNm//NwV4h2icgpnU9SfVf0NkSc7LBJPRREKMMac/RwT
         YuAzV3f8Qu9o7fOrmpMiyI7v1F9yElgYna79W+r9RvhSK4IZPZx2ZXA9JImDVdeOBkQb
         THE5zAlWCQB4GUjcsYDqoMnXF6D9lkSeser26xKQXXrWu9a5VFRnIojrz4fe+y68fXxE
         Qyhd28staEXUwUeQaqhLY92KFcdK8OtaZ1NDUtPsmjvcnZZ1x8D4Xru3sPd8XY19UR+m
         yQS19GV6iVnl0lrlbnPZg5JnR4BDBUgvuFF+U6fMuvDBizP9whX7C3wXYh3m0XuwUzS0
         kyHw==
X-Gm-Message-State: AOAM5333t8ZaOo04p52qhRA6nWvwrQzDL2DI8Lws8oMO3Rq7K4TBZjW9
        A/XYl8Zk2LWpP2i0ZAaliWh3AMQU
X-Google-Smtp-Source: ABdhPJzVi+o/luJHVJoxUcOad9z0OcbBiBLzK+HjZOlFeefiXJBPLYE70Pg04DoJLojSldJxH7FNjg==
X-Received: by 2002:ac2:4a8d:: with SMTP id l13mr5366051lfp.213.1590076978764;
        Thu, 21 May 2020 09:02:58 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id 6sm941059ljq.115.2020.05.21.09.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 09:02:56 -0700 (PDT)
Subject: Re: [GIT PULL] i2c: tegra: Changes for v5.8-rc1
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20200515143924.1579055-1-thierry.reding@gmail.com>
 <314a292e-bcd9-bb30-4067-71dc7cc399d6@gmail.com>
 <20200519160835.GC2113674@ulmo>
 <6b081a10-b150-b07f-2852-743e41ed053c@gmail.com>
 <20200520105100.GA2141681@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5653baa1-b7ae-19ab-5299-ecf227be98c2@gmail.com>
Date:   Thu, 21 May 2020 19:02:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520105100.GA2141681@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

20.05.2020 13:51, Thierry Reding пишет:
> On Wed, May 20, 2020 at 05:19:27AM +0300, Dmitry Osipenko wrote:
>> 19.05.2020 19:08, Thierry Reding пишет:
>>> On Sat, May 16, 2020 at 10:45:32AM +0300, Dmitry Osipenko wrote:
>>>> 15.05.2020 17:39, Thierry Reding пишет:
>>>>> Hi,
>>>>>
>>>>> The following changes since commit 0e698dfa282211e414076f9dc7e83c1c288314fd:
>>>>>
>>>>>   Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.8-i2c
>>>>>
>>>>> for you to fetch changes up to c73178b93754edd8449dccd3faf05baafd4d3f0e:
>>>>>
>>>>>   i2c: tegra: Add support for the VI I2C on Tegra210 (2020-05-12 22:47:52 +0200)
>>>>>
>>>>> Thanks,
>>>>> Thierry
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> i2c: tegra: Changes for v5.8-rc1
>>>>>
>>>>> This includes a few improvements to make the Tegra I2C controller behave
>>>>> properly on suspend/resume, does a bit of cleanup and adds support for
>>>>> the VI-variant of the I2C controller that is used primarily for video
>>>>> capture purposes.
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> Dmitry Osipenko (2):
>>>>>       i2c: tegra: Better handle case where CPU0 is busy for a long time
>>>>>       i2c: tegra: Synchronize DMA before termination
>>>>>
>>>>> Thierry Reding (5):
>>>>>       Revert "i2c: tegra: Fix suspending in active runtime PM state"
>>>>
>>>>>       i2c: tegra: Restore pinmux on system resume
>>>>
>>>> In general this series is good to me, although I have some concerns
>>>> about this patch. Could you please answer the review comments?
>>>
>>> Sorry, those had been burried under too much email. I've answered your
>>> questions now.
>>
>> Hello Thierry,
>>
>> Thank you for the answers, I'd also want to see the answer to the
>> question about how RPM works, i.e. why I2C is RPM-resumed during
>> system's suspend in some cases and not the others.
> 
> I don't think I've seen a question regarding that, so let me answer
> here: the way I understand how this works is that for each device the PM
> core will grab a runtime PM reference during the suspend/resume
> transition, which is done as a way of preventing any of the resumed
> devices from unexpectedly going to runtime suspend.
> 
> This code is in drivers/base/power/main.c, device_prepare(). Note that
> this will only increment the runtime PM usage counter (and therefore
> block the device from entering runtime suspend) but it won't resume the
> device if it is already suspended.

Does it mean that device won't be RPM-suspended if RPM-resume is invoked
during of system's suspend?

I tried to dig through the code, commit messages, kernel docs, etc and
came to a conclusion that it's hacks made on top of other hacks in order
to accommodate needs of the PCI subsystem. This behaviour isn't
documented, which makes RPM a bit awkward to use.

> So far any devices that are already runtime suspended, there isn't
> really anything we have to do during suspend. For those who are not yet
> suspended, we need to force them into suspend so that their clocks are
> disabled and the pinmux state set properly (to "idle").
> 
> On resume we first need to runtime resume the device undconditionally so
> that context can be restored. Runtime resume will take care of enabling
> the clock and setting the pinmux state to "default". Then we restore the
> context and if the device had been runtime suspended, we manually call
> the runtime suspend callback again so that the state matches what the PM
> core thinks it is. However, if the device had not been runtime suspended
> during system suspend, then we must not manually put it back into
> suspend because it would no longer match the PM core's state.
> 
> Does that answer your question?

Yes, this partially answers my question, thank you. Still I don't have a
full picture.

I also don't like the fact that RPM behavior during of system's suspend
isn't symmetrical to system's resume, yet not sure if it is really
intended. I.e. that RPM allows to resume during of late suspend, but not
on early resume.

Anyways, I haven't noticed any problems using this series, so should be
good.
