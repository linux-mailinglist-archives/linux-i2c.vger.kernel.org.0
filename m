Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC3F625F6E
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Nov 2022 17:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbiKKQ0m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Nov 2022 11:26:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232841AbiKKQ0l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Nov 2022 11:26:41 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A297E77E4A;
        Fri, 11 Nov 2022 08:26:38 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 2D6C440002;
        Fri, 11 Nov 2022 16:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1668183995;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EpAKRFgC1HpttC3/LcMYOPznsj7JDQ8LUkzH9QduPeY=;
        b=jAgZhVWK4cbOPjrZcENscWveacxgbb03TdxWROKpkYrzqQLO8M+8B6ZnT4nLGd/YM9978w
        pReLNo3DYr7HvyljOPAQndrhF+/FKr1MSPLrIOBrhizaMXtn4ILiLRXQdHJFNqZ9Uiyudw
        3bkElvxLqbVdTrgFRaNFX7pnUErKQUkIITkZbtguzlg5OlbB6mhg9bZVm0NXxrAfbr8dcN
        8jXxXHY57zBS3d2v5ODlOhkBIyRwfw94CXRoRvn8YNlDNd7GPdpPvC7EhzUWKgC67DJ/Qf
        i6pJZm+p8l5Zk+Lk2vJjqgTdXhj/Hqe5VUhjmfnHeA9M6jmuXQCG2Y2lnfaLJA==
Date:   Fri, 11 Nov 2022 17:26:31 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Rob Herring <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        "satish.nagireddy@getcruise.com" <satish.nagireddy@getcruise.com>
Subject: Re: [PATCH v4 3/8] dt-bindings: media: add bindings for TI
 DS90UB960
Message-ID: <20221111172631.2832ae6c@booty>
In-Reply-To: <8360ac8f-64aa-9edd-a110-903e734739f3@ideasonboard.com>
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
        <20221101132032.1542416-4-tomi.valkeinen@ideasonboard.com>
        <20221102172630.GA4140587-robh@kernel.org>
        <6c254d5f-9fa1-b06a-4edb-7e58e4b33101@ideasonboard.com>
        <fb9e9d5e-9c8b-1ce2-5723-efa498d1ba93@fi.rohmeurope.com>
        <8360ac8f-64aa-9edd-a110-903e734739f3@ideasonboard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Tomi, Matti, Wolfram,

On Thu, 3 Nov 2022 14:32:02 +0200
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:

> On 03/11/2022 14:13, Vaittinen, Matti wrote:
> > On 11/3/22 13:50, Tomi Valkeinen wrote: =20
> >> Hi Rob,
> >>
> >> On 02/11/2022 19:26, Rob Herring wrote: =20
> >>> On Tue, Nov 01, 2022 at 03:20:27PM +0200, Tomi Valkeinen wrote: =20
> >>>> +
> >>>> +=C2=A0 i2c-alias-pool: =20
> >>>
> >>> Something common or could be? If not, then needs a vendor prefix. =20
> >>
> >> I'll have to think about this. It is related to the i2c-atr, so I think
> >> it might be a common thing. =20
> >=20
> > I'd say this should be common. Where the i2c-atr properties should live
> > is another question though. If the I2C-atr stays as a genericly usable
> > component - then these bindings should be in a file that can be
> > referenced by other I2C-atr users (like the UB960 here). =20
>=20
> Yep. All the links, link, serializer and alias nodes/properties are new=20
> things here, and I guess these could be used by other deser-ser systems.=
=20
> That said, I don't have any experience with other systems.

The i2c-alias-pool was discussed during the RFC,v2 review [1] and it
was agreed that it should be generic. The same principle should apply
to the other ATR properties.

That said, at some point it was also decided that the alias pool should
just be ditched in favor of an automatic selection of an unused address
by the i2c core [2] [3]. Maybe that idea has changed, definitely some
i2c core things needed to be omdified for it to happen, but overall I'm
still convinced automatic assignment without a pool was a good idea.

> >>>> +
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c-alias: =
=20
> >>>
> >>> Vendor prefix.
> >>> =20
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
description: |
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 The i2c address used for the serializer. Transactions
> >>>> to this
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 address on the i2c bus where the deserializer resides are
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 forwarded to the serializer.
> >>>> +
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rx-mode: =20
> >>>
> >>> Vendor prefix. And so on... > =20
> >> Yes, I totally missed these. =20
> >=20
> >=20
> > I think the i2c-alias might need to be common as well? =20
>=20
> Perhaps...
>=20
> I was also thinking that the serializer addresses could be taken from=20
> the i2c-alias-pool. But maybe that's not a good idea, as the=20
> serializer-access and remote-peripheral-access are a bit different (e.g.=
=20
> no ATR when accessing the serializer).
>=20
> And I was thinking that, at least here, the alias addresses can be=20
> "anything", so they could be reserved dynamically at runtime, without=20
> any predefined aliases. But that might be a bit confusing to the user.

I think the serialized alias selection is in an intermediate situation
between the deser and the remove chips. For the deser there is a
physical address, nothing strange. For the remote chips, lots of things
could happen, including having several chips. The serializer is in
known quantity (one per connector) and the fact that it is "on the
remote bus" is also somewhat false as it does create the remote bus
itself. Thus for me it would make sense to keep the current structure
(which is quite simple) but mine in not a strong position.

[1]
https://lore.kernel.org/lkml/CAL_JsqKDkixeDJJVxbzWebD6nqMHyk6QqDGSKrQho0THj=
LdmKQ@mail.gmail.com/

[2] https://lore.kernel.org/lkml/20190903093455.GD1020@kunai/

[3] https://lucaceresoli.net/plumbers-i2c-bof/

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
