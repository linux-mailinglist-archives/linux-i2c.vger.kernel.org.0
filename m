Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52D4E4AD502
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 10:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355019AbiBHJcI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 04:32:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355058AbiBHJb7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 04:31:59 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A42C03FEDB;
        Tue,  8 Feb 2022 01:31:44 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id f18so2957541lfj.12;
        Tue, 08 Feb 2022 01:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QTsvG/MyR6TPoZZ1n5KMlOw4gpVQIJ+hOUnP6d8GFcc=;
        b=DKhZSAqJ6wiIGf+iD+yFxg2jDXx8jMDB2WiDTTjJErW2HwymA7vVgUzR9MKOqQAy4m
         Aq2Sd0DEn7MaLIeGV9iWAreTiv0MyFZhSEiGpL4OBtPnVGD50g4Vd1cwHDP1FkmEPfY8
         hNGx9qqSwTvf33NFhBFbEqKnBwQpaf8EmW4QHS4zTccIGOUYdjxdizjPR66D/AZb6XF0
         J/wbms0+EK46ESGLqoEFPULznfkjqCAGs0C4Wim7kv3a3z90hoJogJgFTpUhBVDShJeA
         2I90Ms1qXYPLiDaO7jXQMda1T4C8hP2dSqACLl9oKA0qgICOnneQhAzBM2SxDaBDexii
         tKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QTsvG/MyR6TPoZZ1n5KMlOw4gpVQIJ+hOUnP6d8GFcc=;
        b=idcy3KQyuq5P2N62nfsyGFLXf1i6Agj25o3ycVAXHLXEcQXAM+j4rIUbyJjP5lE03k
         pdwB9fdgq2HvgVgQjf2hJyW69Nwoc7JK2UrJyNopTf8ijV6ENI5/gSl/r23imrHEzJQp
         GXZb+6cszXHdeS18Fcus0OJq4wrsPHezWQEU3dzKq77y/nKIi+iqtgJjqHo08Q2sYd2F
         NkT5VMWyqGPvY7b99XqxyIps/nneLzUDm8MpObCk5uHLXOo4d9fg6iLFsPHgVR3GNE7H
         u3LKhR09emlF1bHdHY4qVb0BOeAPNy2cmFsOR6T5RYWq6o/LFsQKO8dK24xQQV/1kabn
         wLuA==
X-Gm-Message-State: AOAM531xBr4jzAMv3lgaUsqk3gWOeiRVwUkf7fm8sTM8rnNr7nX1fHv4
        qdebqp7oEpuScjSrAOS173y0ap/y0VJpPl1+/g==
X-Google-Smtp-Source: ABdhPJypVIyBMMvDURLR0SEeUbpP7YTNmt+B/7NYNmg53tZ+PS9X8lm5E6KlllarkaEGTbpM2ZZWBPRdR00N7rIwrms=
X-Received: by 2002:a05:6512:3c96:: with SMTP id h22mr2373512lfv.262.1644312702716;
 Tue, 08 Feb 2022 01:31:42 -0800 (PST)
MIME-Version: 1.0
References: <20220207063338.6570-1-warp5tw@gmail.com> <20220207063338.6570-7-warp5tw@gmail.com>
 <CAHb3i=vdc_+J4pCBcY--C85ZR1uXO1LG02UsttsfSnsQBDKWAg@mail.gmail.com>
In-Reply-To: <CAHb3i=vdc_+J4pCBcY--C85ZR1uXO1LG02UsttsfSnsQBDKWAg@mail.gmail.com>
From:   Avi Fishman <avifishman70@gmail.com>
Date:   Tue, 8 Feb 2022 11:31:31 +0200
Message-ID: <CAKKbWA6qZ1ytKS5V6tLxQgzQefhz7mTg3Vi_tPDM2p=N7O+8Vg@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     Tyrone Ting <warp5tw@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        Wolfram Sang <wsa@kernel.org>, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, olof@lixom.net,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tali Perry <tali.perry@nuvoton.com>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        Tomer Maimon <tomer.maimon@nuvoton.com>, KWLIU@nuvoton.com,
        JJLIU0@nuvoton.com, kfting@nuvoton.com,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
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

On Tue, Feb 8, 2022 at 11:22 AM Tali Perry <tali.perry1@gmail.com> wrote:
>
> >On 08/02/2022 09:51, Tali Perry wrote:
> >>> On 08/02/2022 08:14, Tali Perry wrote:
> >>>>> Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
> >>>>>
> >>>>> On 07/02/2022 13:00, Jonathan Neusch=C3=A4fer wrote:
> >>>>>> Hello,
> >>>>>>
> >>>>>> On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
> >>>>>>> From: Tyrone Ting <kfting@nuvoton.com>
> >>>>>>>
> >>>>>>> NPCM8XX uses a similar i2c module as NPCM7XX.
> >>>>>>> The only difference is that the internal HW FIFO is larger.
> >>>>>>>
> >>>>>>> Related Makefile and Kconfig files are modified to support as wel=
l.
> >>>>>>>
> >>>>>>> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controll=
er
> >>>>>>> driver")
> >>>>>>
> >>>>>> It's not really a bug fix, but rather an additional feature.
> >>>>>> Therefore, I suggest removing the Fixes tag from this patch.
> >>>>>>
> >>>>>>> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> >>>>>>> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> >>>>>>> ---
> >>>>>> [...]
> >>>>>>>  /* init register and default value required to enable module */
> >>>>>>>  #define NPCM_I2CSEGCTL 0xE4
> >>>>>>> +#ifdef CONFIG_ARCH_NPCM7XX
> >>>>>>>  #define NPCM_I2CSEGCTL_INIT_VAL 0x0333F000
> >>>>>>> +#else
> >>>>>>> +#define NPCM_I2CSEGCTL_INIT_VAL 0x9333F000
> >>>>>>> +#endif
> >>>>>>
> >>>>>> This is going to cause problems when someone tries to compile a ke=
rnel
> >>>>>> that runs on both NPCM7xx and NPCM8xx (because the driver will the=
n
> >>>>>> only work on NPCM7xx).
> >>>>>
> >>>>> Yes, good catch.
> >>>>>
> >>>>> The NPCM7XX is multiplatform, I guess NPCM8xx will be as well, so t=
his looks like an invalid code. How such code is supposed to work on multip=
latform kernel?
> >>>>>
> >>>>
> >>>> NPCM7xx and NPCM8xx are very different devices.
> >>>> They share same driver sources for some of the modules but it's not =
ABI.
> >>>> Users cannot compile a single kernel with two separate DTS.
> >>>> In case of the i2c controller, the npcm7xx has a 16 byte HW FIFO,
> >>>> and the NPCM8xx has 32 bytes HW FIFO.
> >>>> This also means that registers fields are slightly different.
> >>>> For init data we can move it to the DTS, but register field sizes
> >>>> can't be handled with this approach.
> >>>>
> >>>
> >>> What do you mean they cannot compile a kernel with different DTS? Of
> >>> course they can - when we talk about multiplatform sub-architectures!
> >>> Maybe there is something specific in NPCMxxx which stops it but then =
it
> >>> should not be marked multiplatform.
> >>>
> >>
> >>
> >> NCPM7xx is ARM32 bit (dual core Cortex A9)
> >> NPCM8xx is ARM64 bit (quad core Cortex A35)
> >>
> >> They have completely different architecture so not ABI compliant.
> >> I2C module is similar, but the devices are quite different and have
> >> separate architectures.
> >
> >OK, in such case usually you indeed can't have both. :)
> >
> >> Sorry for the confusion.
> >> This is the first patch we try to upstream for NPCM8xx.
> >> In the coming weeks we will upstream the architecture of NPCM8xx as we=
ll.
> >
> >Still, ARCH_XXX should not be hard-coded in the drivers to change the
> >driver's behavior, even if driver won't be used simultaneously. It
> >breaks all design principles and prevents any further re-use if a new
> >use case appears.
> >
> >You can use "ifdef ARCH_XXX" to skip building of some parts of the
> >driver, but it's not the case here.
> >
>
> Correct, the main change is in FIFO size:
> +#ifdef CONFIG_ARCH_NPCM7XX
> #define I2C_HW_FIFO_SIZE               16
> +#else
> +#define I2C_HW_FIFO_SIZE               32
> +#endif /* CONFIG_ARCH_NPCM7XX */
>
> NPCM7XX will always have 16 bytes, all the next gens will have 32.
>
> This impact some registers sizes, like this one:
>
> +#ifdef CONFIG_ARCH_NPCM7XX
> #define NPCM_I2CRXF_STS_RX_BYTES       GENMASK(4, 0)
> +#else
> +#define NPCM_I2CRXF_STS_RX_BYTES       GENMASK(5, 0)
> +#endif /*CONFIG_ARCH_NPCM7XX*/
>
> For this, the FIFO size should be defined before compilation.
> I also don't want to let users select FIFO size per architecture.
> NPCM7XX has 16, NPCM8XX has 32. This is not a user selection.
> It's part of the arch.

Will this be a better approach to add in the Kconfig file a legacy mode:
config I2C_NPCM_VER_89
      bool "support legacy i2c version 0x89 of npcm"
      depends on ARCH_NPCM7XX
      default y
      help
        This limits the support to legacy i2c version 0x89 of npcm
        Will be only 16 bytes fifo and will not include other new features

config I2C_NPCM
      tristate "Nuvoton I2C Controller"
      depends on ARCH_NPCM || COMPILE_TEST
      select I2C_NPCM_VER_89 if ARCH_NPCM7XX
      help
        If you say yes to this option, support will be included for the
        Nuvoton I2C controller, which is available on the NPCM BMC
        controllers.
        Driver can also support slave mode (select I2C_SLAVE).

and in the code replace:
#ifdef CONFIG_ARCH_NPCM7XX
with
#ifdef CONFIG_I2C_NPCM_VER_89

>
>
>
> >
> >Best regards,
> >Krzysztof
>
> Thanks,
> Tali



--=20
Regards,
Avi
