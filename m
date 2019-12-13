Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 408B211E9A2
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 19:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbfLMSBl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 13:01:41 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33015 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbfLMSBl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 Dec 2019 13:01:41 -0500
Received: by mail-lf1-f68.google.com with SMTP id n25so182309lfl.0;
        Fri, 13 Dec 2019 10:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P2fLhpKaXrNbLsGuII7YB7/yEJSelZ85p6b5L7lTKzs=;
        b=DM0300Zk/3f1Zlhsj3gyk4qYp3WfTYEXzuNgPSY8fPT8wfSXtI3MH1Xlnpmq9mkz8R
         JN+bfY3fU8TuoLdWsQVbyco4vPUXXnXlSG9NgnRxPr7709AomAiDz4d29Ne9Vyjhszj7
         wk8dbzATX0g/F6/9tSVNV/Mwg+TooHOHF6rJRDkXHdiFvrNIiaqwdcBR8ya+Q3+1ybNv
         Y6g9JIzr8S8zMpWwOUPugzDsKJ1uTrR0SZwdGrizDP+4kS7w1umgCOX528AV3xzLj3Kk
         Tacr8benfbFFHooYnk3Fi6+xZwG48Fa90Lp+fxx6Z5Ch4y+xrHXAiI3bAS1rlIDXNebs
         IbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P2fLhpKaXrNbLsGuII7YB7/yEJSelZ85p6b5L7lTKzs=;
        b=daQYP2u2aihLJOoYwdeumYtLysa1gcagpsuNhCcOBqjXQiKAW++K3zjSkZuVV+Uzmk
         cID6fjVJNrIMRpkQ970/GIts30rasR3yoPsA69xWBf/0rs5wD8KDp9fRvAcQpjbNpNgL
         MkzL8NrLYIFFynXDVgAj+F5DtoWCPGqLuAQCYnXAqdFdCQteC1iVsPezmX4z34WWveAM
         BcuTgtMnLHMGOMnKstflySMIcuuA4uB9OqQ/GX9+fZHzLcHhprEOWhKjr5lJR+I70mEP
         lljZQp2862bLKBfJnvVm5jG5CxUnubsc46DcFNQWJWJr/9PQQsqkHxiBKc/nM5RNqs9Q
         YAkw==
X-Gm-Message-State: APjAAAW7txKWoRK9l/hm1GqTSItZF9n0DvdaHfjZz6KhvHumcN8fFHtl
        KWghilBq1shkqLpo8YKr1HLrgr49
X-Google-Smtp-Source: APXvYqwO8brRkhwwl/lTHbp5OPCmIMztJP1+CZgCIWJ8N6W3wkUM8eXcLmrSlqTMAt4HJykxaUewgQ==
X-Received: by 2002:ac2:498e:: with SMTP id f14mr9755035lfl.172.1576260098015;
        Fri, 13 Dec 2019 10:01:38 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id l28sm4877916lfk.21.2019.12.13.10.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2019 10:01:37 -0800 (PST)
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
Message-ID: <1ed725c9-361b-c920-d532-dd640c3ca59f@gmail.com>
Date:   Fri, 13 Dec 2019 21:01:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <3c2b16c0-3e66-d809-b263-f27cf925e203@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

13.12.2019 17:04, Dmitry Osipenko пишет:
> 13.12.2019 16:47, Thierry Reding пишет:
>> On Fri, Dec 13, 2019 at 02:34:28AM +0300, Dmitry Osipenko wrote:
>>> I noticed that sometime I2C clock is kept enabled during suspend-resume.
>>> This happens because runtime PM defers dynamic suspension and thus it may
>>> happen that runtime PM is in active state when system enters into suspend.
>>> In particular I2C controller that is used for CPU's DVFS is often kept ON
>>> during suspend because CPU's voltage scaling happens quite often.
>>>
>>> Note: we marked runtime PM as IRQ-safe during the driver's probe in the
>>> "Support atomic transfers" patch, thus it's okay to enforce runtime PM
>>> suspend/resume in the NOIRQ phase which is used for the system-level
>>> suspend/resume of the driver.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/i2c/busses/i2c-tegra.c | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>
>> I've recently discussed this with Rafael in the context of runtime PM
>> support in the Tegra DRM driver and my understanding is that you're not
>> supposed to force runtime PM suspension like this.
>>
>> I had meant to send out an alternative patch to fix this, which I've
>> done now:
>>
>> 	http://patchwork.ozlabs.org/patch/1209148/
>>
>> That's more in line with what Rafael and I had discussed in the other
>> thread and should address the issue that you're seeing as well.
> 
> Well, either me or you are still having some misunderstanding of the
> runtime PM :) To my knowledge there are a lot of drivers that enforce
> suspension of the runtime PM during system's suspend, it should be a
> right thing to do especially in a context of the Tegra I2C driver
> because we're using asynchronous pm_runtime_put() and thus at the time
> of system's suspending, the runtime PM could be ON (as I wrote in the
> commit message) and then Terga's I2C driver manually disables the clock
> on resume (woopsie).

Actually, looks like it's not the asynchronous pm_runtime_put() is the
cause of suspending in active state. I see that only one of three I2C
controllers is suspended in the enabled state, maybe some child (I2C
client) device keeps it awake, will try to find out.

> By invoking pm_runtime_force_suspend() on systems's suspend, the runtime
> PM executes tegra_i2c_runtime_suspend() if device is in active state. On
> system resume, pm_runtime_force_resume() either keeps device in a
> suspended state or resumes it, say if for userspace disabled the runtime
> PM for the I2C controller.
> 
> Rafael, could you please clarify whether my patch is doing a wrong thing?
> 
>>> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
>>> index b3ecdd87e91f..d309a314f4d6 100644
>>> --- a/drivers/i2c/busses/i2c-tegra.c
>>> +++ b/drivers/i2c/busses/i2c-tegra.c
>>> @@ -1790,9 +1790,14 @@ static int tegra_i2c_remove(struct platform_device *pdev)
>>>  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>>>  {
>>>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>>> +	int err;
>>>  
>>>  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
>>>  
>>> +	err = pm_runtime_force_suspend(dev);
>>> +	if (err < 0)
>>> +		return err;
>>> +
>>>  	return 0;
>>>  }
>>>  
>>> @@ -1813,6 +1818,10 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
>>>  	if (err)
>>>  		return err;
>>>  
>>> +	err = pm_runtime_force_resume(dev);
>>> +	if (err < 0)
>>> +		return err;
>>> +
>>>  	i2c_mark_adapter_resumed(&i2c_dev->adapter);
>>>  
>>>  	return 0;
>>> -- 
>>> 2.24.0
>>>
> 

