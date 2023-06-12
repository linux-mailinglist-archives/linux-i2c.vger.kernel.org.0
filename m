Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 751C372C5AF
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 15:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbjFLNTW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 09:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235229AbjFLNTV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 09:19:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9A5DB;
        Mon, 12 Jun 2023 06:19:20 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C779CCE6;
        Mon, 12 Jun 2023 15:18:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686575928;
        bh=Bj+SpMG81sTj8aensnQvokjjL3Rwu9dHwfJTAZQIrBk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=unso4Umz7SnrFwQD6vncMYiN8Wghu0zrDkXYhTxYVqPsvHrha9zPuyquvf4leAAsY
         aP6tl5rSEy52aLPeBmoU19RN6n2unwxLxcfM7a45sx1ngyujr8w2ddKgM30gZBzw7E
         jipNHUxMxAAHkEqHwP9VbTz9Xv/hkHgz7DA7P+gA=
Date:   Mon, 12 Jun 2023 16:19:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
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
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Message-ID: <20230612131917.GD23921@pendragon.ideasonboard.com>
References: <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230612122353.GA22391@pendragon.ideasonboard.com>
 <OS0PR01MB5922D335D53C7B0FA021B3218654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230612125405.GA23921@pendragon.ideasonboard.com>
 <CAMuHMdV_xw-+_MakVeLVgv1nCW_GqKQ2hiEfb5J-p2WiSvWV_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV_xw-+_MakVeLVgv1nCW_GqKQ2hiEfb5J-p2WiSvWV_g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Geert,

On Mon, Jun 12, 2023 at 03:08:46PM +0200, Geert Uytterhoeven wrote:
> On Mon, Jun 12, 2023 at 2:54 PM Laurent Pinchart wrote:
> > On Mon, Jun 12, 2023 at 12:42:33PM +0000, Biju Das wrote:
> > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > > > On Mon, Jun 12, 2023 at 09:53:02AM +0000, Biju Das wrote:
> > > > > How do we proceed here between [1] and [2]?
> > > > >
> > > > > DT-Maintainers suggestion:
> > > > > [1]
> > > > > raa215300: pmic@12 {
> > > > >   compatible = "renesas,raa215300";
> > > > >   reg = <0x12>, <0x6f>;
> > > > >   reg-names = "main", "rtc";
> > > > >
> > > > >   clocks = <&x2>;
> > > > >   clock-names = "xin";
> > > > >   /* Add Optional shared IRQ resource and share it to child and handle
> > > > > it both in parent and child */ };
> > > > >
> > > > > Laurent/Wolfram suggestion to split it into two nodes and get rid of this patch:
> > > > > [2]
> > > > >   raa215300: pmic @12 {
> > > > >           compatible = "renesas,raa215300";
> > > > >           reg = <0x12>;
> > > > >
> > > > >           /* Add Optional shared IRQ */
> > > > >           renesas,raa215300-rtc = <&rtc_raa215300>; /* Parse the handle and Enable RTC , if present.*/
> > > > >   };
> > > > >
> > > > >   rtc_raa215300: rtc@6f {
> > > > >           compatible = "renesas,raa215300-isl1208";
> > > >
> > > > Make this
> > > >
> > > >             compatible = "renesas,raa215300-isl1208", "isil,isl1208";
> > > >
> > > > >           reg = <0x6f>;
> > > > >
> > > > >           /* Add Optional shared IRQ */
> > > > >           clocks = <&x2>;
> > > > >           clock-names = "xin";
> > > > >           renesas,raa215300-pmic = <&pmic>; /* Parse the handle to get PMIC
> > > > > version to check Oscillator bit is inverted or not */
> > > >
> > > > This isn't nice. I would instead add a renesas,invert-xtoscb boolean
> > > > property. If you don't want different DT sources for different revisions
> > > > of the PMIC,
> > >
> > > I need to support all PMIC versions with same image, as PMIC is just a component on the
> > > SoM module. So SoM's have different PMIC versions.
> >
> > I understand it's not convenient, so let's try to find a good solution.
> >
> > > > one option is to perform the auto-detection in the boot
> > > > loader and update the DT dynamically there.
> > >
> > > Yes, this is an option. Bootloader updates "renesas,invert-xtoscb" property based
> > > on PMIC version.
> > >
> > > Not sure, From binding perspective, Documenting "renesas,invert-xtoscb" is OK for
> > > the relevant maintainers??
> >
> > It's fine with me at least :-) I think a property makes sense, as it
> > describes the device. Updating the device tree in the boot loader based
> > on auto-detection of features is also fairly common (to set the amount
> > of DRAM for instance).
> >
> > What I'm not entirely sure about in this case is if a property would be
> > the best option, or two different compatible strings. I'll let the
> > appropriate maintainer recommend one of those two options. In either
> > case, the boot loader would be responsible for updating the DT.
> 
> Indeed. DT binding best practices 101: do not use properties to
> distinguish, use compatible values instead.
> 
> And don't use different compatible values if you can distinguish using
> a version register.  Unfortunately the version register is part of the
> main/first device (the PMIC), so the RTC cannot find out easily...

That's not very different from having IP cores whose integration is
different between different SoC versions. We could easily add SoC match
code in drivers and map the SoC version to integration data, but it's
not a good practice. DT helps decoupling integration (and quirks) from
drivers and allows getting rid of lots of cross-driver communication
(which used to be handled through board files).

> So basically you have an i2c mfd.  The Linux mfd subsystem is tailored
> for platform devices, so it's not a good match.  The closest we have
> in i2c is the ancillary device...

I think an MFD-type solution that's way too much trouble to handle the
issue at hand. I recommend a DT property here.

-- 
Regards,

Laurent Pinchart
