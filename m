Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2440326DFEF
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 17:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbgIQPnv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 11:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728160AbgIQPnd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 11:43:33 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB4D8C061756;
        Thu, 17 Sep 2020 08:43:31 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id w3so2456115ljo.5;
        Thu, 17 Sep 2020 08:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DAWnaNNCLzi2b/HYy/bsKZyv4EO4JHS8WK3RrU3eKQE=;
        b=QQ1f0h6p9q4wGklnosXzt8rGHZ3AFmRZF8H2xnIIeFrDAKe4zA6eEXRQ9XZ5Jig+UQ
         7zZF/0POnOdLmtWmPDyRI3p7S+zM4NoV9hQoQ0eL+EIQn+I4mC9n5Z34qOLlC64T87oU
         YxzGX+gwY3iSiUKM7T8n639FTqeoqRDbaps7wGxF/svu99Uf4qBNA06R2Ri6An3/vTrN
         z4hGbTO3Q4x94WIyRVaODSvJrKCo1QKmGRz0HVb9dRXnivzXdMj0n7yZQbL5h+SedIys
         LG+zIEDkNQv/D5f3o0Il7WTFwDtkpt5L8DB51xvgg/YtVW8O10eVW8Lj0YJMZQt4Z4A6
         scjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DAWnaNNCLzi2b/HYy/bsKZyv4EO4JHS8WK3RrU3eKQE=;
        b=XsYfcL90MFXeEUgLW6fJVbQRcSnXWHh0Tflcxy1kjaTbDQ0qBIHoJbL8yazcau/zCj
         PzTmeq+xD2UIn+h14woaBXCIh4/pCHkn9CqPk3Jc0i67jsmcEZzUNFEUU0Qkw7K51mkU
         FA1+fIHyD+R2bJd1urLg1ttuu5Jzg2PhFZFZeXWmzwXive7vaRiCE68JnGGkDXLAb8Se
         H2hN3T7oV3UOvNv2p6je77YmPFGNTDRhutmwidfF+J79SBs5Dg7g6vlkFcMJOxX2wBxC
         dqRCr6DYFsDU9kMmB6gEQJWvvxMo68U7TQxr1Fq+HYcaS9wyk0E0SYNYKcHIdOUyHwrt
         lU5w==
X-Gm-Message-State: AOAM532mavdSIVbt11qQm7fjtjUKDQJDzuts6eZXWSYh2NFXP8CWfqhP
        iWxIUMWX/y2Z2rh8UldsZCa2p3EemAc=
X-Google-Smtp-Source: ABdhPJwpb9L2t1kEXCu/zJQbLoXsknW2ZpQlhcAy/zmrCSGu1WKnb3or7d+bh/5ugj/9eI7nXYkRSg==
X-Received: by 2002:a2e:989a:: with SMTP id b26mr9064020ljj.111.1600357409561;
        Thu, 17 Sep 2020 08:43:29 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id m10sm5348006lfo.184.2020.09.17.08.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 08:43:29 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <49498b9c-3b75-ad97-1859-5d6442b27b0c@gmail.com>
Date:   Thu, 17 Sep 2020 18:43:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917122105.GI3515672@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.09.2020 15:21, Thierry Reding пишет:
> On Wed, Sep 09, 2020 at 01:40:02AM +0300, Dmitry Osipenko wrote:
>> Rename "ret" variables to "err" in order to make code a bit more
>> expressive, emphasizing that the returned value is an error code.
>> Same vice versa, where appropriate.
>>
>> Rename variable "reg" to "val" in order to better reflect the actual
>> usage of the variable in the code and to make naming consistent with
>> the rest of the code.
>>
>> Use briefer names for a few members of the tegra_i2c_dev structure in
>> order to improve readability of the code.
>>
>> All dev/&pdev->dev are replaced with i2c_dev->dev in order to have uniform
>> code style across the driver.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 173 ++++++++++++++++-----------------
>>  1 file changed, 86 insertions(+), 87 deletions(-)
> 
> That's indeed a nice improvement. One thing did spring out at me,
> though.
> 
>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> [...]
>> @@ -1831,20 +1830,20 @@ static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
>>  
>>  	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
>>  
>> -	return pinctrl_pm_select_idle_state(i2c_dev->dev);
>> +	return pinctrl_pm_select_idle_state(dev);
>>  }
>>  
>>  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>>  {
>>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>> -	int err = 0;
>> +	int ret = 0;
>>  
>>  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
>>  
>>  	if (!pm_runtime_status_suspended(dev))
>> -		err = tegra_i2c_runtime_suspend(dev);
>> +		ret = tegra_i2c_runtime_suspend(dev);
>>  
>> -	return err;
>> +	return ret;
>>  }
> 
> Isn't this exactly the opposite of what the commit message says (and the
> rest of the patch does)?

This change makes it to be consistent with the rest of the code. You may
notice that "Factor out hardware initialization into separate function"
made a similar change.

The reason I'm doing this is that the "err" suggests that code returns a
error failure code, while it could be a success too and you don't know
for sure by looking only at the part of code. Hence it's cleaner to use
"err" when error code is returned.

It is possible (and maybe even better) to rewrite this function as:

static int __maybe_unused tegra_i2c_suspend(struct device *dev)
{
	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);

	i2c_mark_adapter_suspended(&i2c_dev->adapter);

	if (!pm_runtime_status_suspended(dev)) {
		int err = tegra_i2c_runtime_suspend(dev);
		if (err)
			return err;
	}

	return 0;
}
