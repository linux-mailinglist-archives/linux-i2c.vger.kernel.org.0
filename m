Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53C2F4CBE34
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 13:54:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232941AbiCCMzZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 07:55:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbiCCMzY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 07:55:24 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F38F3EBBC;
        Thu,  3 Mar 2022 04:54:39 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id b13so3740871qkj.12;
        Thu, 03 Mar 2022 04:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gpvc/JncUD6k2jJA3rPe/Gzgk+Fq4UJfHnGecuBxreA=;
        b=IKexSrjmgJhU/WoXJKfWByEwrcXXCaNVPlDjEbMiSg0nxBodoBSBq20+tAwigK6+pC
         9Dp6cFBNY+QNtcPfFvnwju/gHjuFP+6ukcCnooqujSXxGAkBpnouqN1b+TQXjs+Yfi36
         WUWSGgNTjHRQiqueElBcOjkFqfNubmTwkDuIPRDKk65BJVYxujTBTUB/R9Yj71lu8EmR
         1Dh4K2vfrjlXP5q1NTc264erP0AEzWAhFK8isbrZAlyXsw11MyCLEOS2Xu/38VYki9dP
         VCdIcInwZgLBQFuPC8S/9sVzCg7bShQNrudP7qD0LkThcDgEkk0geVGMx22W9GCSObdd
         eVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gpvc/JncUD6k2jJA3rPe/Gzgk+Fq4UJfHnGecuBxreA=;
        b=EI+MeLd1RLOA60DY1nIuUct8EqfkM0r1/WB/hLgShm4b2Gy6EAzN7XZ+Vql1V7d03m
         GxZQIi+4AjePoRsyyJCzq39zyPYc/jkEqaQjsY2A91IpbgAQStRCuxOUm0FTXEZa6XPd
         jgEiLYNzHPOfgZXlbh5JHWKTzYE8MgkOeeQ4FMvs8fuWPQYWaYV2LJAK7WCHjw7k4Hh3
         FXvIvXGatMcuF4MHKgfSYdoAkoapefnJcGiXsBHz1BsF8jIBUFvwr32Yz/a1y4OP63Dx
         LJSwu6WWwP49unC4drefz2h1TlSR9gj+phUcRg2QqRa6CBeMsfTs/C/HSyCUpCrU62AU
         xtIA==
X-Gm-Message-State: AOAM530L32cTe151n1qzyLRBDsEnqOcFn1x6aL4IT1MfPF67j4jtZpow
        /v81cbbrmnQkMgWbll3QcDwXaee/jk2p7p4lpDE=
X-Google-Smtp-Source: ABdhPJya62aW6zfOJJA50kUityeXdjHGZGgzkLm44Teu6/f9/Pp5GGbIVsrZWAIDPZCmqYoXqiTzVJWyoZq7y7zgu3A=
X-Received: by 2002:a05:620a:11:b0:508:7199:40ef with SMTP id
 j17-20020a05620a001100b00508719940efmr18483948qki.62.1646312078413; Thu, 03
 Mar 2022 04:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com> <20220303083141.8742-9-warp5tw@gmail.com>
 <YiCZlhJoXPLpQ6/D@smile.fi.intel.com>
In-Reply-To: <YiCZlhJoXPLpQ6/D@smile.fi.intel.com>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Thu, 3 Mar 2022 14:54:27 +0200
Message-ID: <CAHb3i=t+Ai3w5mMhmZxxMsD7Zv0xpM4ZicMCmdDMtVn_OMbWYA@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] i2c: npcm: Correct register access width
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
        Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        Wolfram Sang <wsa@kernel.org>, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu, lukas.bulwahn@gmail.com,
        arnd@arndb.de, olof@lixom.net, Tali Perry <tali.perry@nuvoton.com>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> On Thu, Mar 03, 2022 at 04:31:38PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Use ioread8 instead of ioread32 to access the SMBnCTL3 register since
> > the register is only 8-bit wide.
>
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
>
> No, this is bad commit message, since you have bitwise masks and there is
> nothing to fix from functional point of view. So, why is this a fix?
>

The next gen of this device is a 64 bit cpu.
The module is and was 8 bit.

The ioread32 that seemed to work smoothly on a 32 bit machine
was causing a panic on a 64 bit machine.
since the module is 8 bit we changed to ioread8.
This is working both for the 32 and 64 CPUs with no issue.


> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>
> This is wrong SoB chain.
>
> ...
>
> > -     return !!(I2CCTL3_SCL_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
> > +     return !!(I2CCTL3_SCL_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
>
> ...
>
> > -     return !!(I2CCTL3_SDA_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
> > +     return !!(I2CCTL3_SDA_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
>
> --
> With Best Regards,
> Andy Shevchenko

Thanks Andy,

BR,
Tali Perry
