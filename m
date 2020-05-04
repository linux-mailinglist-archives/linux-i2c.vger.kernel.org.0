Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03F31C48A1
	for <lists+linux-i2c@lfdr.de>; Mon,  4 May 2020 22:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgEDUzQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 May 2020 16:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgEDUzO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 May 2020 16:55:14 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0794C061A0E;
        Mon,  4 May 2020 13:55:13 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id f18so11123762lja.13;
        Mon, 04 May 2020 13:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=462DgipZWXKeW4Bkk/lkob1uYe6oS0tY/vxkgckhdAs=;
        b=nmMiqcYXUxCNHMDY6rNZt9nIYFpn2LDdh2oaJxnLzASlADJ0Cw/j9O0qUHGMl2UuhI
         LJrjCIpzTTHe3DXJ/pNHR4b0xtq7qFRqiHQH3OINqLF1LFr9GnqSC5TJMGbHAZ+YgxW9
         nOnD+BKcuKIxzcWasFjMZuqKav4AdXBLt4dv6Vm0XKHQwaEb+vtvtrZN73Ti8jkSCTLv
         E59AWMLh9sCK3ztS1zQ5eUAsYD08+NRj9XAC7KYK3Ty/cd6iMH5jQyYU002YuhBGrdiT
         lXVPuZnejmUaYhQN3rHqMQITYdHbpM+4dK1WXBTugNco17bbD4Lh9wYFEG6YhtJxpaY6
         FRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=462DgipZWXKeW4Bkk/lkob1uYe6oS0tY/vxkgckhdAs=;
        b=k5eudCUNv/kTPSCf4DavZxTZaAspYwWgdo2P+Vbibfh3RP1Ok5EIl/2m4zK6TRQYPq
         /U1urkFXIEuurNkaxxYImPEPw+aFoMrsMIiLhAgEzfv64wKZqpk7V+nyVBAq3omMErS6
         yHPzUeDCvMNFv/79RafFcWtNhvPc+zNsqQ1Dh6WOHoU+SegvXj8xjcYezbhwhn1cu739
         22B/qG9UYgYaWIGxnBAcMe6X00J7oV0/m6mTXHQb3YJTizx3ehDIUXBgElAy/7FHiEWW
         ILHUN854PN4kERZ/Vv/vHCP6NSReRDJzGNbLYiqpkMs7YaWDmLTqqV6zPrHh/KLEqaLT
         IGMA==
X-Gm-Message-State: AGi0PuYjdNG7UVHepalXP9Lkm3jRdEetaT9ncskjRbleDKmWIdF47ttu
        wvr0xfLvg9HOVn6IEkaNyGIFWNLT
X-Google-Smtp-Source: APiQypKq0N/xP2mWmHajaeZphpPInajOx5A2endRHkYZbTtG1YblgavCgaEcPx4d7TMt0xreasUwCg==
X-Received: by 2002:a2e:90c9:: with SMTP id o9mr10732090ljg.187.1588625711974;
        Mon, 04 May 2020 13:55:11 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id v19sm62346lfa.54.2020.05.04.13.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 13:55:11 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427103851.GB24446@kunai>
 <dc2de966-81d6-6ad5-0c51-16dd28ca4165@gmail.com>
 <20200427141922.GD3464906@ulmo> <20200427153106.GA8113@kunai>
 <e5a3dd07-97f5-29f1-974e-3037a01cc89c@gmail.com>
 <20200504154226.GA614153@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fb261f0c-157c-b97c-b58f-057b053f8444@gmail.com>
Date:   Mon, 4 May 2020 23:55:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504154226.GA614153@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

04.05.2020 18:42, Thierry Reding пишет:
> On Sat, May 02, 2020 at 05:40:35PM +0300, Dmitry Osipenko wrote:
>> 27.04.2020 18:31, Wolfram Sang пишет:
>>>
>>>> Yes, that bug should be fixed anyway. But that doesn't justify breaking
>>>> suspend/resume completely, which *is* a regression.
>>>>
>>>> Look, I'm not saying that we should drop this patch altogether. All I'm
>>>> saying is that we should postpone it so that we can: a) get suspend and
>>>> resume working again (and by doing so make sure no other suspend/resume
>>>> regressions silently creep in, because that always seems to happen when
>>>> you're not looking) and b) fix any preexisting issues without possibly
>>>> scrambling the result with this perhaps unrelated fix.
>>>>
>>>> So, again, I think the safest road forward is to back this one out for
>>>> now, fix whatever this other bug is and once suspend/resume is working
>>>> properly again we can revisit this patch based on a known-good baseline.
>>>
>>> I am with you here. I want to add that the proper fix should be
>>> developed without thinking too much about stable in the first place.
>>> *When* we have a proper working fix, then we can think about making it
>>> "more" suitable for backporting. Yet, it may also be a result that older
>>> kernels need a different solution. Or have no solution at all, in case
>>> they can't do atomic_transfers and this is needed.
>>>
>>> D'accord?
>>>
>>
>> I saw that you submitted the revert of the patches for 5.7, hopefully it
>> won't result in putting the PCIe driver problem into the back burner.
>> I'll try not to forget about these patches to resubmit them later on,
>> once the problem will be resolved :)
> 
> I can put these two patches into a local development branch to keep
> track of them. From what I said earlier, it looks like it would be fine
> to apply these if we also make that runtime PM change (i.e. drop force
> runtime PM and instead manually invoke runtime PM callbacks, which seems
> to be in line with what the PM maintainers suggest, as pointed out
> elsewhere in this thread).
> 
> How about if I put all of that into a branch and push it to linux-next
> so that we can get some broader testing? I've already run it through our
> internal test system, which, while not perfect, is the broadest system I
> am aware of, and all tests came back positive.
Will be great.

> I'm not exactly sure I see a real issue with the PCIe driver after those
> patches are applied. The regulator errors are gone (presumably because
> the regulators now do get turned off properly) and I don't observe any
> other issues.

That's probably because this I2C patch removed the "completion done
after timeout" message. You may try to re-add the message, it should pop
up on the PCIe driver's suspension. The IRQF_NO_SUSPEND flag should fix it.

My assumption was that it should be always fine handle interrupt after
timeout, and thus, the message isn't really needed. But this wasn't a
correct assumption as we see now, so it should be better to keep the
message for the debugging purposes, maybe turn it into dev_info_once().
