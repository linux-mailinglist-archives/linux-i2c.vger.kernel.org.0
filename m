Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 257C56364BF
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Nov 2022 16:53:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238624AbiKWPx0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 10:53:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238772AbiKWPwz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 10:52:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB32457B76;
        Wed, 23 Nov 2022 07:52:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 57703B82172;
        Wed, 23 Nov 2022 15:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFB3C433D6;
        Wed, 23 Nov 2022 15:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669218768;
        bh=/DumSgjbm3+bFjW/YII5HB+37hZffmS6RIQzxFus23A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Axk59HaPRU6B2o8/sQ2xV/J3QDnuJbllXINFmP+zTkfGNyl9/NsBA856568zy/Zy0
         ziibqVHor7E2pImZW09H3fsO0rmk5lAkiY8/xImxvEPWF1JugZkU42k7XZp/1gGlxF
         YjrYDdmJl0DMzZ+GHnRpj/dpCWN4eBZtN+hiAE0Q=
Date:   Wed, 23 Nov 2022 16:52:45 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
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
        Jason Gunthorpe <jgg@ziepe.ca>,
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
Message-ID: <Y35BzXYg8/WGqf6V@kroah.com>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
 <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
 <97be39ed-3cea-d55a-caa6-c2652baef399@gmail.com>
 <Y34zyzdbRUdyOSkA@casper.infradead.org>
 <Y34+V2bCDdqujBDk@kroah.com>
 <b93a9fcd-0d7b-14fd-1018-bba35f961a27@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b93a9fcd-0d7b-14fd-1018-bba35f961a27@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Nov 23, 2022 at 04:48:41PM +0100, Maximilian Luz wrote:
> On 11/23/22 16:37, Greg Kroah-Hartman wrote:
> > On Wed, Nov 23, 2022 at 02:52:59PM +0000, Matthew Wilcox wrote:
> > > On Wed, Nov 23, 2022 at 02:59:00PM +0100, Maximilian Luz wrote:
> > > > On 11/23/22 14:34, Andy Shevchenko wrote:
> > > > > On Wed, Nov 23, 2022 at 02:14:31PM +0100, Maximilian Luz wrote:
> > > > > > On 11/23/22 13:25, Greg Kroah-Hartman wrote:
> > > > > > > The uevent() callback in struct device_type should not be modifying the
> > > > > > > device that is passed into it, so mark it as a const * and propagate the
> > > > > > > function signature changes out into all relevant subsystems that use
> > > > > > > this callback.
> > > > > 
> > > > > [...]
> > > > > 
> > > > > > > -static inline struct ssam_device *to_ssam_device(struct device *d)
> > > > > > > +static inline struct ssam_device *to_ssam_device(const struct device *d)
> > > > > > >     {
> > > > > > >     	return container_of(d, struct ssam_device, dev);
> > > > > > >     }
> > > > > > 
> > > > > > I am slightly conflicted about this change as that now more or less
> > > > > > implicitly drops the const. So I'm wondering if it wouldn't be better to
> > > > > > either create a function specifically for const pointers or to just
> > > > > > open-code it in the instance above.
> > > > > > 
> > > > > > I guess we could also convert this to a macro. Then at least there
> > > > > > wouldn't be an explicit and potentially misleading const-conversion
> > > > > > indicated in the function signature.
> > > > > 
> > > > > This is an intermediate step as far as I know since moving container_of to
> > > > > recognize const is a bit noisy right now. I guess you can find a discussion
> > > > > on the topic between Greg and Sakari.
> > > > 
> > > > Thanks! I assume you are referring to the following?
> > > > 
> > > > 	https://lore.kernel.org/lkml/4218173bd72b4f1899d4c41a8e251f0d@AcuMS.aculab.com/T/
> > > > 
> > > > As far as I can tell this is only a warning in documentation, not
> > > > compile time (which would probably be impossible?).
> > > > 
> > > > As I've said I'd be fine with converting the function to a macro (and
> > > > preferably adding a similar warning like the one proposed in that
> > > > thread). The point that irks me up is just that, as proposed, the
> > > > function signature would now advertise a conversion that should never be
> > > > happening.
> > > > 
> > > > Having two separate functions would create a compile-time guarantee, so
> > > > I'd prefer that, but I can understand if that might be considered too
> > > > noisy in code. Or if there is a push to make container_of() emit a
> > > > compile-time warning I'd also be perfectly happy with converting it to a
> > > > macro now as that'd alleviate the need for functions in the future.
> > > 
> > > Can't we do:
> > > 
> > > static inline const struct ssam_device *to_ssam_device(const struct device *d)
> > > {
> > > 	return container_of(d, const struct ssam_device, dev);
> > > }
> > > 
> > 
> > You could, if you can always handle a const pointer coming out of this
> > function, but I don't think you can.
> > 
> > What you might want to do instead, and I'll be glad to do it for all of
> > the functions like this I change, is to do what we have for struct
> > device now:
> > 
> > static inline struct device *__kobj_to_dev(struct kobject *kobj)
> > {
> >          return container_of(kobj, struct device, kobj);
> > }
> > 
> > static inline const struct device *__kobj_to_dev_const(const struct kobject *kobj)
> > {
> >          return container_of(kobj, const struct device, kobj);
> > }
> > 
> > /*
> >   * container_of() will happily take a const * and spit back a non-const * as it
> >   * is just doing pointer math.  But we want to be a bit more careful in the
> >   * driver code, so manually force any const * of a kobject to also be a const *
> >   * to a device.
> >   */
> > #define kobj_to_dev(kobj)                                       \
> >          _Generic((kobj),                                        \
> >                   const struct kobject *: __kobj_to_dev_const,   \
> >                   struct kobject *: __kobj_to_dev)(kobj)
> > 
> > 
> > Want me to do the same thing here as well?
> 
> That looks great! Thanks!
> 
> I would very much prefer that.

Ok, will respin this patch as at least 2 individual patches, one that
does the change to to_ssam_device() and the next that does the bus-wide
changes.

I'll review the other container_of() users in this patch as well to see
if they can be converted as well.

thanks,

greg k-h
