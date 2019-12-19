Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2A2612710A
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2019 23:58:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbfLSW6k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Dec 2019 17:58:40 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34701 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbfLSW6k (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Dec 2019 17:58:40 -0500
Received: by mail-lj1-f194.google.com with SMTP id z22so3181331ljg.1;
        Thu, 19 Dec 2019 14:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=05wfn9+TUSy7NYQlatYLcdJC1LAk6czw1l0SEy3BnBM=;
        b=uq3aCwuXNTvs1Z7urtnH/xXXPfL0+UQgebjSWUJbEtLZPPAfRA1I9f4CM5rqUo8ZeS
         KJmSLSwYE8Eqhuz8/U15hSUx037u2NDz56F5S2xceo36AbCEqwLsFSI8UFx69OMMYrPD
         aO6iOg0qug2GO86J0PxS4fgWFEtdA4ynb5S2FV18VTPtvTPpEH15pkDw/HEDMUS4ToH2
         xzMS4v4IreNILxLlSdOhE0HVq+EMop6LYAm026kqTS/ZHq7oKs6QPb4tEM97uIEwVOms
         wYYcWz2QrsKz2envYnOz3KGbwAjILypsIgT/gejvjjaaBNuiFzWntAi1qkPj0OjP3fJY
         wj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=05wfn9+TUSy7NYQlatYLcdJC1LAk6czw1l0SEy3BnBM=;
        b=EcQkyF/70wdTMzbnsGnvl/2b5mUBzCmBLK3zJ/tcnjr/ZgIhYaSxFSJLIkwuKOrgSD
         +/RvKJnHAxRzzwsgreNGDx6tx7WoTqTo/DzMSnOOXqtvdjuWiNw/CLINOPhCAQZANaq5
         owgslrjY8Td6IR9vCIrCr5KEwydAw0Vlb14FqMGzX2hgY37gQTtK7sErmCIRbxMwLON3
         RZLfxBnZElsM9EoPMnvg9m1Sc7GIKEbZqGneYmPHtoi6n7YJvJEQcah+AQ22X8OAsyqw
         /wpa1Oa4QSJnRNObwBEmfVPEHVH2SISvqYGT9Hn0Dc4jTqIA5tbFpkFyEIsTbxJCiWIx
         CMog==
X-Gm-Message-State: APjAAAUiNpTx6neTEShhmj7I8dbt7GAaOU3QaAZYlaTWFPxcW2vN9dk0
        COgGD4WM3Rcsg7OJ6plKBSQqXPaL
X-Google-Smtp-Source: APXvYqyKgsgJ0jeESPN6s86pHb00fv9io13kzziQeW9BJOOZwuY3AHj8qNv70eMNewx8KVRjTTwYAQ==
X-Received: by 2002:a2e:9f47:: with SMTP id v7mr7577083ljk.124.1576796318332;
        Thu, 19 Dec 2019 14:58:38 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id q186sm3547142ljq.14.2019.12.19.14.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2019 14:58:37 -0800 (PST)
Subject: Re: [PATCH v1 3/3] i2c: tegra: Fix suspending in active runtime PM
 state
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-4-digetx@gmail.com> <20191213134746.GA222809@ulmo>
 <3c2b16c0-3e66-d809-b263-f27cf925e203@gmail.com>
 <1ed725c9-361b-c920-d532-dd640c3ca59f@gmail.com>
Message-ID: <1ff337b4-b4e9-4f16-44d5-9e89f88dd61f@gmail.com>
Date:   Fri, 20 Dec 2019 01:58:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1ed725c9-361b-c920-d532-dd640c3ca59f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

13.12.2019 21:01, Dmitry Osipenko пишет:
> 13.12.2019 17:04, Dmitry Osipenko пишет:
>> 13.12.2019 16:47, Thierry Reding пишет:
>>> On Fri, Dec 13, 2019 at 02:34:28AM +0300, Dmitry Osipenko wrote:
>>>> I noticed that sometime I2C clock is kept enabled during suspend-resume.
>>>> This happens because runtime PM defers dynamic suspension and thus it may
>>>> happen that runtime PM is in active state when system enters into suspend.
>>>> In particular I2C controller that is used for CPU's DVFS is often kept ON
>>>> during suspend because CPU's voltage scaling happens quite often.
>>>>
>>>> Note: we marked runtime PM as IRQ-safe during the driver's probe in the
>>>> "Support atomic transfers" patch, thus it's okay to enforce runtime PM
>>>> suspend/resume in the NOIRQ phase which is used for the system-level
>>>> suspend/resume of the driver.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/i2c/busses/i2c-tegra.c | 9 +++++++++
>>>>  1 file changed, 9 insertions(+)
>>>
>>> I've recently discussed this with Rafael in the context of runtime PM
>>> support in the Tegra DRM driver and my understanding is that you're not
>>> supposed to force runtime PM suspension like this.
>>>
>>> I had meant to send out an alternative patch to fix this, which I've
>>> done now:
>>>
>>> 	http://patchwork.ozlabs.org/patch/1209148/
>>>
>>> That's more in line with what Rafael and I had discussed in the other
>>> thread and should address the issue that you're seeing as well.
>>
>> Well, either me or you are still having some misunderstanding of the
>> runtime PM :) To my knowledge there are a lot of drivers that enforce
>> suspension of the runtime PM during system's suspend, it should be a
>> right thing to do especially in a context of the Tegra I2C driver
>> because we're using asynchronous pm_runtime_put() and thus at the time
>> of system's suspending, the runtime PM could be ON (as I wrote in the
>> commit message) and then Terga's I2C driver manually disables the clock
>> on resume (woopsie).
> 
> Actually, looks like it's not the asynchronous pm_runtime_put() is the
> cause of suspending in active state. I see that only one of three I2C
> controllers is suspended in the enabled state, maybe some child (I2C
> client) device keeps it awake, will try to find out.
> 
>> By invoking pm_runtime_force_suspend() on systems's suspend, the runtime
>> PM executes tegra_i2c_runtime_suspend() if device is in active state. On
>> system resume, pm_runtime_force_resume() either keeps device in a
>> suspended state or resumes it, say if for userspace disabled the runtime
>> PM for the I2C controller.
>>
>> Rafael, could you please clarify whether my patch is doing a wrong thing?

[snip]

I'm now thinking that it will be not very worthwhile to spend time on
trying to understand why runtime PM isn't working as expected here. It
will be better to simply remove runtime PM from the I2C driver because
it is used only for clock-gating/pinmuxing and it is a very light
operation in comparison to I2C transfer performance. Thus it should be
better to avoid the runtime PM overhead by enabling/disabling the I2C
clocks before/after the transfer, I think that's what driver did before
the runtime PM addition.

Thierry / Jon / Mikko, any objections?
