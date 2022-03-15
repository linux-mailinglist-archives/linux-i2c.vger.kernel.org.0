Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CED944D9441
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Mar 2022 06:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbiCOGA5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Mar 2022 02:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239667AbiCOGA5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Mar 2022 02:00:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B9E47383
        for <linux-i2c@vger.kernel.org>; Mon, 14 Mar 2022 22:59:46 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1nU0DY-0003jT-7Y; Tue, 15 Mar 2022 06:59:36 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1nU0DX-00084U-A8; Tue, 15 Mar 2022 06:59:35 +0100
Date:   Tue, 15 Mar 2022 06:59:35 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Ian Dannapel <iansdannapel@gmail.com>, linux@rempel-privat.de,
        Erik.Schumacher@iris-sensing.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
        Michael.Glembotzki@iris-sensing.com, linux-imx@nxp.com,
        kernel@pengutronix.de, festevam@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: remove unnecessary delay at startup
Message-ID: <20220315055935.GB14588@pengutronix.de>
References: <20220314095918.50014-1-iansdannapel@gmail.com>
 <20220314101337.4x2cu3nvg2vg7ulh@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220314101337.4x2cu3nvg2vg7ulh@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 06:57:18 up 94 days, 14:42, 65 users,  load average: 0.06, 0.09,
 0.09
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
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

On Mon, Mar 14, 2022 at 11:13:37AM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Mar 14, 2022 at 10:59:18AM +0100, Ian Dannapel wrote:
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index 3576b63a6c03..019dda5301df 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -602,12 +602,6 @@ static int i2c_imx_start(struct imx_i2c_struct *i2c_imx, bool atomic)
> >  	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx, IMX_I2C_I2SR);
> >  	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode, i2c_imx, IMX_I2C_I2CR);
> >  
> > -	/* Wait controller to be stable */
> > -	if (atomic)
> > -		udelay(50);
> > -	else
> > -		usleep_range(50, 150);
> > -
> >  	/* Start I2C transaction */
> >  	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> >  	temp |= I2CR_MSTA;
> 
> This contradicts statements made in
> 43309f3b521302bb66c4c9e66704dd3675e4d725.
> 
> Maybe the sleep/delay should be done conditionally on the busy bit?

Maybe. I do not see what exact problem is this sleep addressing. How
exact the can get stable? Is it addressing some clock issue or wading
until something happening on the bus?

Regards,
Oleskij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
