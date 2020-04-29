Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210BF1BE17F
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 16:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgD2Oqv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Apr 2020 10:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726456AbgD2Oqu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Apr 2020 10:46:50 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E1F5C03C1AD;
        Wed, 29 Apr 2020 07:46:50 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id w14so1475316lfk.3;
        Wed, 29 Apr 2020 07:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6Iqx43ooxgoOivq+n0TDZ4CBXmi8xKAeuxrrrbvkGzA=;
        b=Haw4PU8yu6NVYE7MFuT40CZ3zAtmD0g1aiMZvzucctoEE/7fVReA0DnGM0evnNxklX
         VrPaV3Rel3X5PwawyZrwOI2ZADt9RRF1gmZosRewqRm61ySFMJ3H2LMcudOPmUMg1Cfl
         4PfQZD1qvzEB8EyDDEXyky19RxawxmRXsjHXPLQ/82CT8nWQwzYSNc17PnjJYFNsOEBk
         CyC4NbnO1oj0ozCPd3Gw7mIOeOVsm5vbFapHZrwgO5CbuoR9b8oTGeUROT1Bcjt0kCM1
         WVh1icy15qq64apDWa27qcmPzVgopwE+xF7KD4/BwFL+hmjugFOVUDoprHTYKGHt0dzt
         x6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6Iqx43ooxgoOivq+n0TDZ4CBXmi8xKAeuxrrrbvkGzA=;
        b=qYubLza8qUGMh65bEBZY0te9Hr0UmqRfqyHHq1KbdFgKfDZ1fJKjLXsdr9suVPXXHX
         OSRR3Imt5S0u1ZbBj2Jr+/gzEVk10rOzpjYcjCe7MrBUQHX4SkojDjuyzLI/sy1B4Ke5
         KutbCItietMcdJ3ZoHc6StPZROuiLD4ftKzsKeiQLuCf5PFARYewKtWMRTVqoDWaw4kM
         9fCLgwNPq15F3nCbs1sHA3khIrg/Uhz+l0/esxMbxFIj6tdOOiAWsaOMcRkaTV2Uf5N3
         dF4asR3gQmo5jdD2IvUetDbBgGyPu5AL7ByME3yECgcLZIn+QWedAisuct7Sk/+YsZXd
         NkVw==
X-Gm-Message-State: AGi0PuZFBrf/j0C3+i16ogGQuHh3m6TX0KiKGjLSbBAPVK4W7wCnV9a0
        jUUMcrN3QMp19jieKE1x3tqj6C4Z
X-Google-Smtp-Source: APiQypIXFKXW0+23X9m4XvsDEPOtHxVzRdJkkgu45IxeYCDiHfwes9airQTCiDzijLwznTWJQcOT5A==
X-Received: by 2002:a19:2389:: with SMTP id j131mr5921216lfj.116.1588171608227;
        Wed, 29 Apr 2020 07:46:48 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id f2sm2428460lja.30.2020.04.29.07.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 07:46:47 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
 <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
 <20200427151234.GE3464906@ulmo>
 <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
 <20200429081448.GA2345465@ulmo> <20200429085502.GB2345465@ulmo>
 <9e36c4ec-ca02-bd15-d765-15635f09db4b@gmail.com>
 <7442f4cd-6406-41f6-5c9b-932bff8ad5b2@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5863e364-480e-7839-c42b-73a7f6990a30@gmail.com>
Date:   Wed, 29 Apr 2020 17:46:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7442f4cd-6406-41f6-5c9b-932bff8ad5b2@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

29.04.2020 16:57, Jon Hunter пишет:
> 
> On 29/04/2020 13:35, Dmitry Osipenko wrote:
>> 29.04.2020 11:55, Thierry Reding пишет:
>> ...
>>>>> It's not "papering over an issue". The bug can't be fixed properly
>>>>> without introducing I2C atomic transfers support for a late suspend
>>>>> phase, I don't see any other solutions for now. Stable kernels do not
>>>>> support atomic transfers at all, that proper solution won't be backportable.
>>>>
>>>> Hm... on a hunch I tried something and, lo and behold, it worked. I can
>>>> get Cardhu to properly suspend/resume on top of v5.7-rc3 with the
>>>> following sequence:
>>>>
>>>> 	revert 9f42de8d4ec2 i2c: tegra: Fix suspending in active runtime PM state
>>>> 	apply http://patchwork.ozlabs.org/project/linux-tegra/patch/20191213134417.222720-1-thierry.reding@gmail.com/
>>>>
>>>> I also ran that through our test farm and I don't see any other issues.
>>>> At the time I was already skeptical about pm_runtime_force_suspend() and
>>>> pm_runtime_force_resume() and while I'm not fully certain why exactly it
>>>> doesn't work, the above on top of v5.7-rc3 seems like a good option.
>>>>
>>>> I'll try to do some digging if I can find out why exactly force suspend
>>>> and resume doesn't work.
>>>
>>> Ah... so it looks like pm_runtime_force_resume() never actually does
>>> anything in this case and then disable_depth remains at 1 and the first
>>> tegra_i2c_xfer() will then fail to runtime resume the controller.
>>
>> That's the exactly expected behaviour of the RPM force suspend/resume.
>> The only unexpected part for me is that the tegra_i2c_xfer() runtime
>> resume then fails in the NOIRQ phase.
> 
> From reading the changelog for commit 1e2ef05bb8cf ("PM: Limit race
> conditions between runtime PM and system sleep (v2))", this is the
> expected behaviour for runtime resume in the noirq phase.

I'm curious whether there is a way to tell RPM that it's okay to do it
for a particular device, like I2C that uses IRQ-safe RPM + doesn't have
parent devices that need to be resumed.
