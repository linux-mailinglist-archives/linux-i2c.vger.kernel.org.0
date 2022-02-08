Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E44FD4AD3F9
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 09:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351624AbiBHIvZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 03:51:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351868AbiBHIvY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 03:51:24 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D6EC03FEC8;
        Tue,  8 Feb 2022 00:51:23 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id c14so5599387qvl.12;
        Tue, 08 Feb 2022 00:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=52Mlxc/AZaE8Cndi19CrmZAb2xd8snlWb6gzXeW+f8c=;
        b=LIoXET1Vcm+0Yo/759v2FqsPM9tUsLx5soPaRzhSfagqaev0i/jq4YTBq0QXQKPdRn
         Kbs1VbKM9Vys9h4DE73AhMh80HqZqIG2ciDb+cZAARKQHBryRqURWDb9PWl4iykUvLbx
         vhFCNNRDwT9aWmNTKkotXhcTvlI0jVPKnUeMRvIF3F5xyP3uidSK1o+FyDLyVobzE5Xc
         +RYq4C22VTpWstKp9vrwLat1X3z0vDt0sPLkTADDz1kEv0wGLwyOmR6ZxECbWsNA4Plv
         PyAIXzKAaKValqytpOhB/H/LFIwFoJLFeYiLPMNP5/P/cp2GJJU75tKzVP5CXWisQu/D
         xx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=52Mlxc/AZaE8Cndi19CrmZAb2xd8snlWb6gzXeW+f8c=;
        b=U9Ia4OpCwKrSB4WWagEh9WvIWggsaIO1in+ZRP0FOmVqYjT2S91v9AeU4OILl5prPq
         oAzRnffNqUkKc7wJKDb9r7LNguubOCFNpBqYzCsSYmqeJVNZv2mqlXprwbqIu3K62N6K
         g2PS/WaBp+NBgZZspx4Zib33E4z6l9Lhw725j7TqlSdzhucuovMu0rdzYcwo9hd8QBGf
         hOSC+TOEqrTIeet6DbSKGxQIA1aY3aaYrvqM8TMXny96IxLtFOC51Y9UoE3KPxDDXNwe
         cvFeXci4kDOoVAYbPUeXNQ1DH5fvXPVYDwdU3dprRoX4smxSwKDezCouFvuECMI2I3Ay
         D3NA==
X-Gm-Message-State: AOAM533rYDeALvVu2U0NpaG6bh5tzsAig44gdZMJmKKkxdUjZ6zCFFEP
        2AhzhbHT9bWthVtMk2fuMjnEwAQAiPugYoiVXNA=
X-Google-Smtp-Source: ABdhPJwBqxeW2lVYe2YhpeD6J4pREP12QDacbTsGlkhFVIN+DKzqGhtZN16Vv4UkriLaHnkPuW7YJ4oDA16S2sfvwzY=
X-Received: by 2002:a05:6214:1cc7:: with SMTP id g7mr2429769qvd.124.1644310282674;
 Tue, 08 Feb 2022 00:51:22 -0800 (PST)
MIME-Version: 1.0
References: <20220207063338.6570-1-warp5tw@gmail.com> <20220207063338.6570-7-warp5tw@gmail.com>
 <YgEJ1M40AG9EuRPI@latitude> <086655b0-b9d2-30ed-1496-47cdc6346003@canonical.com>
 <CAHb3i=vpFwez+ZzDhHkSxjkios3tyoM2urRpCxOn3vfwzvewog@mail.gmail.com> <30ac5fe7-9d96-a756-24b0-384361b48a2d@canonical.com>
In-Reply-To: <30ac5fe7-9d96-a756-24b0-384361b48a2d@canonical.com>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Tue, 8 Feb 2022 10:51:11 +0200
Message-ID: <CAHb3i=ukzVr4DDgcPQ2+DO+LXWWtgjCe03WbG-CqvsOP_qqvUw@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

>On 08/02/2022 08:14, Tali Perry wrote:
>>> Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
>>>
>>> On 07/02/2022 13:00, Jonathan Neusch=C3=A4fer wrote:
>>>> Hello,
>>>>
>>>> On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
>>>>> From: Tyrone Ting <kfting@nuvoton.com>
>>>>>
>>>>> NPCM8XX uses a similar i2c module as NPCM7XX.
>>>>> The only difference is that the internal HW FIFO is larger.
>>>>>
>>>>> Related Makefile and Kconfig files are modified to support as well.
>>>>>
>>>>> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller
>>>>> driver")
>>>>
>>>> It's not really a bug fix, but rather an additional feature.
>>>> Therefore, I suggest removing the Fixes tag from this patch.
>>>>
>>>>> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>>>>> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>>>> ---
>>>> [...]
>>>>>  /* init register and default value required to enable module */
>>>>>  #define NPCM_I2CSEGCTL 0xE4
>>>>> +#ifdef CONFIG_ARCH_NPCM7XX
>>>>>  #define NPCM_I2CSEGCTL_INIT_VAL 0x0333F000
>>>>> +#else
>>>>> +#define NPCM_I2CSEGCTL_INIT_VAL 0x9333F000
>>>>> +#endif
>>>>
>>>> This is going to cause problems when someone tries to compile a kernel
>>>> that runs on both NPCM7xx and NPCM8xx (because the driver will then
>>>> only work on NPCM7xx).
>>>
>>> Yes, good catch.
>>>
>>> The NPCM7XX is multiplatform, I guess NPCM8xx will be as well, so this =
looks like an invalid code. How such code is supposed to work on multiplatf=
orm kernel?
>>>
>>
>> NPCM7xx and NPCM8xx are very different devices.
>> They share same driver sources for some of the modules but it's not ABI.
>> Users cannot compile a single kernel with two separate DTS.
>> In case of the i2c controller, the npcm7xx has a 16 byte HW FIFO,
>> and the NPCM8xx has 32 bytes HW FIFO.
>> This also means that registers fields are slightly different.
>> For init data we can move it to the DTS, but register field sizes
>> can't be handled with this approach.
>>
>
>What do you mean they cannot compile a kernel with different DTS? Of
>course they can - when we talk about multiplatform sub-architectures!
>Maybe there is something specific in NPCMxxx which stops it but then it
>should not be marked multiplatform.
>


NCPM7xx is ARM32 bit (dual core Cortex A9)
NPCM8xx is ARM64 bit (quad core Cortex A35)

They have completely different architecture so not ABI compliant.
I2C module is similar, but the devices are quite different and have
separate architectures.

Sorry for the confusion.
This is the first patch we try to upstream for NPCM8xx.
In the coming weeks we will upstream the architecture of NPCM8xx as well.



>
>Best regards,
>Krzysztof

Thanks!
Tali
