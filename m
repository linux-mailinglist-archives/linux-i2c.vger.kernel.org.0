Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0C859BD19
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 11:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233390AbiHVJpu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 05:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233296AbiHVJps (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 05:45:48 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DF0031DD4;
        Mon, 22 Aug 2022 02:45:45 -0700 (PDT)
Received: from [10.3.2.13] (zone.collabora.co.uk [167.235.23.81])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dmitry.osipenko)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id AF8316600368;
        Mon, 22 Aug 2022 10:45:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1661161543;
        bh=tYn6NOEYNjwZvPyuZFKJLJdwEqOQbIRZm3BFAEG96Ko=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=AfKFkDOEyU1GUcMLd6TSoz+g8vtz71zAzqVKiIWxTDgQgTAuBOyxhKYficbNiBFd0
         3jtjodm/IGItK+d6OcXgzAYaNRSsnSoBQSzzLcdrrse+DcwquY9YrsdNavdIwOyxLs
         48KlrRnbchw0FgAlZyu9IBZ7i/KR0psHXztWRypZ5X1CRTl9AlffwUaNEJnRyzWto4
         5nG9Hgfx7mWORbN0A+iWz2aRI21KbQG2IayXsyAvTL7cF5IXAVoB6thCpcb0Lg4E29
         OthYSbAf61FZ6iTzsoiL87snRg/DZVu/0efj9pqL/IW5vZcFe1GauJWqKL/p+GTitQ
         lURmmVct+gtxw==
Message-ID: <ebb0764f-db92-d69d-49ac-151f4e3e0b8a@collabora.com>
Date:   Mon, 22 Aug 2022 12:45:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RESEND 1/2] i2c: tegra: Add GPCDMA support
Content-Language: en-US
To:     Akhil R <akhilrajeev@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
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
From:   Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <SJ1PR12MB6339FC1F82EB1BB7417E533BC0719@SJ1PR12MB6339.namprd12.prod.outlook.com>
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

On 8/22/22 09:56, Akhil R wrote:
>> 19.08.2022 18:15, Dmitry Osipenko пишет:
>>> 19.08.2022 15:23, Akhil R пишет:
>>>>      if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
>>>>              i2c_dev->is_vi = true;
>>>> +    else
>>>> +            i2c_dev->dma_support = !!(of_find_property(np, "dmas",
>>>> + NULL));
>>>
>>> 1. You leak the np returned by of_find_property().
>>>
>>> 2. There is device_property_read_bool() for this kind of
>>> property-exists checks.
> Okay. I went by the implementation in of_dma_request_slave_channel() to
> check 'dmas'.
> 
>>>
>>> 3. If "dmas" is missing in DT, then dma_request_chan() should return
>>> NULL and everything will work fine. I suppose you haven't tried to
>>> test this code.
>>
>> Although, no. It should return ERR_PTR(-ENODEV) and then you should check
>> the return code.
> Yes. Agree that it is more agnostic to check for ERR_PTR(-ENODEV). But since I
> call tegra_init_dma() for every large transfer until DMA is initialized, wouldn't
> it be better to have a flag inside the driver so that we do not have to go through
> so many functions for every attempted DMA transaction to find out that the DT
> properties don't exist?
> 
> Shall I just put i2c_dev->dma_support = true here since DMA is supported by
> hardware? It would turn false if dma_request_chan() returns something other
> than -EPROBE_DEFER.
> 
>       if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
>               i2c_dev->is_vi = true;
>  +    else
>  +            i2c_dev->dma_support = true;

The code already has dma_mode for that. I don't see why another variable
is needed.

Either add new generic dma_request_chan_optional() that will return NULL
if channel is not available and make Tegra I2C driver to use it, or
handle the error code returned by dma_request_chan().

-- 
Best regards,
Dmitry
