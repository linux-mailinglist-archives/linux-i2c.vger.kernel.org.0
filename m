Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A5E25C423
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 17:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbgICPEG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 11:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728984AbgICN60 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Sep 2020 09:58:26 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE185C061A20;
        Thu,  3 Sep 2020 06:48:37 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s205so3789984lja.7;
        Thu, 03 Sep 2020 06:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LaqCbRyYwj+hXeNs4Rfcy15/efkgJqt2Cesa41CCq68=;
        b=pFqpNhWNj4qz5FszdeKCO0DovSJF9igdv0sKaSivGNh1VvmDLPOJ2rVuVtDSOn9zZV
         5tbik1hIIgqy04EDMRQ3NMuHvhu7FlLQz+wUAjmVDBFSFkR9PgVZOFJONMHTxo84I43H
         K5VhgNgMdds6pfYJBoww/b+eiYOTiOhK1ZOTnzv+BveFKlyUOolamDkKm2blJbO6uPfw
         ypekU/Bx1o85t+RyeTWpkAKnz+WZVog0AaReHQ7kjKsS01R+LztnFevJCwHFwPUwxxZg
         TtKboFvpMlSXgqH/9owS8ConHNcYoX72N3imv6VsGCoDB+cDklcIQGCzaECSADbrMNEq
         vsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LaqCbRyYwj+hXeNs4Rfcy15/efkgJqt2Cesa41CCq68=;
        b=TtBuX/cypAOqiOQ4VPqLSyF393UE3zGZeD2Dq9ZBA3Yv/jRBzHP8r560EapfwtZwvQ
         wuUVQONSum0vFXwhiGZHWbQrwGJsQ/gSWktCq5n365vt5kRc4ha/CR5uLrDwZWMfJ4FR
         trLwEHcKTDipfeRuqrxZ0VtdPh03vndoK88l5SWI066oX3Cc500iYORE4WQ5ItEmUKgk
         +xUgD+TXMFvS3JWso412bXUKCU6KvSZZYW7G2zBPuFl28IEenBbkt/LkWxBPcOtmCHVg
         NJi8RcIam+67F+Qu3BuZWT5kvRNR1hpytjv+XigS13mPP05Q0duUbXBSX7zqd6x9sMnW
         4piA==
X-Gm-Message-State: AOAM531iOOltLwk5qalkv3kaEKALR3Mmp1C7hQKaRaGq6Q2EqP0s1Bu/
        sa3x4oFHgKwF3gLjjJ5KMOnsE54qrO8=
X-Google-Smtp-Source: ABdhPJysBNIOjzHtL+VhmNkg+NelDDnocAgSZYpjvcLtfIhQVLeWlsH5s72PcLFzEMhLzr7ci/8TXw==
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr1448443ljm.364.1599140916133;
        Thu, 03 Sep 2020 06:48:36 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id k205sm605178lfk.19.2020.09.03.06.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 06:48:35 -0700 (PDT)
Subject: Re: [PATCH v3 09/22] i2c: tegra: Clean up probe function
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200903005300.7894-1-digetx@gmail.com>
 <20200903005300.7894-10-digetx@gmail.com>
 <CAHp75VdPoJFNC+MntKu-CL8jFMEe85ZT3R9DF0aaNC4KjqWXyg@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4bd12095-7a29-bcb4-6b49-83eca285c897@gmail.com>
Date:   Thu, 3 Sep 2020 16:48:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdPoJFNC+MntKu-CL8jFMEe85ZT3R9DF0aaNC4KjqWXyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

03.09.2020 14:17, Andy Shevchenko пишет:
> On Thu, Sep 3, 2020 at 3:54 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> The driver's probe function code is difficult to read and follow. This
>> patch reorders code of the probe function, forming logical groups that are
>> easy to work with. The clock and hardware initializations are factored
>> out into separate functions in order to keep code clean and ease error
>> unwinding.
>>
>> Driver now makes use of devm_platform_get_and_ioremap_resource() and
>> platform_get_irq() which are replacing boilerplate parts of the code.
>>
>> The dev_err_probe() is now used for reset control retrieval because reset
>> is now requested before clocks, and thus, BPMP driver that provides reset
>> controls for newer SoCs may cause the probe defer.
> 
>> The error message of devm_request_irq() is removed because this function
>> takes care of printing the message by itself.
> 
> I see no evidence of this.

Good catch! I confused it with the platform_get_irq() which prints the
message! I'll correct it in v4, thanks!

Anyways, the message of devm_request_irq() needs a correction since it
prints the number of vIRQ instead of the error code.

> ...
> 
>> +       of_property_read_u32(np, "clock-frequency", &bus_clk_rate);
>> +       i2c_dev->bus_clk_rate = bus_clk_rate;
> 
> Hmm... I dunno if Wolfram is going to implement a special helper
> exactly for this. I remember we discussed that with him during v5.8
> (?) times.

I now see that there is a i2c_parse_fw_timings() which parses
"clock-frequency" and other common properties. I could switch to use
that helper, but not sure whether it would be really worthwhile because
only one property is needed to be parsed. I'll consider this change for
v4, thank you for the suggestion!

> ...
> 
>> +static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
> 
> Hmm... Don't we have something like devm_clk_bulk_get_all() or so?
> 

Sounds like a good suggestion! I'll consider it for the v4, thanks!
