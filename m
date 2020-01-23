Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05F2D146C56
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 16:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbgAWPKZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 10:10:25 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40065 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgAWPKZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jan 2020 10:10:25 -0500
Received: by mail-lf1-f67.google.com with SMTP id c23so1660253lfi.7;
        Thu, 23 Jan 2020 07:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sHWD0p6295NOKaaJ5oJz+yopi9KLqoopBFFT+y7DoB0=;
        b=ARlupex2FqXFhpBfO3NrGaJDdQrNtaCKAvMCUiR/31eqnMWXkSNOrrV8Ah2+RXXXi5
         bjNkAvYDT71LOhl/q5BA3VkBPry326zP1kM+Ojf7ZRYclr+8OlpFezdvhwJwj3bxRN/k
         5OYhbN1oNyRs8xuK8zLP6bCOzVR6fC5OtJtYp37BrnmR25YQWwOu9TvckqV8QffFrVjW
         dWVOxSfiAidKMxUW2RTuQKDSrBARr39Snl8XNOTa7x8SYqPqHViRzV2acEV0La7TNKVq
         O3Ouc/sZZVsoQobrQ63vBRAIKbZZ9PxLMMwj4U+13kSC3du/wbLQpDYRURt+0El74F6P
         FHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sHWD0p6295NOKaaJ5oJz+yopi9KLqoopBFFT+y7DoB0=;
        b=NVKUZXkVNsrNutO5fZP/s3ouh4f3gWw/V5guEAnxEe4vUhwcUEIIpUUpek/UgyMeL2
         alWAw0XPjcsY6cHOFU/9BrHkaTaBYY3LO4vYT5WC5FgbFGDQ70R7fyvXLArK/4OjkQAj
         pY1RYcvWDw2I/HngEeI7pEEXze1WzqCFYI94QuUcFoxYVtGCdKBKVTbaKGnZoWTYrt5W
         FgtS4Rkr+bqYrVJyADugZSnNcNz2lhgPDkpwBZAD5T2jeGWQFBiESP3PYEyjijBOFuNt
         fVFybvw63btexgxxXEB5ipbnin17oV5cPZV1+Tw8qHHwnJZFGKD+g9LgMlpsIHJ549nO
         p/Lg==
X-Gm-Message-State: APjAAAXSRK8xN/Dq/IvBTFcWNmw98AGQFNQmqKTPDFIKjQ368t3v7adB
        /rTSKe0tOSNJVDPaHhHq5ZDhduhH
X-Google-Smtp-Source: APXvYqzRuyAEeRGZNQ77CadeuJvVKT80NbGPcOY9cqqXGvIrasE+zlRFHihDkqc1o4GeKUFMP/tNmw==
X-Received: by 2002:a19:c3ce:: with SMTP id t197mr4931035lff.174.1579792223010;
        Thu, 23 Jan 2020 07:10:23 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id b13sm1197074lfi.77.2020.01.23.07.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2020 07:10:22 -0800 (PST)
Subject: Re: [PATCH] i2c: tegra: Restore pinmux on system resume
To:     Wolfram Sang <wsa@the-dreams.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20191213134417.222720-1-thierry.reding@gmail.com>
 <20200123111927.GH1105@ninjato>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a9a5eb76-03f9-04d8-1b6c-115ec73fdebf@gmail.com>
Date:   Thu, 23 Jan 2020 18:10:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200123111927.GH1105@ninjato>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

23.01.2020 14:19, Wolfram Sang пишет:
> On Fri, Dec 13, 2019 at 02:44:17PM +0100, Thierry Reding wrote:
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
> 
> Do we still need this after I applied "[PATCH v5 0/8] NVIDIA Tegra I2C
> driver fixes and improvements" ?
> 

No, it shouldn't be needed.
