Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8C812B4FD
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2019 14:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbfL0Nze (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Dec 2019 08:55:34 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41141 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbfL0Nze (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Dec 2019 08:55:34 -0500
Received: by mail-lj1-f194.google.com with SMTP id h23so27172176ljc.8;
        Fri, 27 Dec 2019 05:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9sMcGzWfir8Lx3Y6NmbYy7/hTalm8JqMa44HUWMV2Jo=;
        b=f/BsLHfQeDKdM9icrp1TnTcOX/7A1PKXz/zXWC8o5dev2AYRK/43aODXpL46lqtHyV
         1PaRJwtuFlEcQslNJkLSi1WYzW3IV2jbMbx6raR3a8Ihso8K76LHGgMRXigN0WIEwmMy
         Pp6K0vVvw08vo5cExhkNEREiWureEQUHPTDGe9CHAeL0LVyvp3+wVkYVFHC6Eo+P2+1Q
         RF6kbRQV0NPeOmh49kMZH+otQG69Sfeo9Mn4/dr9EOxY32LaVwVXuts9sz3XKXC9AL58
         DpYInVnjqiwRNCTgWKc1w7PORy6ASzHaciHcVlGJ7O3j/AwSofvo0IBMQ1iGtUeoKd8y
         iaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9sMcGzWfir8Lx3Y6NmbYy7/hTalm8JqMa44HUWMV2Jo=;
        b=ggGZgXB/Ry//TwgSLiODV9fAGWpUOOw7IHFpQCcGvqtH6Bx+VYi7DiuYVS5o6zTZwI
         5PkGuU0RDMsmkG/JNFyzCfa7TlEshdWQ3zzjUk+yxUcgejIkOtUshxDInvJ9dkMqYt9q
         97tM1OSCN1uRHHTGznSfN5yGunr83/aDez+Cnlre2/HhMcbKxEOnkszhK6r7T4k0a8Tf
         6HpD4SGyPgovboe7Ob3ARCaIpqYwsqPDskl6/DkhVU0TzLo7qyyC5L2R/RWOnX/jrWJf
         jRs9b4uGpKIigBcvf3WyGHwGpTjcmL3nMQa06BKF9k8gdkaIDv2MSxmQSn0jzX0Lfm7J
         BdPA==
X-Gm-Message-State: APjAAAU5fjkQiRCfuz2KJ9aFmMX3Y2dZODJjfMIRmbc89UbBWon9xeTi
        2/r9jh3I1HNPQSfzh74+hYc=
X-Google-Smtp-Source: APXvYqw59mXt+JhQ95hpLg/VoLCrUstqztAoo5t32zgcs1l4P7ICXroYNEKCXY3obRWgxQ9sYvyLgA==
X-Received: by 2002:a2e:8758:: with SMTP id q24mr29416127ljj.157.1577454932153;
        Fri, 27 Dec 2019 05:55:32 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id y8sm13582930lji.56.2019.12.27.05.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2019 05:55:31 -0800 (PST)
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
 <ec7e11f6-2695-29c8-c9ed-98dc229b8aac@gmail.com>
Message-ID: <bf9465a5-ffd1-09bc-cc36-11c6ba356231@gmail.com>
Date:   Fri, 27 Dec 2019 16:55:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <ec7e11f6-2695-29c8-c9ed-98dc229b8aac@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

13.12.2019 17:55, Dmitry Osipenko пишет:
> 13.12.2019 17:29, Dmitry Osipenko пишет:
>> 13.12.2019 02:34, Dmitry Osipenko пишет:
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
>>>
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
>>
>> I'm now in a doubt that it is correct to use NOIRQ level at all for the
>> suspend because i2c_mark_adapter_suspended() uses mutex, thus I'm
>> wondering what will happen if there is an asynchronous transfer
>> happening during suspend..
>>
>> The i2c_mark_adapter_suspended() will try to block and will never return?
> 
> Moreover, the I2C interrupt should be disabled during the NOIRQ phase.
> So, yes.. looks like making use of NOIRQ level wasn't a correct
> decision. On the other hand, I don't think that any I2C client driver
> used by Tegra SoCs in the upstream kernel could cause the problem at the
> moment, so it shouldn't be critical.
> 
> BTW: Jon, please CC me next time ;) [I'll try to find a better solution
> for the PCIE problem]

On a second thought, the NOIRQ shouldn't really cause any big problems
because if something executes I2C asynchronously, then the transfer
should simply timeout.


