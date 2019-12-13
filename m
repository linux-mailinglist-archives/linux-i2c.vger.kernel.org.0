Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 202D711E5EC
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 15:55:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbfLMOzQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 09:55:16 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41901 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727673AbfLMOzP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 09:55:15 -0500
Received: by mail-lf1-f68.google.com with SMTP id m30so2169210lfp.8;
        Fri, 13 Dec 2019 06:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2opFr/klQK1oObZvRIZa9Uwbm+rqJyT65CDiKOERf+U=;
        b=Y+y5apdGrHSiwkctdVgYNHSe8GOEeduItT5VyjHaRwFq59Sm8SpifY0r94mYG73ClT
         26dO/MXkfrUDu5hQHJ+CL+ZnoTgfp+6o40FvU7aKpgpJ8m0Lb0byz5PadhrpEvkX8/KW
         PMEpDDr+WiifDLTE9f1z5hIfLkEVc52ncORBs72g+3N18QXtSiVcsmHrSWcagz9AwKbQ
         E1UkMz9J44RN+zOFLaT33UWrfjzev4DakQRhc4Kx25TXI9r4q/gwXsLyfUXugumtfywb
         jwbA/U8SA3Kn4cxRJs1/0Ch1CeZ2AZVROkj0vT4RDDd53topZmfFzawvyHh7fPUm1KEO
         XFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2opFr/klQK1oObZvRIZa9Uwbm+rqJyT65CDiKOERf+U=;
        b=cNxTnusMz9mN133pKaZOTYdqMCRP9FPv90TZrBNiEE/PBTMOy80FsEcKPDg6ocZ7O1
         OqpbVhMrcy/a+FAAKEee6FFvoXSS3CpgxHEhZFzsdO+7AtHyzg/o7k185GgDnN5FrROB
         kTcN9lqwAXhFub7txv2Z6aSfYXCgMHfwqxn9G02RS2SgvTc/3PMRuK6kcKhSiN8Il/Dl
         o9J5pix611nED65lI2Wubphga0SiUieW0jKTNuIh1k/c85n9IMVozqfigndJIC/K4W/3
         k1z/i/X0frF0VVlG2jGLOL0PzZ0DicKRc77dlHq17K3qZ/iaLE4a4qAKbI6/zqvnkAID
         BwmQ==
X-Gm-Message-State: APjAAAU+MUCHgP9Yerc35+VWwDIOAwtbcOedBh087n1gnf6nYL7HwLuo
        BLoT6CVkKBMFwyNhBueQYlA=
X-Google-Smtp-Source: APXvYqzt/isFtrQIYcmnKxu+sYyMAJCKFYN/difz6VDeRNIWwYULjo+2bqyLCma+CrJDpzaPayDdfw==
X-Received: by 2002:ac2:53a8:: with SMTP id j8mr9517976lfh.28.1576248912919;
        Fri, 13 Dec 2019 06:55:12 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id p12sm4696695lfc.43.2019.12.13.06.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2019 06:55:12 -0800 (PST)
Subject: Re: [PATCH v1 3/3] i2c: tegra: Fix suspending in active runtime PM
 state
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>
References: <20191212233428.14648-1-digetx@gmail.com>
 <20191212233428.14648-4-digetx@gmail.com>
 <ae96db3a-0854-6e80-0469-e5fa6fd7bb8e@gmail.com>
Message-ID: <ec7e11f6-2695-29c8-c9ed-98dc229b8aac@gmail.com>
Date:   Fri, 13 Dec 2019 17:55:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <ae96db3a-0854-6e80-0469-e5fa6fd7bb8e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

13.12.2019 17:29, Dmitry Osipenko пишет:
> 13.12.2019 02:34, Dmitry Osipenko пишет:
>> I noticed that sometime I2C clock is kept enabled during suspend-resume.
>> This happens because runtime PM defers dynamic suspension and thus it may
>> happen that runtime PM is in active state when system enters into suspend.
>> In particular I2C controller that is used for CPU's DVFS is often kept ON
>> during suspend because CPU's voltage scaling happens quite often.
>>
>> Note: we marked runtime PM as IRQ-safe during the driver's probe in the
>> "Support atomic transfers" patch, thus it's okay to enforce runtime PM
>> suspend/resume in the NOIRQ phase which is used for the system-level
>> suspend/resume of the driver.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index b3ecdd87e91f..d309a314f4d6 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -1790,9 +1790,14 @@ static int tegra_i2c_remove(struct platform_device *pdev)
>>  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>>  {
>>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>> +	int err;
>>  
>>  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
> 
> I'm now in a doubt that it is correct to use NOIRQ level at all for the
> suspend because i2c_mark_adapter_suspended() uses mutex, thus I'm
> wondering what will happen if there is an asynchronous transfer
> happening during suspend..
> 
> The i2c_mark_adapter_suspended() will try to block and will never return?

Moreover, the I2C interrupt should be disabled during the NOIRQ phase.
So, yes.. looks like making use of NOIRQ level wasn't a correct
decision. On the other hand, I don't think that any I2C client driver
used by Tegra SoCs in the upstream kernel could cause the problem at the
moment, so it shouldn't be critical.

BTW: Jon, please CC me next time ;) [I'll try to find a better solution
for the PCIE problem]

>> +	err = pm_runtime_force_suspend(dev);
>> +	if (err < 0)
>> +		return err;
>> +
>>  	return 0;
>>  }
>>  
>> @@ -1813,6 +1818,10 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
>>  	if (err)
>>  		return err;
>>  
>> +	err = pm_runtime_force_resume(dev);
>> +	if (err < 0)
>> +		return err;
>> +
>>  	i2c_mark_adapter_resumed(&i2c_dev->adapter);
>>  
>>  	return 0;
>>
> 

