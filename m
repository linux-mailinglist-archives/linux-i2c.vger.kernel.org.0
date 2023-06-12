Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D42AF72C525
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 14:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236142AbjFLM4M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 08:56:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236177AbjFLMz6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 08:55:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465B51705;
        Mon, 12 Jun 2023 05:54:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59B3AAB;
        Mon, 12 Jun 2023 14:53:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686574416;
        bh=1ZKjM8kOiNJ1nFXOZt8rGNkoupO0YlmYVSQkyCSJShw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XlKFfFSn9cPtZG3ZZq582/1jAQBuovbR8Ma7KidRl7hEuiuEsofwjPlL+L05MsP+T
         sTdFIomAEh6qB5ugm3oFqIJXAS6TGqDRUrsHdrB1XJdKRMLpRSlZAvUxVPD+OZROBD
         tvC2BzvfgQEpiG/asYEriz5lBOvb+TBkp7uyZALA=
Date:   Mon, 12 Jun 2023 15:54:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
Message-ID: <20230612125405.GA23921@pendragon.ideasonboard.com>
References: <ZIBFc3y9jD59lZ3A@shikoro>
 <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230612122353.GA22391@pendragon.ideasonboard.com>
 <OS0PR01MB5922D335D53C7B0FA021B3218654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OS0PR01MB5922D335D53C7B0FA021B3218654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Mon, Jun 12, 2023 at 12:42:33PM +0000, Biju Das wrote:
> Hi Laurent,
> 
> Thanks for the feedback.
> 
> > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > 
> > On Mon, Jun 12, 2023 at 09:53:02AM +0000, Biju Das wrote:
> > > Hi All,
> > >
> > > How do we proceed here between [1] and [2]?
> > >
> > > DT-Maintainers suggestion:
> > > [1]
> > > raa215300: pmic@12 {
> > > 	compatible = "renesas,raa215300";
> > > 	reg = <0x12>, <0x6f>;
> > > 	reg-names = "main", "rtc";
> > >
> > > 	clocks = <&x2>;
> > > 	clock-names = "xin";
> > > 	/* Add Optional shared IRQ resource and share it to child and handle
> > > it both in parent and child */ };
> > >
> > > Laurent/Wolfram suggestion to split it into two nodes and get rid of this patch:
> > > [2]
> > > 	raa215300: pmic @12 {
> > > 		compatible = "renesas,raa215300";
> > > 		reg = <0x12>;
> > >
> > > 		/* Add Optional shared IRQ */
> > > 		renesas,raa215300-rtc = <&rtc_raa215300>; /* Parse the handle and Enable RTC , if present.*/
> > > 	};
> > >
> > > 	rtc_raa215300: rtc@6f {
> > > 		compatible = "renesas,raa215300-isl1208";
> > 
> > Make this
> > 
> >  		compatible = "renesas,raa215300-isl1208", "isil,isl1208";
> > 
> > Btw, it would be nice to convert
> > Documentation/devicetree/bindings/rtc/isil,isl1208.txt to YAML.
> 
> It is already posted see [1] and [2]
> [1]
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230602142426.438375-6-biju.das.jz@bp.renesas.com/
> 
> [2]
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230602142426.438375-7-biju.das.jz@bp.renesas.com/

Great :-) Thanks.

> > > 		reg = <0x6f>;
> > >
> > > 		/* Add Optional shared IRQ */
> > > 		clocks = <&x2>;
> > > 		clock-names = "xin";
> > > 		renesas,raa215300-pmic = <&pmic>; /* Parse the handle to get PMIC
> > > version to check Oscillator bit is inverted or not */
> > 
> > This isn't nice. I would instead add a renesas,invert-xtoscb boolean
> > property. If you don't want different DT sources for different revisions
> > of the PMIC,
> 
> I need to support all PMIC versions with same image, as PMIC is just a component on the
> SoM module. So SoM's have different PMIC versions.

I understand it's not convenient, so let's try to find a good solution.

> > one option is to perform the auto-detection in the boot
> > loader and update the DT dynamically there.
> 
> Yes, this is an option. Bootloader updates "renesas,invert-xtoscb" property based
> on PMIC version.
> 
> Not sure, From binding perspective, Documenting "renesas,invert-xtoscb" is OK for
> the relevant maintainers??

It's fine with me at least :-) I think a property makes sense, as it
describes the device. Updating the device tree in the boot loader based
on auto-detection of features is also fairly common (to set the amount
of DRAM for instance).

What I'm not entirely sure about in this case is if a property would be
the best option, or two different compatible strings. I'll let the
appropriate maintainer recommend one of those two options. In either
case, the boot loader would be responsible for updating the DT.

> > > 	};
> > > > -----Original Message-----
> > > > From: Biju Das
> > > > Sent: Thursday, June 8, 2023 1:57 PM
> > > > To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Cc: Wolfram Sang <wsa@kernel.org>; Geert Uytterhoeven <geert@linux-
> > > > m68k.org>; Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>;
> > > > Rob Herring <robh+dt@kernel.org>; Andrzej Hajda
> > > > <andrzej.hajda@intel.com>; Neil Armstrong
> > > > <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; David
> > > > Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Kieran
> > > > Bingham <kieran.bingham@ideasonboard.com>;
> > > > Mauro Carvalho Chehab <mchehab@kernel.org>; Hans Verkuil <hverkuil-
> > > > cisco@xs4all.nl>; Alessandro Zummo <a.zummo@towertech.it>; Alexandre
> > > > Belloni <alexandre.belloni@bootlin.com>; Jonas Karlman
> > > > <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>; Uwe
> > > > Kleine-König <u.kleine- koenig@pengutronix.de>; Corey Minyard
> > > > <cminyard@mvista.com>; Marek Behún <kabel@kernel.org>; Jiasheng
> > > > Jiang <jiasheng@iscas.ac.cn>; Antonio Borneo
> > > > <antonio.borneo@foss.st.com>; Abhinav Kumar
> > > > <quic_abhinavk@quicinc.com>; Ahmad Fatoum <a.fatoum@pengutronix.de>;
> > > > dri-devel@lists.freedesktop.org; linux-i2c@vger.kernel.org;
> > > > linux-media@vger.kernel.org; Geert Uytterhoeven
> > > > <geert+renesas@glider.be>; Fabrizio Castro
> > > > <fabrizio.castro.jz@renesas.com>; linux-renesas-soc@vger.kernel.org;
> > > > Mark Brown <broonie@kernel.org>
> > > > Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device
> > > > API
> > > >
> > > > Hi Laurent,
> > > >
> > > > Thanks for the feedback.
> > > >
> > > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance
> > > > > i2c_new_ancillary_device API
> > > > >
> > > > > Hi Biju,
> > > > >
> > > > > On Thu, Jun 08, 2023 at 11:00:19AM +0000, Biju Das wrote:
> > > > > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance
> > > > > > > i2c_new_ancillary_device API On Thu, Jun 08, 2023 at
> > 06:41:35AM+0000, Biju Das wrote:
> > > > > > > > > Subject: RE: [PATCH v5 01/11] i2c: Enhance
> > > > > > > > > i2c_new_ancillary_device API
> > > > > > > > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance
> > > > > > > > > > i2c_new_ancillary_device API
> > > > > > > > > >
> > > > > > > > > > Hi all,
> > > > > > > > > >
> > > > > > > > > > sorry for not being able to chime in earlier.
> > > > > > > > > >
> > > > > > > > > > > In Biju's particular use case, the i2c device responds
> > > > > > > > > > > to two addresses, which is the standard i2c ancillary
> > use case.
> > > > > > > > > > > However, what's special
> > > > > > > > > >
> > > > > > > > > > Not quite. ancillary is used when a *driver* needs to
> > > > > > > > > > take care of two addresses. We already have devices
> > > > > > > > > > bundling two features into the same chip. I recall at
> > > > > > > > > > least RTC + EEPROM somewhere. And so far, we have been
> > > > > > > > > > handling this by creating two nodes in DT and have proper
> > binding docs.
> > > > > > > > > > I think this is cleaner. First, you can see in DT
> > > > > > > > > > already what the compound device really consists of. In
> > > > > > > > > > this case, which RTC and RTC driver is exactly needed.
> > > > > > > > > > Second, the code added here adds complexity to the I2C
> > > > > > > > > > core with another layer of inderection for dummy devices.
> > > > > > > > >
> > > > > > > > > FYI, please see [1] and [2]
> > > > > > > > >
> > > > > > > > > As per DT maintainers, most of PMICs are described with
> > > > > > > > > one node, even though RTC is on separate address.
> > > > > > > > > According to them the DT schema allows multiple addresses
> > for children.
> > > > > > > > > But currently we lacks implementation for that. The
> > > > > > > > > enhancement to this API allows that.
> > > > > > > > >
> > > > > > > > > > > As some resources are shared (knowledge about the
> > > > > > > > > > > clocks), splitting this in two distinct devices in DT
> > > > > > > > > > > (which is what Biju's initial patch series did) would
> > > > > > > > > > > need phandles to link both nodes together.
> > > > > > > > > > >
> > > > > > > > > > > Do you have a better idea how to represent this?
> > > > > > > > > >
> > > > > > > > > > Not sure if I understood this chip correctly, but maybe:
> > > > > > > > > > The PMIC driver exposes a clock gate which can be
> > > > > > > > > > consumed by the RTC driver?
> > > > > > > >
> > > > > > > > Let me give me some details of this PMIC chip.
> > > > > > > >
> > > > > > > > PMIC device has 2 addresses "0x12:- PMIC" , "0x6f"- rtc.
> > > > > > > >
> > > > > > > > It has XIN, XOUT, INT# pins and a register for firmware
> > revisions.
> > > > > > >
> > > > > > > Is the firmware revision register accessed through address
> > > > > > > 0x12
> > > > > > > (PMIC) or 0x6f (RTC) ?
> > > > > >
> > > > > > 0x12(PMIC).
> > > > > >
> > > > > > > > Based on the system design,
> > > > > > > >
> > > > > > > > If XIN and XOUT is connected to external crystal, Internal
> > > > > > > > oscillator is enabled for RTC. In this case we need to set
> > > > > > > > the oscillator bit to "0".
> > > > > > > >
> > > > > > > > If XIN is connected to external clock source, Internal
> > > > > > > > oscillator is disabled for RTC. In this case we need to set
> > > > > > > > the oscillator bit to "1".
> > > > > > >
> > > > > > > Same here, which address is the oscillator bit accessed through
> > ?
> > > > > >
> > > > > > RTC (0x6F)--> to set oscillator bit.
> > > > >
> > > > > And does the PMIC part depend on the oscillator bit being set
> > > > > correctly, or is that used for the RTC only ?
> > > >
> > > > PMIC part does not. It is used only in RTC.
> > > >
> > > > Based on PMIC revision, we need to set the oscillator bit in RTC
> > > > block for PMIC rev a0 and rest of the PMIC chips.
> > > >
> > > > On PMIC rev0, oscillator bit is inverted.
> > > >
> > > > > > > > If XIN and XOUT not connected RTC operation not possible.
> > > > > > > >
> > > > > > > > IRQ# (optional) functionality is shared between PMIC and RTC.
> > > > > > > > (PMIC fault for various bucks/LDOs/WDT/OTP/NVM and alarm
> > condition).
> > > > > > >
> > > > > > > IRQs can be shared between multiple devices so this shouldn't
> > > > > > > be a problem.
> > > > > >
> > > > > > OK. How do we represent this IRQ in DT?
> > > > >
> > > > > You can simply reference the same IRQ from the interrupts property
> > > > > of different DT nodes.
> > > > >
> > > > > > > > The board, I have doesn't populate IRQ# pin. If needed some
> > > > > > > > customers can populate IRQ# pin and use it for PMIC fault
> > > > > > > > and RTC alarm.
> > > > > > > >
> > > > > > > > Also, currently my board has PMIC rev a0 where oscillator
> > > > > > > > bit is inverted and internal oscillator is enabled (ie: XIN
> > > > > > > > and XOUT is connected to external crystal)
> > 
> > --
> > Regards,
> > 
> > Laurent Pinchart

-- 
Regards,

Laurent Pinchart
