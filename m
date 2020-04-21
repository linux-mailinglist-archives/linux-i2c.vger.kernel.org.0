Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9481B2AAE
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Apr 2020 17:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729057AbgDUPJC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Apr 2020 11:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgDUPJC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Apr 2020 11:09:02 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E9B9C061A10;
        Tue, 21 Apr 2020 08:09:00 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id n6so10985109ljg.12;
        Tue, 21 Apr 2020 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PJ2vFfBZGdU5ZRkYjORGT3QSQUV1Hukqw/CItLnNVhc=;
        b=FQ/6oIX9b978+5Q1Y4zMHr2x6a8mSsdPkcpbVARmjtij5YsPeezRAOvVFKCz8k4sQp
         tInfv+J4u0YksA3KufqvEs0yqHu8Foy7Mhghghg6Z9sd+dFwMNpmsZzHlt3gDdVZU3NM
         v8KIaAEknpv0JnN+MCqWQzB018Eb87bbQGK67qyHk80ZSfNyPCefMV2BiQvSsMwoktit
         ktw2OhY4avaUT4D+7OBEuCR9yiOQmzxOIqOUj7NzdMMoSA7uNZq4a2FLWGNZKZwG8A90
         /Wwjyci5XLSL4FQr/kCS8hFCaFbAMnnW77T9TEWUw48bBr5AK7KCfrIcUdqHkrZkJl+d
         HMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PJ2vFfBZGdU5ZRkYjORGT3QSQUV1Hukqw/CItLnNVhc=;
        b=Ur90Rq701V7k439zzNLf5i0dHh/ntxcmppmfm61pYkJKq7AddQdZ+kZ2UqG2rjYBrs
         Ex+kOsutG/5VxmMatgGWH7ysjTmwAwwVxUHoTsbcfQSKMNg3Fv7NARWvuVp4hCQWjBxL
         pKhQoIjIreEZ3ddjrXqtqFClEUVkqgGLUWS1rA9b2cukXPixPo9/xPbLabYzO8duzZwv
         kwe7nyulN6IO6BtusE/cBRFeHUBNRiGECGPLRTLbw5dYd47CKQ3/ejcggnf+zjWYjlmW
         GgXaLx4uBrkniLoQwRf5RFPkE8gfwRE5VPIwjQ2an5YNZUPu8fNLU/oiBCmdihfnJ5lq
         g4bw==
X-Gm-Message-State: AGi0PuYwzsLnV2hvMykNHUgW01pEp4RC8eCGyp87a14j0sMk4UwaeowJ
        8CDKnoDne8T9iUwj4scKu2DbmOJk
X-Google-Smtp-Source: APiQypIC9LVkOozdTl4B0Afm5JLxwzKJf777JLJ2FTMjtOurX85K6qZm/988+5RfsAdQsHIB68r3+A==
X-Received: by 2002:a2e:6c16:: with SMTP id h22mr3311996ljc.30.1587481738520;
        Tue, 21 Apr 2020 08:08:58 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id a19sm2347295lff.11.2020.04.21.08.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 08:08:57 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
 <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
 <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
 <db1132ce-53a8-371c-98e0-cb7cd91d5c7d@gmail.com>
 <fa344989-4cce-0d2c-dc93-4ca546823160@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bba0a93a-8ec4-eda6-97f3-fb2ab0b9b503@gmail.com>
Date:   Tue, 21 Apr 2020 18:08:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fa344989-4cce-0d2c-dc93-4ca546823160@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

21.04.2020 17:40, Jon Hunter пишет:
> 
> On 21/04/2020 14:25, Dmitry Osipenko wrote:
>> 21.04.2020 12:49, Jon Hunter пишет:
>> ...
>>> I can try the above, but I agree it would be best to avoid messing with
>>> the suspend levels if possible.
>>
>> Will be awesome if you could try it and report back the result.
>>
> 
> I gave it a try but suspend still fails.

Perhaps the RPM's -EACCES is returned from here:

https://elixir.free-electrons.com/linux/v5.7-rc2/source/drivers/base/power/runtime.c#L723

Which suggests that I2C is accessed after being suspended. I guess the
PCIe driver suspends after the I2C and somehow my change affected the
suspension order, although not sure how.

Jon, could you please try to enable PM logging and post the log? Please
also post log of the working kernel version, so that we could compare
the PM sequence.

Something like this should enable the logging: "echo 1 >
/sys/power/pm_trace" + there is RPM tracing.
