Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F220E563711
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Jul 2022 17:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbiGAPks convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 1 Jul 2022 11:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiGAPkr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Jul 2022 11:40:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB8D3FBDA
        for <linux-i2c@vger.kernel.org>; Fri,  1 Jul 2022 08:40:46 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o7Ikg-00007D-92; Fri, 01 Jul 2022 17:40:14 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o7Ikb-003oL0-QT; Fri, 01 Jul 2022 17:40:13 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1o7Ike-000AJX-H5; Fri, 01 Jul 2022 17:40:12 +0200
Message-ID: <eb92e73d1fdbdc7e056173526b54d2d6417dff9e.camel@pengutronix.de>
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
Date:   Fri, 01 Jul 2022 17:40:12 +0200
In-Reply-To: <TYYPR01MB70864F60A6F0ED029045E071F5BA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
         <c168df990e1187bf44a5c46be53aa6b20d30d14d.camel@pengutronix.de>
         <CAMuHMdXV72_BWOpU=O13Fa3-t001YSRdsFePSHBS=Xvh1jY1EQ@mail.gmail.com>
         <TYYPR01MB7086706381CDCEF4F582690CF5BA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
         <be61be2446998c40b51a33453dda4d0b5f1518c3.camel@pengutronix.de>
         <TYYPR01MB70864F60A6F0ED029045E071F5BA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
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

On Do, 2022-06-30 at 15:16 +0000, Phil Edworthy wrote:
[...]
> > Which reset driver is handling the reset for this i2c module?
> drivers/clk/renesas/rzg2l-cpg.c 
> See rzg2l_cpg_assert() and rzg2l_cpg_deassert()
> Note this driver handles a few different SoCs, the SoC using this i2c
> driver is specified in drivers/clk/renesas/r9a09g011-cpg.c

Thank you.

[...]
> 
> 
> In order for drivers to work on lots of platforms, should all drivers
> use devm_reset_control_get_shared() instead of devm_reset_control_get(),
> unless there is a need to reset the hardware at a specific time after
> boot (e.g. watchdog with no way out)?

Nobody should use devm_reset_control_get(). Those drivers that require
direct control should use devm_reset_control_get_exclusive(). All
others probably should use the _shared() variant, if it works for them.

> So where do we go with this for this i2c driver?

In this specific case letting the driver deassert the reset seems to be
safe, so I'm fine with the way it is.

You could also let the i2c driver call reset_control_assert() during
remove() and modify the rzg2l-cpg.c driver to ignore it. That doesn't
seem very useful on its own, but it would have the positive effect of
documenting the shared-with-firmware reset in the reset controller
driver.

regards
Philipp
