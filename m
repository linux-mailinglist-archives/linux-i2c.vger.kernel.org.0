Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7743459CA07
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 22:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiHVUdj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 16:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232112AbiHVUde (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 16:33:34 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BBF16396;
        Mon, 22 Aug 2022 13:33:32 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id d8so4507526lfq.0;
        Mon, 22 Aug 2022 13:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=nRs4+6Qq+mxj3porzYhpRJretUtLEmOubukbTGJZYos=;
        b=RyoKch+R+u7XVHOPQWfCyQ7JZ6UDzZN1bxqDFOEl40zYAgJ+9LBF8ohv04pqdv9dgd
         hElovf9vyD3qWPFtZtFLshRW7Jjeh+Be0jB/YxrYhDc33PghHRNaVKrHdCfXlv+SuUfx
         Uyx0+Qj3JofyDoW4IRaMte6Wg8xAo10UHG2v+H2pjHOsw6aTvrpuN9WDzJJOCN1M+CGK
         rmOl6BK8VcNImnOwIZLPDI2EB28UjYUWpZHi4nI8+j2GgLFo7d8XOGkRNXm7Y9EcZj3K
         2jjnbX5JFztGRwiFiT1DW5Bh8V73++2CL+yvloanMVkj2PzU6agU36yKC8yfRSZQij2L
         MF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=nRs4+6Qq+mxj3porzYhpRJretUtLEmOubukbTGJZYos=;
        b=YqF1c6q9iTnCr07vfPWMgJwMVyP9W/GhbiAmGzCsk8eqV6VxNxvr1E7PWqrIgWBUyH
         zGfg+Ut3ly02KWN/VTl/xTJnr/GsIZQGW5hqODOz7zqhzChKSoT/FfuwVLBR72zyqjX9
         gimj8zVbaQOV7fluG1ei6syEhF0xm8sLMFLG9RVpBY6INxTCU2HlTZWeeAvQnFZwc92f
         G8m/FE7CQG/vuZbWTB/uNHKdYhLqUOkmMbOeYBuDEz/uIxOtPJ3IM5jdfuCmXYwmi9qs
         /892Qs0sf9FvKnwxMh0+jX0BMn44eroB261SeM3L5FEQUi/9A3OTwpCWFiWmoCm75/Qu
         oWsg==
X-Gm-Message-State: ACgBeo3Xo+hN/ab89mHH/F4AvWCjujmXaal8eKSPk9pOqKs6FQa/OiID
        05KM0ypCNVbW9G1o1D3Pa7y6DO4uu9o=
X-Google-Smtp-Source: AA6agR60sG9svcrPjilKrPuLt8ES8ivmFvsAIlhuBcZEy0DJcRY4UFXqXl18oUfdj1C/PqrWvmr+4Q==
X-Received: by 2002:a05:6512:3092:b0:492:f323:f05b with SMTP id z18-20020a056512309200b00492f323f05bmr259974lfd.542.1661200410339;
        Mon, 22 Aug 2022 13:33:30 -0700 (PDT)
Received: from [192.168.2.145] (109-252-119-13.nat.spd-mgts.ru. [109.252.119.13])
        by smtp.googlemail.com with ESMTPSA id g6-20020a056512118600b004886508ca5csm2097448lfr.68.2022.08.22.13.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 13:33:29 -0700 (PDT)
Message-ID: <fac10841-1682-845f-3e4a-5668f59caed0@gmail.com>
Date:   Mon, 22 Aug 2022 23:33:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Content-Language: en-US
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
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <SJ1PR12MB63396DC508F63807F1CE9901C0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
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

22.08.2022 13:29, Akhil R пишет:
>> On 8/22/22 09:56, Akhil R wrote:
>>>> 19.08.2022 18:15, Dmitry Osipenko пишет:
>>>>> 19.08.2022 15:23, Akhil R пишет:
>>>>>>      if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
>>>>>>              i2c_dev->is_vi = true;
>>>>>> +    else
>>>>>> +            i2c_dev->dma_support = !!(of_find_property(np, "dmas",
>>>>>> + NULL));
>>>>>
>>>>> 1. You leak the np returned by of_find_property().
>>>>>
>>>>> 2. There is device_property_read_bool() for this kind of
>>>>> property-exists checks.
>>> Okay. I went by the implementation in of_dma_request_slave_channel() to
>>> check 'dmas'.
>>>
>>>>>
>>>>> 3. If "dmas" is missing in DT, then dma_request_chan() should return
>>>>> NULL and everything will work fine. I suppose you haven't tried to
>>>>> test this code.
>>>>
>>>> Although, no. It should return ERR_PTR(-ENODEV) and then you should check
>>>> the return code.
>>> Yes. Agree that it is more agnostic to check for ERR_PTR(-ENODEV). But since I
>>> call tegra_init_dma() for every large transfer until DMA is initialized, wouldn't
>>> it be better to have a flag inside the driver so that we do not have to go
>> through
>>> so many functions for every attempted DMA transaction to find out that the
>> DT
>>> properties don't exist?
>>>
>>> Shall I just put i2c_dev->dma_support = true here since DMA is supported by
>>> hardware? It would turn false if dma_request_chan() returns something other
>>> than -EPROBE_DEFER.
>>>
>>>       if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
>>>               i2c_dev->is_vi = true;
>>>  +    else
>>>  +            i2c_dev->dma_support = true;
>>
>> The code already has dma_mode for that. I don't see why another variable
>> is needed.
>>
>> Either add new generic dma_request_chan_optional() that will return NULL
>> if channel is not available and make Tegra I2C driver to use it, or
>> handle the error code returned by dma_request_chan().
> 
> Let me elaborate my thoughts. 
> 
> The function tegra_i2c_init_dma() is also called inside tegra_i2c_xfer_msg() if
> DMA is not initialized before, i.e. if (!i2c_dev->dma_buf).

This is not true

i2c_dev->dma_mode=false if !i2c_dev->dma_buf and that's it

https://elixir.bootlin.com/linux/v6.0-rc2/source/drivers/i2c/busses/i2c-tegra.c#L1253

tegra_i2c_init_dma() is invoked only during probe

> So, if suppose there is no DT entry for dmas, the driver would have to go take the
> path tegra_i2c_init_dma() -> dma_request_chan() -> of_*() apis -> ... and then figure
> out that DMA is not supported. This would happen for each transfer of size larger than
> I2C_PIO_MODE_PREFERRED_LEN.
> 
> To avoid this, I am looking for a variable/flag which can indicate if the driver should attempt
> to configure DMA or not. I didn't quite get the idea if dma_mode can be extended to support
> this, because it is updated based on xfer_size on each transfer. My idea of i2c_dev->dma_support
> is that it will be constant after the probe().


