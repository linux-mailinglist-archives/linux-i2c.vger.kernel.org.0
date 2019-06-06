Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3148537816
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 17:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729191AbfFFPe7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 11:34:59 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37097 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729185AbfFFPe7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 11:34:59 -0400
Received: by mail-lj1-f195.google.com with SMTP id 131so2485052ljf.4;
        Thu, 06 Jun 2019 08:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CNzuT4B+gj0fca3L+CBElR5BCGQz7D37R5CsfOS0R5U=;
        b=VWscwD+f7KttjezbVWzpZtP1ZvHaxYlbphCgYRA7iz58igJeZyW24ly4jyIogAH0Uw
         SHrCD9VcA1bnc0g4lDBUhiArGjnOKqINogD2cGRbqydhHmnbOt/9FOVwptsK9Ts/EDtM
         vDeCBMXacEKgoIZrgg06bMgL6XwQiMlNa6OYNbARX2UOEv9qlrzo91Z0ocO6b9jNToYz
         bk9kivBv6638oKvzKIlHqdQFNM0fpg9+4i4hwoRfSp3YM5699DWdG248k1ySlPOe+zy8
         uVede+6ARmkEQwT4pDGyhUevnkhKW36zKI80lgtHM1ZzG3Repouf0aKJO1Ff4gS7RXBF
         mv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CNzuT4B+gj0fca3L+CBElR5BCGQz7D37R5CsfOS0R5U=;
        b=Gh74JyOWZ7yCfR8bCvvK+yG8e4qIhyBMqG2WYcE0NascSTzLcWy5BpPO0K/jROuPVH
         GEOfWVbU17mVAiDCKQs/4sVNDkCczWAGIyuBjfrTDuJ1ngGELMBmd7w7xG+3cjKIGbgT
         lnE7pJN24qH0wssvvCqun93wPmlF4yjWeg6Id/kVJmdiPcHB+l3dazF/stuXWzEDtxx8
         241Hwid/grhqPPrUeSgTWXQgsMNvrwA0sVN5R1cFvOaJgNKqD0c9cGnvIMiUTpNwM0Ru
         jL98ob5bW70YgT8jHtlwiilss+TWQaFp1GQ3M7XLxE6WEe2zEeuvHYQ3DFWuEB/LdVyD
         6/Aw==
X-Gm-Message-State: APjAAAXikuLb3n0lOH5R9D2Ap9GCWNGP1H6gER4K3cPSfroFivw3P0DH
        2za24uaqeQUKhcr9CwAbS0s=
X-Google-Smtp-Source: APXvYqycnx3S37BNA7DJjEmd/qBgfJr+RwE4m5dx1DAhWLvIzmnhmE5vqjakjfMRNCOKq5AfjVegUw==
X-Received: by 2002:a2e:988b:: with SMTP id b11mr10513015ljj.85.1559835296660;
        Thu, 06 Jun 2019 08:34:56 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id z12sm343409lfe.2.2019.06.06.08.34.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 08:34:55 -0700 (PDT)
Subject: Re: [PATCH V2] i2c: busses: tegra: Add suspend-resume support
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559800475-5446-1-git-send-email-bbiswas@nvidia.com>
 <bf93e88f-cbed-3bb0-223a-74ad0b08aa9e@gmail.com>
 <5871f51b-11d4-8bc9-6f40-4a91f2aab8f8@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3d4ea007-e289-6b52-5321-68a7399e62d7@gmail.com>
Date:   Thu, 6 Jun 2019 18:34:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5871f51b-11d4-8bc9-6f40-4a91f2aab8f8@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

06.06.2019 16:58, Bitan Biswas пишет:
> 
> 
> On 6/6/19 5:06 AM, Dmitry Osipenko wrote:
>> 06.06.2019 8:54, Bitan Biswas пишет:
>>> Post suspend I2C registers have power on reset values. Before any
>>> transfer initialize I2C registers to prevent I2C transfer timeout
>>> and implement suspend and resume callbacks needed. Fix below errors
>>> post suspend:
>>>
>>> 1) Tegra I2C transfer timeout during jetson tx2 resume:
>>>
>>> [   27.520613] pca953x 1-0074: calling pca953x_resume+0x0/0x1b0 @
>>> 2939, parent: i2c-1
>>> [   27.633623] tegra-i2c 3160000.i2c: i2c transfer timed out
>>> [   27.639162] pca953x 1-0074: Unable to sync registers 0x3-0x5. -110
>>> [   27.645336] pca953x 1-0074: Failed to sync GPIO dir registers: -110
>>> [   27.651596] PM: dpm_run_callback(): pca953x_resume+0x0/0x1b0
>>> returns -110
>>> [   27.658375] pca953x 1-0074: pca953x_resume+0x0/0x1b0 returned -110
>>> after 127152 usecs
>>> [   27.666194] PM: Device 1-0074 failed to resume: error -110
>>>
>>> 2) Tegra I2C transfer timeout error on jetson Xavier post resume.
>>>
>>> Remove i2c bus lock-unlock calls in resume callback as
>>> i2c_mark_adapter_*
>>> (suspended-resumed) help ensure i2c core calls from client are not
>>> executed before i2c-tegra resume.
>>>
>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>> ---
>>>   drivers/i2c/busses/i2c-tegra.c | 23 +++++++++++++++++++++++
>>>   1 file changed, 23 insertions(+)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>> b/drivers/i2c/busses/i2c-tegra.c
>>> index ebaa78d..76b7926 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -1687,7 +1687,30 @@ static int tegra_i2c_remove(struct
>>> platform_device *pdev)
>>>   }
>>>     #ifdef CONFIG_PM_SLEEP
>>> +static int tegra_i2c_suspend(struct device *dev)
>>> +{
>>> +    struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>>> +
>>> +    i2c_mark_adapter_suspended(&i2c_dev->adapter);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int tegra_i2c_resume(struct device *dev)
>>> +{
>>> +    struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>>> +    int ret;
>>> +
>>> +    ret = tegra_i2c_init(i2c_dev, false);
>>> +    if (ret)
>>> +        return ret;
>>
>> We're expecting that tegra_i2c_init returns a error code on a failure
>> and nothing else, hence it will be a bit more expressive to name the
>> returned variable as "err". There is nothing wrong with yours variant,
>> this is just a very minor recommendation from me. Please note that a bit
>> more wise choice of the names makes easier to follow the code for other
>> people and hence results in a cleaner code.
> Agreed.
> 
>>
>>> +
>>> +    i2c_mark_adapter_resumed(&i2c_dev->adapter);
>>
>> Please add a blank line here for a better readability and to make the
>> patch consistent. You added the blank line in a similar case of
>> tegra_i2c_suspend() and this makes it inconsistent.
>>
> OK.
> 
>>> +    return 0;
>>> +}
>>> +
>>>   static const struct dev_pm_ops tegra_i2c_pm = {
>>> +    SET_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend, tegra_i2c_resume)
>>>       SET_RUNTIME_PM_OPS(tegra_i2c_runtime_suspend,
>>> tegra_i2c_runtime_resume,
>>>                  NULL)
>>>   };
>>>
> I shall send updated patch with suggested changes.

Yes, please.
