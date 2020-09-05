Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8672025EBAE
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 01:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728740AbgIEXKZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 19:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728680AbgIEXKY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 19:10:24 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C18C061244;
        Sat,  5 Sep 2020 16:10:23 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w3so11961110ljo.5;
        Sat, 05 Sep 2020 16:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n58POaQgMsscFkw7qF/GIhc8sgXRWn+V2ZxtlGK5da4=;
        b=ZYSEZnM+7r+JL6LpGdHfIq9KwUssDExAHQLfTwdc30/q/SVxjo0bfED3SyHnwJ31WU
         HuJ7fPg/ZZbzQWoVy/2sGgsi+1pze5aRHAOsb4UhlCyw3D7vadvdPyLWfqesnd9iTLNb
         JHUGZDhcrA1EPLOR8Z3VIDZmvlhZ5A8ZiiMXKobiC8ed3Fk2iTM2jpPIkvrDqK9p9xP8
         uNRW8GV49QaLjFwau+E853sUf9aLiPtevj7pu0AYeEOWzqzpOGyXAkmCJtBuO6+JUxLQ
         g1z2sIQvOIAc1+TcDOOjhmBpeMN9gh5/lrYyXeV8wtQTvoLDjp0HjyY4V/dU/sr5Aehw
         K52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n58POaQgMsscFkw7qF/GIhc8sgXRWn+V2ZxtlGK5da4=;
        b=ujC0BJV1VqX8QRaNG8dzAlskZCEhtlQ6foQKI0nll3bllx+LbqMZ8lJsNdFzZhueCB
         i0Xln2A9nMGI/fVvT55bNfqYeMzieCumIr9+HE3LopX03DeJRXsbeXhz1KWci9J+sepy
         h//DjZ+FgqRPbNBNyXK5EeAbAOZIMcydsYpnaUZQQoz2+i5fEeZlH4YSSYS2Jt+YRgpx
         sjOBwxKzT2gxS7RBa17APIQpRWy0kxPKh+3Z4IsXwiXuYQzE394WgV1GrPG3GEuEia81
         SLb55CE85ADykWlp3H6cpBYt0GdhUvkRdj6YE69P/gOeUM183BoSNHbwyIt55nEQ6+dg
         Qifg==
X-Gm-Message-State: AOAM530YNTP6p8/lmeqqs6xVjxRvLPr2bRBULIttCJ0Ly8lNm0bRqg3P
        SPMzRWIfmH41oSy3tUePrNj4kCEKH6A=
X-Google-Smtp-Source: ABdhPJykAb3ABh21Mzg5NvXGbSEv5J6ceUnUEHOz4xM606C8Qrf0bgCEGJr4OhrQSM1QHZgRQ3SnBA==
X-Received: by 2002:a2e:8684:: with SMTP id l4mr1406906lji.180.1599347421791;
        Sat, 05 Sep 2020 16:10:21 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id g15sm2540686ljj.39.2020.09.05.16.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 16:10:21 -0700 (PDT)
Subject: Re: [PATCH v4 11/31] i2c: tegra: Factor out runtime PM and hardware
 initialization
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200905204151.25343-1-digetx@gmail.com>
 <20200905204151.25343-12-digetx@gmail.com>
 <20200905221042.GB18554@qmqm.qmqm.pl>
 <350949de-00ee-a664-d979-fd47803a80e4@gmail.com>
 <20200905225153.GF18554@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b28d8ec1-22d5-74f4-d8cf-c3881474a624@gmail.com>
Date:   Sun, 6 Sep 2020 02:10:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905225153.GF18554@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

06.09.2020 01:51, Michał Mirosław пишет:
> On Sun, Sep 06, 2020 at 01:24:14AM +0300, Dmitry Osipenko wrote:
>> 06.09.2020 01:10, Michał Mirosław пишет:
>>> On Sat, Sep 05, 2020 at 11:41:31PM +0300, Dmitry Osipenko wrote:
>>>> Factor out runtime PM and hardware initialization into separate function
>>>> in order have a cleaner error unwinding in the probe function.
>>> [...]
>>>> +	ret = tegra_i2c_init_runtime_pm_and_hardware(i2c_dev);
>>> [...]
>>>
>>> This one doesn't improve the code for me. The problems are: 1) putting two
>>> unrelated parts in one function, 2) silently reordered initialization.
>>
>> The hardware initialization depends on the resumed RPM and the rest of
>> the probe function doesn't care about the RPM. I don't quite understand
>> why you're saying that they are unrelated, could you please explain?
>>
>> The DMA/RPM initialization is intentionally reordered in order to clean
>> up the error handling, like the commit message says. To me it's a clear
>> improvement :)
> 
> Ok, then wouldn't it be enough to just move this part in the probe()?
> A sign of a problem for me is how much information you had to put in
> the name of the new function.

Looking at it again now, I think you're right. I also now noticed that
the RPM isn't disabled now if tegra_i2c_init() fails.

I'll try to take another look, but probably will lean to yours variant
in the v5. Thanks!
