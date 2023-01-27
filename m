Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E36367E421
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 12:51:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232450AbjA0LvK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 06:51:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234653AbjA0Lub (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 06:50:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66EED7DBF1;
        Fri, 27 Jan 2023 03:48:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0610E61B48;
        Fri, 27 Jan 2023 11:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA25EC433EF;
        Fri, 27 Jan 2023 11:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1674819955;
        bh=+HZedC1yYWn9RpT0uEg90it6dWEPBAOVrFjpfrJEmQA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gXiPe9Dgc9ISKhiSOrlvRd3vLkCrFPKbID9Sdqb8YTmyUV5MkO+qxCXN0rHEb/eSp
         q6Nu+oZWk7Z+bnW8piP441ATYZ0bgF8mB1wY/+gqEh/LoquSECvV9RNKpLJFsaaPPS
         aSDMWgOBNEd5cIzWxcjZXzjRMhgQ+tTvJrgG5zyQ=
Date:   Fri, 27 Jan 2023 12:45:52 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Grant Likely <grant.likely@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 571/606] serial: sc16is7xx: Convert to i2c's .probe_new()
Message-ID: <Y9O5cMnC+uKrPToz@kroah.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-572-uwe@kleine-koenig.org>
 <536ac08e-bdbd-b4d6-8309-8f6763f8db12@kernel.org>
 <20221121070757.cqiybt5uk4qiczmr@pengutronix.de>
 <0bfea903-5efd-a76d-5944-16a2c9362adb@kernel.org>
 <20221123080912.lbmfgnco67psdu27@pengutronix.de>
 <20230127101025.evefhpwpfikahd3k@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230127101025.evefhpwpfikahd3k@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 27, 2023 at 11:10:25AM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Nov 23, 2022 at 09:09:12AM +0100, Uwe Kleine-König wrote:
> > On Wed, Nov 23, 2022 at 07:36:52AM +0100, Jiri Slaby wrote:
> > > On 21. 11. 22, 8:07, Uwe Kleine-König wrote:
> > > > On Mon, Nov 21, 2022 at 07:03:41AM +0100, Jiri Slaby wrote:
> > > > > On 18. 11. 22, 23:45, Uwe Kleine-König wrote:
> > > > > > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > > > > 
> > > > > > .probe_new() doesn't get the i2c_device_id * parameter, so determine
> > > > > > that explicitly in the probe function.
> > > > > 
> > > > > I wonder why -- is this a new approach to probe functions? Or is only i2c
> > > > > affected? And why? Could you point to the commit introducing and describing
> > > > > the change in the i2c core?
> > > > 
> > > > I didn't sent the cover letter to all recipents of the individual
> > > > patches, so flow of information is a bit rough. Sorry about that.
> > > > 
> > > > You can find it at
> > > > https://lore.kernel.org/lkml/20221118224540.619276-1-uwe@kleine-koenig.org/,
> > > > it should answer your question.
> > > 
> > > Yes, I looked up that beforehand, but was no more clever after reading it.
> > > 
> > > > The short version is: The i2c framework does a more or less expensive
> > > > lookup for each call to .probe() to provide the id parameter. A relevant
> > > > part of the drivers however doesn't use this parameter, so the idea is
> > > > to let the drivers who actually need it, determine it themselves.
> > > > 
> > > > Statistics for the current state of this series in my tree:
> > > > Among the 602 converted drivers, 404 don't make use of the parameter.
> > > 
> > > So doesn't it make sense to provide both probe with no id and "probe_id"
> > > then? 200 is quite a few (a third to be precise).
> > 
> > Having the probe callback with the id parameter is only temporary. As
> > soon as all drivers are converted, the variant with the id parameter
> > will go away.
> > 
> > > BTW is this a performance issue? I.e. does it slow down the boot?
> > 
> > I don't know the start motivation for Lee (who triggered the conversion
> > in b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back
> > type")).
> > Looking at the git history, he created 1e98dcd77970 ("mfd: 88pm860x:
> > Move over to new I2C device .probe() call") converting a driver that
> > doesn't benefit immensely. The lookup is more expensive for drivers with
> > big .id_table, the converted driver has only one entry.
> > 
> > I think in the end is a mixture between:
> > 
> >  - A big part of the drivers doesn't benefit from the lookup.
> >  - For most other busses the probe function only gets a device parameter
> >    and no id (spi, platform, i3c). There are counter examples though:
> >    amba, usb. Didn't check further.
> 
> The discussion somehow ended here without a real result.
> 
> As of today's next master there are only 9 drivers left using .probe().
> So I'd like to stop this discussion and ask to apply the conversion for
> the sc16is7xx driver to be able to complete the conversion.
> 
> My plan is to drop the .probe callback as it is today after the next
> merge window. So I ask the serial maintainers to either take the patch
> under discussion for the next merge window or accept that the conversion
> is done together with the patch that drops .probe() that probably will
> go in via the i2c tree.

I don't see the patch anymore, so I have no objection for it going
through the i2c tree.

thanks,

greg k-h
