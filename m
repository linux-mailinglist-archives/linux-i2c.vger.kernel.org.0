Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A941C563710
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Jul 2022 17:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiGAPks convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 1 Jul 2022 11:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiGAPkr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Jul 2022 11:40:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEFD03FBF7
        for <linux-i2c@vger.kernel.org>; Fri,  1 Jul 2022 08:40:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o7Ikf-00006u-HT; Fri, 01 Jul 2022 17:40:13 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o7IkZ-003oKw-3y; Fri, 01 Jul 2022 17:40:10 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o7Ikb-000AJF-Sx; Fri, 01 Jul 2022 17:40:09 +0200
Message-ID: <2d0f161e879175dea310ed77797f83f29c2b9503.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/2] i2c: Add new driver for Renesas RZ/V2M controller
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Rob Herring <robh@kernel.org>,
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
Date:   Fri, 01 Jul 2022 17:40:09 +0200
In-Reply-To: <CAMuHMdXV72_BWOpU=O13Fa3-t001YSRdsFePSHBS=Xvh1jY1EQ@mail.gmail.com>
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
         <c168df990e1187bf44a5c46be53aa6b20d30d14d.camel@pengutronix.de>
         <CAMuHMdXV72_BWOpU=O13Fa3-t001YSRdsFePSHBS=Xvh1jY1EQ@mail.gmail.com>
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

Hi Geert,

On Mi, 2022-06-29 at 19:18 +0200, Geert Uytterhoeven wrote:
> Hi Philipp,
> 
> On Wed, Jun 29, 2022 at 6:21 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > On Di, 2022-06-28 at 20:45 +0100, Phil Edworthy wrote:
> > > The Renesas RZ/V2M SoC (r9a09g011) has a new i2c controller. This series
> > > add the driver. One annoying problem is that the SoC uses a single reset
> > > line for two i2c controllers, and unfortunately one of the controllers
> > > is managed by some firmware, not by Linux. Therefore, the driver just
> > > deasserts the reset.
> > 
> > This sounds scary. If the driver is never loaded, and the reset is
> > never deasserted, what happens to the firmware trying to access the
> > other i2c controller? Does it hang? Or write to the reset controller
> > registers to deassert the reset? If so, is there any protection against
> > concurrent access from firmware and reset controller driver?
> 
> In response to v1, I wrote
> 
> > That is actually an integration issue, not an i2c controller issue.
> > 
> > Perhaps we need a RESET_IS_CRITICAL flag, cfr. CLK_IS_CRITICAL,
> > to be set by the reset provider?

I would just let the reset controller driver implement this by
disabling _assert and _reset for those firmware-shared resets.

regards
Philipp
