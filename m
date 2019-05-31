Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC1EE30E47
	for <lists+linux-i2c@lfdr.de>; Fri, 31 May 2019 14:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbfEaMpH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 May 2019 08:45:07 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42018 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbfEaMpG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 May 2019 08:45:06 -0400
Received: by mail-lj1-f193.google.com with SMTP id y15so6266085ljd.9;
        Fri, 31 May 2019 05:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qv8Gl69nP262ZkQFCl6BnDomj+l1WagsjrnxTyxwFmo=;
        b=JCIQQzF2pbauh1aXmVxIwQBz8di8WN+wWx8fOFZ8KZt0IAKUhsPYQD4E9UNf+R608x
         77GfrCT/ZvCAmMbYjjck7h0ugNJbFOSZiMUhTU8S+luENk+d73cjvC3BDb+02VcIshh6
         ydeBCd4zAw3NLt3bpWVTjM3v84rJSqVvU5p7v+QVUu84gvWt+VctQDkr6tNRT0DL5jbS
         Ld1lGFDj+fEgVqHaiGtXFhqgOe7EpNZM5HtlO5SH5R/JeEitjEkxg6AcE+v/QDHCWTP+
         7b69UhEsvbNVe3vGAISuMmePN4PWLwhX1Igffux6TefoV+MZh+YrN0FmGRerBFyZxQ9W
         7kZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qv8Gl69nP262ZkQFCl6BnDomj+l1WagsjrnxTyxwFmo=;
        b=mACvh+DDxBgmgXsvEQ9rGErPsaSOuXiJUChkk0qRZkKuNd0RV10737uq9bHBAkEIG2
         WMGLU2qsLa0rs/oXtUnlS0fVOMlx5ZP17POgoEBLVGZ7nMa+Ui3ITFepFr36U9eG/oLw
         ZffEKqbNdft15dkhRB1RxgJgYiphcCe/1dLCAnbfYu3wrVj4V/Kipr+PVzr1RY2sDaxR
         6rwQZT6VuP14vibzeflApSQ2zXXfK/ROdk8eMwuCD8BNZmfi0Wq8cyov7TdZtxjYsszh
         /pSn+GcdbpHgrq2C5gURO7hnQtCgTZmLAy88sHTOzToiYgyrRYqks0ib7vRPoG/TaE9v
         eqSg==
X-Gm-Message-State: APjAAAVpjP9mFLlBjR8aVah8IFqh627M9IHtbEl/0JYm1ntfaba5CdzZ
        l3FcKKDIyEmEIhYdfRtGPin3xl9T
X-Google-Smtp-Source: APXvYqwuXyCSIZ4g7NUoXwjG2Qc4/ojYG9JoWbNV4+FDSGoVQy4Hineu+W0O8JH3tysDD+l1cmbVYg==
X-Received: by 2002:a2e:9112:: with SMTP id m18mr5961730ljg.181.1559306704152;
        Fri, 31 May 2019 05:45:04 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id r3sm1201949ljr.76.2019.05.31.05.45.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 05:45:03 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4f14a218-332c-0263-c6c5-73a13b2446f0@gmail.com>
Date:   Fri, 31 May 2019 15:43:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9142282b-ab76-53a0-13ce-c43b8adc575f@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

31.05.2019 11:50, Bitan Biswas пишет:
> 
> 
> On 5/30/19 4:27 AM, Dmitry Osipenko wrote:
>> 30.05.2019 8:55, Bitan Biswas пишет:
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
>>> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
>>> ---
>>>   drivers/i2c/busses/i2c-tegra.c | 24 ++++++++++++++++++++++++
>>>   1 file changed, 24 insertions(+)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c
>>> b/drivers/i2c/busses/i2c-tegra.c
>>> index ebaa78d..f6a377f 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -1687,9 +1687,33 @@ static int tegra_i2c_remove(struct
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
>>> +    i2c_lock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>>> +    ret = tegra_i2c_init(i2c_dev, false);
>>> +    i2c_unlock_bus(&i2c_dev->adapter, I2C_LOCK_ROOT_ADAPTER);
>>
>> Why the locking is needed here?
> 
> async resume could result in stress test issues if some client accesses
> the i2c instance. This ensures the i2c instance is locked till the
> initialization is complete.

1) This doesn't make much sense.. if client could access I2C during of
tegra_i2c_init execution, then what stops it to perform the access
before the lock is taken?

2) The whole point of the i2c_mark_adapter_* API is to catch those
faulty clients that have a broken suspend-resume sequence. Client will
get a -ESHUTDOWN on trying to issue I2C transfer while controller is
marked as suspended.

3) Please don't use async suspend-resume where it doesn't make sense.

Corollary: you should drop the locking because it doesn't do anything
useful.
