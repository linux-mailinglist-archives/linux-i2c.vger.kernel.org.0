Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08DD31C2641
	for <lists+linux-i2c@lfdr.de>; Sat,  2 May 2020 16:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbgEBOkk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 May 2020 10:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728025AbgEBOkk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 May 2020 10:40:40 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0588C061A0C;
        Sat,  2 May 2020 07:40:39 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id z22so5852287lfd.0;
        Sat, 02 May 2020 07:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jF079cO7Jq/3nThqQzbP5w55X0eSfqlpg5uSL6fU9Jw=;
        b=WwCDY31unfVfXCynpQMFGt8MVkUQJ3CsNANMXHEPEj/1PG4hEn+ovXfOaNKdXm/2Bt
         EnHmmELBoj+ZSD8Kd4neeHdw70aUvh8GuagIvJhf451JblBUEEiMW/ZZ6Y1lAiOYxOh8
         l4q5zxPpewV0YviJRg4xlYxQLb477Lki+KV7K+zr0DJpTKW6eIMvUnWiS67FiU/j2Nok
         CanstU9HnBB1N2q7alH938QS7lQ4Fw70RFmHREc2CWCweKKPk+02XOqEGORwHY4KzyQc
         sNw/uCMRZqdBW5oODOrkafbcD+vFPqsO0gjVITsmhLPkOcluKKsXg8QCGekM3bmQ18st
         mhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jF079cO7Jq/3nThqQzbP5w55X0eSfqlpg5uSL6fU9Jw=;
        b=fdiOre3oHMPkgItuFmY491KATjPJk9xR8JsgSRsHmL6SgYiLsFH3oj0832HJA/LD6D
         VpqysojC+D0OtltFYWB+L8w/Nr2b6NZJn9kA4FiObSgxg4oHCdkK7RsTclkoON041eTn
         hzRoUF2XYUCorxxZVQctJO7HhIpZ92uYrq5MZgRFs12GsVsTlnM/TLYLOf0Da6F+73RZ
         g0KPLPjvGqDHpEqddZxaOzqqYfLxwU4x7I0s45jrCuxaOceZO2KgiSmUWM09ZgT/gQwL
         PfMDHVEg5IWKZVcayanXASMtnVmrIBdR/2hDZNzUrGB9SIDtq0fOX7pIWG5K+WyQIWyQ
         iiXw==
X-Gm-Message-State: AGi0PuYPNGgeXEu5gmqpliMIbgjS7NcMFfGrnlKXmTUU6ObSYIgpt4vp
        wTb0d3bRDpGAeXq8FCGI0xagJSwT
X-Google-Smtp-Source: APiQypJPjn3k3xOMWu/0rPIimvR9U97xYWUlJ77FeciBHb450OkCQAxR3iC1/aMzfDoxan8C4pJ53Q==
X-Received: by 2002:a05:6512:31ca:: with SMTP id j10mr5450160lfe.74.1588430437970;
        Sat, 02 May 2020 07:40:37 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id k22sm3964210ljj.85.2020.05.02.07.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2020 07:40:36 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Wolfram Sang <wsa@the-dreams.de>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <f8fb1f7f-2497-033e-ff2c-c86c6caa9706@gmail.com>
 <fd1ca178-1ea3-851f-20a6-10bf00453ce3@nvidia.com>
 <a5734f19-254e-b6bc-e791-fa1ac63f11a4@gmail.com>
 <79f6560e-dbb5-0ae1-49f8-cf1cd95396ec@nvidia.com>
 <20200427074837.GC3451400@ulmo>
 <c1190858-eaea-8e94-b4d1-1cf28076c330@gmail.com>
 <20200427103851.GB24446@kunai>
 <dc2de966-81d6-6ad5-0c51-16dd28ca4165@gmail.com>
 <20200427141922.GD3464906@ulmo> <20200427153106.GA8113@kunai>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e5a3dd07-97f5-29f1-974e-3037a01cc89c@gmail.com>
Date:   Sat, 2 May 2020 17:40:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427153106.GA8113@kunai>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

27.04.2020 18:31, Wolfram Sang пишет:
> 
>> Yes, that bug should be fixed anyway. But that doesn't justify breaking
>> suspend/resume completely, which *is* a regression.
>>
>> Look, I'm not saying that we should drop this patch altogether. All I'm
>> saying is that we should postpone it so that we can: a) get suspend and
>> resume working again (and by doing so make sure no other suspend/resume
>> regressions silently creep in, because that always seems to happen when
>> you're not looking) and b) fix any preexisting issues without possibly
>> scrambling the result with this perhaps unrelated fix.
>>
>> So, again, I think the safest road forward is to back this one out for
>> now, fix whatever this other bug is and once suspend/resume is working
>> properly again we can revisit this patch based on a known-good baseline.
> 
> I am with you here. I want to add that the proper fix should be
> developed without thinking too much about stable in the first place.
> *When* we have a proper working fix, then we can think about making it
> "more" suitable for backporting. Yet, it may also be a result that older
> kernels need a different solution. Or have no solution at all, in case
> they can't do atomic_transfers and this is needed.
> 
> D'accord?
> 

I saw that you submitted the revert of the patches for 5.7, hopefully it
won't result in putting the PCIe driver problem into the back burner.
I'll try not to forget about these patches to resubmit them later on,
once the problem will be resolved :)
