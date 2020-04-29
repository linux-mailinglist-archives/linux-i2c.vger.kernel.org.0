Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B83D1BE464
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 18:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgD2Qyy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Apr 2020 12:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726580AbgD2Qyx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Apr 2020 12:54:53 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B9EC03C1AE;
        Wed, 29 Apr 2020 09:54:53 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so3367531ljn.7;
        Wed, 29 Apr 2020 09:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=25HnlozkAtqEDcil+8KBg+/ajiyWX0yOHur6PlUaxL8=;
        b=NHH0Yl4/mnb5lU89cPwv5PGZIJ9G3UxS3H+S59GAHUf0w4JfPfvSCHxJ5xRg6GiN6J
         tsEeFC1IJ/BazXR5LtbdQC7u2Mzc8xFn96gIes8/BU1UB2m+5MKiyoZsvUbJG/y39rAa
         12G6WrpUvt6k5ajzH981tHhMruUg8XDzPGQR3eYiUkx6VpoiYF1xA82ybfE8AWkq3JFq
         mo02Uv5mSRlkHjdSEaW5NQ5SWqfKORMlGY+ssP9f5BN2nBT6g06TGOa5STwswLgNw4v/
         cM/sadGzxL62IubAlori2eWp2PkPT1P09tZQshRG9AosYQXT2ohv1JHB6/rzSPkhbABt
         mzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=25HnlozkAtqEDcil+8KBg+/ajiyWX0yOHur6PlUaxL8=;
        b=WvvthrqkrHSY2+tKdevcp5Xbpa7VtHqE0DC5xxtP08zlaIIO7odEgnDNHM8k1kg4HS
         2VyivapAbmzqkNvCXKGOk9irsyq7SpO1YZaGDRt8nib/IwtmmkP8C6YsT3zb/qySOzpc
         efyrhbzBtA81eRwa9DysTqrc8EqQJqdYHu9JqYXTUpxKcZNcA8rXKVPf9MLCyJY8Sttq
         DeiYTE983sr51KpHrBRU8anOlvjNuaGBE1CJ6WizQEqtUlMJH8hJRXqNHMChuTvuthc3
         2+hXKJbmchL5x0uKTaTU6kOOR9Ui7h1br9nBk/5j3YvIFFVEL1zaE9Q79aUdYetcUas8
         NDNw==
X-Gm-Message-State: AGi0PuYxx10muZ6GTvEtElYnLmKi23KjKal3lizUECE4ri+9ujnJHt/h
        RAP/0SHph9LaxEvxkSHN8yoTj3EX
X-Google-Smtp-Source: APiQypIbrC+HNGPKHu9Z6YSyrVRpKkcI/xc8rJnRacZOFpQkPgcFM9XqluxPvgVCXPOWFNikmlYO0g==
X-Received: by 2002:a05:651c:402:: with SMTP id 2mr17995390lja.192.1588179291454;
        Wed, 29 Apr 2020 09:54:51 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id x21sm2584614ljm.74.2020.04.29.09.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 09:54:50 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bd622667-9364-abfa-ad98-5ed51919ca09@gmail.com>
Date:   Wed, 29 Apr 2020 19:54:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429163020.GB3157354@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

29.04.2020 19:30, Thierry Reding пишет:
> On Wed, Apr 29, 2020 at 03:35:26PM +0300, Dmitry Osipenko wrote:
>> 29.04.2020 11:55, Thierry Reding пишет:
>> ...
>>>>> It's not "papering over an issue". The bug can't be fixed properly
>>>>> without introducing I2C atomic transfers support for a late suspend
>>>>> phase, I don't see any other solutions for now. Stable kernels do not
>>>>> support atomic transfers at all, that proper solution won't be backportable.
>>>>
>>>> Hm... on a hunch I tried something and, lo and behold, it worked. I can
>>>> get Cardhu to properly suspend/resume on top of v5.7-rc3 with the
>>>> following sequence:
>>>>
>>>> 	revert 9f42de8d4ec2 i2c: tegra: Fix suspending in active runtime PM state
>>>> 	apply http://patchwork.ozlabs.org/project/linux-tegra/patch/20191213134417.222720-1-thierry.reding@gmail.com/
>>>>
>>>> I also ran that through our test farm and I don't see any other issues.
>>>> At the time I was already skeptical about pm_runtime_force_suspend() and
>>>> pm_runtime_force_resume() and while I'm not fully certain why exactly it
>>>> doesn't work, the above on top of v5.7-rc3 seems like a good option.
>>>>
>>>> I'll try to do some digging if I can find out why exactly force suspend
>>>> and resume doesn't work.
>>>
>>> Ah... so it looks like pm_runtime_force_resume() never actually does
>>> anything in this case and then disable_depth remains at 1 and the first
>>> tegra_i2c_xfer() will then fail to runtime resume the controller.
>>
>> That's the exactly expected behaviour of the RPM force suspend/resume.
>> The only unexpected part for me is that the tegra_i2c_xfer() runtime
>> resume then fails in the NOIRQ phase.
>>
>> Anyways, again, today it's wrong to use I2C in the NOIRQ phase becasue
>> I2C interrupt is disabled. It's the PCIe driver that should be fixed.
> 
> I don't think so. Everything works perfectly fine if we fix system
> suspend/resume not to rely on pm_runtime_force_{suspend,resume}() and
> directly call the runtime suspend/resume implementations.

It should "work" only in conjunction with my I2C patch, otherwise you'll
get a spurious I2C timeout error. And it will "work" only because
interrupt is handled manually after the timeout, meaning that yours
suspending time will take few hundreds ms more.

> So can we please stop deflecting and fix the damn I2C driver. From my
> perspective we have two choices:
> 
>   1) do what I suggested above and revert the force suspend/resume patch
>      and apply the "manual" suspend/resume patch instead
> 
>   2) revert this patch and go back to the drawing board
> 
> I suspect that with 2) we'd end up back where we started and have to do
> 1) anyway.
> 
> An alternative that I'd prefer even more would be to do 2) now for v5.7
> and then we do 1) for v5.8 and give this some more soaking time.

I2C driver isn't broken, PCIe driver is. IMO.

Both yours variants are not going to be a backportable fix for the
stable kernels, they won't fix the suspended interrupt problem. What I'm
missing?
