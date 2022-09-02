Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51CE45AAD9F
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Sep 2022 13:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236177AbiIBL14 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Sep 2022 07:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235555AbiIBL1j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Sep 2022 07:27:39 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA9F46236;
        Fri,  2 Sep 2022 04:25:10 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id w8so2776983lft.12;
        Fri, 02 Sep 2022 04:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=3wSQssIvU5TpIflujRE62eFde6JJcJsrA+ZhrJwQQfQ=;
        b=Joj5LgHgcOzbk6WGUMe826PCorH8cLC6HPxEKgV7mNTjgOYCSFMdIo3x1WXOdoA5T2
         WWhAIPk/+ECEgPSPdM4IO+cCj+tOxv0TZcQ279EUHRH7zDe9eo6KhRHw86uN5BMUciwB
         0PPY2Za1HuDq6FvV0DM9XaOKIVYbMCXX/5o3c9S2Nv6DT2uVmj2qpOV9yeA2Qhevq8W8
         Yvv0XXttiAcdlLAu0qbT+abfV5xfHrMESWY54rmWwaT9/KqInAC56gFPfQZ9ye3WNuQ2
         QuU9Y8q0tq87k2JMbXCanL1utD6mAF0YQjEymU59NiQxLYLIk4ifnKBljLZfgrAMv5Bc
         I1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3wSQssIvU5TpIflujRE62eFde6JJcJsrA+ZhrJwQQfQ=;
        b=Ufexv8WXfA0S8KQk45i2V8wHY4Wxp200Zl9IaPX/V+AO4PxZlKWRnk4hJejIUQjbQM
         TqczP+O/Zfk5+2N02NWV1JhdhQ5+uoua63DrcImPBPaCpIpvm5Yg27FpvhPncTxdScRc
         miNF9qWfOKOoqmgmgL5rjTlZUJALS8PAL2D11fTmb3Wlwpg74udTSbcmKZFiUcZjo6LE
         rH15ki9mbc0uRG4GgTQ97CLXYb5nU2ki8IiB08hCeCh+W2Whfhze3KPrg19BmXbRSzdh
         lEneld3SuZMpKlnbk/R7GV/RJrvyxhDlGG6T33pGc930hvc+FtO920Z+ej37Wc3AMnkm
         zpFg==
X-Gm-Message-State: ACgBeo3FuW7zlvCiY+FAUQsmR3vQIXKtR6yoyIzGh6TatXKNWwdRiFMW
        dL4ch9rfQ8eXJ6bQt7zo4ak=
X-Google-Smtp-Source: AA6agR517c3ElKraOg7+PFGcWmpDlZ72RTpYLX/GxbANV8Bv+WmNHaFflP/JfaczLKnU6tJI7HFsjQ==
X-Received: by 2002:a05:6512:694:b0:494:9a24:3243 with SMTP id t20-20020a056512069400b004949a243243mr2746673lfe.673.1662117903578;
        Fri, 02 Sep 2022 04:25:03 -0700 (PDT)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru. [109.252.119.13])
        by smtp.googlemail.com with ESMTPSA id h1-20020a2ea481000000b00268bc2c1ed0sm161995lji.22.2022.09.02.04.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Sep 2022 04:25:02 -0700 (PDT)
Message-ID: <61463a5f-9280-bcc7-3595-26ac9ddbe800@gmail.com>
Date:   Fri, 2 Sep 2022 14:25:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc:     Akhil R <akhilrajeev@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "Kartik ." <kkartik@nvidia.com>
References: <SJ1PR12MB6339FC1F82EB1BB7417E533BC0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <ebb0764f-db92-d69d-49ac-151f4e3e0b8a@collabora.com>
 <SJ1PR12MB63396DC508F63807F1CE9901C0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <fac10841-1682-845f-3e4a-5668f59caed0@gmail.com>
 <cd0374f1-2c05-7e61-7187-cfc9c42edf63@gmail.com>
 <SJ1PR12MB63397BBD4EF314A742680F2CC0709@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <a7ba27c4-992b-28d1-f6c2-3937b4f275ce@collabora.com>
 <c9ba2629-fc81-cefd-0d6d-991084781ec3@collabora.com>
 <SJ1PR12MB63393F51E29BA1F85AD249DBC0709@SJ1PR12MB6339.namprd12.prod.outlook.com>
 <4f791065-e0dd-6ed5-f152-86d7be683490@collabora.com> <YxDEVUq3jbjnOmnI@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <YxDEVUq3jbjnOmnI@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

01.09.2022 17:40, Thierry Reding пишет:
> On Tue, Aug 23, 2022 at 04:32:11PM +0300, Dmitry Osipenko wrote:
>> On 8/23/22 15:55, Akhil R wrote:
>> ...
>>>>>> What I am trying for is to have a mechanism that doesn't halt the i2c
>>>> transfers
>>>>>> till DMA is available. Also, I do not want to drop DMA because it was
>>>> unavailable
>>>>>> during probe().
>>>>>
>>>>> Why is it unavailable? Sounds like you're not packaging kernel properly.
>>> Unavailable until initramfs or systemd is started since the module has to be
>>> loaded from either of it.
>>>
>>>>>
>>>>>> This situation is sure to hit if we have I2C driver as built in and DMA driver as a
>>>>>> module. In such cases, I2C will never be able to use the DMA.
>>>>>
>>>>> For Tegra I2C built-in + DMA driver module you should add the dma.ko to
>>>>> initramfs and then it will work. This is a common practice for many
>>>>> kernel drivers.
>>>>>
>>>>> It's also similar to a problem with firmware files that must be
>>>>> available to drivers during boot,
>>>
>>> Isn't the initramfs loaded after the driver initcalls? Wasn't very much clear for me
>>> from the code and docs. We did try adding the module in initramfs initially, but
>>> couldn't find much of a difference from when it is loaded by systemd in rootfs.
>>> Will explore more on this if this really helps.
>>
>> It doesn't matter when initramfs is loaded. Tegra I2C should be
>> re-probed once DMA driver is ready, that's the point of deferred
>> probing. I'd assume that your DMA driver module isn't loading.
> 
> One problem we have with this, and it's another part of the reason why
> we have the TEGRA20_APB_DMA conditional in there, is that if no DMA
> driver is enabled, then the I2C driver will essentially defer probe
> indefinitely.
> 
> The same would happen if for whatever reason someone was to disable the
> DMA engine via status = "disabled" in device tree. And that's not
> something we can easily discover, as far as I can tell. Although perhaps
> code could be added to discover these kinds of situations.

The case of missing/disabled node needs to be addressed in the DMA API.
Add new dma_request_chan_optional().

> Both of the above scenarios could also be considered as bugs, I suppose,
> and in that case the fix would be to update the configuration and/or the
> device tree.
> 
>>>>>> Another option I thought about was to request and free DMA channel for
>>>> each
>>>>>> transfer, which many serial drivers already do. But I am a bit anxious if that
>>>> will
>>>>>> increase the latency of transfer.
>>>>>
>>>>> Perhaps all you need to do is to add MODULE_SOFTDEP to Tegra I2C driver
>>>>> like we did it for the EMC driver [1].
>>>>>
>>>>> [1]
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-
>>>> next.git/commit/?id=14b43c20c283de36131da0cb44f3170b9ffa7630
>>>>>
>>>>
>>>> Although, probably MODULE_SOFTDEP won't work for a built-in driver. In
>>>> that case, change Tegra I2C kconfig to depend on the DMA driver.
>>>
>>> Since I2C can work without DMA, wouldn't it limit the flexibility of I2C driver.
>>
>> There are kernel configurations that are not worthwhile to support
>> because nobody use them in practice. I think this is exactly the case
>> here. The TEGRA20_APB_DMA driver dependency created troubles for a long
>> time.
>>
>> If DMA driver is enabled in kernel config, then you should provide the
>> driver module to kernel and it will work.
>>
>> If DMA driver is disabled in kernel config, then Tegra I2C driver should
>> take that into account. I'm now recalling that this was the reason of
>> "!IS_ENABLED(CONFIG_TEGRA20_APB_DMA)" in the code.
>>
>> Since all h/w gens now provide DMA support for Tegra I2C, then should be
>> better and easier to make DMA a dependency for Tegra I2C and don't
>> maintain kernel build configurations that nobody cares about.
> 
> This is a suboptimal solution because we have APB DMA for Tegra20
> through Tegra210 and GPC DMA for Tegra186 and later. So we'd need to
> depend on two drivers and that would then pull in GPC DMA basically on
> all generations.

You should be right here, Kconfig doesn't support conditional dependencies.

> One potential workaround would be to have a fairly elaborate check in
> the driver to make sure that for SoC generations that support APB DMA
> that that driver is enabled, and for SoC generations that have GPC DMA
> that the corresponding driver is enabled. That's quite ugly and it
> doesn't solve the status = "disabled" problem, so we'd need that as
> well.
> 
> Another thing that I've been thinking about is to use the deferred probe
> timeout to remedy this. driver_deferred_probe_check_state() can be used
> by subsystems to help figure out these kinds of situations. Basically if
> we integrated that into dma_request_channel(), this would at some point
> (fairly) late into boot return -ETIMEDOUT (or -ENODEV if modules are
> disabled). So this would help with status = "disabled" and allow us to
> avoid Kconfig dependencies/conditionals. Unfortunately it seems like
> that is in the process of being removed, so not sure if that's a long-
> term option.
> 
> What that doesn't help with is the potentially long delay that probe
> deferral can cause, so it means that all I2C devices may not get a
> chance to probe until very late into the boot process. We may need to
> survey what exactly that means to better judge what to do about it. I
> do agree that probe deferral is the right tool for the job, but it may
> be prohibitively slow to get I2C working with that.
> 
> Another mitigation would be for the driver to keep probing for the DMA
> channels in the background. Sort of like an asynchronous probe deferral
> of that subset. Similar things were discussed at some point when the
> whole fw_devlink and such were hashed out, though at the time I think
> the preferred proposal was a notification mechanism.

Replicate what is done for APBDMA.

if (i2c_dev->hw->has_apb_dma)
	if (!IS_ENABLED(CONFIG_TEGRA20_APB_DMA))
		dev_dbg(i2c_dev->dev, "DMA support not enabled\n");
			return 0;
} else {
	if (!IS_ENABLED(CONFIG_TEGRA186_GPC_DMA)) {
		dev_dbg(i2c_dev->dev, "DMA support not enabled\n");
			return 0;
	}
}

This will enable GPCDMA. Everything else can be done later on.
