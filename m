Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC464AC395
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 16:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345470AbiBGPbL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 10:31:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382300AbiBGP0e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 10:26:34 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25EA1C0401C8
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 07:26:34 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9F1564003D
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 15:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644247592;
        bh=jtBwxjA6IxdUXSiBKA9l5yKPNOzp1lDJ3zELoV7GVzI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=tyxraPvfd6lWxeGVlnuGZskaQusMOgJF+KTiDy9I/TrsHX4Sc2oUTC0+KIsCpRHLR
         gomZdj5D/lWgQjtz1/fMYEq6WJxtqQ9Kvz3Q+rEajOr04YWEAwl9B2ldhrCUpfr5p4
         NjictvAj0vtWXifOrvgmVQXnHskaMpARKghlchKk2fVd9LhvZhNWcBW4hbpYbMcvg5
         cRU/3o/QhecY6NNayYezsZCH/xwgbHl6VlruvG0RTIoWm7IhBdc//+HQo4xrM6Bd8O
         98BMDZZRiICvIIyk6NkzM1S5p6PkvwFnW0rogva4d/43d7MKOjNyKlHNUg7RxbrY0l
         EleT8M/tDtCmQ==
Received: by mail-ed1-f70.google.com with SMTP id g5-20020a056402090500b0040f28e1da47so4352583edz.8
        for <linux-i2c@vger.kernel.org>; Mon, 07 Feb 2022 07:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jtBwxjA6IxdUXSiBKA9l5yKPNOzp1lDJ3zELoV7GVzI=;
        b=e+F+b1V63tItsCmA2bpLt8ZtQApwZIVQBFIVimBYSVJnHCkp7s1XB0ZSCH+whyIjeH
         Af9Xgk9lE7PvXABbtiNJqBbHEDn5Xu3dOGx9N3o8UTffSCxq+AXjTMkCj8nXqhHtf2fz
         Tfe8FIvPDah3x9LrsXQfTA/N5IQ4gagN00nc3texMgI6J0IRufYvj1wEZ2ledaJfYXe0
         2OcM9PY8TIZ3fGDtG5pXE0WLf/BHyR5+mPwt73VQjxftf/nOlMoz1V2vV50LFBps36A8
         MI1bbhVJMQv2vjzuQGDL8Mf85aTqDBZWHrUGRP1jyj9f5cY490RQCBfQFS9dzgLTsFSM
         K+jg==
X-Gm-Message-State: AOAM532WiGtPQar3IHUlC5+eVBtr+G+LfrC4pFxGH0EfB4PTkM4oI8o5
        lqYwe1YFQq0/00s5OJIMLIZZYNNBIOBONnIL34ozLRU5+iirIXB83jxY/3CwD4/25IYRCY31hkq
        h6NML6i937i3V70GYKU+ID3ha3eZtaq4jbNHFQg==
X-Received: by 2002:a05:6402:2682:: with SMTP id w2mr14308634edd.355.1644247592208;
        Mon, 07 Feb 2022 07:26:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVJn4Nlc49XX5kswoAu+DV9XJFl3JgZB7TwRP+HT5uWO4LoDj7YPKGUhK5pvvh8K/hZa2i2A==
X-Received: by 2002:a05:6402:2682:: with SMTP id w2mr14308602edd.355.1644247592039;
        Mon, 07 Feb 2022 07:26:32 -0800 (PST)
Received: from [192.168.0.89] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id ec52sm3945244edb.24.2022.02.07.07.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 07:26:31 -0800 (PST)
Message-ID: <086655b0-b9d2-30ed-1496-47cdc6346003@canonical.com>
Date:   Mon, 7 Feb 2022 16:26:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
Content-Language: en-US
To:     =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, semen.protsenko@linaro.org,
        yangyicong@hisilicon.com, wsa@kernel.org, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, devicetree@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-7-warp5tw@gmail.com> <YgEJ1M40AG9EuRPI@latitude>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YgEJ1M40AG9EuRPI@latitude>
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

On 07/02/2022 13:00, Jonathan Neuschäfer wrote:
> Hello,
> 
> On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
>> From: Tyrone Ting <kfting@nuvoton.com>
>>
>> NPCM8XX uses a similar i2c module as NPCM7XX.
>> The only difference is that the internal HW FIFO
>> is larger.
>>
>> Related Makefile and Kconfig files are modified
>> to support as well.
>>
>> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
> 
> It's not really a bug fix, but rather an additional feature.
> Therefore, I suggest removing the Fixes tag from this patch.
> 
>> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>> ---
> [...]
>>  /* init register and default value required to enable module */
>>  #define NPCM_I2CSEGCTL			0xE4
>> +#ifdef CONFIG_ARCH_NPCM7XX
>>  #define NPCM_I2CSEGCTL_INIT_VAL		0x0333F000
>> +#else
>> +#define NPCM_I2CSEGCTL_INIT_VAL		0x9333F000
>> +#endif
> 
> This is going to cause problems when someone tries to compile a kernel
> that runs on both NPCM7xx and NPCM8xx (because the driver will then only
> work on NPCM7xx).

Yes, good catch.

The NPCM7XX is multiplatform, I guess NPCM8xx will be as well, so this
looks like an invalid code. How such code is supposed to work on
multiplatform kernel?

> 
> And every time another platform is added, this approach will make the
> code less readable.
> 
> A more future-proof approach is probably to have a struct with chip-
> specific data (such as the I2CSECCTL initialization value), which is
> then selected via the .data field in of_device_id.


Best regards,
Krzysztof
