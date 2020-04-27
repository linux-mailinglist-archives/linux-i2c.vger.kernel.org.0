Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E650E1BA605
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 16:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgD0OOH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 10:14:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbgD0OOH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 10:14:07 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CD9FC0610D5;
        Mon, 27 Apr 2020 07:14:01 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e25so17749316ljg.5;
        Mon, 27 Apr 2020 07:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c8AQHsY8ZQ/Cy5ox+15xpqyPDPV+NimT+CSsM7t46b8=;
        b=jKmNNWFSSc0A+hrf0/miuC1saeKkdkKxFkjuCaz6KszE1dWOL4SG/dtwnvNsiKPGG9
         Fw/q7Pc7C/NdJboPhNNix+UpX+vUFdNI7js7qd9uzv1Xg6171itAIkCHhZyT6JktIhMg
         ITdaJO+B2uRDYaD2+ns1L1swGRHFL71FHbdenW62hS2dZMnMS49P8sdDkLIukLXh3x0F
         nAofB8q3yhkDjR3siVOTyYPp4wkt/bXIN4kpUFwCgU9H8UCOTqHF+TCGQeIvEbP+/n9H
         W/vU/+Eu7rNzHUJC2O6nscxUYK6R0vG4xqqUSAOI4e1FwHtLWe7eBZ9eGEnd2CZC2iG7
         ji4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c8AQHsY8ZQ/Cy5ox+15xpqyPDPV+NimT+CSsM7t46b8=;
        b=bbWXCHhR167Weqgtl+IDSP1xLsYRQEdRdFJMfv3XeeWmEBjETrn/ZOpEyb+8bC0QkQ
         lbenuxxp8FoBJNH4vaedWY4JAlpLO+2GPbFaP39f7idDTpzdJFwznPp47CzY6YlizgkE
         6X5DKBrCQUs9KOQqNTPNP/wIXEl3HbC1cNTyyYglIdX7mV6Rh0FPgHQ8abKxuZKMrcyb
         EU8gWWfluxwr1PbL+dPdQwrk+zY0O9+x+sNinqVOcMWJZhHECRiG3CkKZBuHK25RYOVW
         XTzqehyfCnJbOPmCoeGwNrubTavg98Z0gkcVGcGKzx3eunBVeRpsGJ33CFWkKxhWxtn/
         H+9Q==
X-Gm-Message-State: AGi0PuZJgxvM6HoPbDh4ls5y1kkmU2BMv8tAwPJ0J27Xay9MFsOUBirp
        PTxY+gCtbf9dBGxrBUeaK05GCXfh
X-Google-Smtp-Source: APiQypLQ1p5oqGSd3NEfGBRNduxXuo5WMn3UkrOaMJAYOZKqqlSyVGqBXzsslANjxprUFF8WOc8IEA==
X-Received: by 2002:a2e:760c:: with SMTP id r12mr13970197ljc.139.1587996839234;
        Mon, 27 Apr 2020 07:13:59 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id d13sm5568421ljc.14.2020.04.27.07.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 07:13:57 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
From:   Dmitry Osipenko <digetx@gmail.com>
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
 <bba0a93a-8ec4-eda6-97f3-fb2ab0b9b503@gmail.com>
 <6f07e5c8-7916-7ea2-2fe7-d05f8f011471@nvidia.com>
 <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
 <da5985f4-44b3-336d-207d-4c0388806f95@gmail.com>
Message-ID: <5fc71168-e4ac-11f6-dbf1-e80f4fae8d1a@gmail.com>
Date:   Mon, 27 Apr 2020 17:13:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <da5985f4-44b3-336d-207d-4c0388806f95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

27.04.2020 15:46, Dmitry Osipenko пишет:
> 23.04.2020 13:56, Jon Hunter пишет:
>>>> So I think that part of the problem already existed prior to these
>>>> patches. Without your patches I see ...
>>>>
>>>> [   59.543528] tegra-i2c 7000d000.i2c: i2c transfer timed out
>>>> [   59.549036] vdd_sata,avdd_plle: failed to disable
>>>> [   59.553778] Failed to disable avdd-plle: -110
>>>> [   59.558150] tegra-pcie 3000.pcie: failed to disable regulators: -110
>>> Does this I2C timeout happen with my patches? Could you please post full
>>> logs of an older and the recent kernel versions?
>> I believe that it does, but I need to check.
>>
> 
> Jon, could you please confirm that you're seeing those regulator-disable
> errors with my patch? I don't see those errors in yours original log [1].
> 
> [1]
> https://lore.kernel.org/lkml/1e259e22-c300-663a-e537-18d854e0f478@nvidia.com/
> 
> Again, could you please post the *full* logs?
> 
> If regulator's disabling was "failing" before without my patch because
> of the I2C interrupt being force-disabled during of NOIRQ phase, and now
> regulator's disabling succeeds with my patch because IRQ is manually
> handled after the timeout, then this could be bad. It means that
> regulator was actually getting disabled, but I2C driver was timing out
> because interrupt couldn't be handled in NOIRQ phase, which should
> result in a dead PCIe on a resume from suspend since regulator's core
> thinks that regulator is enabled (I2C said it failed to disable), while
> it is actually disabled.
> 
> Do you have anything plugged into the PCIe slot in yours testing farm?
> It wouldn't surprise me if the plugged card isn't functional after
> resume from suspend on a stable kernels.
> 

I actually now see that interrupt is not allowed to be enabled during
the NOIRQ phase:

https://elixir.bootlin.com/linux/v5.7-rc3/source/kernel/irq/manage.c#L640

it should be worthwhile to turn it into a WARN_ON.
