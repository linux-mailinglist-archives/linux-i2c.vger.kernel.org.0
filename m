Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD8C14AD1FD
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 08:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347946AbiBHHOb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 02:14:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235298AbiBHHOa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 02:14:30 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60FEEC0401EF;
        Mon,  7 Feb 2022 23:14:29 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id y8so14049558qtn.8;
        Mon, 07 Feb 2022 23:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VNtT+hI4htB2swNQKNRtjIfJJVmCXaN4+/+51pyI8Kg=;
        b=K+zBA6+sy0mDQchDnIAOMFJrUx4Kf2xIFdKUsNO77VskGfPqUASUGDZPGB5dnglE90
         XerLsB9YGVAjop+gcaAGOm7Dvjl4tTxVWbXiTN5PBi8LWcER+X5nr/CG6S5+KtN8i9VR
         zz8gZlv0gi0LPhGrRZLFWcTT6o5hK2XZ+yg0dsPV1ZRq2s17fURCyI+8+S265FZL1NUW
         KJudZnAjDQrDjbwCV9tAw8G6mtZscAyTI9SEDiVugSmnYrRIQYG5eDu1qALpYpZGQrxW
         DBJquFgnQwhzVKYK6w7h3xuVFErlD8eMRaMbaGsEoWsKcpshAIgQYidvaklhAJRRaIee
         lwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VNtT+hI4htB2swNQKNRtjIfJJVmCXaN4+/+51pyI8Kg=;
        b=GUwi1oiztIaaPoK5RMlybZDIhDhKqXzN3sKoS9REejEcTNSXYv+tiiePX0GGHAnpJw
         Qk/EJvTmqNzKppe+4s3xSLGCnoGtCZPPbcqpukYy4mTZdM0uS/v0YyMk/+ZFZX3gql5a
         FRmKK3Jg/9xwASZyRpsmCO8LayVjBD1436mF4narMt5L9URaQNTUuY+6a9U/CNAGQQxP
         XmaB9vrJti/FuK0cABr3+3Jp4IbhFlHk1xFiZUN2+JipsDTQQNmDu7xAXO6Kx04B1JBp
         je9cNCPTsRDGuzLa5VSc7i40lMkAWkFPEsmOs4mdO1d/o34TfeYfHU3KE8mSS8j0cyhM
         toNg==
X-Gm-Message-State: AOAM531xhpot0GN6zM/ZCcKk2aCugheDbWBr6FSWsiBQXeyiit6K4I83
        EqO0ODFajnk9ZmanHvrGqPeMchmF60uOEpr0jsU=
X-Google-Smtp-Source: ABdhPJxcy7FjpbarmDvijrfYBsu9QSlj4cydqRZroJlQcRNaRWWhHSSBldpn+0r3FsH2IOnoXHEB4cLNZ4lHo6k+gQs=
X-Received: by 2002:a05:622a:248:: with SMTP id c8mr2155685qtx.602.1644304468511;
 Mon, 07 Feb 2022 23:14:28 -0800 (PST)
MIME-Version: 1.0
References: <20220207063338.6570-1-warp5tw@gmail.com> <20220207063338.6570-7-warp5tw@gmail.com>
 <YgEJ1M40AG9EuRPI@latitude> <086655b0-b9d2-30ed-1496-47cdc6346003@canonical.com>
In-Reply-To: <086655b0-b9d2-30ed-1496-47cdc6346003@canonical.com>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Tue, 8 Feb 2022 09:14:17 +0200
Message-ID: <CAHb3i=vpFwez+ZzDhHkSxjkios3tyoM2urRpCxOn3vfwzvewog@mail.gmail.com>
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

>-----Original Message-----
>From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>Sent: Monday, February 7, 2022 5:27 PM
>To: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>; Tyrone Ting <warp5tw=
@gmail.com>
>Cc: avifishman70@gmail.com; tmaimon77@gmail.com; tali.perry1@gmail.com; ve=
nture@google.com; yuenn@google.com; benjaminfair@google.com; robh+dt@kernel=
.org; semen.protsenko@linaro.org; yangyicong@hisilicon.com; wsa@kernel.org;=
 jie.deng@intel.com; sven@svenpeter.dev; bence98@sch.bme.hu; lukas.bulwahn@=
gmail.com; arnd@arndb.de; olof@lixom.net; andriy.shevchenko@linux.intel.com=
; IS20 Tali Perry <tali.perry@nuvoton.com>; IS20 Avi Fishman <Avi.Fishman@n=
uvoton.com>; IS20 Tomer Maimon <tomer.maimon@nuvoton.com>; CS20 KWLiu <KWLI=
U@nuvoton.com>; CS20 JJLiu0 <JJLIU0@nuvoton.com>; CS20 KFTing <KFTING@nuvot=
on.com>; devicetree@vger.kernel.org; openbmc@lists.ozlabs.org; linux-i2c@vg=
er.kernel.org; linux-kernel@vger.kernel.org
>Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
>
>On 07/02/2022 13:00, Jonathan Neusch=C3=A4fer wrote:
>> Hello,
>>
>> On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
>>> From: Tyrone Ting <kfting@nuvoton.com>
>>>
>>> NPCM8XX uses a similar i2c module as NPCM7XX.
>>> The only difference is that the internal HW FIFO is larger.
>>>
>>> Related Makefile and Kconfig files are modified to support as well.
>>>
>>> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller
>>> driver")
>>
>> It's not really a bug fix, but rather an additional feature.
>> Therefore, I suggest removing the Fixes tag from this patch.
>>
>>> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>>> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>> ---
>> [...]
>>>  /* init register and default value required to enable module */
>>>  #define NPCM_I2CSEGCTL 0xE4
>>> +#ifdef CONFIG_ARCH_NPCM7XX
>>>  #define NPCM_I2CSEGCTL_INIT_VAL 0x0333F000
>>> +#else
>>> +#define NPCM_I2CSEGCTL_INIT_VAL 0x9333F000
>>> +#endif
>>
>> This is going to cause problems when someone tries to compile a kernel
>> that runs on both NPCM7xx and NPCM8xx (because the driver will then
>> only work on NPCM7xx).
>
>Yes, good catch.
>
>The NPCM7XX is multiplatform, I guess NPCM8xx will be as well, so this loo=
ks like an invalid code. How such code is supposed to work on multiplatform=
 kernel?
>

NPCM7xx and NPCM8xx are very different devices.
They share same driver sources for some of the modules but it's not ABI.
Users cannot compile a single kernel with two separate DTS.
In case of the i2c controller, the npcm7xx has a 16 byte HW FIFO,
and the NPCM8xx has 32 bytes HW FIFO.
This also means that registers fields are slightly different.
For init data we can move it to the DTS, but register field sizes
can't be handled with this approach.



>>
>> And every time another platform is added, this approach will make the
>> code less readable.
>>
>> A more future-proof approach is probably to have a struct with chip-
>> specific data (such as the I2CSECCTL initialization value), which is
>> then selected via the .data field in of_device_id.
>
>
>Best regards,
>Krzysztof

Thanks for the review!
Tali Perry, Nuvoton.
