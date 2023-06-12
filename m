Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7095972C587
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 15:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjFLNJD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 12 Jun 2023 09:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbjFLNJC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 09:09:02 -0400
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66AD5A0;
        Mon, 12 Jun 2023 06:09:00 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-56cf32f5bf8so22915237b3.3;
        Mon, 12 Jun 2023 06:09:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686575339; x=1689167339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XhZcZSHZMUBc906xfl0reyAu6fl6qfJnXfrRKfwIpg=;
        b=MeOhhH71d9BNu6XPRpIkaakdm8mAaNAANC2lGr3OrNPR5p72/fOFgO4nZ/UPSwJNeS
         7LTjI+FWxwtFQr/tHRsFTM7aXIGWzLR2IfnJ/9cg0lSzPVMMylBUjYOoNLj5fEgwxF6p
         /39x238b3Q0gA6rdDSLJBPbtKMHp0aqoJRey/BB+WwoljUf7CAdHdKca34qaOwvDR/hG
         gejxWi74aTIPBzZ2ibIbgO88fkQ9OFWdL/SKUEL6krgVEAWUfOZpM6RbSzc1hJNt4aPz
         AZU0velBMD/zM2AhyovadZayK/Nn2bjrIFjA5rzXPs6rya3kX/n4ubRr50ucIGEakg3R
         mN+g==
X-Gm-Message-State: AC+VfDx2xznIMC6Y5t+YsEiHvzuXEkP6GLG7sbb/aU8leQQcgTE2Dx20
        BcDsdl2RwOAXaLiF4Y9/TTdmUI8IWiBAag==
X-Google-Smtp-Source: ACHHUZ4yxSONE2j7jvj74P0z+K/mCu3DW4upo6ynr+xOYq9KvF+ZQlnJkB5zraNGojA7UtRxvXI6Tg==
X-Received: by 2002:a81:93c3:0:b0:561:8602:1a40 with SMTP id k186-20020a8193c3000000b0056186021a40mr11058011ywg.46.1686575339362;
        Mon, 12 Jun 2023 06:08:59 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id v3-20020a814803000000b0055a416529bbsm1502921ywa.24.2023.06.12.06.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 06:08:58 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-bc50b217bc0so2258680276.1;
        Mon, 12 Jun 2023 06:08:58 -0700 (PDT)
X-Received: by 2002:a25:1e86:0:b0:ba9:b3dd:6b0d with SMTP id
 e128-20020a251e86000000b00ba9b3dd6b0dmr8576899ybe.64.1686575338138; Mon, 12
 Jun 2023 06:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <ZIBFc3y9jD59lZ3A@shikoro> <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com> <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com> <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230612122353.GA22391@pendragon.ideasonboard.com> <OS0PR01MB5922D335D53C7B0FA021B3218654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230612125405.GA23921@pendragon.ideasonboard.com>
In-Reply-To: <20230612125405.GA23921@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Jun 2023 15:08:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_xw-+_MakVeLVgv1nCW_GqKQ2hiEfb5J-p2WiSvWV_g@mail.gmail.com>
Message-ID: <CAMuHMdV_xw-+_MakVeLVgv1nCW_GqKQ2hiEfb5J-p2WiSvWV_g@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
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
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
        <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Trent Piepho <tpiepho@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Laurent,

On Mon, Jun 12, 2023 at 2:54 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jun 12, 2023 at 12:42:33PM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > > On Mon, Jun 12, 2023 at 09:53:02AM +0000, Biju Das wrote:
> > > > How do we proceed here between [1] and [2]?
> > > >
> > > > DT-Maintainers suggestion:
> > > > [1]
> > > > raa215300: pmic@12 {
> > > >   compatible = "renesas,raa215300";
> > > >   reg = <0x12>, <0x6f>;
> > > >   reg-names = "main", "rtc";
> > > >
> > > >   clocks = <&x2>;
> > > >   clock-names = "xin";
> > > >   /* Add Optional shared IRQ resource and share it to child and handle
> > > > it both in parent and child */ };
> > > >
> > > > Laurent/Wolfram suggestion to split it into two nodes and get rid of this patch:
> > > > [2]
> > > >   raa215300: pmic @12 {
> > > >           compatible = "renesas,raa215300";
> > > >           reg = <0x12>;
> > > >
> > > >           /* Add Optional shared IRQ */
> > > >           renesas,raa215300-rtc = <&rtc_raa215300>; /* Parse the handle and Enable RTC , if present.*/
> > > >   };
> > > >
> > > >   rtc_raa215300: rtc@6f {
> > > >           compatible = "renesas,raa215300-isl1208";
> > >
> > > Make this
> > >
> > >             compatible = "renesas,raa215300-isl1208", "isil,isl1208";
> > >
> > > >           reg = <0x6f>;
> > > >
> > > >           /* Add Optional shared IRQ */
> > > >           clocks = <&x2>;
> > > >           clock-names = "xin";
> > > >           renesas,raa215300-pmic = <&pmic>; /* Parse the handle to get PMIC
> > > > version to check Oscillator bit is inverted or not */
> > >
> > > This isn't nice. I would instead add a renesas,invert-xtoscb boolean
> > > property. If you don't want different DT sources for different revisions
> > > of the PMIC,
> >
> > I need to support all PMIC versions with same image, as PMIC is just a component on the
> > SoM module. So SoM's have different PMIC versions.
>
> I understand it's not convenient, so let's try to find a good solution.
>
> > > one option is to perform the auto-detection in the boot
> > > loader and update the DT dynamically there.
> >
> > Yes, this is an option. Bootloader updates "renesas,invert-xtoscb" property based
> > on PMIC version.
> >
> > Not sure, From binding perspective, Documenting "renesas,invert-xtoscb" is OK for
> > the relevant maintainers??
>
> It's fine with me at least :-) I think a property makes sense, as it
> describes the device. Updating the device tree in the boot loader based
> on auto-detection of features is also fairly common (to set the amount
> of DRAM for instance).
>
> What I'm not entirely sure about in this case is if a property would be
> the best option, or two different compatible strings. I'll let the
> appropriate maintainer recommend one of those two options. In either
> case, the boot loader would be responsible for updating the DT.

Indeed. DT binding best practices 101: do not use properties to
distinguish, use compatible values instead.

And don't use different compatible values if you can distinguish using
a version register.  Unfortunately the version register is part of the
main/first device (the PMIC), so the RTC cannot find out easily...

So basically you have an i2c mfd.  The Linux mfd subsystem is tailored
for platform devices, so it's not a good match.  The closest we have
in i2c is the ancillary device...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
