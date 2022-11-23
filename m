Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8A9263697E
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 20:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239591AbiKWTGZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 14:06:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236590AbiKWTGY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 14:06:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC46F922D2;
        Wed, 23 Nov 2022 11:06:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 586E161EBE;
        Wed, 23 Nov 2022 19:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7968C433D6;
        Wed, 23 Nov 2022 19:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669230382;
        bh=imibZHjJL9cpBpAGiGFcUllw5xFRNIsDuHu6Y+fwag4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V2GZdWHPvr+u9NV42kW3apisS1jk4Cp6h19MZ6qfaWIUGIVJV5gV2ha39zpYgwqP7
         WIt60wd9b8FvKniDUGYZZUiLCvZQFxPf+YdmrcSFnI46/b/EWX33zlFDz2TQxA125f
         2aOS9p5Y/Iiz28acyMaujccSu8U/Ol2yQw6Symkw=
Date:   Wed, 23 Nov 2022 20:06:20 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Wolfram Sang <wsa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Chaitanya Kulkarni <kch@nvidia.com>,
        Ming Lei <ming.lei@redhat.com>,
        Jilin Yuan <yuanjilin@cdjrlc.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ira Weiny <ira.weiny@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Won Chung <wonchung@google.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-block@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-i3c@lists.infradead.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y35vLAWWfezPvGSm@kroah.com>
References: <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com>
 <Y35JfNJDppRp5bLX@ziepe.ca>
 <Y35R+/eQJYI7VaDS@kroah.com>
 <Y35YlI93UBuTfgYy@ziepe.ca>
 <Y35dMIaNYSE0Cykd@casper.infradead.org>
 <Y35iKfYf3ThdVvaR@kroah.com>
 <Y35lt+0jXrOKynL5@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y35lt+0jXrOKynL5@ziepe.ca>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 23, 2022 at 02:25:59PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 23, 2022 at 07:10:49PM +0100, Greg Kroah-Hartman wrote:
> > On Wed, Nov 23, 2022 at 05:49:36PM +0000, Matthew Wilcox wrote:
> > > On Wed, Nov 23, 2022 at 01:29:56PM -0400, Jason Gunthorpe wrote:
> > > > #define generic_container_of(in_type, in, out_type, out_member) \
> > > > 	_Generic(in,                                        \
> > > >                   const in_type *: ((const out_type *)container_of(in, out_type, out_member)),   \
> > > >                   in_type *: ((out_type *)container_of(in, out_type, out_member)) \
> > > > 		  )
> > > 
> > > There's a neat trick I found in seqlock.h:
> > > 
> > > #define generic_container_of(in_t, in, out_t, m)			\
> > > 	_Generic(*(in),							\
> > > 		const in_t: ((const out_t *)container_of(in, out_t, m)), \
> > > 		in_t: ((out_t *)container_of(in, out_type, m))	\
> > > 	)
> > > 
> > > and now it fits in 80 columns ;-)
> > 
> > Nice trick!  Dropping the inline functions is a bit different, let me
> > see if that still gives a sane error if we pass an incorrect type or
> > mess with the const * the wrong way.  I'll run some tests tomorrow
> > afternoon...
> 
> The errors in some cases are very verbose, but it is somewhat
> understandable - the worst is when _Generic fails to match anything,
> but also at least clang partially expanded container_of and it throws
> other assertions too.
> 
> I also wonder if this could just be rolled into the normal
> container_of.

I think we might be able to now, my previous attempts with inline
functions prevented that.  I'll beat on that tomorrow...

> in_type would have to be derived like:
> 
>   in_type = typeof((out_type *)NULL)->out_member)
> 
> But I don't know if you can use typeof in a generic type matching expression..

Maybe that is what threw me before, I can't remember.  I do know we
tried a number of different attempts, can't recall the failed ones...

thanks,

greg k-h
