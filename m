Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3655561E58
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 16:45:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234227AbiF3Opw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 30 Jun 2022 10:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232297AbiF3Opw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 10:45:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11DC1A835
        for <linux-i2c@vger.kernel.org>; Thu, 30 Jun 2022 07:45:50 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o6vPz-0001Ot-GB; Thu, 30 Jun 2022 16:45:19 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o6vPs-003bq3-Kk; Thu, 30 Jun 2022 16:45:16 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o6vPv-000AeP-9t; Thu, 30 Jun 2022 16:45:15 +0200
Message-ID: <be61be2446998c40b51a33453dda4d0b5f1518c3.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/2] i2c: Add new driver for Renesas RZ/V2M controller
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sven Peter <sven@svenpeter.dev>, Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Date:   Thu, 30 Jun 2022 16:45:15 +0200
In-Reply-To: <TYYPR01MB7086706381CDCEF4F582690CF5BA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
         <c168df990e1187bf44a5c46be53aa6b20d30d14d.camel@pengutronix.de>
         <CAMuHMdXV72_BWOpU=O13Fa3-t001YSRdsFePSHBS=Xvh1jY1EQ@mail.gmail.com>
         <TYYPR01MB7086706381CDCEF4F582690CF5BA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Phil,

On Do, 2022-06-30 at 13:43 +0000, Phil Edworthy wrote:
> Hi Philipp, Geert,
> 
> On 29 June 2022 18:18 Geert Uytterhoeven wrote:
> > On Wed, Jun 29, 2022 at 6:21 PM Philipp Zabel wrote:
> > > On Di, 2022-06-28 at 20:45 +0100, Phil Edworthy wrote:
> > > > The Renesas RZ/V2M SoC (r9a09g011) has a new i2c controller. This
> > series
> > > > add the driver. One annoying problem is that the SoC uses a single
> > reset
> > > > line for two i2c controllers, and unfortunately one of the controllers
> > > > is managed by some firmware, not by Linux. Therefore, the driver just
> > > > deasserts the reset.
> > > 
> > > This sounds scary. If the driver is never loaded, and the reset is
> > > never deasserted, what happens to the firmware trying to access the
> > > other i2c controller? Does it hang? Or write to the reset controller
> > > registers to deassert the reset? If so, is there any protection against
> > > concurrent access from firmware and reset controller driver?
> Where a common reset is used by Linux and some firmware, I think we have to
> ensure/assume that both only ever de-assert it.

We also have to make sure that no read-modify-write cycles are required
to deassert the resets if we can't lock between firmware and kernel.
Otherwise concurrent access could cause a deassert to be reverted.

> In this particular SoC, the register used to assert/de-assert the reset
> has write enable bits in the upper half of the reg. There shouldn't be any
> issues with both trying to de-assert the reset at the same time.

Which reset driver is handling the reset for this i2c module?

> > In response to v1, I wrote
> > 
> > > That is actually an integration issue, not an i2c controller issue.
> > > 
> > > Perhaps we need a RESET_IS_CRITICAL flag, cfr. CLK_IS_CRITICAL,
> > > to be set by the reset provider?
> 
> From what I understand, there are two main use cases for resets:
> 1. Often reset lines may be asserted at power on and so a driver needs to
>    de-assert them so that the module can be used.

There are resets that are not initially asserted (among them the self-
deasserting resets) that are required to be asserted some time during
boot, to put some hardware into a well defined state.
I don't think those should be shared, but they sometimes are.

> 2. A driver may need to reset the module for some reason. I have only
>    seen this with watchdog timers with no way out.

Grep for device_reset() or reset_control_reset() for some examples.
Also there are quite a few assert/udelay/deassert calls in drivers.

Also many drivers assert the reset again during remove(). Whether that
is always necessary or useful, I can't say.

It's sometimes nice during development, to be able to reload a kernel
module or rebind a driver to reset some locked up hardware.

> So if a driver does not need to reset the module, shouldn't the driver
> only ever be de-asserting the reset line?

I'm not sure the driver can always know this if it is used on different
platforms.

> If so, it also doesn’t matter whether the reset is shared with other
> modules or not.
> If a driver needs to reset the module, then the reset cannot be shared
> with other modules used by firmware or Linux, or we cannot use any
> other modules that share the reset line.

It can be shared for the special case of multiple modules requiring a
shared reset line to be asserted once, at some time before the modules
are used. The reset controller API supports this for the
reset_control_reset() call.

regards
Philipp
