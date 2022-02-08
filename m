Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDEA24AD420
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 09:57:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349857AbiBHI4w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 03:56:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231657AbiBHI4v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 03:56:51 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB32C03FEC0
        for <linux-i2c@vger.kernel.org>; Tue,  8 Feb 2022 00:56:50 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C6E1140052
        for <linux-i2c@vger.kernel.org>; Tue,  8 Feb 2022 08:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644310608;
        bh=jrCjP6cigoq2hUV57n4k5BTndMW5LQallJ585bA4v4U=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=a1SQAhLX6RwGAnMpJlhkdMDubv6qBh7od9kb0V1X79KBUxS5NJ58s5vcaUVdyciOM
         56wMtyZdQmXZi9HxGmohfPBwp1S8emKFQW5Kzm2h476GS3KTjD9Qx7aTG/CPOHEdsn
         lKOZ9c53XN6ZJ2bpuxVUu3gNrwYO24MVPZ9hm7Ss1ejjCET5Ud9cyzmGTHf60oEBya
         soAFJcnIpNxvswvf3g/YwkjLCQvEP6QkRBnzvJRxfJpEY6++3ijCY2GlppXSaeaSjm
         a3qkwIGLPX7+HrPLlzeK7X56v9+8jwhWkk7HjIKP4rMscYyUAvR+xa0uZ4TqJw/cME
         8NSVZ8oP+jGXg==
Received: by mail-ed1-f70.google.com with SMTP id k11-20020a50c8cb000000b0040f84c5bc66so2432403edh.4
        for <linux-i2c@vger.kernel.org>; Tue, 08 Feb 2022 00:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jrCjP6cigoq2hUV57n4k5BTndMW5LQallJ585bA4v4U=;
        b=bHsdbojjzD+XQJ8R6x6IyraPrsKQEZedAEAvVA4Urmk2iQV/xI4/ZEXw2Vk3KEjiti
         NWNLrY9rHPELNMl0rmjHD9/lG7++ASe9D9EUwpNr93KfKYl/5uz4jJ6xdjvlJXdo3vjJ
         X0WWfJi8NFsQRG6wpB7Ocs6Pn9OBFt2WDdjd7cbNJsT+C0Qm5HwOv1Qv9PC0vdhynNgs
         okoJszpvUcTuePLV3QTd5Ptpu2Zcc2eTrDeoMyYIsnBgocmYfnAuYDcIW8JbHpAuXXpb
         4ux/GoX4FgELwoL6x1WiyQYOHVj9b8R97aR1N/QVKyJhWG11ly8sCkv6S11k2OFTlHBN
         wRpA==
X-Gm-Message-State: AOAM5308apKKzfQfbdevmLfActiDrq6uHT4au9qp+tFAHwaHEFwFA8S3
        lVq/trvDMneNodY0lKDaY56aKpEGiQReIG+NDjbYg5Q3PVox6Sy0IuSOoegDsLcUf+ytEnqffTz
        7i8zoJOvLNLoo5P4ikoyBwctqkNaKOM+rf9D7Mw==
X-Received: by 2002:a17:907:948c:: with SMTP id dm12mr2940465ejc.770.1644310607465;
        Tue, 08 Feb 2022 00:56:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWL7auPyMvH/eI9rxLnQiNw2PVY1Wgkiymv6mfS8QZo6OPnHvXX90ldKMwT7Z004YsVjstlQ==
X-Received: by 2002:a17:907:948c:: with SMTP id dm12mr2940447ejc.770.1644310607251;
        Tue, 08 Feb 2022 00:56:47 -0800 (PST)
Received: from [192.168.0.92] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id a21sm4220537eds.5.2022.02.08.00.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 00:56:46 -0800 (PST)
Message-ID: <1a172e64-f662-2a36-71ef-4214cfe5bffc@canonical.com>
Date:   Tue, 8 Feb 2022 09:56:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
Content-Language: en-US
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>, semen.protsenko@linaro.org,
        yangyicong@hisilicon.com, Wolfram Sang <wsa@kernel.org>,
        jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
        lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tali Perry <tali.perry@nuvoton.com>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, devicetree <devicetree@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-7-warp5tw@gmail.com> <YgEJ1M40AG9EuRPI@latitude>
 <086655b0-b9d2-30ed-1496-47cdc6346003@canonical.com>
 <CAHb3i=vpFwez+ZzDhHkSxjkios3tyoM2urRpCxOn3vfwzvewog@mail.gmail.com>
 <30ac5fe7-9d96-a756-24b0-384361b48a2d@canonical.com>
 <CAHb3i=ukzVr4DDgcPQ2+DO+LXWWtgjCe03WbG-CqvsOP_qqvUw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAHb3i=ukzVr4DDgcPQ2+DO+LXWWtgjCe03WbG-CqvsOP_qqvUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/02/2022 09:51, Tali Perry wrote:
>> On 08/02/2022 08:14, Tali Perry wrote:
>>>> Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
>>>>
>>>> On 07/02/2022 13:00, Jonathan Neuschäfer wrote:
>>>>> Hello,
>>>>>
>>>>> On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
>>>>>> From: Tyrone Ting <kfting@nuvoton.com>
>>>>>>
>>>>>> NPCM8XX uses a similar i2c module as NPCM7XX.
>>>>>> The only difference is that the internal HW FIFO is larger.
>>>>>>
>>>>>> Related Makefile and Kconfig files are modified to support as well.
>>>>>>
>>>>>> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller
>>>>>> driver")
>>>>>
>>>>> It's not really a bug fix, but rather an additional feature.
>>>>> Therefore, I suggest removing the Fixes tag from this patch.
>>>>>
>>>>>> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>>>>>> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>>>>> ---
>>>>> [...]
>>>>>>  /* init register and default value required to enable module */
>>>>>>  #define NPCM_I2CSEGCTL 0xE4
>>>>>> +#ifdef CONFIG_ARCH_NPCM7XX
>>>>>>  #define NPCM_I2CSEGCTL_INIT_VAL 0x0333F000
>>>>>> +#else
>>>>>> +#define NPCM_I2CSEGCTL_INIT_VAL 0x9333F000
>>>>>> +#endif
>>>>>
>>>>> This is going to cause problems when someone tries to compile a kernel
>>>>> that runs on both NPCM7xx and NPCM8xx (because the driver will then
>>>>> only work on NPCM7xx).
>>>>
>>>> Yes, good catch.
>>>>
>>>> The NPCM7XX is multiplatform, I guess NPCM8xx will be as well, so this looks like an invalid code. How such code is supposed to work on multiplatform kernel?
>>>>
>>>
>>> NPCM7xx and NPCM8xx are very different devices.
>>> They share same driver sources for some of the modules but it's not ABI.
>>> Users cannot compile a single kernel with two separate DTS.
>>> In case of the i2c controller, the npcm7xx has a 16 byte HW FIFO,
>>> and the NPCM8xx has 32 bytes HW FIFO.
>>> This also means that registers fields are slightly different.
>>> For init data we can move it to the DTS, but register field sizes
>>> can't be handled with this approach.
>>>
>>
>> What do you mean they cannot compile a kernel with different DTS? Of
>> course they can - when we talk about multiplatform sub-architectures!
>> Maybe there is something specific in NPCMxxx which stops it but then it
>> should not be marked multiplatform.
>>
> 
> 
> NCPM7xx is ARM32 bit (dual core Cortex A9)
> NPCM8xx is ARM64 bit (quad core Cortex A35)
> 
> They have completely different architecture so not ABI compliant.
> I2C module is similar, but the devices are quite different and have
> separate architectures.

OK, in such case usually you indeed can't have both. :)

> Sorry for the confusion.
> This is the first patch we try to upstream for NPCM8xx.
> In the coming weeks we will upstream the architecture of NPCM8xx as well.

Still, ARCH_XXX should not be hard-coded in the drivers to change the
driver's behavior, even if driver won't be used simultaneously. It
breaks all design principles and prevents any further re-use if a new
use case appears.

You can use "ifdef ARCH_XXX" to skip building of some parts of the
driver, but it's not the case here.


Best regards,
Krzysztof
