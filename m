Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAF7E1BA45D
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 15:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgD0NP0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 09:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726786AbgD0NPZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 09:15:25 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30590C0610D5;
        Mon, 27 Apr 2020 06:15:25 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e25so17528337ljg.5;
        Mon, 27 Apr 2020 06:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Yv+Yf1SDaIjRjfiGBc4e6L26R7Y5+CX+LAg5EicPHrE=;
        b=VAiQfdYYK49y2ij6jlP/UkXehRD0FlOK3KIywZgntgpXPqtpipYHBUXUYysji6qI8x
         RRCREB9Hosdaoqf9u2vCOaanQTM/FmgI1G2e0FCWnl9m9/SSioQUMPx6paQZmrmoRb3U
         GtbzkgF//kZajx/ADE61JJ5jlytOM59igNeWj7zSXPoX20knFCYqDeDdKiAyGmVPGXjE
         tHgcux94zLaVlWzQ2z80QubdOcPkO7C/hcozd8pqm//44A4VrhmYOTV0gVtNRcGCn9tN
         DVyB5UUCxDSeNFewBgELpVjvFcqxMXnc8+dpbfYbNd2MS/Lg40jmJJ756LM0rgJY0Ssl
         Hlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yv+Yf1SDaIjRjfiGBc4e6L26R7Y5+CX+LAg5EicPHrE=;
        b=IfnAl0+WTjKP7FeVsEjs5HZzyHoHf0v0WFBt4xKLg8C/JrF7aX2AwrRaX++rwjhBzW
         ZprjHKhWmkKiLHdbAjDl57j/vAFujH1COwjZGcGrXHrh4YQVbbVgkCVDljx6oIWjVzaY
         1MJYib4L39MMnr7NuW8wYvuLvoC+Uctux6NJ1hLkwBWIoJ1+GQoKHQyVeWjN3bQx5EB2
         RM5YBwnZSW6oYiTDLA4bIpLGSPSqJrpuXBh1dbMe8FT6rsAf0L3fy5FjZqDwCL7kEdBu
         k+IXmpER3fR+/SNiLLoFbFRTbb3LJBxtepthlI13Hq0jnpVe3K+kED0jplK4JNewcVuo
         Kp3Q==
X-Gm-Message-State: AGi0PuYCbOQcPtHMk/tP7JwQpirHCbf7fjMNr8Hqa1SMnwk7fZgSrBeT
        G+FaZBrcF8IHDoS5xrjkMgWfN8jV
X-Google-Smtp-Source: APiQypKEDGP/PSN983auyZAywmLt8GSg70EdZeYAC2WFD1YAvqJ8Q5FjzS/gNq1XPeVYCcycOiNAlg==
X-Received: by 2002:a2e:b4a5:: with SMTP id q5mr14589286ljm.58.1587993323426;
        Mon, 27 Apr 2020 06:15:23 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id z65sm11447664lfa.37.2020.04.27.06.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 06:15:22 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427103851.GB24446@kunai>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dc2de966-81d6-6ad5-0c51-16dd28ca4165@gmail.com>
Date:   Mon, 27 Apr 2020 16:15:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427103851.GB24446@kunai>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

27.04.2020 13:38, Wolfram Sang пишет:
> On Mon, Apr 27, 2020 at 12:52:10PM +0300, Dmitry Osipenko wrote:
>> 27.04.2020 10:48, Thierry Reding пишет:
>> ...
>>>> Maybe but all these other problems appear to have existed for sometime
>>>> now. We need to fix all, but for the moment we need to figure out what's
>>>> best for v5.7.
>>>
>>> To me it doesn't sound like we have a good handle on what exactly is
>>> going on here and we're mostly just poking around.
>>>
>>> And even if things weren't working quite properly before, it sounds to
>>> me like this patch actually made things worse.
>>
>> There is a plenty of time to work on the proper fix now. To me it sounds
>> like you're giving up on fixing the root of the problem, sorry.
> 
> From what I understood, there were (at least) two regressions reported.
> So, to me, it makes sense to revert the change, so for upstream users
> everything stays "the same". Of course, this does not mean it should
> stay like this forever and you guys can work on fixing the root causes.
> I'll happily apply them for this release when you are confident with the
> results.
> 

For now it's a single regression in the PCIe driver and it's actually
not a regression, but a PCIe driver bug that needs to be fixed. The I2C
part should be okay.

By reverting the I2C patch, we're back to the PCIe bug being papered
over and I don't like this. Let's just fix the PCIe driver and the
problem is gone.. it needs to be fixed anyways.
