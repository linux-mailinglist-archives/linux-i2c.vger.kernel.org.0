Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83F841BA3C5
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Apr 2020 14:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgD0Mqk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Apr 2020 08:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726539AbgD0Mqj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Apr 2020 08:46:39 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D024C0610D5;
        Mon, 27 Apr 2020 05:46:39 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id r17so13687802lff.2;
        Mon, 27 Apr 2020 05:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FYckNb0B+cZG7B36JVxEWqaLbf2JJ1+tQj5efljqrWM=;
        b=X/mGoeBWWZkOS3wqw0QTgkNqYvIgNK07zHnT9PAcBlZsAICRV3Cy/JLSOHbtKuGsDc
         USOj3zERIyBx/spuyhcUKVOmax1P0+N6p4e1peqiBA2tWXssdA8nEKUiEc5JFDh18zv+
         1MCVNAR83gIN6vcXqe+VSBvNQpX9Tsj/5ENYgPlimNt8LBGmAJ55lIUUKrzpbpgN+t3K
         C2K8LNVUYWS0vV/0xu7DfPSMlWmqjv2ngDsvTcItwnOk0a/tJagPxVYTF2K7xbElP2Fz
         +YSE3WiQutY5uBW58eTTIeFRgIk1rNE+bT6FvNG9av7SJ3Qi68YB3pTzDansSjyTPEuv
         CYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FYckNb0B+cZG7B36JVxEWqaLbf2JJ1+tQj5efljqrWM=;
        b=gl/v5XByjAFDhncOXN535cCLJdk2UH1ju4qRJsP2rD7KZibsVrJ+/4TbhLveLnObif
         OU1MP062dmEa9prp2ho1P4Iowl6GMk3aSJ2b7QmTIXjWhnmJo+YE6CqXFO971qtqhI95
         EB4RunVyOVAdBt4FL8YXMiM1PsL1kjBwKs7pJ+9K6pTBKvkPlBh9TN8IYl/V/u0Cuhuk
         l0fPTjJEb4E3b81DMDuN0LnmAwTaQTcOXTwazRUx57T/3ngLa6DB7X6zz/3ZtjJSfrwB
         2XwUHkmYYIHA3g8guDr9Ba+arLrw6f0a5Oz73ryZHdicJ+ozKCufvnneEWSuQFiOP8ES
         28aw==
X-Gm-Message-State: AGi0Pub2AmVzvXuXkFpploEh+bJwVQWI6e3T9xClyHE08vrqS4RG+x63
        rWrqQE+vSdVL+iBRvao0koGI/0/c
X-Google-Smtp-Source: APiQypIJymiTY3IXtDUEEdPTQaxxrlVOWeNXzfI9rboL+XxbjYH+ooqY11bQi2YDDffKjsA2TFq15w==
X-Received: by 2002:ac2:550e:: with SMTP id j14mr15067882lfk.188.1587991597830;
        Mon, 27 Apr 2020 05:46:37 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id j19sm11743119lfe.17.2020.04.27.05.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 05:46:36 -0700 (PDT)
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
 <bba0a93a-8ec4-eda6-97f3-fb2ab0b9b503@gmail.com>
 <6f07e5c8-7916-7ea2-2fe7-d05f8f011471@nvidia.com>
 <77a31b2f-f525-ba9e-f1ae-2b474465bde4@gmail.com>
 <470b4de4-e98a-1bdc-049e-6259ad603507@nvidia.com>
 <d2531fc1-b452-717d-af71-19497e14ef00@gmail.com>
 <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <da5985f4-44b3-336d-207d-4c0388806f95@gmail.com>
Date:   Mon, 27 Apr 2020 15:46:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a5198024-7273-74c4-b4f4-3a29d042bc36@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

23.04.2020 13:56, Jon Hunter пишет:
>>> So I think that part of the problem already existed prior to these
>>> patches. Without your patches I see ...
>>>
>>> [   59.543528] tegra-i2c 7000d000.i2c: i2c transfer timed out
>>> [   59.549036] vdd_sata,avdd_plle: failed to disable
>>> [   59.553778] Failed to disable avdd-plle: -110
>>> [   59.558150] tegra-pcie 3000.pcie: failed to disable regulators: -110
>> Does this I2C timeout happen with my patches? Could you please post full
>> logs of an older and the recent kernel versions?
> I believe that it does, but I need to check.
> 

Jon, could you please confirm that you're seeing those regulator-disable
errors with my patch? I don't see those errors in yours original log [1].

[1]
https://lore.kernel.org/lkml/1e259e22-c300-663a-e537-18d854e0f478@nvidia.com/

Again, could you please post the *full* logs?

If regulator's disabling was "failing" before without my patch because
of the I2C interrupt being force-disabled during of NOIRQ phase, and now
regulator's disabling succeeds with my patch because IRQ is manually
handled after the timeout, then this could be bad. It means that
regulator was actually getting disabled, but I2C driver was timing out
because interrupt couldn't be handled in NOIRQ phase, which should
result in a dead PCIe on a resume from suspend since regulator's core
thinks that regulator is enabled (I2C said it failed to disable), while
it is actually disabled.

Do you have anything plugged into the PCIe slot in yours testing farm?
It wouldn't surprise me if the plugged card isn't functional after
resume from suspend on a stable kernels.
