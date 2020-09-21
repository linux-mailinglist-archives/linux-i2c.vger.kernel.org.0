Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8862729C9
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 17:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgIUPTE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 11:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726644AbgIUPTE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 11:19:04 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B759C061755;
        Mon, 21 Sep 2020 08:19:04 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y17so14459454lfa.8;
        Mon, 21 Sep 2020 08:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=susC4Ve+alKHrkGi8N88sYATdLhSjkz6XsHyhT+wd38=;
        b=Ez19NSvUO90V46rnPFGnXo0K6ml1o3e/+DtiUccoHdWruWLj2PVC5A+HGaPj31T6BX
         HIibmwZlEFFI2BaO1n1e43OYcEGmy6hE5O+uQb69Ki8RerQ9Jk3P1bYQOT1GzJKhV0PL
         7BQwHljUEf0QbaPLkZI2DGi091NSFYcgtHlh5G0l0VRIltXA0QJs+67UHgdavSNYmd8v
         IxSVt/ejtVy0Fih+/A1tRdolvdUzn1HY3FYYW81ZyQyWC8AUWagk8SSuyipzGltLFgip
         SHdSRuCoHntXGZYNTSESHRLsW+xNwc0u0U23hog5wu5vlsWw/zlDC+WcbOtTrBhpluf4
         Lcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=susC4Ve+alKHrkGi8N88sYATdLhSjkz6XsHyhT+wd38=;
        b=djP/iyKkMSNpvKWaxJrObRLVnOZWdNGvuW9QKjVLSLElC5WfjZwF7xO2BjyWsuBVDJ
         v682ihbmw0BxRxZuWxDoDXLg7c77B+OZn37Pz5ZkeKIvXSzlW9t2sR9OYJDaibYOEDxq
         JQ+/EQQ5jwWuSvoX09NtO8h2seGbruuqY3hmzgZEibQX/JKeUhLp32KRnEpiPLvCGeQr
         kUJbaBn7jcoXh1eLqDvZVpjM0aW3lfqE6s1o6mOZA5t4x6ckSM7TVwGLU5/Z4K1A2imP
         tiaVvBgjykMezKcUBVujcEEOpok39CNZzJBsTxlVuzHkpYQiwfO9pj/rmOyCSgFga/Tk
         XQbw==
X-Gm-Message-State: AOAM532MONFUbSjA2SNb3WAsVLmEMjssHHXQm7qml2ymii1PTA3P64Y2
        daRhrD3gdpCLfGVKhPlZ8MDqO+/NB/U=
X-Google-Smtp-Source: ABdhPJy87cPNHNtLE7BYVxip7BjTUbpBVwu+emKaWpGaE7oXn4wheEi4Bj9pOVBwjQa/zqkVFkHoRA==
X-Received: by 2002:ac2:54ab:: with SMTP id w11mr146282lfk.180.1600701540758;
        Mon, 21 Sep 2020 08:19:00 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id c20sm2654437lff.291.2020.09.21.08.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 08:19:00 -0700 (PDT)
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
 <49498b9c-3b75-ad97-1859-5d6442b27b0c@gmail.com>
 <20200921114059.GM3950626@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <633d8e6e-d50c-a7cb-5cdf-f0547b94a86d@gmail.com>
Date:   Mon, 21 Sep 2020 18:18:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921114059.GM3950626@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

21.09.2020 14:40, Thierry Reding пишет:
> On Thu, Sep 17, 2020 at 06:43:28PM +0300, Dmitry Osipenko wrote:
>> 17.09.2020 15:21, Thierry Reding пишет:
>>> On Wed, Sep 09, 2020 at 01:40:02AM +0300, Dmitry Osipenko wrote:
>>>> Rename "ret" variables to "err" in order to make code a bit more
>>>> expressive, emphasizing that the returned value is an error code.
>>>> Same vice versa, where appropriate.
>>>>
>>>> Rename variable "reg" to "val" in order to better reflect the actual
>>>> usage of the variable in the code and to make naming consistent with
>>>> the rest of the code.
>>>>
>>>> Use briefer names for a few members of the tegra_i2c_dev structure in
>>>> order to improve readability of the code.
>>>>
>>>> All dev/&pdev->dev are replaced with i2c_dev->dev in order to have uniform
>>>> code style across the driver.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  drivers/i2c/busses/i2c-tegra.c | 173 ++++++++++++++++-----------------
>>>>  1 file changed, 86 insertions(+), 87 deletions(-)
>>>
>>> That's indeed a nice improvement. One thing did spring out at me,
>>> though.
>>>
>>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>> [...]
>>>> @@ -1831,20 +1830,20 @@ static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
>>>>  
>>>>  	clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
>>>>  
>>>> -	return pinctrl_pm_select_idle_state(i2c_dev->dev);
>>>> +	return pinctrl_pm_select_idle_state(dev);
>>>>  }
>>>>  
>>>>  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>>>>  {
>>>>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>>>> -	int err = 0;
>>>> +	int ret = 0;
>>>>  
>>>>  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
>>>>  
>>>>  	if (!pm_runtime_status_suspended(dev))
>>>> -		err = tegra_i2c_runtime_suspend(dev);
>>>> +		ret = tegra_i2c_runtime_suspend(dev);
>>>>  
>>>> -	return err;
>>>> +	return ret;
>>>>  }
>>>
>>> Isn't this exactly the opposite of what the commit message says (and the
>>> rest of the patch does)?
>>
>> This change makes it to be consistent with the rest of the code. You may
>> notice that "Factor out hardware initialization into separate function"
>> made a similar change.
>>
>> The reason I'm doing this is that the "err" suggests that code returns a
>> error failure code, while it could be a success too and you don't know
>> for sure by looking only at the part of code. Hence it's cleaner to use
>> "err" when error code is returned.
> 
> I don't follow that reasoning. Every error code obviously also has a
> value for success. Otherwise, what's the point of even having a function
> if all it can do is fail. Success has to be an option for code to be any
> useful at all, right?
> 
> The "err" variable here transports the error code and if that error code
> happens to be 0 (meaning success), why does that no longer qualify as an
> error code?

If you're naming variable as "err", then this implies to me that it will
contain a error code if error variable is returned directly. Error
shouldn't relate to a success. In practice nobody pays much attention to
variable naming, so usually there is a need to check what code actually
does anyways. I don't care much about this and just wanting to make a
minor improvement while at it.
