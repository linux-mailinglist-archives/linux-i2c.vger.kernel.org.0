Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C42E1BE4A1
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 19:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgD2RCl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Apr 2020 13:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726776AbgD2RCk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Apr 2020 13:02:40 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4487BC03C1AE;
        Wed, 29 Apr 2020 10:02:40 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id g10so2276689lfj.13;
        Wed, 29 Apr 2020 10:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3lN2EUXREobqihKThRa5uh5/wHV6odRCA05HFH35DSU=;
        b=SoIbu0RHOhRpTU2fkuLoy+Lfc7aodBaq73tQfdVAsZtGusods24Mx67wE8GG2X2T7W
         m3RxkAkz9MkzF0p/4UA1upUmAvMxL1k5rCp42SyiYDFM0dKpBT28Tvp6L9Hm30PLnS+X
         vhqhSu9FVaEEidbRsYLpD+eOIWfHKiEP4gxgaDQXZBFgB80BcKCoKkkGV/oF4cC+BUPV
         nHpz48iRE/mB2yjmXSRwWDLakeDpCQ36eMZhaPiSCD4t6zAty58nXzwyCUH0w4z83rjD
         KcaOiyq4g9X0RIks7S035RQwA0pCZ8zz7j98ZK0RI/e42JouGzARrL7H4ByM0mRkqBHs
         1xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3lN2EUXREobqihKThRa5uh5/wHV6odRCA05HFH35DSU=;
        b=sfQ3LjyK6BiYvlKKvaPFwbNqBBx/hry+KBU94ZU4QXF1X4DI+4RK1V0maOy+JgUUtS
         jwjMijIe5HgGDqw0GU3ONnlN+lUUHBl3lbZIaq3c3mVH8WB+loR+qiEEfuCkL0MCvIQb
         qZAQml/5OyCdwCmUktrAQiPQEEpWBFGV0ouZJePGqIUe2tAtZqt58Q9wJeKTiMA2cWbr
         PIQtyotwxEm9r4DZw7z7f7CGdEmal04QDYhMy4Jcqp8C+oGvoLsH1wqWPyvXqczxCVwE
         1yqxEGN6dde1uzBM6Xm+FgMykN7RGj2UyC8vQOyQzgh4pyHSnG2wEundWez+dtrO/IC9
         ya5g==
X-Gm-Message-State: AGi0PuYnWbRrQ81RLeWnjWawzithAikp3iy6a8is98ypjfhaITAqxsm/
        oMCohVka+dsRclHO/fcGhx+5fVdG
X-Google-Smtp-Source: APiQypKzr4qKOw+dJP7w9+CQO0MSB3QXu+WGnEu7EBlI1u2hLHht+xgHU++Cj4Vs2H0mkPq2nxI1ug==
X-Received: by 2002:ac2:5338:: with SMTP id f24mr2213922lfh.197.1588179758290;
        Wed, 29 Apr 2020 10:02:38 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id m15sm2573038lji.21.2020.04.29.10.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 10:02:37 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427110033.GC3464906@ulmo>
 <3a06811c-02dc-ce72-ebef-78c3fc3f4f7c@gmail.com>
 <20200427151234.GE3464906@ulmo>
 <1ab276cf-c2b0-e085-49d8-b8ce3dba8fbe@gmail.com>
 <20200429081448.GA2345465@ulmo> <20200429085502.GB2345465@ulmo>
 <9e36c4ec-ca02-bd15-d765-15635f09db4b@gmail.com>
 <7442f4cd-6406-41f6-5c9b-932bff8ad5b2@nvidia.com>
 <5863e364-480e-7839-c42b-73a7f6990a30@gmail.com>
 <20200429162434.GA3157354@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bb4d97b6-c3c6-dcf0-c2a7-51f094998381@gmail.com>
Date:   Wed, 29 Apr 2020 20:02:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429162434.GA3157354@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

29.04.2020 19:24, Thierry Reding пишет:
> On Wed, Apr 29, 2020 at 05:46:46PM +0300, Dmitry Osipenko wrote:
>> 29.04.2020 16:57, Jon Hunter пишет:
>>>
>>> On 29/04/2020 13:35, Dmitry Osipenko wrote:
>>>> 29.04.2020 11:55, Thierry Reding пишет:
>>>> ...
>>>>>>> It's not "papering over an issue". The bug can't be fixed properly
>>>>>>> without introducing I2C atomic transfers support for a late suspend
>>>>>>> phase, I don't see any other solutions for now. Stable kernels do not
>>>>>>> support atomic transfers at all, that proper solution won't be backportable.
>>>>>>
>>>>>> Hm... on a hunch I tried something and, lo and behold, it worked. I can
>>>>>> get Cardhu to properly suspend/resume on top of v5.7-rc3 with the
>>>>>> following sequence:
>>>>>>
>>>>>> 	revert 9f42de8d4ec2 i2c: tegra: Fix suspending in active runtime PM state
>>>>>> 	apply http://patchwork.ozlabs.org/project/linux-tegra/patch/20191213134417.222720-1-thierry.reding@gmail.com/
>>>>>>
>>>>>> I also ran that through our test farm and I don't see any other issues.
>>>>>> At the time I was already skeptical about pm_runtime_force_suspend() and
>>>>>> pm_runtime_force_resume() and while I'm not fully certain why exactly it
>>>>>> doesn't work, the above on top of v5.7-rc3 seems like a good option.
>>>>>>
>>>>>> I'll try to do some digging if I can find out why exactly force suspend
>>>>>> and resume doesn't work.
>>>>>
>>>>> Ah... so it looks like pm_runtime_force_resume() never actually does
>>>>> anything in this case and then disable_depth remains at 1 and the first
>>>>> tegra_i2c_xfer() will then fail to runtime resume the controller.
>>>>
>>>> That's the exactly expected behaviour of the RPM force suspend/resume.
>>>> The only unexpected part for me is that the tegra_i2c_xfer() runtime
>>>> resume then fails in the NOIRQ phase.
>>>
>>> From reading the changelog for commit 1e2ef05bb8cf ("PM: Limit race
>>> conditions between runtime PM and system sleep (v2))", this is the
>>> expected behaviour for runtime resume in the noirq phase.
>>
>> I'm curious whether there is a way to tell RPM that it's okay to do it
>> for a particular device, like I2C that uses IRQ-safe RPM + doesn't have
>> parent devices that need to be resumed.
> 
> Been there, done that:
> 
> 	http://patchwork.ozlabs.org/project/linux-tegra/patch/20191128160314.2381249-2-thierry.reding@gmail.com/

It should work, but it looks to me more like a hack rather than a proper
fix. At least I haven't seen any other drivers doing anything like that.

I don't have any better suggestions for now, so perhaps it should be a
good enough solution for the starter, combined with setting the
IRQF_NO_SUSPEND flag for I2C interrupt. It should allow drivers like
PCIe to use I2C in the NOIRQ phase.

Maybe it could be worthwhile to try to ask Rafael about how drivers
should handle this situation in regards to the RPM usage.
