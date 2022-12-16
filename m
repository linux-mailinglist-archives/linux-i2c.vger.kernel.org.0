Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65E6664E9E8
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 12:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiLPLCn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Dec 2022 06:02:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbiLPLCm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Dec 2022 06:02:42 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D5F31B1F1
        for <linux-i2c@vger.kernel.org>; Fri, 16 Dec 2022 03:02:40 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1p68U0-0001Mb-Uw; Fri, 16 Dec 2022 12:02:28 +0100
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1p68Tz-0003Yt-O1; Fri, 16 Dec 2022 12:02:27 +0100
Date:   Fri, 16 Dec 2022 12:02:27 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Primoz Fiser <primoz.fiser@norik.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH] i2c: imx: increase retries on arbitration loss
Message-ID: <20221216110227.GA12327@pengutronix.de>
References: <20221216084511.2576786-1-primoz.fiser@norik.com>
 <20221216094518.bevkg5buzu7iybfh@pengutronix.de>
 <bb4882a9-8be6-5255-6256-aa1253362e59@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bb4882a9-8be6-5255-6256-aa1253362e59@norik.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 16, 2022 at 11:41:08AM +0100, Primoz Fiser wrote:
> Hi Marco,
> 
> On 16. 12. 22 10:45, Marco Felsch wrote:
> > Hi Primoz,
> > 
> > On 22-12-16, Primoz Fiser wrote:
> > > By default, retries value is set to 0 (no retries). Set retries to more
> > > sensible value of 3 to allow i2c core to re-attempt transfer in case of
> > > i2c arbitration loss (i2c-imx returns -EAGAIN errno is such case).
> > 
> > apart the fact that the number of retries vary a lot and so the client
> > driver behaviour can vary a lot which is not good IMHO, why do you think
> > that 3 is a sufficient number?
> 
> IMHO it is better than leaving it at 0 (no retries)?
> 
> Setting it to sensible value like 3 will at least attempt to make transfer
> in case arbitration-loss occurs.
> 
> > 
> > If an arbitration loss happen, why do you think that retrying it 3 times
> > changes that?
> 
> I our case, setting retries to non-zero value solves issues with PMIC
> shutdown on phyboard-mira which in some rare cases fails with "Failed to
> shutdown (err =  -11)" (-EAGAIN).
> 
> To me it makes common sense retries is set to non-zero value especially for
> such rare conditions/situations.

https://lore.kernel.org/all/Ys1bw9zuIwWS+bqw@shikoro/

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
