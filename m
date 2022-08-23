Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBCFC59E886
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 19:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343647AbiHWRB5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Aug 2022 13:01:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344367AbiHWRBO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Aug 2022 13:01:14 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4EAD14E13B;
        Tue, 23 Aug 2022 06:32:18 -0700 (PDT)
Received: from [192.168.2.145] (unknown [109.252.119.13])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 0D8946601DD8;
        Tue, 23 Aug 2022 14:32:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1661261536;
        bh=qYAbuLUkpYt+uM+/fl7m986bAwBm8xRYbN9/9PNiiyg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=awhbsSUN/KwnvxfssZE3JauPUbX717ylMppTYN5OSSg5EkcgTbcPNTgq3FRIPUyju
         JngJpWUg14TdAeOVtnuLsUOT8eN/5C1B1cCcpyVZV9qknSbauELUkEI7vFuQPDwSyS
         Tz+6Q6oTRFK4rGZal8a54PCHxC8fGyqJMF3k5PWOPAgXkAkgeXT295N0U0FmDU/hYB
         P0/TYvcNkqrXpZ0eCrqCr267op1TsInXIXr624UPHHhR47lIYf5wD+VUvz7Ve74Qle
         EsjwpmQgN3+1gNKqBBXWDZu2tFd7m1gIczOD5rKy4MOTergFbk1nPXdw1CyJ81QQuY
         7kKKttATwI1/w==
Message-ID: <4f791065-e0dd-6ed5-f152-86d7be683490@collabora.com>
Date:   Tue, 23 Aug 2022 16:32:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "wsa@kernel.org" <wsa@kernel.org>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "Kartik ." <kkartik@nvidia.com>
References: <20220819122313.40445-1-akhilrajeev@nvidia.com>
 <20220819122313.40445-2-akhilrajeev@nvidia.com>
 <20281ca7-e597-7030-4861-5f9a3594726d@gmail.com>
 <89a746fd-a98e-3147-7811-33c5051c2b6d@gmail.com>
 <SJ1PR12MB6339FC1F82EB1BB7417E533BC0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <ebb0764f-db92-d69d-49ac-151f4e3e0b8a@collabora.com>
 <SJ1PR12MB63396DC508F63807F1CE9901C0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <fac10841-1682-845f-3e4a-5668f59caed0@gmail.com>
 <cd0374f1-2c05-7e61-7187-cfc9c42edf63@gmail.com>
 <SJ1PR12MB63397BBD4EF314A742680F2CC0709@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <a7ba27c4-992b-28d1-f6c2-3937b4f275ce@collabora.com>
 <c9ba2629-fc81-cefd-0d6d-991084781ec3@collabora.com>
 <SJ1PR12MB63393F51E29BA1F85AD249DBC0709@SJ1PR12MB6339.namprd12.prod.outlook.com>
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <SJ1PR12MB63393F51E29BA1F85AD249DBC0709@SJ1PR12MB6339.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/23/22 15:55, Akhil R wrote:
...
>>>> What I am trying for is to have a mechanism that doesn't halt the i2c
>> transfers
>>>> till DMA is available. Also, I do not want to drop DMA because it was
>> unavailable
>>>> during probe().
>>>
>>> Why is it unavailable? Sounds like you're not packaging kernel properly.
> Unavailable until initramfs or systemd is started since the module has to be
> loaded from either of it.
> 
>>>
>>>> This situation is sure to hit if we have I2C driver as built in and DMA driver as a
>>>> module. In such cases, I2C will never be able to use the DMA.
>>>
>>> For Tegra I2C built-in + DMA driver module you should add the dma.ko to
>>> initramfs and then it will work. This is a common practice for many
>>> kernel drivers.
>>>
>>> It's also similar to a problem with firmware files that must be
>>> available to drivers during boot,
> 
> Isn't the initramfs loaded after the driver initcalls? Wasn't very much clear for me
> from the code and docs. We did try adding the module in initramfs initially, but
> couldn't find much of a difference from when it is loaded by systemd in rootfs.
> Will explore more on this if this really helps.

It doesn't matter when initramfs is loaded. Tegra I2C should be
re-probed once DMA driver is ready, that's the point of deferred
probing. I'd assume that your DMA driver module isn't loading.

>>>> Another option I thought about was to request and free DMA channel for
>> each
>>>> transfer, which many serial drivers already do. But I am a bit anxious if that
>> will
>>>> increase the latency of transfer.
>>>
>>> Perhaps all you need to do is to add MODULE_SOFTDEP to Tegra I2C driver
>>> like we did it for the EMC driver [1].
>>>
>>> [1]
>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-
>> next.git/commit/?id=14b43c20c283de36131da0cb44f3170b9ffa7630
>>>
>>
>> Although, probably MODULE_SOFTDEP won't work for a built-in driver. In
>> that case, change Tegra I2C kconfig to depend on the DMA driver.
> 
> Since I2C can work without DMA, wouldn't it limit the flexibility of I2C driver.

There are kernel configurations that are not worthwhile to support
because nobody use them in practice. I think this is exactly the case
here. The TEGRA20_APB_DMA driver dependency created troubles for a long
time.

If DMA driver is enabled in kernel config, then you should provide the
driver module to kernel and it will work.

If DMA driver is disabled in kernel config, then Tegra I2C driver should
take that into account. I'm now recalling that this was the reason of
"!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)" in the code.

Since all h/w gens now provide DMA support for Tegra I2C, then should be
better and easier to make DMA a dependency for Tegra I2C and don't
maintain kernel build configurations that nobody cares about.

-- 
Best regards,
Dmitry
