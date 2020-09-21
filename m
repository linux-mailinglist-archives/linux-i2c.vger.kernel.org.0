Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFA1272AF7
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 18:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgIUQFZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 12:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgIUQFZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 12:05:25 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F64C061755;
        Mon, 21 Sep 2020 09:05:25 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id b19so11553964lji.11;
        Mon, 21 Sep 2020 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RJtNmWqWvqKJ3Qu069D++R1P55oJ4cpgeozxeJ7Xo/E=;
        b=CfVHB4O35RJP619hIcrfmDiKT3RnqgkbikSKp4SaOwg8Q7w0LMO6bVLADfk+uWbTfy
         kf555m5ENw9444Y/usIKs2u96wRuHNV8tRBLacwfdysEF8TnEFb8LoDbtqzmox45i2Le
         FFnS4+deOfGVBtc3PexnP6d8BWf1KfE7GBitTtDd6iREOJ4k9nJbJ33ddP4QTgh0ancZ
         skjWxvZ2AfEzlUARmsViARVve45YisdOBJGB/+eYnW2akh0QsBiWTU0ErRVbGiErXJFR
         wm0+TBFwkJrbL2ODgZvXNaTFkIcmorilVmxsQBlaGywqrk8oAWkfbakHX2YFGhfv+gVf
         OsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RJtNmWqWvqKJ3Qu069D++R1P55oJ4cpgeozxeJ7Xo/E=;
        b=KX9YpIXQaUCLyT787slDjo3Co1RYAdaIqA3KlGlwSPvt96WX3SgAG9twWA8ro1wyYY
         GliSvxC40kRRjitaCx/luAhCFOMFUzNZCfujpLhmocc/YT+pWZnZkFTqCRFZHq63FO7b
         sxhRhiQLB2Vpf/EqswFUYOnMMknLQDB1mvWcyEhz/8vTczIZ9k166fDU4oRzq7NgpKg3
         0aM2KhZxv+2abiwWJel9e4tK7Tb0kQjPzuI708/zxNbHUa8Ugf02t0LOeU7lhtXLXVJH
         7+ynTcm+cUceciUFxvAyJakAzeKd7bZCDDwJ0bTh25r9TM+CJEqbydQtIQxBSkTSgY/2
         fb/g==
X-Gm-Message-State: AOAM531IcLtuHSH+wnUW7IQDAZsL2a3qoRJShJHeuq5cYq9C1r052FK2
        fFA4DvHzI4uXkfQtVfQPLG30x48BgJ4=
X-Google-Smtp-Source: ABdhPJxipAy85PMM8vo5rg0kpML/cnww40xLT7eCd9xDrS/1/Jse3vA/lnMFAVFYQH9NkmCi35Pfhw==
X-Received: by 2002:a05:651c:554:: with SMTP id q20mr141320ljp.348.1600704323159;
        Mon, 21 Sep 2020 09:05:23 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id y9sm2835881ljc.122.2020.09.21.09.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 09:05:22 -0700 (PDT)
Subject: Re: [PATCH v7 30/34] i2c: tegra: Clean up variable names
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-31-digetx@gmail.com> <20200917122105.GI3515672@ulmo>
 <49498b9c-3b75-ad97-1859-5d6442b27b0c@gmail.com>
 <20200921114059.GM3950626@ulmo>
 <633d8e6e-d50c-a7cb-5cdf-f0547b94a86d@gmail.com>
 <20200921155052.GA3991813@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <00f7eafe-cb15-3ab9-4b84-aa6349246a63@gmail.com>
Date:   Mon, 21 Sep 2020 19:05:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921155052.GA3991813@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

21.09.2020 18:50, Thierry Reding пишет:
> On Mon, Sep 21, 2020 at 06:18:59PM +0300, Dmitry Osipenko wrote:
>> 21.09.2020 14:40, Thierry Reding пишет:
>>> On Thu, Sep 17, 2020 at 06:43:28PM +0300, Dmitry Osipenko wrote:
>>>> 17.09.2020 15:21, Thierry Reding пишет:
>>>>> On Wed, Sep 09, 2020 at 01:40:02AM +0300, Dmitry Osipenko wrote:
>>>>>> Rename "ret" variables to "err" in order to make code a bit more
>>>>>> expressive, emphasizing that the returned value is an error code.
>>>>>> Same vice versa, where appropriate.
>>>>>>
>>>>>> Rename variable "reg" to "val" in order to better reflect the actual
>>>>>> usage of the variable in the code and to make naming consistent with
>>>>>> the rest of the code.
>>>>>>
>>>>>> Use briefer names for a few members of the tegra_i2c_dev structure in
>>>>>> order to improve readability of the code.
>>>>>>
>>>>>> All dev/&pdev->dev are replaced with i2c_dev->dev in order to have uniform
>>>>>> code style across the driver.
>>>>>>
>>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>>> ---
>>>>>>  drivers/i2c/busses/i2c-tegra.c | 173 ++++++++++++++++-----------------
>>>>>>  1 file changed, 86 insertions(+), 87 deletions(-)
>>>>>
>>>>> That's indeed a nice improvement. One thing did spring out at me,
>>>>> though.
>>>>>
>>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>>>> [...]
>>>>>> @@ -1831,20 +1830,20 @@ static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
>>>>>>  
>>>>>>  	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
>>>>>>  
>>>>>> -	return pinctrl_pm_select_idle_state(i2c_dev->dev);
>>>>>> +	return pinctrl_pm_select_idle_state(dev);
>>>>>>  }
>>>>>>  
>>>>>>  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>>>>>>  {
>>>>>>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>>>>>> -	int err = 0;
>>>>>> +	int ret = 0;
>>>>>>  
>>>>>>  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
>>>>>>  
>>>>>>  	if (!pm_runtime_status_suspended(dev))
>>>>>> -		err = tegra_i2c_runtime_suspend(dev);
>>>>>> +		ret = tegra_i2c_runtime_suspend(dev);
>>>>>>  
>>>>>> -	return err;
>>>>>> +	return ret;
>>>>>>  }
>>>>>
>>>>> Isn't this exactly the opposite of what the commit message says (and the
>>>>> rest of the patch does)?
>>>>
>>>> This change makes it to be consistent with the rest of the code. You may
>>>> notice that "Factor out hardware initialization into separate function"
>>>> made a similar change.
>>>>
>>>> The reason I'm doing this is that the "err" suggests that code returns a
>>>> error failure code, while it could be a success too and you don't know
>>>> for sure by looking only at the part of code. Hence it's cleaner to use
>>>> "err" when error code is returned.
>>>
>>> I don't follow that reasoning. Every error code obviously also has a
>>> value for success. Otherwise, what's the point of even having a function
>>> if all it can do is fail. Success has to be an option for code to be any
>>> useful at all, right?
>>>
>>> The "err" variable here transports the error code and if that error code
>>> happens to be 0 (meaning success), why does that no longer qualify as an
>>> error code?
>>
>> If you're naming variable as "err", then this implies to me that it will
>> contain a error code if error variable is returned directly. Error
>> shouldn't relate to a success. In practice nobody pays much attention to
>> variable naming, so usually there is a need to check what code actually
>> does anyways. I don't care much about this and just wanting to make a
>> minor improvement while at it.
> 
> Oh... I think I get what you're trying to do here now. You're saying
> that we may be storing a positive success result in this variable and
> therefore it would be wrong to call it "error", right?
> 
> And I always thought I was pedantic... =)
> 
> The way I see it, any success value can still be considered an error
> code. Typically you either propagate the value immediately for errors or
> you just ignore it on success. In that case, keeping it in a variable a
> bit beyond the assignment isn't a big issue. What matters is that you
> don't use it. There are some exceptions where this can look weird, such
> as:
> 
> 	err = platform_get_irq(pdev, 0);
> 	if (err < 0)
> 		return err;
> 
> 	chip->irq = err;
> 
> Although I think that's still okay and can be useful for example if
> chip->irq is an unsigned int, and hence you can't do:
> 
> 	chip->irq = platform_get_irq(pdev, 0);
> 	if (chip->irq < 0)
> 		return chip->irq;
> 
> My main gripe with variables named "ret" or "retval" is that I often see
> them not used as return value at all. Or the other extreme is that every
> variable is at some point a return value if it stores the result of a
> function call. So I think "ret" is just fundamentally a bad choice. But
> I also realize that that's very subjective.
> 
> Anyway, I would personally lean towards calling all these "err" instead
> of "ret", but I think consistency trumps personal preference, so I would
> not object to "ret" generally. But I think it's a bit extreme to use err
> everywhere else and use "ret" only when we don't immediately return the
> error code because I think that's just too subtle of a difference to
> make up for the inconsistency.
> 
> On the other hand, we've spent way too much time discussing this, so
> just pick whatever you want:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 

Thanks, I'll change it to make tegra_i2c_suspend() to use the same style
as tegra_i2c_resume() uses, which should be the best option in this case.
