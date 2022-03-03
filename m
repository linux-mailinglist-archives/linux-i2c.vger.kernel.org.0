Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6616E4CBE20
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Mar 2022 13:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232414AbiCCMtS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Mar 2022 07:49:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbiCCMtR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Mar 2022 07:49:17 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7C327B15;
        Thu,  3 Mar 2022 04:48:32 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id b23so4436251qtt.6;
        Thu, 03 Mar 2022 04:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TlJoiS/nwF7TWolI2yLIZqV/64cBek/sdtvX3O8gnwU=;
        b=TUnpu7WLjU0tQQwSJK9oBU77zJbZ8kxUQwgULEofTStglq/4J9iYmAAQ63xWuGyBkF
         sinXZNw//WadLaI0pAYmUNYoD701mqqyHgHzhVVwv7DTK9Z0Cxk1YyMhfFQ+jiR8KkIk
         Dsvko6U4gEvyoX4qzfx3bt+shpotKuqOdfH0AnowvwevgmXLp+h2HOAgBn9A6sc84fsC
         mFBKeTo48bzzpq+rlotxKuMS4bi5cVQ4xcKCKJR1iWsgKaCoJJjE02RpqTUXPEtkNF2C
         p4WOvYvDb7B86Zyfo2D75Z+HQuUn8FyGBzyNce7WUv0AQrCZJttjee3yayRVidoTPuLD
         NNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TlJoiS/nwF7TWolI2yLIZqV/64cBek/sdtvX3O8gnwU=;
        b=v16FumzPqvK9QY/ysrfjHapNuDndM3n2mLObIt7MLOA7qdD5hSm0IJ0I6tFP+AWav/
         xcCqCNwXi3gXmyJgrfnmePkC1WpTPQP2C4ChUcFx8mpeUiqz5aZN0Usu+1+5L7DCU2sD
         3sViV1cXjKaVRPTTkwHTBQVdmYKco7A0M7OT+eWJ9/n1iUIrQ42QItPtcfVvigEYzEW7
         ghVdfxCLoQ7lmNREQIhL6OpRpPTPybsjSSgejQ5p8nvX9+5AsgNdg0Va6a3sPMLaf8rN
         us0t1FlicJSvXTX+lviwFNlExbZ0bfgLJEH8Y4n3VfbG+2MqB6/6B10tYl+mAA9Df7b5
         ZTCw==
X-Gm-Message-State: AOAM5315jgm9gkPVbjg0RbnTsfnTfRSwmqpRxzqarXhm/kSpnHvjlLwk
        PIhkbbHdm/diVwkRKXe20PlWRSaOJcAo55IFJmM=
X-Google-Smtp-Source: ABdhPJwmy0Lxq3dOOuPailZC57EbGc10MJu5b4Wb9g6YTokZrF5CoH2wT8ZMYziIglwOWdfPszhyNoPKPMzGFVf2phs=
X-Received: by 2002:a05:622a:1985:b0:2de:b88:4673 with SMTP id
 u5-20020a05622a198500b002de0b884673mr27451315qtc.230.1646311711557; Thu, 03
 Mar 2022 04:48:31 -0800 (PST)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com> <20220303083141.8742-10-warp5tw@gmail.com>
 <YiCaSSbbszm3qYIQ@smile.fi.intel.com>
In-Reply-To: <YiCaSSbbszm3qYIQ@smile.fi.intel.com>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Thu, 3 Mar 2022 14:48:20 +0200
Message-ID: <CAHb3i=sStqdSpLKtF_UGmTsOssR_swssTd3pv6c2-z_kiUPTTA@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] i2c: npcm: Handle spurious interrupts
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

> On Thu, Mar 3, 2022 at 12:37 PM Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Thu, Mar 03, 2022 at 04:31:39PM +0800, Tyrone Ting wrote:
> > > From: Tali Perry <tali.perry1@gmail.com>
> > >
> > > In order to better handle spurious interrupts:
> > > 1. Disable incoming interrupts in master only mode.
> > > 2. Clear end of busy (EOB) after every interrupt.
> > > 3. Return correct status during interrupt.
> >
> > This is bad commit message, it doesn't explain "why" you are doing these.
> >
> > ...


BMC users connect a huge tree of i2c devices and muxes.
This tree suffers from spikes, noise and double clocks.
All these may cause spurious interrupts to the BMC.

If the driver gets an IRQ which was not expected and was not handled
by the IRQ handler,
there is nothing left to do but to clear the interrupt and move on.
If the transaction failed, driver has a recovery function.
After that, user may retry to send the message.

Indeed the commit message doesn't explain all this.
We will fix and add to the next patchset.


> >
> > > +     /*
> > > +      * if irq is not one of the above, make sure EOB is disabled and all
> > > +      * status bits are cleared.
> >
> > This does not explain why you hide the spurious interrupt.
> >
> > > +      */
> > > +     if (ret == IRQ_NONE) {
> > > +             npcm_i2c_eob_int(bus, false);
> > > +             npcm_i2c_clear_master_status(bus);
> > > +     }
> > > +
> > > +     return IRQ_HANDLED;
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >

Thanks Andy,

BR,
Tali Perry
