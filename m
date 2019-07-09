Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2A8C63D09
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2019 23:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729594AbfGIVED (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Jul 2019 17:04:03 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:44084 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbfGIVED (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Jul 2019 17:04:03 -0400
Received: by mail-qk1-f195.google.com with SMTP id d79so204825qke.11;
        Tue, 09 Jul 2019 14:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wpghyK4dozu5v3hFpJGTeVXF3O891a2KOUKLtA2/s7Q=;
        b=uU4kwx9NLOtv/WY27Kbwrzjh9vMwckOyHx4U3LkvO6nmgZKidA4HhHZ0u02NycVP6t
         gOSQotf8KmSCZPn1P74YEu7INxpJdl9mG8IOde4TeVPFdwAK4PB7JZcHTzTBvulnBqV2
         WCy4TsXx0t4SLmbNwxGsmVqfm9JWWvLtB99DekUCJDnAUyU1+9K/cjQTW9eOWhMl4xnZ
         wL6so19l9AeL0jEbz8FjY7VWNdJy8kI8VkwbQvr77gGZE0O6a/v+riUouBRwx3T1Neiy
         NezwhCqVU7VFqfFbyhbkvNqrEgFtSJCnRlUMmXLvA/FjpsN92IOT6dSjBxyJzvSGkfih
         T6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wpghyK4dozu5v3hFpJGTeVXF3O891a2KOUKLtA2/s7Q=;
        b=hViwRyH3T2rrSLWUT8lQjtDMywWKNA/grizUpUzI4nN91woGf0olmzTeIrWIZprgND
         rxPnKw37FKe/AHduktyt2q69oMLCv9mkN3W/1Fq9q8YqSPw4ohfb6L6oju49H3P94dNj
         ePxHm0Ud0GrLFqJfThzWAlhcusygK0gir0z4JL3UGpG43tYLEUY9ecQPIgnspV6ru58k
         +KEhpH0TZkBdufsxxGyt8CVWyIrQ6wsE7CF+kcR2AobEJjUX+HMvaHfUoIHcz9Lpe1MN
         hs8wNLBoqY+Mz3QZztrW6Y+Z912ud4EfxYMDbY6PY4CKNW2ol3xT9AJlZvRrbG1FNp8F
         8D8w==
X-Gm-Message-State: APjAAAVD1YaAgpSBerzTow49IBzBaczEpv4Gl55mcP9x52uOBCbNpA+K
        f2jzjFJyXKC10bGPANZ0aXRUq36v
X-Google-Smtp-Source: APXvYqzxdl4qVrv5T+Ey4gJlsXUVNtPWb624rW6L1vHtsdIqxE7NJhGlM7MoMCQoEGqcRCA5vSGZsA==
X-Received: by 2002:a37:9c0c:: with SMTP id f12mr19391827qke.442.1562706241767;
        Tue, 09 Jul 2019 14:04:01 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id z50sm10999043qtz.36.2019.07.09.14.03.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 14:04:01 -0700 (PDT)
Subject: Re: [PATCH v1] i2c: tegra: Compile PM functions unconditionally
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190707231234.11679-1-digetx@gmail.com>
 <13be0f2e-2131-2e0d-d39f-9f1c964b8698@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <44febd8d-6b1a-a948-4102-b1809e906f44@gmail.com>
Date:   Wed, 10 Jul 2019 00:03:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <13be0f2e-2131-2e0d-d39f-9f1c964b8698@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

09.07.2019 13:12, Jon Hunter пишет:
> 
> On 08/07/2019 00:12, Dmitry Osipenko wrote:
>> The I2C driver fails to probe if CONFIG_PM_SLEEP=n because runtime PM
>> doesn't depend on the PM sleep and in this case the runtime PM ops are
>> not included in the driver, resulting in I2C clock not being enabled.
>> It's much cleaner to simply allow compiler to remove the dead code
>> instead of messing with the #ifdefs.
>>
>> This patch fixes such errors when CONFIG_PM_SLEEP=n:
>>
>>   tegra-i2c 7000c400.i2c: timeout waiting for fifo flush
>>   tegra-i2c 7000c400.i2c: Failed to initialize i2c controller
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 16 +++++-----------
>>  1 file changed, 5 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>> index 9fcb13beeb8f..18f0ceed9f1b 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -636,7 +636,7 @@ static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
>>  	dvc_writel(i2c_dev, val, DVC_CTRL_REG1);
>>  }
>>  
>> -static int tegra_i2c_runtime_resume(struct device *dev)
>> +static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
>>  {
>>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>>  	int ret;
>> @@ -665,7 +665,7 @@ static int tegra_i2c_runtime_resume(struct device *dev)
>>  	return 0;
>>  }
>>  
>> -static int tegra_i2c_runtime_suspend(struct device *dev)
>> +static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
>>  {
>>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>>  
>> @@ -1711,8 +1711,7 @@ static int tegra_i2c_remove(struct platform_device *pdev)
>>  	return 0;
>>  }
>>  
>> -#ifdef CONFIG_PM_SLEEP
>> -static int tegra_i2c_suspend(struct device *dev)
>> +static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>>  {
>>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>>  
>> @@ -1721,7 +1720,7 @@ static int tegra_i2c_suspend(struct device *dev)
>>  	return 0;
>>  }
>>  
>> -static int tegra_i2c_resume(struct device *dev)
>> +static int __maybe_unused tegra_i2c_resume(struct device *dev)
>>  {
>>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>>  	int err;
>> @@ -1741,18 +1740,13 @@ static const struct dev_pm_ops tegra_i2c_pm = {
>>  			   NULL)
>>  };
>>  
>> -#define TEGRA_I2C_PM	(&tegra_i2c_pm)
>> -#else
>> -#define TEGRA_I2C_PM	NULL
>> -#endif
>> -
>>  static struct platform_driver tegra_i2c_driver = {
>>  	.probe   = tegra_i2c_probe,
>>  	.remove  = tegra_i2c_remove,
>>  	.driver  = {
>>  		.name  = "tegra-i2c",
>>  		.of_match_table = tegra_i2c_of_match,
>> -		.pm    = TEGRA_I2C_PM,
>> +		.pm    = &tegra_i2c_pm,
>>  	},
>>  };
>>  
> 
> Looks good to me.
> 
> Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!

