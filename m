Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D80077805B4
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Aug 2023 07:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357362AbjHRFeJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Aug 2023 01:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357111AbjHRFdi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Aug 2023 01:33:38 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67EEF1BE7
        for <linux-i2c@vger.kernel.org>; Thu, 17 Aug 2023 22:33:37 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1qWs6U-0002Yj-Sv; Fri, 18 Aug 2023 07:32:58 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1qWs6Q-0004bJ-EA; Fri, 18 Aug 2023 07:32:54 +0200
Date:   Fri, 18 Aug 2023 07:32:54 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Yann Sionneau <yann@sionneau.net>
Cc:     Leo Li <leoyang.li@nxp.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>, Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux@armlinux.org.uk,
        linux-gpio@vger.kernel.org,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH -next v2] I2C: Fix return value check for
 devm_pinctrl_get()
Message-ID: <20230818053254.GK5650@pengutronix.de>
References: <20230817022018.3527570-1-ruanjinjie@huawei.com>
 <AM0PR04MB6289593A2149C9411FA9D5858F1AA@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <6b508343-7b7f-0fd5-d83f-92dc88a9510d@sionneau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b508343-7b7f-0fd5-d83f-92dc88a9510d@sionneau.net>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 18, 2023 at 01:07:27AM +0200, Yann Sionneau wrote:
> Hi,
> 
> Le 17/08/2023 à 19:30, Leo Li a écrit :
> 
> > > The devm_pinctrl_get() function returns error pointers and never returns
> > > NULL. Update the checks accordingly.
> > Not exactly.  It can return NULL when CONFIG_PINCTRL is not defined.  We probably should fix that API too.
> > 
> > include/linux/pinctrl/consumer.h:
> > static inline struct pinctrl * __must_check devm_pinctrl_get(struct device *dev)
> > {
> >          return NULL;
> > }
> 
> So, as Leo pointed out it seems devm_pinctrl_get() can in fact return NULL,
> when CONFIG_PINCTRL is not defined.
> 
> What do we do about this?
> 
> Proposals:
> 
> 1/ make sure all call sites of devm_pinctrl_get() do check for error with
> IS_ERR *and* check for NULL => therefore using IS_ERR_OR_NULL
> 
> 2/ change the fallback implementation in include/linux/pinctrl/consumer.h to
> return ERR_PTR(-Esomething) (which errno?)
> 
> 3/ another solution?

NULL is returned on purpose. When PINCTRL is disabled NULL becomes a
valid pinctrl cookie which can be passed to the other stub functions.
With this drivers using pinctrl can get through their probe function
without an error when PINCTRL is disabled.

The same approach is taken by the clk and regulator API.

It is correct to test the return value of devm_pinctrl_get() with
IS_ERR(), only the commit message of these patches is a bit inaccurate.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
