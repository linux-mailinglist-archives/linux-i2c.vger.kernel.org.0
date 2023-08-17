Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5F877EFEA
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 06:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235076AbjHQEie (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 00:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348019AbjHQEi2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 00:38:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 339D31BE8
        for <linux-i2c@vger.kernel.org>; Wed, 16 Aug 2023 21:38:26 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1qWUm6-0003oL-4d; Thu, 17 Aug 2023 06:38:22 +0200
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1qWUm2-0003QZ-By; Thu, 17 Aug 2023 06:38:18 +0200
Date:   Thu, 17 Aug 2023 06:38:18 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Yang Li <leoyang.li@nxp.com>
Subject: Re: [PATCH -next v2] I2C: Fix return value check for
 devm_pinctrl_get()
Message-ID: <20230817043818.GC28787@pengutronix.de>
References: <20230817022018.3527570-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230817022018.3527570-1-ruanjinjie@huawei.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Aug 17, 2023 at 10:20:17AM +0800, Ruan Jinjie wrote:
> The devm_pinctrl_get() function returns error pointers and never
> returns NULL. Update the checks accordingly.
> 
> Fixes: 543aa2c4da8b ("i2c: at91: Move to generic GPIO bus recovery")
> Fixes: fd8961c5ba9e ("i2c: imx: make bus recovery through pinctrl optional")
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
> v2:
> - Remove NULL check instead of using IS_ERR_OR_NULL() to avoid leaving them behind.
> - Update the commit title and message.
> ---
>  drivers/i2c/busses/i2c-at91-master.c | 2 +-
>  drivers/i2c/busses/i2c-imx.c         | 2 +-

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

Thank you!

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
