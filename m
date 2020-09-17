Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C7026E5A1
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 21:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgIQTzI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 15:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727693AbgIQO7c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 10:59:32 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD64CC06174A;
        Thu, 17 Sep 2020 07:59:31 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id x77so2553494lfa.0;
        Thu, 17 Sep 2020 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5b+6iKz7/t1fonq7I0abGl0uRV12XzzWdSbVpQjE5Vw=;
        b=cbRL789XfnfU1Xx4aPxfYvS0BogNxW6NYyP/o+A0BzA8uAnN9kRa/ceXi062kYTW4g
         EXEuLIZjE60aRPcqgzDHis6VKgXJvFKPKWHbnIcGL7jcyEGSiG1hNA1m0LwC2C7eCZ1F
         LlrThZ8KZMCZLAjenpChvvsb15mkU6JqmcCuYM2eS5OKyiZ4PFsygb/fieSPDdTA4AvJ
         4wevfUutG6jfzO8x6cX9dpmlJE+NxAjeO+4ZRibi45FocH/5ixYF9gQZGA0OPdP5TRyl
         jNVmfG7ZRAaATTJhdtr9h0vGX3VBmQGTvfH09Q8F+qLFpDtTKWBqfvukuNPSmcL4elNY
         62jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5b+6iKz7/t1fonq7I0abGl0uRV12XzzWdSbVpQjE5Vw=;
        b=HPs612WM/pacvoFsConNrQuzbILVtFthAsuuhEWEje88a7+phMCfDdT+OXGl3JtlHZ
         7HeAcxSmSCHDxKl9FOgvjIbeBxZzbtq5IOoSCiiQdxpPF5yDUG6gIUymMzJx9bvPakL/
         sKEZs+f1eMnrroIY1SgPHDw/r8usf1YMb52L4swEjbdQQ51ldNcw6M3vyprGDinEjkf9
         0rzjDZXisyCTG1O/3CUVpC9kAvaAU7Ka3NiKWNtGVTGTnEFU2e4HkuGn8yrTF1qJK3t4
         UcznFTofSgfgx3bcLDjP5I2v/k9vGealwjxpyJDEnVsf/jLyoAR+0sdSj8eHlWIG/t28
         2Uug==
X-Gm-Message-State: AOAM530syzSbfwW8sO/YJG3+tO8euDMY+1+PcaspzysNICkjCv4hkGRD
        ICZZ/zCNafBhBiWzjfEscqFVE4osu7A=
X-Google-Smtp-Source: ABdhPJxuGPxhfyGLCIpyTeGimrwYaCFW7sgdBAiWdB9sRQBcaJSgPp5YAxdd65GGqr2xqqASiTxbfg==
X-Received: by 2002:a19:992:: with SMTP id 140mr8866749lfj.273.1600354770100;
        Thu, 17 Sep 2020 07:59:30 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id y8sm6073590ljy.107.2020.09.17.07.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 07:59:29 -0700 (PDT)
Subject: Re: [PATCH v7 08/34] i2c: tegra: Remove error message used for
 devm_request_irq() failure
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-9-digetx@gmail.com> <20200917112852.GT3515672@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0a11e836-dcc0-0fba-4da7-caf28cbcf7d6@gmail.com>
Date:   Thu, 17 Sep 2020 17:59:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917112852.GT3515672@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.09.2020 14:28, Thierry Reding пишет:
> On Wed, Sep 09, 2020 at 01:39:40AM +0300, Dmitry Osipenko wrote:
>> The error message prints number of vIRQ, which isn't a useful information.
>> In practice devm_request_irq() never fails, hence let's remove the bogus
>> message in order to make code cleaner.
>>
>> Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> I think I have seen this fail occasionally when something's wrong in the
> IRQ code, or when we are not properly configuring the IRQ in device tree
> for example.
> 
> So I'd prefer if this error message stayed here. I agree that it's not a
> terribly useful error message, so perhaps adding the error code to it
> would make it more helpful?

We have dtbs_check nowadays and I assume you only saw a such problem
during of hardware bring-up, correct?

Realistically, this error should never happen "randomly" and even if it
will happen, then you will still know that I2C driver failed because
driver-core will tell you about that.

Hence there is no much value in the error message, it should be more
practical to remove it in order to keep the code cleaner.

>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index a52c72135390..b813c0976c10 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -1807,10 +1807,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
>>  
>>  	ret = devm_request_irq(&pdev->dev, i2c_dev->irq, tegra_i2c_isr,
>>  			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), i2c_dev);
>> -	if (ret) {
>> -		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
>> +	if (ret)
>>  		goto release_dma;
>> -	}
>>  
>>  	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
>>  	i2c_dev->adapter.owner = THIS_MODULE;
>> -- 
>> 2.27.0
>>

