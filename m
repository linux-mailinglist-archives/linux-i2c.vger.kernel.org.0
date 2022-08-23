Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA4959D772
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 11:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241727AbiHWJwy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Aug 2022 05:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352405AbiHWJvm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Aug 2022 05:51:42 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32CE9F0C0;
        Tue, 23 Aug 2022 01:45:47 -0700 (PDT)
Received: from [10.3.2.13] (zone.collabora.co.uk [167.235.23.81])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id AF4B5660035D;
        Tue, 23 Aug 2022 09:45:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1661244303;
        bh=MB2Qk+RxUws0IOBMaJlk3RN6WN03sqbEJpsq6QhTiEM=;
        h=Date:Subject:From:To:References:Cc:In-Reply-To:From;
        b=WqIfcZKyImmTfB1AChHEp/cNhSy5VfGIwKlqyu4BjRlo31mlsYSLXy73lgbbDuQ6d
         m/ScKTpMI7l932ttZBnbj5ChU9vo799g3Fx4ZTqle5C11uniuCIMrGHsePZW50eoBp
         Q7Z+fTKI2fNlset1cpqhGiQN8bGmhqWs/wqyDgQu8QvmADPSDLU9wrmVMluwxvyl3W
         KVCEbcJDb785SthcHCYLwN7HRWrGB3sipx47623NWwHjedJ3GR/dH+gXMOqpCL2Kh3
         iHWTIEmzNLlQIWLy7AlD/wHCyVSTJvHjHUh+0dvqxmaWOn4gnEkobPC1Mzdr/RQ1eJ
         uZFHfCH4XdQlw==
Message-ID: <c9ba2629-fc81-cefd-0d6d-991084781ec3@collabora.com>
Date:   Tue, 23 Aug 2022 11:45:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Content-Language: en-US
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
To:     Akhil R <akhilrajeev@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "wsa@kernel.org" <wsa@kernel.org>
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
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
In-Reply-To: <a7ba27c4-992b-28d1-f6c2-3937b4f275ce@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 8/23/22 11:39, Dmitry Osipenko wrote:
> On 8/23/22 08:17, Akhil R wrote:
>>> 22.08.2022 23:33, Dmitry Osipenko пишет:
>>>> 22.08.2022 13:29, Akhil R пишет:
>>>>>> On 8/22/22 09:56, Akhil R wrote:
>>>>>>>> 19.08.2022 18:15, Dmitry Osipenko пишет:
>>>>>>>>> 19.08.2022 15:23, Akhil R пишет:
>>>>>>>>>>      if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
>>>>>>>>>>              i2c_dev->is_vi = true;
>>>>>>>>>> +    else
>>>>>>>>>> +            i2c_dev->dma_support = !!(of_find_property(np, "dmas",
>>>>>>>>>> + NULL));
>>>>>>>>>
>>>>>>>>> 1. You leak the np returned by of_find_property().
>>>>>>>>>
>>>>>>>>> 2. There is device_property_read_bool() for this kind of
>>>>>>>>> property-exists checks.
>>>>>>> Okay. I went by the implementation in of_dma_request_slave_channel() to
>>>>>>> check 'dmas'.
>>>>>>>
>>>>>>>>>
>>>>>>>>> 3. If "dmas" is missing in DT, then dma_request_chan() should return
>>>>>>>>> NULL and everything will work fine. I suppose you haven't tried to
>>>>>>>>> test this code.
>>>>>>>>
>>>>>>>> Although, no. It should return ERR_PTR(-ENODEV) and then you should
>>> check
>>>>>>>> the return code.
>>>>>>> Yes. Agree that it is more agnostic to check for ERR_PTR(-ENODEV). But
>>> since I
>>>>>>> call tegra_init_dma() for every large transfer until DMA is initialized,
>>> wouldn't
>>>>>>> it be better to have a flag inside the driver so that we do not have to go
>>>>>> through
>>>>>>> so many functions for every attempted DMA transaction to find out that
>>> the
>>>>>> DT
>>>>>>> properties don't exist?
>>>>>>>
>>>>>>> Shall I just put i2c_dev->dma_support = true here since DMA is supported
>>> by
>>>>>>> hardware? It would turn false if dma_request_chan() returns something
>>> other
>>>>>>> than -EPROBE_DEFER.
>>>>>>>
>>>>>>>       if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
>>>>>>>               i2c_dev->is_vi = true;
>>>>>>>  +    else
>>>>>>>  +            i2c_dev->dma_support = true;
>>>>>>
>>>>>> The code already has dma_mode for that. I don't see why another variable
>>>>>> is needed.
>>>>>>
>>>>>> Either add new generic dma_request_chan_optional() that will return NULL
>>>>>> if channel is not available and make Tegra I2C driver to use it, or
>>>>>> handle the error code returned by dma_request_chan().
>>>>>
>>>>> Let me elaborate my thoughts.
>>>>>
>>>>> The function tegra_i2c_init_dma() is also called inside tegra_i2c_xfer_msg() if
>>>>> DMA is not initialized before, i.e. if (!i2c_dev->dma_buf).
>>>>
>>>> This is not true
>>>>
>>>> i2c_dev->dma_mode=false if !i2c_dev->dma_buf and that's it
>>>>
>>>> https://elixir.bootlin.com/linux/v6.0-rc2/source/drivers/i2c/busses/i2c-
>>> tegra.c#L1253
>>>>
>>>> tegra_i2c_init_dma() is invoked only during probe
>>>>
>>>>> So, if suppose there is no DT entry for dmas, the driver would have to go take
>>> the
>>>>> path tegra_i2c_init_dma() -> dma_request_chan() -> of_*() apis -> ... and
>>> then figure
>>>>> out that DMA is not supported. This would happen for each transfer of size
>>> larger than
>>>>> I2C_PIO_MODE_PREFERRED_LEN.
>>>>>
>>>>> To avoid this, I am looking for a variable/flag which can indicate if the driver
>>> should attempt
>>>>> to configure DMA or not. I didn't quite get the idea if dma_mode can be
>>> extended to support
>>>>> this, because it is updated based on xfer_size on each transfer. My idea of
>>> i2c_dev->dma_support
>>>>> is that it will be constant after the probe().
>>>
>>> I see now that it's you added tegra_i2c_init_dma() to
>>> tegra_i2c_xfer_msg(). And tegra_i2c_init_dma() already falls back to PIO
>>> if DMA is unavailable.
>>>
>>> I don't remember why !IS_ENABLED(CONFIG_TEGRA20_APB_DMA) was added
>>> to
>>> tegra_i2c_init_dma(), but if dma_request_chan() returns -EPROBE_DEFER
>>> when there is no DMA channel available at all, then you should fix it.
>>>
>>> Trying to initialize DMA during transfer if it failed to initialize
>>> during probe is a wrong approach. DMA must be initialized only once
>>> during probe. Please make the probe to work properly.
>>
>> What I am trying for is to have a mechanism that doesn't halt the i2c transfers
>> till DMA is available. Also, I do not want to drop DMA because it was unavailable
>> during probe().
> 
> Why is it unavailable? Sounds like you're not packaging kernel properly.
> 
>> This situation is sure to hit if we have I2C driver as built in and DMA driver as a 
>> module. In such cases, I2C will never be able to use the DMA.
> 
> For Tegra I2C built-in + DMA driver module you should add the dma.ko to
> initramfs and then it will work. This is a common practice for many
> kernel drivers.
> 
> It's also similar to a problem with firmware files that must be
> available to drivers during boot,
> 
>> Another option I thought about was to request and free DMA channel for each
>> transfer, which many serial drivers already do. But I am a bit anxious if that will
>> increase the latency of transfer.
> 
> Perhaps all you need to do is to add MODULE_SOFTDEP to Tegra I2C driver
> like we did it for the EMC driver [1].
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=14b43c20c283de36131da0cb44f3170b9ffa7630
> 

Although, probably MODULE_SOFTDEP won't work for a built-in driver. In
that case, change Tegra I2C kconfig to depend on the DMA driver.

-- 
Best regards,
Dmitry
