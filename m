Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 460314E44DF
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Mar 2022 18:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239481AbiCVRUQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Mar 2022 13:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235774AbiCVRUQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Mar 2022 13:20:16 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0260A27160;
        Tue, 22 Mar 2022 10:18:48 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id g24so23675302lja.7;
        Tue, 22 Mar 2022 10:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RTM8YUH/16l7EmtQcBgSO7BwZNaXuM1GsNHw5TU8YMA=;
        b=J29nEJuaabNwiyFtO8XZPJKmEU9lbA8VGTBj0axXaQD+gTYL1YKfUAADfwV/o/lH8o
         wRmlmmOVhmigITYeNYkxvKqC1BmEQ8TT7w2jnw6P4bHYJqs30SY0R9jl953jv2p00H/1
         0+tmBnmJOmrY4v4vb2xjA5lMl3pjnCv9DYZFQ/BI5ZAlwbJNuvnxbEXjWL53tNCMaPL2
         BbK893Os0K1j3Bj1/igfs65CzEV8BGVA6Y7JTd0qE6plW2BdV4BeNSTmnnnKCqlRLYKl
         9+vdcIStLRNz04/cWIrq+DhMCXoKhlyb+sDtos9t1bZLSBhWPbktKKFGfO2OtkSYNoqg
         iv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RTM8YUH/16l7EmtQcBgSO7BwZNaXuM1GsNHw5TU8YMA=;
        b=ppnQJCTIOlltrlvDx19PrrTduZ9pZItzekh0Mz0kjtNj83SoZpaRW+wKKK5HwygAsw
         z6LfvIod85s+IiXUmciMS5JcFhVtKq+kUbeWiCW92fzXQorU0vdrxqPxlLAw335bnJwL
         ur99cPglGP3+tkZu93mbB9wgKRUTThhNbDzWioP6zbwwdv6hUrgjUl9FEYuO2FnsTvmK
         BzpIh9PePMj3wjYYA0maI4ooQ53hBf2lHpz8mZ+iVckssSXjVKKi0nUA12lJdas0VlNC
         tWiiEP4pvaz0Pt/iGQbqStXy7Dry7JyShI92b54Y4IWohnLRCp/1b7O5yeSYhxIR2rDH
         swfw==
X-Gm-Message-State: AOAM5318R8RT0Z5p9F/1NMHt/80/9YSBAhSztWPEeRT4RLwPxqFRBZBx
        bJ6lN2Eu0mhtiUndZL2Bo67Jrp6+JRe1704alQ==
X-Google-Smtp-Source: ABdhPJymIl3mnNzrBExxaC0P2tRc8nbab8mz9t2Jc0bzsAMqP+1Rv0yxtuHSGMSJ0/8LnAfqx+/tcAL9uimcF+hNheg=
X-Received: by 2002:a2e:505b:0:b0:248:1fc:68e9 with SMTP id
 v27-20020a2e505b000000b0024801fc68e9mr20172432ljd.206.1647969525404; Tue, 22
 Mar 2022 10:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com> <20220303083141.8742-9-warp5tw@gmail.com>
 <YiCZlhJoXPLpQ6/D@smile.fi.intel.com> <CAHb3i=t+Ai3w5mMhmZxxMsD7Zv0xpM4ZicMCmdDMtVn_OMbWYA@mail.gmail.com>
 <YiDNdlEKqorDFkZB@smile.fi.intel.com> <YiJ5unrCb82ZMV4Z@latitude>
In-Reply-To: <YiJ5unrCb82ZMV4Z@latitude>
From:   Avi Fishman <avifishman70@gmail.com>
Date:   Tue, 22 Mar 2022 19:18:34 +0200
Message-ID: <CAKKbWA4quvDbHWBdckAsKe65fDXXe8M-9CsjaP=4wsA=-NnULA@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] i2c: npcm: Correct register access width
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        yangyicong@hisilicon.com, Linux I2C <linux-i2c@vger.kernel.org>,
        Benjamin Fair <benjaminfair@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        JJLIU0@nuvoton.com, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tomer Maimon <tomer.maimon@nuvoton.com>, KWLIU@nuvoton.com,
        bence98@sch.bme.hu, Arnd Bergmann <arnd@arndb.de>,
        sven@svenpeter.dev, Rob Herring <robh+dt@kernel.org>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        Tyrone Ting <warp5tw@gmail.com>, semen.protsenko@linaro.org,
        jie.deng@intel.com, Patrick Venture <venture@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
        Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
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

On Fri, Mar 4, 2022 at 10:42 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> Hello,
>
> On Thu, Mar 03, 2022 at 04:15:18PM +0200, Andy Shevchenko wrote:
> > On Thu, Mar 03, 2022 at 02:54:27PM +0200, Tali Perry wrote:
> > > > On Thu, Mar 03, 2022 at 04:31:38PM +0800, Tyrone Ting wrote:
> > > > > From: Tyrone Ting <kfting@nuvoton.com>
> > > > >
> > > > > Use ioread8 instead of ioread32 to access the SMBnCTL3 register s=
ince
> > > > > the register is only 8-bit wide.
> > > >
> > > > > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controll=
er driver")
> > > >
> > > > No, this is bad commit message, since you have bitwise masks and th=
ere is
> > > > nothing to fix from functional point of view. So, why is this a fix=
?
> > > >
> > >
> > > The next gen of this device is a 64 bit cpu.
> > > The module is and was 8 bit.
> > >
> > > The ioread32 that seemed to work smoothly on a 32 bit machine
> > > was causing a panic on a 64 bit machine.
> > > since the module is 8 bit we changed to ioread8.
> > > This is working both for the 32 and 64 CPUs with no issue.
> >
> > Then the commit message is completely wrong here.
>
> I disagree: The commit message is perhaps incomplete, but not wrong.
> The SMBnCTL3 register was specified as 8 bits wide in the datasheets of
> multiple chip generations, as far as I can tell, but the driver wrongly
> made a 32-bit access, which just happened not to blow up.
>
> So, indeed, "since the register is only 8-bit wide" seems to be a
> correct claim.
>
> > And provide necessary (no need to have noisy commit messages)
> > bits of the oops to show what's going on
>
> I guess it's blowing up now because SMBnCTL3 isn't 32-bit aligned
> (being at offset 0x0e in the controller).
>

Hi Andy,
After this clarification can you please acknowledge this specific patch?
If you think there is a better way to describe this, can you propose one?

>
> Jonathan



--=20
Regards,
Avi
