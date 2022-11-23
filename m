Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB94636E4C
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Nov 2022 00:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbiKWXYn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Nov 2022 18:24:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbiKWXYj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Nov 2022 18:24:39 -0500
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61EA2107E56;
        Wed, 23 Nov 2022 15:24:37 -0800 (PST)
Date:   Wed, 23 Nov 2022 23:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1669245874; x=1669505074;
        bh=4D7H7t9cQFG+vEXPzrmjxP0kBkCA637MqCW+lh8xlvo=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=hPbJVkIuL1M0qEmL0bT4PuPpgSPCUAu33Y+Qb7tdeEgjcQqAn2P9/FpfK16HEA2EM
         7vjsfHf0eS2PmoRXdPNGezpmX314hJ02XB0zpjgzVkJDzPqhEL7AMChGfIwFpiPwIA
         NF7ZZEj1iGDIHy5p8DLkWQw2m5Qldpno4e6/JtLA16r0ZaA4hkUD/VeqWm5hbTdlnb
         BxWDFCkr77h+K0/o8YNYsqjLGq0ZWGeFJce25BsYm5wcKn9VpmO0zKAO32OE9aTevx
         yfP5UsPCKW2I3bqPQKJL7FqD0bhsWsXV2qxdqiRQ7WsVWh4oHNK9TFNBq0m4+w4lGn
         bmQFT/VhhjM8A==
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Matthew Wilcox <willy@infradead.org>,
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
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a const *
Message-ID: <tx7-rd-SyCXl_K0mh2tDzOLPmogI631IJQJRNK8dMW_GVZiy5AHHVN7-b_Ib3P1L_dLTCRPEw8dAhDbMAPGg8QTKs4p1XFoNHlEZpAnWcCw=@protonmail.com>
In-Reply-To: <Y35vLAWWfezPvGSm@kroah.com>
References: <Y34hgIW8p1RlQTBB@smile.fi.intel.com> <Y34+V2bCDdqujBDk@kroah.com> <Y35JfNJDppRp5bLX@ziepe.ca> <Y35R+/eQJYI7VaDS@kroah.com> <Y35YlI93UBuTfgYy@ziepe.ca> <Y35dMIaNYSE0Cykd@casper.infradead.org> <Y35iKfYf3ThdVvaR@kroah.com> <Y35lt+0jXrOKynL5@ziepe.ca> <Y35vLAWWfezPvGSm@kroah.com>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Hi


2022. november 23., szerda 20:06 keltez=C3=A9ssel, Greg Kroah-Hartman =
=C3=ADrta:


> On Wed, Nov 23, 2022 at 02:25:59PM -0400, Jason Gunthorpe wrote:
>=20
> > On Wed, Nov 23, 2022 at 07:10:49PM +0100, Greg Kroah-Hartman wrote:
> >=20
> > > On Wed, Nov 23, 2022 at 05:49:36PM +0000, Matthew Wilcox wrote:
> > >=20
> > > > On Wed, Nov 23, 2022 at 01:29:56PM -0400, Jason Gunthorpe wrote:
> > > >=20
> > > > > #define generic_container_of(in_type, in, out_type, out_member) \
> > > > > _Generic(in, \
> > > > > const in_type *: ((const out_type *)container_of(in, out_type, ou=
t_member)), \
> > > > > in_type *: ((out_type *)container_of(in, out_type, out_member)) \
> > > > > )
> > > >=20
> > > > There's a neat trick I found in seqlock.h:
> > > >=20
> > > > #define generic_container_of(in_t, in, out_t, m) \
> > > > _Generic(*(in), \
> > > > const in_t: ((const out_t *)container_of(in, out_t, m)), \
> > > > in_t: ((out_t *)container_of(in, out_type, m)) \
> > > > )
> > > >=20
> > > > and now it fits in 80 columns ;-)
> > >=20
> > > Nice trick! Dropping the inline functions is a bit different, let me
> > > see if that still gives a sane error if we pass an incorrect type or
> > > mess with the const * the wrong way. I'll run some tests tomorrow
> > > afternoon...
> >=20
> > The errors in some cases are very verbose, but it is somewhat
> > understandable - the worst is when _Generic fails to match anything,
> > but also at least clang partially expanded container_of and it throws
> > other assertions too.
> >=20
> > I also wonder if this could just be rolled into the normal
> > container_of.
>=20
>=20
> I think we might be able to now, my previous attempts with inline
> functions prevented that. I'll beat on that tomorrow...
>=20
> > in_type would have to be derived like:
> >=20
> > in_type =3D typeof((out_type *)NULL)->out_member)
> >=20
> > But I don't know if you can use typeof in a generic type matching expre=
ssion..
>=20
>=20
> Maybe that is what threw me before, I can't remember. I do know we
> tried a number of different attempts, can't recall the failed ones...
>=20

I am sorry I haven't followed the previous discussion,
but has something like the following been considered?

  #define container_of2(ptr, type, member) \
  =09_Generic((ptr), \
  =09=09typeof_member(const type, member) *: container_of((ptr), const type=
, member), \
  =09=09const void *: container_of((ptr), const type, member), \
  =09=09default: container_of((ptr), type, member) \
  =09)

This is not perfect by any means, but I believe it is a reasonable
improvement. It only really works reliably if the member type and
the specified `type` in the arguments are unqualified,
but I believe that should cover the majority of cases.

I have tried to build an x86-64 defconfig with this and there are
numerous const violations, but I haven't seen any false positives.


> [...]


Regards,
Barnab=C3=A1s P=C5=91cze
