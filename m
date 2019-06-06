Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF7137371
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 13:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727325AbfFFLw3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jun 2019 07:52:29 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36881 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbfFFLw3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jun 2019 07:52:29 -0400
Received: by mail-lf1-f68.google.com with SMTP id m15so1325055lfh.4;
        Thu, 06 Jun 2019 04:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zPLkA/L+MT2tb0YKXYeABZbn8ju7XPPpKF8Cm5YcWwY=;
        b=SMis4RP11BWLAtEAe/AcVwMHUFdHYhwm4lgqJj0zCFzDFTUR7sVzRouZ3qKXRmUYja
         paWnrgCl3cj4x8z7kACumI+8hKt8DF/heg1hG78OwcUf+kh8PwF8tq1byYJX08dsJv3X
         QntZqBkewrE/dYemVY1O7w4uzEcagcyrOvUwZXu8mO0PiIYvDkXzxMFXvQ9M8M/3+tTL
         YtLrwo1tl9cfMvGORPD/ehP2dTXD5hz5SwwV4dFwNsGbK1ebEq4nRpeMhGzp3OVR7sLU
         GRlSDfhjgCV53vo1/T5fuYezWkQAgNFknivUQoNm9rzG0kQ/jRPvIPnz6jvjNW+XGsgI
         ukeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zPLkA/L+MT2tb0YKXYeABZbn8ju7XPPpKF8Cm5YcWwY=;
        b=pK9tNXdSLK1mQf0p5OHLhoRf1SCRbl/UaVjeXkZ58rLV+HYrBuxjmlpBJ/KVw1esFp
         VwSkIZgvzUOTeaBGb5D+p9751jxiqPx/iaT908yi/oqXGHMxV7Ne+ULCI/dS0auRoxHc
         lQd6zEcyyGxAXIbB0AGwks4ObxhmELFu2JTfRjscYa00V7a0hTtzivzkclCKILCwOJcq
         Fw9cjzzn/495eS42EbzNcAUSR7cVdHUERuVXz60g6g7JOlU2RBO9rU6uLmi6JKVJ5yx3
         cdcDBT6dVSiDOuYnBBn5CKV4MW60wWJgi68lOrCzMDjp8TblMHBvryln9x+mreglvj+n
         6CNQ==
X-Gm-Message-State: APjAAAWPRLCM8iXqQeOVw4HLaXIhZFcY3XI5SNoEK/t+/Qea9UYy7RGQ
        2cW4F41RKVyUHxb2OxfEOuQ=
X-Google-Smtp-Source: APXvYqzmyOkZXWN5lfsLPAhrNTYEgiBO+5rUSrFZxFIShj+qXgIAvp9nzbLNM129xeNZKqbYHpi8hw==
X-Received: by 2002:ac2:5922:: with SMTP id v2mr23366649lfi.180.1559821946588;
        Thu, 06 Jun 2019 04:52:26 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id e19sm309810ljj.62.2019.06.06.04.52.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 04:52:25 -0700 (PDT)
Subject: Re: [PATCH V1] i2c: busses: tegra: Add suspend-resume support
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1559195718-6693-1-git-send-email-bbiswas@nvidia.com>
 <c8bad04b-67ef-bcdf-04df-4aa61271e81c@gmail.com>
 <9142282b-ab76-53a0-13ce-c43b8adc575f@nvidia.com>
 <4f14a218-332c-0263-c6c5-73a13b2446f0@gmail.com>
 <caa17a53-6f29-411b-9a84-58ff019752ff@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d5803f1d-0895-08b8-4851-cd8afad830c6@gmail.com>
Date:   Thu, 6 Jun 2019 14:52:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <caa17a53-6f29-411b-9a84-58ff019752ff@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

06.06.2019 8:43, Bitan Biswas пишет:
> 
> 
> On 5/31/19 5:43 AM, Dmitry Osipenko wrote:
>> 31.05.2019 11:50, Bitan Biswas пишет:
>>>
>>>
>>> On 5/30/19 4:27 AM, Dmitry Osipenko wrote:
>>>> 30.05.2019 8:55, Bitan Biswas пишет:
>>>>> Post suspend I2C registers have power on reset values. Before any
>>>>> transfer initialize I2C registers to prevent I2C transfer timeout
>>>>> and implement suspend and resume callbacks needed. Fix below errors
>>>>> post suspend:
>>>>>
>>>>> 1) Tegra I2C transfer timeout during jetson tx2 resume:
>>>>>
>>>>> [   27.520613] pca953x 1-0074: calling pca953x_resume+0x0/0x1b0 @
>>>>> 2939, parent: i2c-1
>>>>> [   27.633623] tegra-i2c 3160000.i2c: i2c transfer timed out
>>>>> [   27.639162] pca953x 1-0074: Unable to sync registers 0x3-0x5. -110
>>>>> [   27.645336] pca953x 1-0074: Failed to sync GPIO dir registers: -110
>>>>> [   27.651596] PM: dpm_run_callback(): pca953x_resume+0x0/0x1b0
>>>>> returns -110
>>>>> [   27.658375] pca953x 1-0074: pca953x_resume+0x0/0x1b0 returned -110
>>>>> after 127152 usecs
>>>>> [   27.666194] PM: Device 1-0074 failed to resume: error -110
>>>>>
>>>>> 2) Tegra I2C transfer timeout error on jetson Xavier post resume.
>>>>>
>>>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>>>> ---
>>>>>    drivers/i2c/busses/i2c-tegra.c | 24 ++++++++++++++++++++++++
>>>>>    1 file changed, 24 insertions(+)
>>>>>
>>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>>>> b/drivers/i2c/busses/i2c-tegra.c
>>>>> index ebaa78d..f6a377f 100644
>>>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>>>> @@ -1687,9 +1687,33 @@ static int tegra_i2c_remove(struct
>>>>> platform_device *pdev)
>>>>>    }
>>>>>      #ifdef CONFIG_PM_SLEEP
>>>>> +static int tegra_i2c_suspend(struct device *dev)
>>>>> +{
>>>>> +    struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>>>>> +
>>>>> +    i2c_mark_adapter_suspended(&i2c_dev->adapter);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int tegra_i2c_resume(struct device *dev)
>>>>> +{
>>>>> +    struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>>>>> +    int ret;
>>>>> +
>>>>> +    i2c_lock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>>>>> +    ret = tegra_i2c_init(i2c_dev, false);
>>>>> +    i2c_unlock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>>>>
>>>> Why the locking is needed here?
>>>
>>> async resume could result in stress test issues if some client accesses
>>> the i2c instance. This ensures the i2c instance is locked till the
>>> initialization is complete.
>>
>> 1) This doesn't make much sense.. if client could access I2C during of
>> tegra_i2c_init execution, then what stops it to perform the access
>> before the lock is taken?
> Client resumes will start after I2C instance resume because of driver
> dependency. Since lock is the first call in i2c-tegra I believe I2C
> calls of client will not start.

You're incorrectly assuming that client can start resuming in the middle
of the controller's resume process. I2C client's resume won't start
until tegra_i2c_resume() is finished completely. That is because child
drivers are resumed only after theirs parent is ready and this is
guaranteed by the drivers core.
