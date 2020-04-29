Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B37C1BDC64
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Apr 2020 14:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgD2Mfa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Apr 2020 08:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726426AbgD2Mfa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Apr 2020 08:35:30 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C63E1C03C1AD;
        Wed, 29 Apr 2020 05:35:29 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id f11so2445742ljp.1;
        Wed, 29 Apr 2020 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NUoe38klOCQtxasI+t9o8qMGW2IzeduoGzN0/atKrts=;
        b=MRiAm3TFoo3RKDwRuwyjSpfg0hBAboJFu4Rg82H4SpneSimPkxNpnFDp4x0JH/adU3
         ULl1pjCoQXNHiox1BNXexlIyVXL10N9pJKSBmqe1TnKZCce24DbwlAmyL63O5x+949Bl
         m4EH3xn7pki+DkNj6lpzgURhqw1xD77/1wDLPOm/PiY3qHHd88hRM+fy4T1k8o6polkT
         tX+zpbdFCxHrJ33BGkYSHqqgojH8XgOwwKrbZ1053jD1oVgNMwjDJyi/9kMuVoLAotMw
         80BOgbaBS8y39odMfidpUpClcBcAIPS+XTgGI1MdidQcto0jv6GVyJRpTbc2HtQWv4xO
         x1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NUoe38klOCQtxasI+t9o8qMGW2IzeduoGzN0/atKrts=;
        b=NOWcLswioiGn7BY9QmlLKNCqadibVyQjO61ttkd00WGsqnedWjBdaf/R8j0hfEN6AU
         gRGET9qtF66GCMduZ5JYiwhM8x26oErg7QFnQ1MppHbCCSVUjtg4PodqPMzxhJF84otK
         rlBficTje2pBP+jTX4BLCSk8jYP3+4ouIXpv5qP9kVkY93get0mBueBniurO5GGibvXD
         qm5p+LXLdt5/U0QfSJWR5SrZ21Ga4d6woNwQuPteV9b6oVhhx6ec1Fti32sCtx1M+Jaj
         Rb8RtYd+yAomSqVAhi8eUG4NllQL2jgJwPdib5R1MNs3C/am4V35vXZ36DX3r7E2txWs
         ZlFA==
X-Gm-Message-State: AGi0Pua8oVpHy0mfJ/WRLr74opjGzkPh/9fPpqxqBHTEwaKrCeDdgkMx
        4KFkvz8ijEGgmDzjcHm1kbg8MEmN
X-Google-Smtp-Source: APiQypI6czpfoNYYXqi1LKDgN8gs6cesq80NGh3Mlp6b3MgVjn1J8FfLxftkDbxG90dgaZk8ibUFYw==
X-Received: by 2002:a2e:700b:: with SMTP id l11mr17063691ljc.255.1588163727943;
        Wed, 29 Apr 2020 05:35:27 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id k18sm3007442lfg.81.2020.04.29.05.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2020 05:35:27 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9e36c4ec-ca02-bd15-d765-15635f09db4b@gmail.com>
Date:   Wed, 29 Apr 2020 15:35:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429085502.GB2345465@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

29.04.2020 11:55, Thierry Reding пишет:
...
>>> It's not "papering over an issue". The bug can't be fixed properly
>>> without introducing I2C atomic transfers support for a late suspend
>>> phase, I don't see any other solutions for now. Stable kernels do not
>>> support atomic transfers at all, that proper solution won't be backportable.
>>
>> Hm... on a hunch I tried something and, lo and behold, it worked. I can
>> get Cardhu to properly suspend/resume on top of v5.7-rc3 with the
>> following sequence:
>>
>> 	revert 9f42de8d4ec2 i2c: tegra: Fix suspending in active runtime PM state
>> 	apply http://patchwork.ozlabs.org/project/linux-tegra/patch/20191213134417.222720-1-thierry.reding@gmail.com/
>>
>> I also ran that through our test farm and I don't see any other issues.
>> At the time I was already skeptical about pm_runtime_force_suspend() and
>> pm_runtime_force_resume() and while I'm not fully certain why exactly it
>> doesn't work, the above on top of v5.7-rc3 seems like a good option.
>>
>> I'll try to do some digging if I can find out why exactly force suspend
>> and resume doesn't work.
> 
> Ah... so it looks like pm_runtime_force_resume() never actually does
> anything in this case and then disable_depth remains at 1 and the first
> tegra_i2c_xfer() will then fail to runtime resume the controller.

That's the exactly expected behaviour of the RPM force suspend/resume.
The only unexpected part for me is that the tegra_i2c_xfer() runtime
resume then fails in the NOIRQ phase.

Anyways, again, today it's wrong to use I2C in the NOIRQ phase becasue
I2C interrupt is disabled. It's the PCIe driver that should be fixed.
