Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D594325FD0A
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 17:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730079AbgIGP1D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 11:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730163AbgIGP01 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 11:26:27 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2567C061573;
        Mon,  7 Sep 2020 08:25:49 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id t23so16587234ljc.3;
        Mon, 07 Sep 2020 08:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vxm2Igun/q6T7+g3CyW4TzjR0caFh2BccAiRyp7KFRc=;
        b=XQhMAxv5UsGUTaP2gmJE18daXqUxUWTx2Ljtg8zGmSkHctgKcSN68V1y/EygGunyym
         gKF4d3Rya/8NfaXPXpDOMeW8So24G35TLf46QaibDfcj2qDulM9B3FfL7WTv5QwL7/k3
         4/6/8eacW42A74NZX1FYbAJ0B37aZrW2SqitpKsiOvUdEKxmFrGoCPp+HnR2+EfXQVyF
         Nwbb4P/ZFcj71iYr41v7z4AunCZkuH0mhk2ZLL9yjnxqgxStDRNncccchlKFL+CnRWfa
         wHLnyklBYHXxYBEhro3Mv81hQvr2ArNt2Jx8uS+jmb7xLvT1REOoXsi+G9B1UHRV8iPa
         P8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vxm2Igun/q6T7+g3CyW4TzjR0caFh2BccAiRyp7KFRc=;
        b=jGLHRR8N5MYe2k2myM4Qzpicz3ukWOx7t46iETPfwxhD1cDQq12FOeAT9B+XbN6kVt
         x/MtyvJrCCfiTkM8tefPaXUESDtiYwz1QrPw3dBeiVJ5IhKwECjv1Kk//QwZc7XR27Cd
         5/2Xb9kUeuEcbNNydywvYnsuIf8Qzsd0Iic2gpNibJsWEBOhgQoe0m+iYs+pDQ0RiM7S
         wXpv5HmFcXwsMSvpudKs7/mAB7yQz00JCNBw6YKxboTc58HWTySPfEZM8NBkXJcLt2bG
         FErLtdIxeeG+v4Zba9mwHQVamEQZg5os6fSeHdt45kG1YvHugTF5/ncbmLqct6pi3wNz
         3wgQ==
X-Gm-Message-State: AOAM53341QDDjBKwjHGElsXaLVZ/569yIC4TByZnAE4fGf37sp7aBwvN
        MqN2H0me1na6Q8K9TPKhJOxKxUuJLnY=
X-Google-Smtp-Source: ABdhPJz0H0iTo6lShlk9NFmHJSQJCBX4QEcBRHy/X8PPCY4GZ5/vdmdtv+ropjfF4ZPboEYRwdCS5A==
X-Received: by 2002:a2e:3013:: with SMTP id w19mr2709739ljw.339.1599492348213;
        Mon, 07 Sep 2020 08:25:48 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id x17sm7267990lja.10.2020.09.07.08.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 08:25:47 -0700 (PDT)
Subject: Re: [PATCH v5 06/36] i2c: tegra: Runtime PM always available on Tegra
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200906185039.22700-1-digetx@gmail.com>
 <20200906185039.22700-7-digetx@gmail.com>
 <CAHp75VevXe3c2LGF3jZyDfvPpRAz+-GQKvXEO4OKvuur=RgXCQ@mail.gmail.com>
 <f9ec5178-e38e-ed9a-25f8-21e53ccd31d1@gmail.com>
 <CAHp75Vdj7HYN0SWt9StqB8K6JrUCk7dtDhAUwYDkkBXc1R8ueg@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c76f64c8-bd46-36f0-edb4-3ddca281a72b@gmail.com>
Date:   Mon, 7 Sep 2020 18:25:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vdj7HYN0SWt9StqB8K6JrUCk7dtDhAUwYDkkBXc1R8ueg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

07.09.2020 18:05, Andy Shevchenko пишет:
> On Mon, Sep 7, 2020 at 5:32 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>> 07.09.2020 11:10, Andy Shevchenko пишет:
>>> On Sun, Sep 6, 2020 at 9:51 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>>>
>>>> The runtime PM is guaranteed to be always available on Tegra after commit
>>>> 40b2bb1b132a ("ARM: tegra: enforce PM requirement"). Hence let's remove
>>>> all the RPM-availability checking and handling from the code.
>>>
>>>> +       ret = pm_runtime_get_sync(i2c_dev->dev);
>>>> +       if (ret < 0) {
>>>> +               dev_err(dev, "runtime resume failed\n");
>>>> +               goto disable_rpm;
>>>
>>> As in the original code here is a refcount leak.
>>> Should call pm_runtime_put_noidle(). (Possible to use goto put_rpm;
>>> but in that case the code a bit confusing to the reader)
>>
>> Good point! I already forgot about this RPM API problem! I'll add a
>> patch to address this.
>>
>> Would be great if anyone could put effort into changing the default
>> get_sync() behaviour and add get_sync_nofail(). Otherwise this will be a
>> never ending problem.
> 
> I didn't get this. For time being the API (yes, with its all cons) has
> the clear usage:
> a) don't check for errors -- you are fine
> b) if you start checking errors, keep in mind refcounting.
> 
> So, I don't see how nofail() can fix b) case.
> 

It's a very unintuitive behaviour which none of other APIs have. I would
never expect the refcount to be bumped in a case of error, this is a
clear drawback of the API, IMO. Perhaps this is not seen as a problem by
people who have excellent memory and can easily remember about existence
of such non-standard quirks, or by people who're touching the RPM code
frequently.
