Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2084267E7E9
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 15:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbjA0OON (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 09:14:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233022AbjA0ON5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 09:13:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2CE783D8;
        Fri, 27 Jan 2023 06:13:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1489861CB0;
        Fri, 27 Jan 2023 14:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D437C433D2;
        Fri, 27 Jan 2023 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1674828835;
        bh=LJLYKX3J5X8hhM7+whZMdOoAPy1yjNgGrNf65NObbNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tsznf9uEOUJO2JpQeb4rNpTHanfowhqletsU05eYDd8bBe2LrnC0OC+u4xLSLBI/i
         hIJfBtvSmvIG0cNc6xVh9j+tpE2zw1T6pWoa+i/fv7CX2PNI26xzHt3VMg82qO3TXz
         Os/Idw0126BgSQ3Xwn1agpERM0pIaw34zTRn4NhM=
Date:   Fri, 27 Jan 2023 15:13:52 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        Grant Likely <grant.likely@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 571/606] serial: sc16is7xx: Convert to i2c's .probe_new()
Message-ID: <Y9PcIKLIbmsLB8lQ@kroah.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-572-uwe@kleine-koenig.org>
 <536ac08e-bdbd-b4d6-8309-8f6763f8db12@kernel.org>
 <20221121070757.cqiybt5uk4qiczmr@pengutronix.de>
 <0bfea903-5efd-a76d-5944-16a2c9362adb@kernel.org>
 <20221123080912.lbmfgnco67psdu27@pengutronix.de>
 <20230127101025.evefhpwpfikahd3k@pengutronix.de>
 <Y9O5cMnC+uKrPToz@kroah.com>
 <20230127131751.gupnp7l6wyrutpmw@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230127131751.gupnp7l6wyrutpmw@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 27, 2023 at 02:17:51PM +0100, Uwe Kleine-König wrote:
> Hello Greg,
> 
> On Fri, Jan 27, 2023 at 12:45:52PM +0100, Greg Kroah-Hartman wrote:
> > On Fri, Jan 27, 2023 at 11:10:25AM +0100, Uwe Kleine-König wrote:
> > > On Wed, Nov 23, 2022 at 09:09:12AM +0100, Uwe Kleine-König wrote:
> > > > On Wed, Nov 23, 2022 at 07:36:52AM +0100, Jiri Slaby wrote:
> > > > > BTW is this a performance issue? I.e. does it slow down the boot?
> > > > 
> > > > I don't know the start motivation for Lee (who triggered the conversion
> > > > in b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back
> > > > type")).
> > > > Looking at the git history, he created 1e98dcd77970 ("mfd: 88pm860x:
> > > > Move over to new I2C device .probe() call") converting a driver that
> > > > doesn't benefit immensely. The lookup is more expensive for drivers with
> > > > big .id_table, the converted driver has only one entry.
> > > > 
> > > > I think in the end is a mixture between:
> > > > 
> > > >  - A big part of the drivers doesn't benefit from the lookup.
> > > >  - For most other busses the probe function only gets a device parameter
> > > >    and no id (spi, platform, i3c). There are counter examples though:
> > > >    amba, usb. Didn't check further.
> > > 
> > > The discussion somehow ended here without a real result.
> > > 
> > > As of today's next master there are only 9 drivers left using .probe().
> > > So I'd like to stop this discussion and ask to apply the conversion for
> > > the sc16is7xx driver to be able to complete the conversion.
> > > 
> > > My plan is to drop the .probe callback as it is today after the next
> > > merge window. So I ask the serial maintainers to either take the patch
> > > under discussion for the next merge window or accept that the conversion
> > > is done together with the patch that drops .probe() that probably will
> > > go in via the i2c tree.
> > 
> > I don't see the patch anymore,
> 
> If you want to take a look:
> 
> 	b4 am 20221118224540.619276-572-uwe@kleine-koenig.org
> 
> or
> 
> 	https://lore.kernel.org/lkml/20221118224540.619276-572-uwe@kleine-koenig.org
> 
> > so I have no objection for it going through the i2c tree.
> 
> Can I interpret that as an Ack? :-)

Even better:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
