Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D1559CA84
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 23:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237823AbiHVVIm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 17:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237626AbiHVVIm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 17:08:42 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1322AE1A;
        Mon, 22 Aug 2022 14:08:40 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id bq23so7960383lfb.7;
        Mon, 22 Aug 2022 14:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Ip87jsX7KADK2pmZOVByUz9Mir5GBBYgZe572IJd5QA=;
        b=TO9i0GukRGXY6MEyFfhC0MPtsDz2EIBrwJYgliYY5+6VH23LdXkwJF5QQj1acSi5Al
         zXwRb+o9PGW0zH2zflctmWLetXM4en9lPr3ZdZ6tXKH1qCqKi5jZWJAHCA7voF6BLC2z
         y054x9eArND0gh8pX5RljUXyFRYZErxMW3jbUMQAFmKHBR+bgmepmctXoGvy1Betg7AN
         7k+RINnGSCP5mcQJHzUvT5rec8Z/gfQKh/6aqps/3RZrBvJ2tvw8N7V/ta8Zk1UKZfr0
         1WGMcr+MOap/Fbl3syVSq8zQuOXqxKWR5kxXCRlWC+Cu3nPXWpQrJ1hwlur3nLfsfgzS
         4g2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Ip87jsX7KADK2pmZOVByUz9Mir5GBBYgZe572IJd5QA=;
        b=mEbPaQphS9qtRTdNShhZE72LeVqWmYj1CW8aHInd+Jx58R/3MNLimc664cG9yHgxlP
         xq6/1Svt/DrcfT4BFHW/f0+9rmuScajAd2MPH2tcnQjdqXbrV2Bo6L74aKEG5m/hoGiw
         YOgUMRJo0WlWVZFDY8kpC/faY8phMO2if7akgGObWSNpo1YriJ0vJ+8raXpOZ3hUciW2
         GL1/G4a5w28rQ2uMnO3clcQRdZTD5nVufgshYvQfhIPQzuIPA1Zj9DU/Zo0OZQZH/v6Q
         F0sz6EoQGRc7s/T5QgpKWXQFvqfId003DEu/Pnvrm3iSbjDFUb0Qs6zzLVdveQ6lQYOG
         pMOQ==
X-Gm-Message-State: ACgBeo3wTPcenkO/rrpFq1/7lKCJQF7022tZkZiO074d5/sZa3HzH7b7
        0XG8PfHWpUR46due3CSGKNA=
X-Google-Smtp-Source: AA6agR4azk5mi9p3RffsHvdO7JbGEv0kET1ZMVM1KhxBcwIJdeHiiabuHTRep41oEyHPxsfcjJfM8A==
X-Received: by 2002:a05:6512:2216:b0:48b:3a34:d14a with SMTP id h22-20020a056512221600b0048b3a34d14amr7875774lfu.158.1661202518868;
        Mon, 22 Aug 2022 14:08:38 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.119.13])
        by smtp.googlemail.com with ESMTPSA id l10-20020a2ea30a000000b00261cc67e9c2sm744842lje.131.2022.08.22.14.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 14:08:38 -0700 (PDT)
Message-ID: <cd0374f1-2c05-7e61-7187-cfc9c42edf63@gmail.com>
Date:   Tue, 23 Aug 2022 00:08:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Content-Language: en-US
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Akhil R <akhilrajeev@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
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
In-Reply-To: <fac10841-1682-845f-3e4a-5668f59caed0@gmail.com>
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

22.08.2022 23:33, Dmitry Osipenko пишет:
> 22.08.2022 13:29, Akhil R пишет:
>>> On 8/22/22 09:56, Akhil R wrote:
>>>>> 19.08.2022 18:15, Dmitry Osipenko пишет:
>>>>>> 19.08.2022 15:23, Akhil R пишет:
>>>>>>>      if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
>>>>>>>              i2c_dev->is_vi = true;
>>>>>>> +    else
>>>>>>> +            i2c_dev->dma_support = !!(of_find_property(np, "dmas",
>>>>>>> + NULL));
>>>>>>
>>>>>> 1. You leak the np returned by of_find_property().
>>>>>>
>>>>>> 2. There is device_property_read_bool() for this kind of
>>>>>> property-exists checks.
>>>> Okay. I went by the implementation in of_dma_request_slave_channel() to
>>>> check 'dmas'.
>>>>
>>>>>>
>>>>>> 3. If "dmas" is missing in DT, then dma_request_chan() should return
>>>>>> NULL and everything will work fine. I suppose you haven't tried to
>>>>>> test this code.
>>>>>
>>>>> Although, no. It should return ERR_PTR(-ENODEV) and then you should check
>>>>> the return code.
>>>> Yes. Agree that it is more agnostic to check for ERR_PTR(-ENODEV). But since I
>>>> call tegra_init_dma() for every large transfer until DMA is initialized, wouldn't
>>>> it be better to have a flag inside the driver so that we do not have to go
>>> through
>>>> so many functions for every attempted DMA transaction to find out that the
>>> DT
>>>> properties don't exist?
>>>>
>>>> Shall I just put i2c_dev->dma_support = true here since DMA is supported by
>>>> hardware? It would turn false if dma_request_chan() returns something other
>>>> than -EPROBE_DEFER.
>>>>
>>>>       if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
>>>>               i2c_dev->is_vi = true;
>>>>  +    else
>>>>  +            i2c_dev->dma_support = true;
>>>
>>> The code already has dma_mode for that. I don't see why another variable
>>> is needed.
>>>
>>> Either add new generic dma_request_chan_optional() that will return NULL
>>> if channel is not available and make Tegra I2C driver to use it, or
>>> handle the error code returned by dma_request_chan().
>>
>> Let me elaborate my thoughts. 
>>
>> The function tegra_i2c_init_dma() is also called inside tegra_i2c_xfer_msg() if
>> DMA is not initialized before, i.e. if (!i2c_dev->dma_buf).
> 
> This is not true
> 
> i2c_dev->dma_mode=false if !i2c_dev->dma_buf and that's it
> 
> https://elixir.bootlin.com/linux/v6.0-rc2/source/drivers/i2c/busses/i2c-tegra.c#L1253
> 
> tegra_i2c_init_dma() is invoked only during probe
> 
>> So, if suppose there is no DT entry for dmas, the driver would have to go take the
>> path tegra_i2c_init_dma() -> dma_request_chan() -> of_*() apis -> ... and then figure
>> out that DMA is not supported. This would happen for each transfer of size larger than
>> I2C_PIO_MODE_PREFERRED_LEN.
>>
>> To avoid this, I am looking for a variable/flag which can indicate if the driver should attempt
>> to configure DMA or not. I didn't quite get the idea if dma_mode can be extended to support
>> this, because it is updated based on xfer_size on each transfer. My idea of i2c_dev->dma_support
>> is that it will be constant after the probe().

I see now that it's you added tegra_i2c_init_dma() to
tegra_i2c_xfer_msg(). And tegra_i2c_init_dma() already falls back to PIO
if DMA is unavailable.

I don't remember why !IS_ENABLED(CONFIG_TEGRA20_APB_DMA) was added to
tegra_i2c_init_dma(), but if dma_request_chan() returns -EPROBE_DEFER
when there is no DMA channel available at all, then you should fix it.

Trying to initialize DMA during transfer if it failed to initialize
during probe is a wrong approach. DMA must be initialized only once
during probe. Please make the probe to work properly.
