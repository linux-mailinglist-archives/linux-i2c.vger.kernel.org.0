Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731AA1DA7E3
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 04:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbgETCTb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 22:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgETCTa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 May 2020 22:19:30 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF86C061A0E;
        Tue, 19 May 2020 19:19:30 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id h26so1213566lfg.6;
        Tue, 19 May 2020 19:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2uNlK1vI3MaWNduTF7IiL3rIYLrk8NSp3OzdwonhruI=;
        b=Hl+dMJIEACuB/rjd450c/e0B9lKVhXkPPQNhgkPF8RFH8I5zTp4w2ytFaqK52QWAwJ
         tFcU3IpvjUbledF5TpCAg3muM6WJjlpub38eoFvdwsBghbB4xvUYEPQ5cij64gqiyaaX
         3mFUAYkHM3igz0r8w0+c/vaXB0vwk33L0WclCYBMqixdHw1tq7iO2ez5HXOCn0v4Ow9z
         K7i4dXk6rHJ6rRVCD2RgJFYYBBMEGCZ2Vx3MVJzdwU3ZyksY9n/E/L3G2MhWCLCSZjpg
         BhdlwOx431pGNqClokQqObBOBoK2BVpUzlqIEKDEgsDMGNfrdSQk0mmkwiRsIxAeOqeH
         cIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2uNlK1vI3MaWNduTF7IiL3rIYLrk8NSp3OzdwonhruI=;
        b=oO8XsPAJf45rJxAsTfB0IOISdhP8KiPoIUtdl2Lg7pD9vVjATOMKxcGoVaJLBLct5d
         19FzSJEPBw5f+Loqu8iLAPjA4IvP/Vc553iebVFlfD0lGiQL+RZRdPDm0MS/YRPvZ7uW
         ne1n2FonZlloRFYi7zAZL46aYh5Pd+9yoSydKywzM6laVbMjcPAFhKD8AiehNv+2H7Py
         5GJfrQQZAdjhhDu10EPCav5t+tQQg47E01c5DhSYvpLlaLed/MWW9R61eWWYMSSMP160
         CaQ6ANCO/C+SGfiOtwLfDPMKIAWttu9Zp45p4pecr32wIBrLRs6EBmjvlwppMxoTOwAY
         pDAg==
X-Gm-Message-State: AOAM532Jj3LjTYzFPGKPJ/XBIm/R7hwQVVW0FFwtIHybT4ZkPvmzuP5o
        uW/r93/5bsRlFRJe+cEfOkIuX1V3
X-Google-Smtp-Source: ABdhPJxoMH2J7oUXMtgsrrposnFJkGqXwPdzV4c/k7LXzy95vaNTW9txi9wibXmRVdW3MdYHDQgMhQ==
X-Received: by 2002:a19:150:: with SMTP id 77mr1110150lfb.71.1589941168454;
        Tue, 19 May 2020 19:19:28 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id v126sm581755lfa.50.2020.05.19.19.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 19:19:27 -0700 (PDT)
Subject: Re: [GIT PULL] i2c: tegra: Changes for v5.8-rc1
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20200515143924.1579055-1-thierry.reding@gmail.com>
 <314a292e-bcd9-bb30-4067-71dc7cc399d6@gmail.com>
 <20200519160835.GC2113674@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6b081a10-b150-b07f-2852-743e41ed053c@gmail.com>
Date:   Wed, 20 May 2020 05:19:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519160835.GC2113674@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

19.05.2020 19:08, Thierry Reding пишет:
> On Sat, May 16, 2020 at 10:45:32AM +0300, Dmitry Osipenko wrote:
>> 15.05.2020 17:39, Thierry Reding пишет:
>>> Hi,
>>>
>>> The following changes since commit 0e698dfa282211e414076f9dc7e83c1c288314fd:
>>>
>>>   Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)
>>>
>>> are available in the Git repository at:
>>>
>>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.8-i2c
>>>
>>> for you to fetch changes up to c73178b93754edd8449dccd3faf05baafd4d3f0e:
>>>
>>>   i2c: tegra: Add support for the VI I2C on Tegra210 (2020-05-12 22:47:52 +0200)
>>>
>>> Thanks,
>>> Thierry
>>>
>>> ----------------------------------------------------------------
>>> i2c: tegra: Changes for v5.8-rc1
>>>
>>> This includes a few improvements to make the Tegra I2C controller behave
>>> properly on suspend/resume, does a bit of cleanup and adds support for
>>> the VI-variant of the I2C controller that is used primarily for video
>>> capture purposes.
>>>
>>> ----------------------------------------------------------------
>>> Dmitry Osipenko (2):
>>>       i2c: tegra: Better handle case where CPU0 is busy for a long time
>>>       i2c: tegra: Synchronize DMA before termination
>>>
>>> Thierry Reding (5):
>>>       Revert "i2c: tegra: Fix suspending in active runtime PM state"
>>
>>>       i2c: tegra: Restore pinmux on system resume
>>
>> In general this series is good to me, although I have some concerns
>> about this patch. Could you please answer the review comments?
> 
> Sorry, those had been burried under too much email. I've answered your
> questions now.

Hello Thierry,

Thank you for the answers, I'd also want to see the answer to the
question about how RPM works, i.e. why I2C is RPM-resumed during
system's suspend in some cases and not the others.

