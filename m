Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3240711E529
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2019 15:05:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727490AbfLMOES (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 09:04:18 -0500
Received: from mail.kapsi.fi ([91.232.154.25]:39477 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727489AbfLMOES (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Dec 2019 09:04:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=TieXscLzs/Q99X9LKniSYeAVxdxO5rQYMcYpPSdOnsY=; b=GTNjKzGgonVe++aSoeyvfD6QpD
        mcuwQSmy41VgvGes9/L2kCTUuQtnnESO3LyU5qTYOgLQ4NzmOA3nmNY0NRjZrs+H/8mjrNRAWL0aB
        IjV3owCZkRnCyzwnCc1y9mwzLgea1ESSxyXotS0hvzOnwaiKka9El0Rd1Ap4u5pi2G7ZEIR/kaAis
        FWlZvG73Q43z9RJqsigQKASngmrqZ6tukdkxQdQT4M4dbQlxI0hksw5WgzqWr6gCMS5JbMDs4kq3k
        HasctAmh9PvKfJFDTdsjUYr6GjiZ5rgNCbE98l9dnO4o9BP/Ir/nxijunZErhuX6SfAZTqPRv1dCO
        eKjK1rog==;
Received: from [193.209.96.43] (helo=[10.21.26.179])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1iflYG-0004am-BQ; Fri, 13 Dec 2019 16:04:16 +0200
Subject: Re: [PATCH] i2c: tegra: Restore pinmux on system resume
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20191213134417.222720-1-thierry.reding@gmail.com>
 <9a8d5d74-a4b2-0414-35f1-99776a0ba066@kapsi.fi>
Message-ID: <f81c749b-a4ba-2ed3-4715-1ee4b8dc5e09@kapsi.fi>
Date:   Fri, 13 Dec 2019 16:04:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <9a8d5d74-a4b2-0414-35f1-99776a0ba066@kapsi.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 193.209.96.43
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Oh, I guess that option was already discussed =)

Sorry,
Mikko

On 13.12.2019 16.03, Mikko Perttunen wrote:
> Could this just be pm_runtime_force_suspend and pm_runtime_force_resume?
> 
> Mikko
> 
> On 13.12.2019 15.44, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Depending on the board design, the I2C controllers found on Tegra SoCs
>> may require pinmuxing in order to function. This is done as part of the
>> driver's runtime suspend/resume operations. However, the PM core does
>> not allow devices to go into runtime suspend during system sleep to
>> avoid potential races with the suspend/resume of their parents.
>>
>> As a result of this, when Tegra SoCs resume from system suspend, their
>> I2C controllers may have lost the pinmux state in hardware, whereas the
>> pinctrl subsystem is not aware of this. To fix this, make sure that if
>> the I2C controller is not runtime suspended, the runtime suspend code is
>> still executed in order to disable the module clock (which we don't need
>> to be enabled during sleep) and set the pinmux to the idle state.
>>
>> Conversely, make sure that the I2C controller is properly resumed when
>> waking up from sleep so that pinmux settings are properly restored.
>>
>> This fixes a bug seen with DDC transactions to an HDMI monitor timing
>> out when resuming from system suspend.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>   drivers/i2c/busses/i2c-tegra.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-tegra.c 
>> b/drivers/i2c/busses/i2c-tegra.c
>> index a98bf31d0e5c..dae2a3d7b512 100644
>> --- a/drivers/i2c/busses/i2c-tegra.c
>> +++ b/drivers/i2c/busses/i2c-tegra.c
>> @@ -1710,10 +1710,14 @@ static int tegra_i2c_remove(struct 
>> platform_device *pdev)
>>   static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>>   {
>>       struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>> +    int err = 0;
>>       i2c_mark_adapter_suspended(&i2c_dev->adapter);
>> -    return 0;
>> +    if (!pm_runtime_status_suspended(dev))
>> +        err = tegra_i2c_runtime_suspend(dev);
>> +
>> +    return err;
>>   }
>>   static int __maybe_unused tegra_i2c_resume(struct device *dev)
>> @@ -1729,9 +1733,11 @@ static int __maybe_unused 
>> tegra_i2c_resume(struct device *dev)
>>       if (err)
>>           return err;
>> -    err = tegra_i2c_runtime_suspend(dev);
>> -    if (err)
>> -        return err;
>> +    if (pm_runtime_status_suspended(dev)) {
>> +        err = tegra_i2c_runtime_suspend(dev);
>> +        if (err)
>> +            return err;
>> +    }
>>       i2c_mark_adapter_resumed(&i2c_dev->adapter);
>>
