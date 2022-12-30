Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 872E9659967
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Dec 2022 15:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbiL3Olb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Dec 2022 09:41:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235139AbiL3OlT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Dec 2022 09:41:19 -0500
Received: from smtp-out-03.comm2000.it (smtp-out-03.comm2000.it [212.97.32.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93DED1A830;
        Fri, 30 Dec 2022 06:41:14 -0800 (PST)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: francesco@dolcini.it)
        by smtp-out-03.comm2000.it (Postfix) with ESMTPSA id 517C1B44F2D;
        Fri, 30 Dec 2022 15:41:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
        s=mailsrv; t=1672411270;
        bh=slpFlEiEoA19QdYQl6qukZiRr34GdN+uJEB251p+cA8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=VcxT5lfeDcGXEfClRD2fELOhpitRhEkx+GYqtvK5mpVSQwZiBiW6BeJGvC9utommQ
         56XtaiLtzGjmtZtOXpJ4a5CYA9xr3yAuC9lDKsa7aEleYs/prGa9o9Gj2yaNWXkeXi
         V0xSneteVB5OpZhNMuv00KfqkhxCPDZkDprc/B5s90sVulr/VDNel8+y8ZM5wVmP6u
         TlkLmZGFSQUuhEBA3xsl/W2vpvUFOHgaSzAuSF/cx3P7lcWaQUpv/hIsfPASkqXkll
         amzIMzSdS4pqGZ6Uev7v8UOrPvP2kX0u0jBza+FnyCK4qKOv5HgGFadwiwyEHxIg0t
         yPlHcVpXNQdHg==
Date:   Fri, 30 Dec 2022 15:40:58 +0100
From:   Francesco Dolcini <francesco@dolcini.it>
To:     Primoz Fiser <primoz.fiser@norik.com>
Cc:     Francesco Dolcini <francesco@dolcini.it>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        upstream@lists.phytec.de, Marco Felsch <m.felsch@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        francesco.dolcini@toradex.com, wsa@kernel.org
Subject: Re: [PATCH] i2c: imx: increase retries on arbitration loss
Message-ID: <Y674eoNsHtAeG7IP@francesco-nb.int.toradex.com>
References: <20221216084511.2576786-1-primoz.fiser@norik.com>
 <20221216094518.bevkg5buzu7iybfh@pengutronix.de>
 <bb4882a9-8be6-5255-6256-aa1253362e59@norik.com>
 <20221216110227.GA12327@pengutronix.de>
 <20221216111308.wckibotr5d3q6ree@pengutronix.de>
 <5c2e0531-e7c3-1b37-35ed-c8e9795a0d18@norik.com>
 <Y5xpt6J01Boec6Xr@francesco-nb.int.toradex.com>
 <41991ce2-3e88-5afc-6def-6e718d624768@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41991ce2-3e88-5afc-6def-6e718d624768@norik.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+Wolfram

On Wed, Dec 28, 2022 at 09:01:46AM +0100, Primoz Fiser wrote:
> On 16. 12. 22 13:51, Francesco Dolcini wrote:
> > On Fri, Dec 16, 2022 at 01:23:29PM +0100, Primoz Fiser wrote:
> > > The only solid point in the thread seems to be that in that case we are not
> > > covering up the potential i2c hardware issues?
> > 
> > I believe that in this case we should just have a warning in the kernel.
> > The retry potentially work-around a transient issue and we do not hide any hardware
> > issue at the same time. It seems an easy win-win solution.
> 
> I would agree about throwing a warning message in retry case.
> 
> Not sure how would it affect other i2c bus drivers using retries > 0.
> Retries might be pretty rare with i2c-imx but some other drivers set this to
> 5 for example. At least using _ratelimited printk is a must using this
> approach.

Wolfram, Uwe, Oleksij

Would it be acceptable to have a warning when we have I2C retries, and
with that in place enabling retries on the imx driver?

It exists hardware that requires this to work correctly, and at a
minimum setting the retry count from user space is not going to solve
potential issues during initial driver probe.

To me the only reasonable solution is to have the retry enabled with a
sensible number (3? 5?), however there is a concern that this might
hide real hardware issues.

> > > Yeah fair point but on the other hand, goal of this patch would be to
> > > improve robustness in case of otherwise good performing hardware. From user
> > > perspective I just want it to work despite it retrying under the hood from
> > > time to time. I think Francesco had the same idea.
> > 
> > Unfortunately I was missing the exact background that made us do this
> > change, we just had it sitting in our fork for too long :-/
> > This is one of the reason I gave up on it.
> > 
> > Quoting Uwe [1]
> > > sometimes there is no practical way around such work arounds. I happens
> > > from time to time that the reason for problem is known, but fixing the
> > > hardware is no option, then you need such workrounds. (This applies to
> > > both, retrying the transfers and resetting the bus.)
> 
> I wouldn't say this is exactly a workaround if "retries mechanism" is
> standard part of the i2c core. Other drivers use it as well. it is just a
> setting to improve bus robustness.
> 
> But OK, I guess we can live with this one-liner in the downstream kernel.
To me this is not a good idea.

Francesco

