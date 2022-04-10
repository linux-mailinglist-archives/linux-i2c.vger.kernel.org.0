Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9257A4FAC91
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Apr 2022 09:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234203AbiDJHfm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 10 Apr 2022 03:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234164AbiDJHfl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 10 Apr 2022 03:35:41 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4ADB546B2;
        Sun, 10 Apr 2022 00:33:31 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id j9so13494425lfe.9;
        Sun, 10 Apr 2022 00:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ox3tf6Vdl+MQsr77fGjpkrwS1r+0QmB/6mtEgP5kOo8=;
        b=Bz0LpOefLI1lEojOFoqUlsAMdkco/5HPV+AeTU8rHp3rFzg2cMD4iJ00Rm8TxmsIxZ
         sQ1/5o80CAfxhQMQ92Uv0ZIWBiDcfEftMM9yT+G9p3ptL5HUn7yIbqeqVVjgGwneCRJ0
         5nn0YNGTFNK9A4MaqZXdlfeteZadEXkSG7YgMXeAVw5bdHl0+NfShg2FVksEaH0QLaYb
         9VAbdRSL7/217gvvfj/DFOdJ8jMwie1OVmRuDZqJJDWz5D7zB0Dzfjr74dQ3e44hi3QB
         BRxQHStxTpWRqYaHaupRGJewHhsSVcra/7/KN/DzesBRXa5L4KyhCxzOcISyXRon0ihN
         DUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ox3tf6Vdl+MQsr77fGjpkrwS1r+0QmB/6mtEgP5kOo8=;
        b=NRdY90ZjGixBHQtMO5XpT/QfQuNS78Xys/7jTp5UpLNogALpPq02+35Q9rB8YQTLMF
         wDmI+v9TNkOiT+bckx3W4DGDvUVggPG8S7Gl4UL4+RkP2twrmYDSfPAm8KiJtI9/M+Eh
         2drTeV5aiicBXXFCVtbqIcX4ejLZyUADqmv8h4raUQRWWxjuBzZOLmQYytm6Z3hNhhF2
         7xgOe183imFJi62OuwF7LSB4JmomMpgCQNyLPBeTAB+H4dnw+HtD7rcZ0z7J0V65nnTT
         xoJiHQrErIMfGKTpfl2HFBG3x1QaT+ay7da4g64rDa0HGrlreS3XGVOfStsPyicVrFLY
         j+Yg==
X-Gm-Message-State: AOAM5307ypVZUAMf18X3NpLPiXAyVHAYcNRUGVRd16vheMPXr3HaL65c
        3OX4NsuSBpFqNkxsRTUyf6wzkbulbG4XN3bX5g==
X-Google-Smtp-Source: ABdhPJxMe5Lm1RdB41pICYNqF8fraGS6Hg0euDwsM1rxKXmiuFYkQ8RgSAxFld06VADpygjbCv6naNQgqZecQN5dzrs=
X-Received: by 2002:a05:6512:3b2c:b0:44a:35fd:994c with SMTP id
 f44-20020a0565123b2c00b0044a35fd994cmr17605988lfv.473.1649576009787; Sun, 10
 Apr 2022 00:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com> <20220303083141.8742-10-warp5tw@gmail.com>
 <YiCaSSbbszm3qYIQ@smile.fi.intel.com> <CAHb3i=sStqdSpLKtF_UGmTsOssR_swssTd3pv6c2-z_kiUPTTA@mail.gmail.com>
 <YiDNDsPWKyaIUlQR@smile.fi.intel.com> <CAKKbWA5FyCKTjEUw8rqtkoL7aw6f7Fa_QzcAkgaRnnUMTe0SKg@mail.gmail.com>
 <YkvsB27Oj0kSmJRG@smile.fi.intel.com>
In-Reply-To: <YkvsB27Oj0kSmJRG@smile.fi.intel.com>
From:   Avi Fishman <avifishman70@gmail.com>
Date:   Sun, 10 Apr 2022 10:33:18 +0300
Message-ID: <CAKKbWA5aQeQTtM06NdNvg0=D5ThcghW5rVaM__0c1kopftqX+w@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] i2c: npcm: Handle spurious interrupts
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tali Perry <tali.perry1@gmail.com>,
        Tyrone Ting <warp5tw@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        yangyicong@hisilicon.com, semen.protsenko@linaro.org,
        Wolfram Sang <wsa@kernel.org>, jie.deng@intel.com,
        sven@svenpeter.dev, bence98@sch.bme.hu,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, olof@lixom.net,
        Tali Perry <tali.perry@nuvoton.com>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        Tomer Maimon <tomer.maimon@nuvoton.com>, KWLIU@nuvoton.com,
        JJLIU0@nuvoton.com, kfting@nuvoton.com,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
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

On Tue, Apr 5, 2022 at 10:13 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Apr 04, 2022 at 08:03:44PM +0300, Avi Fishman wrote:
> > On Thu, Mar 3, 2022 at 4:14 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Mar 03, 2022 at 02:48:20PM +0200, Tali Perry wrote:
> > > > > On Thu, Mar 3, 2022 at 12:37 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Thu, Mar 03, 2022 at 04:31:39PM +0800, Tyrone Ting wrote:
> > > > > > > From: Tali Perry <tali.perry1@gmail.com>
> > > > > > >
> > > > > > > In order to better handle spurious interrupts:
> > > > > > > 1. Disable incoming interrupts in master only mode.
> > > > > > > 2. Clear end of busy (EOB) after every interrupt.
> > > > > > > 3. Return correct status during interrupt.
> > > > > >
> > > > > > This is bad commit message, it doesn't explain "why" you are doing these.
> > >
> > > ...
> > >
> > > > BMC users connect a huge tree of i2c devices and muxes.
> > > > This tree suffers from spikes, noise and double clocks.
> > > > All these may cause spurious interrupts to the BMC.
>
> (1)
>
> > > > If the driver gets an IRQ which was not expected and was not handled
> > > > by the IRQ handler,
> > > > there is nothing left to do but to clear the interrupt and move on.
> > >
> > > Yes, the problem is what "move on" means in your case.
> > > If you get a spurious interrupts there are possibilities what's wrong:
> > > 1) HW bug(s)
> > > 2) FW bug(s)
> > > 3) Missed IRQ mask in the driver
> > > 4) Improper IRQ mask in the driver
> > >
> > > The below approach seems incorrect to me.
> >
> > Andy, What about this explanation:
> > On rare cases the i2c gets a spurious interrupt which means that we
> > enter an interrupt but in
> > the interrupt handler we don't find any status bit that points to the
> > reason we got this interrupt.
> > This may be a rare case of HW issue that is still under investigation

About 1 to 100,000 transactions

> > In order to overcome this we are doing the following:
> > 1. Disable incoming interrupts in master mode only when slave mode is
> > not enabled.
> > 2. Clear end of busy (EOB) after every interrupt.
> > 3. Clear other status bits (just in case since we found them cleared)
> > 4. Return correct status during the interrupt that will finish the transaction.
> > On next xmit transaction if the bus is still busy the master will
> > issue a recovery process before issuing the new transaction.
>
> This sounds better, thanks.
>
> One thing to clarify, the (1) states that the HW "issue" is known and becomes a
> PCB level one, i.e. noisy environment that has not been properly shielded.
> So, if it is known, please put the reason in the commit message.
>

The HW issue is not known yet, we see it on few platforms and in other
platforms we don't, so the first assumption was this.
So eventually we don't want to claim this without proving it.

> Also would be good to see numbers of "rare". Is it 0.1%?

I added above the known statistics.

>
> > > > If the transaction failed, driver has a recovery function.
> > > > After that, user may retry to send the message.
> > > >
> > > > Indeed the commit message doesn't explain all this.
> > > > We will fix and add to the next patchset.
> > > >
> > > > > > > +     /*
> > > > > > > +      * if irq is not one of the above, make sure EOB is disabled and all
> > > > > > > +      * status bits are cleared.
> > > > > >
> > > > > > This does not explain why you hide the spurious interrupt.
> > > > > >
> > > > > > > +      */
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


-- 
Regards,
Avi
