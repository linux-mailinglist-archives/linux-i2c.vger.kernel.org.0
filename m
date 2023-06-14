Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A49C72F8E3
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 11:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243929AbjFNJS2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 14 Jun 2023 05:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234452AbjFNJS1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 05:18:27 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C32161FC3;
        Wed, 14 Jun 2023 02:18:25 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-57001c0baddso5081647b3.2;
        Wed, 14 Jun 2023 02:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734305; x=1689326305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0z9fPoNU4B1VL5CglK88xqX1DvSDN2wrWEr2r/xjmM=;
        b=cMG5+J/kRWs2CA9LFSeyugN1d1pI/XF4F6VTKAKV4QTk0HRZVVwPsgcu/5OGG+mOLk
         pXxX2wkt/d63zFO1cO5UedffLuguA48gl+ZUr2twfZ8TmM0YDyQFbzDdAS4DH8VEAUaI
         OpwuS7XOJ93gRG5MBzzmgre6Nn2Y5u8ac4KRJnA9JAFsmbBjpRwvnNZ2/+kIGBHGsY07
         5NYo2X3bqVsQZJGzvKt8AZrfGm0tAS4c+eFW18+DD1f3/J1xk+THAQBamNcFUyKtkAbk
         9ZZfLo5XKD7e033O786dp8lcT3QJ3SLRP3QIauUvenfRaUy4kx0Wh2SP2YO3/9ND8A+7
         W4mA==
X-Gm-Message-State: AC+VfDzmOInsw6pMGFmYPP2D1QVlfr+xQN5fPOUmaOsjDwdySFFrMsdB
        9opV/7j65xtkrxrWtOhowYnD4x+1YMREZw==
X-Google-Smtp-Source: ACHHUZ5ikfy+fxru5KsEhHAhqt5kMc5l2EUiOE657SkMesJmm8l+GhlfPI8QumPBZNq0Wyls9U4FHw==
X-Received: by 2002:a0d:d84c:0:b0:56d:2038:c254 with SMTP id a73-20020a0dd84c000000b0056d2038c254mr998253ywe.44.1686734304939;
        Wed, 14 Jun 2023 02:18:24 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id s84-20020a815e57000000b0056fa3abed93sm888451ywb.96.2023.06.14.02.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 02:18:24 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-bb15165ba06so392369276.2;
        Wed, 14 Jun 2023 02:18:24 -0700 (PDT)
X-Received: by 2002:a25:dac5:0:b0:bcb:c3d6:2b1d with SMTP id
 n188-20020a25dac5000000b00bcbc3d62b1dmr1375376ybf.34.1686734304117; Wed, 14
 Jun 2023 02:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato> <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato> <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro> <OS0PR01MB592220CCA081848A711D75328655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592210CE54A9CF953980DFEE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59220D794AED55A6B795C3EF8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230614081314.GD17519@pendragon.ideasonboard.com> <OS0PR01MB59225C45554667D342454923865AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59225C45554667D342454923865AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Jun 2023 11:18:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOTVxK+xkf5F_fBb2eB8E6kt1eWW0e15sPWj30Q7WHPQ@mail.gmail.com>
Message-ID: <CAMuHMdWOTVxK+xkf5F_fBb2eB8E6kt1eWW0e15sPWj30Q7WHPQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Antonio Borneo <antonio.borneo@foss.st.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Wed, Jun 14, 2023 at 10:21 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > On Tue, Jun 13, 2023 at 07:31:46PM +0000, Biju Das wrote:
> > > > Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device
> > > > API
> > > > > Subject: RE: [PATCH v5 01/11] i2c: Enhance
> > > > > i2c_new_ancillary_device API
> > > > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance
> > > > > > i2c_new_ancillary_device API
> > > > > >
> > > > > > Hi everyone,
> > > > > >
> > > > > > > Perhaps we should first think through what an ancillary device
> > > > > > > really is.  My understanding is that it is used to talk to
> > > > > > > secondary addresses of a multi-address I2C slave device.
> > > > > >
> > > > > > As I mentioned somewhere before, this is not the case. Ancillary
> > > > > > devices are when one *driver* handles more than one address.
> > > > > > Everything else has been handled differently in the past (for
> > > > > > all the uses I am aware of).
> > > > > >
> > > > > > Yet, I have another idea which is so simple that I wonder if it
> > > > > > maybe has already been discussed so far?
> > > > > >
> > > > > > * have two regs in the bindings
> > > > >
> > > > > OK, it is inline with DT maintainers expectation as it is matching
> > > > > with real hw as single device node having two regs.
> > > > >
> > > > > > * use the second reg with i2c_new_client_device to instantiate the
> > > > > >   RTC sibling. 'struct i2c_board_info', which is one parameter,
> > should
> > > > > >   have enough options to pass data, e.g it has a software_node.
> > > > >
> > > > > OK, I can see the below can be passed from PMIC to new client
> > device.
> > > > >
> > > > >         client->addr = info->addr;
> > > > >
> > > > >         client->init_irq = info->irq;
> > > > >
> > > > > >
> > > > > > Should work or did I miss something here?
> > > > >
> > > > > I guess it will work. We instantiate appropriate device based On
> > > > > PMIC revision and slave address and IRQ resource passed through
> > > > > 'struct i2c_board_info'
> > > > >
> > > > > Will check this and update you.
> > > >
> > > > info.irq = irq; -->Irq fine
> > > > info.addr = addr; -->slave address fine size = strscpy(info.type,
> > > > name, sizeof(info.type)); -->instantiation based on PMIC version
> > > > fine.
> > > >
> > > > 1) How do we share clk details on instantiated device to find is it
> > > > connected to external crystal or external clock source? as we cannot
> > > > pass of_node between PMIC and "i2c_board_info" as it results in
> > > > pinctrl failure. info->platformdata and
> > > > Client->dev.platformdata to retrieve this info??
> > >
> > > Or
> > >
> > > I2C instantiation based on actual oscillator bit value, ie, two
> > > i2c_device_id's with one for setting oscillator bit and another for
> > > clearing oscillator bit
> > >
> > > PMIC driver parses the clock details. Based on firmware version and
> > > clock, It instantiates either i2c_device_id with setting oscillator
> > > bit or clearing oscillator bit.
> >
> > I don't like that hack. I still think that two DT nodes is the best
> > option, I think you're trying hard to hack around a problem that is
> > actually not a problem.
>
> Why do you think it is a hack? I believe rather it is actual solution
>
> PMIC is a single device, with 2 regs, clocks, pinctrl and IRQ properties.
> So it will be represented as single node with single compatible.
>
> By instating a client device, we are sharing the relevant resources to RTC device driver.

Exactly.  RAA215300 is a PMIC with an integrated ISL1208-derivative.
My biggest concern with using 2 separate nodes in DT is that one day
we might discover another integration issue, which needs communication
between the two parts.

Things from the top of my head:
  1. The device has a single interrupt pin.  Is there any interaction
     or coordination between PMIC and RTC interrupts?
  2. On the real ISL1208, the interrupt pin can also be used as a clock
     output.  Perhaps this is fed to some PMIC part in the
     RAA215300, too?
  2. Does the battery charger circuit in the PMIC impact the VBAT
     input of the RTC?
  3. Are there other I2C addresses the chip listens to?

I only have access to the Short-Form Datasheet for the RAA215300,
so I cannot check myself...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
