Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A95064EBC0
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 13:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbiLPM72 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Dec 2022 07:59:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbiLPM71 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Dec 2022 07:59:27 -0500
X-Greylist: delayed 493 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 16 Dec 2022 04:59:25 PST
Received: from smtp-out-06.comm2000.it (smtp-out-06.comm2000.it [212.97.32.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9535D5214F
        for <linux-i2c@vger.kernel.org>; Fri, 16 Dec 2022 04:59:25 -0800 (PST)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: francesco@dolcini.it)
        by smtp-out-06.comm2000.it (Postfix) with ESMTPSA id B78DA563C24;
        Fri, 16 Dec 2022 13:51:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
        s=mailsrv; t=1671195070;
        bh=EfBeTvttVoc82tq3ofLmEzobpG7NJbK0UtZUph4ruAE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To;
        b=slrkRNWklL0vICs1jQcJiwtip3TE7VTBsQUcWNmbWgp9uPfjrZwyhnMq4lPyNby+7
         K7nrs1BzC4oyfd9/Jqzt57pYjC20u/Mt/1YJ0Bx/hRhW12ly8vW0LDq5uVDOuq3EfY
         g1+vRepyJxsD1BFdOysWWHIBa6YfrkabclDjrRJb+RlbKAU9cUA10MySzRC24pKT9w
         gmAMoNbZFfSsIrD9Y23+eRAlpKhmPmRWZgDltbho7p0F8q8NLpS100DmRdrKQg0LWg
         ZWd1mXhM7Tfis3eTIwegOViRcO1kZU2ooAW2jKXhCTM6HK1iYViw8NEA+o8gKV5zUA
         R9ebkEltPzUUQ==
Date:   Fri, 16 Dec 2022 13:51:03 +0100
From:   Francesco Dolcini <francesco@dolcini.it>
To:     Primoz Fiser <primoz.fiser@norik.com>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
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
        francesco.dolcini@toradex.com
Subject: Re: [PATCH] i2c: imx: increase retries on arbitration loss
Message-ID: <Y5xpt6J01Boec6Xr@francesco-nb.int.toradex.com>
References: <20221216084511.2576786-1-primoz.fiser@norik.com>
 <20221216094518.bevkg5buzu7iybfh@pengutronix.de>
 <bb4882a9-8be6-5255-6256-aa1253362e59@norik.com>
 <20221216110227.GA12327@pengutronix.de>
 <20221216111308.wckibotr5d3q6ree@pengutronix.de>
 <5c2e0531-e7c3-1b37-35ed-c8e9795a0d18@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c2e0531-e7c3-1b37-35ed-c8e9795a0d18@norik.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 16, 2022 at 01:23:29PM +0100, Primoz Fiser wrote:
> Hi all,
> 
> On 16. 12. 22 12:13, Uwe Kleine-König wrote:
> > On Fri, Dec 16, 2022 at 12:02:27PM +0100, Oleksij Rempel wrote:
> > > On Fri, Dec 16, 2022 at 11:41:08AM +0100, Primoz Fiser wrote:
> > > > Hi Marco,
> > > > 
> > > > On 16. 12. 22 10:45, Marco Felsch wrote:
> > > > > Hi Primoz,
> > > > > 
> > > > > On 22-12-16, Primoz Fiser wrote:
> > > > > > By default, retries value is set to 0 (no retries). Set retries to more
> > > > > > sensible value of 3 to allow i2c core to re-attempt transfer in case of
> > > > > > i2c arbitration loss (i2c-imx returns -EAGAIN errno is such case).
> > > > > 
> > > > > apart the fact that the number of retries vary a lot and so the client
> > > > > driver behaviour can vary a lot which is not good IMHO, why do you think
> > > > > that 3 is a sufficient number?
> > > > 
> > > > IMHO it is better than leaving it at 0 (no retries)?
> > > > 
> > > > Setting it to sensible value like 3 will at least attempt to make transfer
> > > > in case arbitration-loss occurs.
> > > > 
> > > > > 
> > > > > If an arbitration loss happen, why do you think that retrying it 3 times
> > > > > changes that?
> > > > 
> > > > I our case, setting retries to non-zero value solves issues with PMIC
> > > > shutdown on phyboard-mira which in some rare cases fails with "Failed to
> > > > shutdown (err =  -11)" (-EAGAIN).
> > > > 
> > > > To me it makes common sense retries is set to non-zero value especially for
> > > > such rare conditions/situations.
> > > 
> > > https://lore.kernel.org/all/Ys1bw9zuIwWS+bqw@shikoro/
> 
> Ohh I see.
> 
> Reading through the thread I guess we aren't getting this mainlined at all
> :)
>
> The only solid point in the thread seems to be that in that case we are not
> covering up the potential i2c hardware issues?

I believe that in this case we should just have a warning in the kernel.
The retry potentially work-around a transient issue and we do not hide any hardware
issue at the same time. It seems an easy win-win solution.

> Yeah fair point but on the other hand, goal of this patch would be to
> improve robustness in case of otherwise good performing hardware. From user
> perspective I just want it to work despite it retrying under the hood from
> time to time. I think Francesco had the same idea.

Unfortunately I was missing the exact background that made us do this
change, we just had it sitting in our fork for too long :-/
This is one of the reason I gave up on it.

Quoting Uwe [1]
> sometimes there is no practical way around such work arounds. I happens
> from time to time that the reason for problem is known, but fixing the
> hardware is no option, then you need such workrounds. (This applies to
> both, retrying the transfers and resetting the bus.) 

Francesco

[1] https://lore.kernel.org/all/20220715083400.q226rrwxsgt4eomp@pengutronix.de/

