Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A20E1BA7BC
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 17:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgD0PSj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 11:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726539AbgD0PSi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 11:18:38 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AEECC0610D5;
        Mon, 27 Apr 2020 08:18:38 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a21so15100966ljj.11;
        Mon, 27 Apr 2020 08:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9U+B2NaGe4OFbm99455rOrzIn/iooy1p5vPA7+6Gp+g=;
        b=eHVmD1YaiZTIE/3QpHl3g9qHmbmh6tP0iGk2GTdaYwYxze1nOsKRc0CTgqz/Ixkcxd
         3cQ6Sw9PGLmDVXUyOTTOmwrLFAbJn8Twrqa6yJR2qhctJ4s7IVBHikyeXp4cuKadZsdo
         P7lalaKtvLFU5pzKuedylG75I4kacmZjlXpuG1W/yw79UBfFXaeA9G9M8QNx5N5VY2AH
         lOtaYBNQnTN6Fr/Brck+EIM+ZzbuId/9QlZQbOi17Glzbx2pBJqqk6cafvFZI2ljcQA7
         Ju1ir4UwkjrFRUXouP0ftMrI5V5ltn16L7rYoeDuDRFeiisogV1nHx835RJ65JFCl4Cp
         kSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9U+B2NaGe4OFbm99455rOrzIn/iooy1p5vPA7+6Gp+g=;
        b=DbGjbxIs5oMv5nu6XMjh3slzUULv8gdKKy6byWy/EUwI+F7MQgGG1hNT6iOu5RYlVn
         tyKykxqgQFJhXRgomdygXSSQs9lixXgzVCT1v0rP2r6AnDWrmdvSnnVKei8xsrdyBv9g
         VSsWEks0R65xkXFdwgBT3yKKHPkEE2GtthbZJQkygHjKxxcDwP5JkgdD56a67xHQl1vs
         01eqOsFDXFk7xtng+X/HYhyVxhLD72kq4ISZc7lbP4na95qdkjUqZ6aHoM1yveC180S/
         evXqaoVLcKxye5hTvEb1RdNhZ7C24O/itpRqIZJFBWKeY045LFTf4lD7/NC/h92t1NMp
         BJNg==
X-Gm-Message-State: AGi0PubwfpL/6RLQLBnSdH8Tdvna0eH7Du4OEHwcQBMEbWDEC/PBv8R+
        zRdUJXfL0EIf2aFjGa9mwEn2zcsZ
X-Google-Smtp-Source: APiQypKubZIOOzOIkciewwG943jhIaqo15SktgP5Guj49wD8jK/RxInDt+QME+2KQywNj7zC+FlC5Q==
X-Received: by 2002:a2e:800f:: with SMTP id j15mr14716945ljg.27.1588000716462;
        Mon, 27 Apr 2020 08:18:36 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id j13sm11409029lfb.19.2020.04.27.08.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 08:18:35 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
Date:   Mon, 27 Apr 2020 18:18:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427151234.GE3464906@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

27.04.2020 18:12, Thierry Reding пишет:
> On Mon, Apr 27, 2020 at 05:21:30PM +0300, Dmitry Osipenko wrote:
>> 27.04.2020 14:00, Thierry Reding пишет:
>>> On Mon, Apr 27, 2020 at 12:52:10PM +0300, Dmitry Osipenko wrote:
>>>> 27.04.2020 10:48, Thierry Reding пишет:
>>>> ...
>>>>>> Maybe but all these other problems appear to have existed for sometime
>>>>>> now. We need to fix all, but for the moment we need to figure out what's
>>>>>> best for v5.7.
>>>>>
>>>>> To me it doesn't sound like we have a good handle on what exactly is
>>>>> going on here and we're mostly just poking around.
>>>>>
>>>>> And even if things weren't working quite properly before, it sounds to
>>>>> me like this patch actually made things worse.
>>>>
>>>> There is a plenty of time to work on the proper fix now. To me it sounds
>>>> like you're giving up on fixing the root of the problem, sorry.
>>>
>>> We're at -rc3 now and I haven't seen any promising progress in the last
>>> week. All the while suspend/resume is now broken on at least one board
>>> and that may end up hiding any other issues that could creep in in the
>>> meantime.
>>>
>>> Furthermore we seem to have a preexisting issue that may very well
>>> interfere with this patch, so I think the cautious thing is to revert
>>> for now and then fix the original issue first. We can always come back
>>> to this once everything is back to normal.
>>>
>>> Also, people are now looking at backporting this to v5.6. Unless we
>>> revert this from v5.7 it may get picked up for backports to other
>>> kernels and then I have to notify stable kernel maintainers that they
>>> shouldn't and they have to back things out again. That's going to cause
>>> a lot of wasted time for a lot of people.
>>>
>>> So, sorry, I disagree. I don't think we have "plenty of time".
>>
>> There is about a month now before the 5.7 release. It's a bit too early
>> to start the panic, IMO :)
> 
> There's no panic. A patch got merged and it broken something, so we
> revert it and try again. It's very much standard procedure.
> 
>> Jon already proposed a reasonable simple solution: to keep PCIe
>> regulators always-ON. In a longer run we may want to have I2C atomic
>> transfers supported for a late suspend phase.
> 
> That's not really a solution, though, is it? It's just papering over
> an issue that this patch introduced or uncovered. I'm much more in
> favour of fixing problems at the root rather than keep papering over
> until we loose track of what the actual problems are.

It's not "papering over an issue". The bug can't be fixed properly
without introducing I2C atomic transfers support for a late suspend
phase, I don't see any other solutions for now. Stable kernels do not
support atomic transfers at all, that proper solution won't be backportable.
