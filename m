Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CBA41BBDB7
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Apr 2020 14:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbgD1MiC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Apr 2020 08:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726361AbgD1MiC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Apr 2020 08:38:02 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF8BEC03C1A9;
        Tue, 28 Apr 2020 05:38:01 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id f11so16693093ljp.1;
        Tue, 28 Apr 2020 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jaKR5R1WloABoOCNDwha2qUKSeGPIsf61ojAQBzgC2k=;
        b=Xpl4XiVD8uN3HZPXJDUEvWlNUFkg/wbeIjrtTvd71Okm+zIpEkiPP6pNr77DaV27/E
         yDY4TpEKX5TkZwNky5GupxcmC8CWmiKkmFD8m+2PFYpHy5HW7fdyMhNyb/H1geqGYqJE
         e34Ob3ju+51tEYinnRHFQke4dpW6FgqQsZzd+7PMTh5cwlWTrAKCdZ7mPc/LmqTXMMKB
         CRw3BJoMmiJd+lKPJD/HA/rIMVOoejIa+huOj04X66XtTTL8vuBv3K1XkRTsm8AMX6vm
         z2UP0xFk4VybbvAcqg/9xr3+xWfIIJby3+mfTnMXxVz6oERYVMGLHAOtNT1IqbyiQ5GO
         pySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jaKR5R1WloABoOCNDwha2qUKSeGPIsf61ojAQBzgC2k=;
        b=aqmSTGXSaWToyDgmqn5pcu1UWnjwkkORg8IdIDZEBB/STbTWNcLLngtsr01I5F7SFy
         dfp04lRBSzzWvDlu54LZlvmR+sh4yRqenKu5K32DPpHvFOKyz1VkbSo0h6zjRjBmL+m+
         CB67sjCod6dVqjkWu3YzWws4EWLYpXE9M2lSzXibg5S+HLQezyHnucd3xyRG+cOD9zk1
         P8QSIVRc/TDjhkWE1JyIOervM4PtrGLX4rrKOCVR8/AwdFXKea4VRCtQLmSLfPliyFMU
         5bEgVu/8vhHeb/V2QrYLxHmPdJ0xIsUom2C7gRIqiVKeUARhpDwBpnTBZocZrdSTEAh2
         NGPA==
X-Gm-Message-State: AGi0PuaOdtVDxZD+Pv79abD3YzbONwwiFFuHbLMxmoexgyJiLRB7YCVK
        o7Q5Ai8TQWH+U4hu5wrJJluMid+D
X-Google-Smtp-Source: APiQypIxVhNpDjp5Qg6Ip7K3vj0YXm4hcVNu1KOU3k8f4RfTGbv1CDxkze+vzXhlexo8u+RHlgWgiw==
X-Received: by 2002:a2e:b4a5:: with SMTP id q5mr18023098ljm.58.1588077479868;
        Tue, 28 Apr 2020 05:37:59 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id w29sm2388095lfq.35.2020.04.28.05.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 05:37:59 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
 <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
 <20200427151234.GE3464906@ulmo>
 <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
 <4981d7eb-b41e-c597-04ff-3d3295804d5a@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c56acfc2-c87c-7ed7-2cd0-ef31553d910f@gmail.com>
Date:   Tue, 28 Apr 2020 15:37:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4981d7eb-b41e-c597-04ff-3d3295804d5a@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

28.04.2020 11:01, Jon Hunter пишет:
> 
> On 27/04/2020 16:18, Dmitry Osipenko wrote:
>> 27.04.2020 18:12, Thierry Reding пишет:
>>> On Mon, Apr 27, 2020 at 05:21:30PM +0300, Dmitry Osipenko wrote:
>>>> 27.04.2020 14:00, Thierry Reding пишет:
>>>>> On Mon, Apr 27, 2020 at 12:52:10PM +0300, Dmitry Osipenko wrote:
>>>>>> 27.04.2020 10:48, Thierry Reding пишет:
>>>>>> ...
>>>>>>>> Maybe but all these other problems appear to have existed for sometime
>>>>>>>> now. We need to fix all, but for the moment we need to figure out what's
>>>>>>>> best for v5.7.
>>>>>>>
>>>>>>> To me it doesn't sound like we have a good handle on what exactly is
>>>>>>> going on here and we're mostly just poking around.
>>>>>>>
>>>>>>> And even if things weren't working quite properly before, it sounds to
>>>>>>> me like this patch actually made things worse.
>>>>>>
>>>>>> There is a plenty of time to work on the proper fix now. To me it sounds
>>>>>> like you're giving up on fixing the root of the problem, sorry.
>>>>>
>>>>> We're at -rc3 now and I haven't seen any promising progress in the last
>>>>> week. All the while suspend/resume is now broken on at least one board
>>>>> and that may end up hiding any other issues that could creep in in the
>>>>> meantime.
>>>>>
>>>>> Furthermore we seem to have a preexisting issue that may very well
>>>>> interfere with this patch, so I think the cautious thing is to revert
>>>>> for now and then fix the original issue first. We can always come back
>>>>> to this once everything is back to normal.
>>>>>
>>>>> Also, people are now looking at backporting this to v5.6. Unless we
>>>>> revert this from v5.7 it may get picked up for backports to other
>>>>> kernels and then I have to notify stable kernel maintainers that they
>>>>> shouldn't and they have to back things out again. That's going to cause
>>>>> a lot of wasted time for a lot of people.
>>>>>
>>>>> So, sorry, I disagree. I don't think we have "plenty of time".
>>>>
>>>> There is about a month now before the 5.7 release. It's a bit too early
>>>> to start the panic, IMO :)
>>>
>>> There's no panic. A patch got merged and it broken something, so we
>>> revert it and try again. It's very much standard procedure.
>>>
>>>> Jon already proposed a reasonable simple solution: to keep PCIe
>>>> regulators always-ON. In a longer run we may want to have I2C atomic
>>>> transfers supported for a late suspend phase.
>>>
>>> That's not really a solution, though, is it? It's just papering over
>>> an issue that this patch introduced or uncovered. I'm much more in
>>> favour of fixing problems at the root rather than keep papering over
>>> until we loose track of what the actual problems are.
>>
>> It's not "papering over an issue". The bug can't be fixed properly
>> without introducing I2C atomic transfers support for a late suspend
>> phase, I don't see any other solutions for now. Stable kernels do not
>> support atomic transfers at all, that proper solution won't be backportable.
> 
> 
> There are a few issues here, but the issue Thierry and I are referring
> to is the regression introduced by this change. Yes this exposes other
> problems, but we first need to understand why this breaks resume in
> general, regardless of what the PCIe driver is doing. I will look at
> this a bit more later this week.

Let's postpone the reverting by 1-3 weeks then. Likely that there will
be a proper (and trivial) solution by that time, otherwise it should be
okay to revert the I2C patch.
