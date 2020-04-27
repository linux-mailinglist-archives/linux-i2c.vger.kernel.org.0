Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020521BA6CB
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 16:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgD0Opa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 10:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727077AbgD0Opa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 10:45:30 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E310C0610D5;
        Mon, 27 Apr 2020 07:45:30 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a21so17860251ljb.9;
        Mon, 27 Apr 2020 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UmcvB+icBroDzkka3UAHpcYnvCsSTvFkr+1fpDIIjtc=;
        b=Qg8bvRvIvrTblf2F5kQz7bAoUJ0ywYJk7j0qHPT/T6VKZPSatyIQWLf+Eh39VqGJux
         Gj0FIO6I+CuRwiWbI8K2Ngtyjt/xVexnXg36VjFlw0wBjXPKBOY/ap53fSgHiB5Ni2Sh
         EibyUIfHwrIJG5PMnmWhHX3QtEsYLDk2tTHOvwrnKIhSGgJvkrdwqD3L9ClP7s1awCxp
         2n4NCR7j3g+rZnmdg5hwDZ7vy1rOnyu8zmK3CxkOxh28YUWz9Jh0Fh6Fcvn4wPgbJPZW
         EwbEN8mwHbmsKz4WEdiw2wBXGMHc43FevijiN7JuEopkBz0gTgduLKBidazT2JYRX7TQ
         E4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UmcvB+icBroDzkka3UAHpcYnvCsSTvFkr+1fpDIIjtc=;
        b=f2gvYR7eOpbQDxVtCv0y7y08t2QoDARfkXIcA6CNhGPai36ZWyQYszPPdw+CKxM+5P
         5fJ2reQAu80RMZtzldKpvoH6YJ9YJ6MRsdxeNgbcT5Vzf7B985tlLBmXd9p3mKkUewGE
         GjmMI6IPcYfnNG/QlLgPEB17ff/yHe4LiPoV37uMrbJmI5nxTCaDrIhu0P/YGbgefaQJ
         3D0Kt0j59SnllkL3djE25FBK++0ulQLY+bFRkcGkD5GJq7D3ZsVWByxO9OTTRheImYKk
         yd/JRstp3DpyAUcba+xWh6/jDlQrxa6fueJTRK09yvJdxnkFI/4gj/5EZtn11JHGAr3P
         4KHQ==
X-Gm-Message-State: AGi0PuZXx/L3YgLxzfkzKlN8GN2izkRacuV9q0TGBcW6Pjb1bXKcrnF1
        cWPAx5ojKQ0fkFL9DF5DZFsO7uO3
X-Google-Smtp-Source: APiQypKee063pMi1m6kMVabheRTsFVy/ZZY46RncbCvCsbopAgvxjAWo3JrHLWq8mW5DCPIzX62YCw==
X-Received: by 2002:a2e:5847:: with SMTP id x7mr14175519ljd.61.1587998728237;
        Mon, 27 Apr 2020 07:45:28 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id a19sm11368462lff.11.2020.04.27.07.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 07:45:27 -0700 (PDT)
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
 <5fc71168-e4ac-11f6-dbf1-e80f4fae8d1a@gmail.com>
Message-ID: <090241c4-e026-aea4-e1e9-a2a661b2c27e@gmail.com>
Date:   Mon, 27 Apr 2020 17:45:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5fc71168-e4ac-11f6-dbf1-e80f4fae8d1a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

27.04.2020 17:13, Dmitry Osipenko пишет:
> 27.04.2020 15:46, Dmitry Osipenko пишет:
>> 23.04.2020 13:56, Jon Hunter пишет:
>>>>> So I think that part of the problem already existed prior to these
>>>>> patches. Without your patches I see ...
>>>>>
>>>>> [   59.543528] tegra-i2c 7000d000.i2c: i2c transfer timed out
>>>>> [   59.549036] vdd_sata,avdd_plle: failed to disable
>>>>> [   59.553778] Failed to disable avdd-plle: -110
>>>>> [   59.558150] tegra-pcie 3000.pcie: failed to disable regulators: -110
>>>> Does this I2C timeout happen with my patches? Could you please post full
>>>> logs of an older and the recent kernel versions?
>>> I believe that it does, but I need to check.
>>>
>>
>> Jon, could you please confirm that you're seeing those regulator-disable
>> errors with my patch? I don't see those errors in yours original log [1].
>>
>> [1]
>> https://lore.kernel.org/lkml/1e259e22-c300-663a-e537-18d854e0f478@nvidia.com/
>>
>> Again, could you please post the *full* logs?
>>
>> If regulator's disabling was "failing" before without my patch because
>> of the I2C interrupt being force-disabled during of NOIRQ phase, and now
>> regulator's disabling succeeds with my patch because IRQ is manually
>> handled after the timeout, then this could be bad. It means that
>> regulator was actually getting disabled, but I2C driver was timing out
>> because interrupt couldn't be handled in NOIRQ phase, which should
>> result in a dead PCIe on a resume from suspend since regulator's core
>> thinks that regulator is enabled (I2C said it failed to disable), while
>> it is actually disabled.
>>
>> Do you have anything plugged into the PCIe slot in yours testing farm?
>> It wouldn't surprise me if the plugged card isn't functional after
>> resume from suspend on a stable kernels.
>>
> 
> I actually now see that interrupt is not allowed to be enabled during
> the NOIRQ phase:
> 
> https://elixir.bootlin.com/linux/v5.7-rc3/source/kernel/irq/manage.c#L640
> 
> it should be worthwhile to turn it into a WARN_ON.
> 

Oh, wait! There is already a warning there.. hmm.
