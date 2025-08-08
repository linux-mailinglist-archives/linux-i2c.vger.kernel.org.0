Return-Path: <linux-i2c+bounces-12165-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A48B1EFEE
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Aug 2025 22:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF3131C27DF5
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Aug 2025 20:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E219238D49;
	Fri,  8 Aug 2025 20:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBKeL+SY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AC922A7E9;
	Fri,  8 Aug 2025 20:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754686301; cv=none; b=SLDrCuhZ1sbD3wJNHA1+rLwqnOe29SMLwLUhWktRtEJy9ocxH++aD2sepDe5DNULaXIXKvaq0YRUeu/WmOLuJbXyU7T7B+njsVQ2ZQlNudheq+GmVYwu5b/QhiXznV9AhoVa9YaZYs79cdBoFz+C4zlzlzUbA1v+cDb4vBzLJsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754686301; c=relaxed/simple;
	bh=4c7dcO8cBD9ikUvxoVP8jATQy3ONCOqQNTHYEuyQBdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8MZjJrXltjmCATUInNeU26SibSI0+q4tvOTWoX7dpBz2NFbuxYb5XIxEoDxb029L/rzvnaNBZ3WjhIzw5TTSmvDo7eogyl9yLdbl+BtodhxKW85Mu8TXCIxsq8si2KSDwtYPtfEtrXCNRuQQ3bn6gJ8mE3K7SkFOXIbBKSvUZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBKeL+SY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B722C4CEED;
	Fri,  8 Aug 2025 20:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754686301;
	bh=4c7dcO8cBD9ikUvxoVP8jATQy3ONCOqQNTHYEuyQBdM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QBKeL+SYcyEzKbbmBSU8UI8p/fIkhmUUjyV0ltEVrmhRNTCnGbX4zICtQx9RHJ8le
	 FdIy1QH8Hvm7vP2i+gBSjJJLuFG/ApPppzWaBfhK4mu0AakIYYonLilAmBxao0pRbW
	 toFGjGu7RKKSRjntZntsdrQYPu3QniGr7YOd44klA0ugoTT6rFk76dxOF1Cbc0GGg5
	 i1e4/94Z683Voo62ISDXcvvf8B0zCcOYprU7SA7w4tZMBaVjGZzRd6/dXEd1wl31GQ
	 7gJ68jGMOJoaxqKVuyUZqxicIN4OS27nKHrNm4i3BS0z+RXpzKOH131Q+RnABBGsCD
	 ErdSwQxvYkD6g==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so485981966b.3;
        Fri, 08 Aug 2025 13:51:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVirRp3+FH5+7Ipy7Vi9uGdsFTkoeiZ7PhpX+b4qN3N8ms6Kg9rgVmFsutSVM6SBePUMwNM9pt8MSk+8RQjIs=@vger.kernel.org, AJvYcCUdXV7FwS0Kfr3qATG5rXVE2ZcgeOCIe2tfKSAmeV+SzF2H/m+zAUBSOO5I10MVsN6Q/6PM+DbgA7wTJQ==@vger.kernel.org, AJvYcCVDVxhHlSGp9Jl6YhYiw85/APKV1S3UuRTxDH9PTX1u8Ue1wMzjpeckt+ks0zjxaFJ4X0QO+fpjaHWr@vger.kernel.org, AJvYcCWeSDWKJoTw1paaS1b9/w712o6Tbh5MA0bbtEuQLbg/LzdJux6v/7noixZH4U0NFaS//5QcDxqNA/P1QGvH@vger.kernel.org
X-Gm-Message-State: AOJu0YyK+qHDme28Vm/TUfQ3tWFrYoX1dgbfZik1J2JpJPznKky0pUDR
	jnWOE5IcEFEc60LkEje5zG4mtcSBeOrnUJ+IGUyVKA+KPhp6ZE/9Y10vg+Fm5Co6i8S/iZD8U1B
	eMXv29OyMCy5BlHI9qCIOss+yZAl4Ug==
X-Google-Smtp-Source: AGHT+IHQrJOpK4XiBNspBEI4oq5Xzca+wGsnB52qjjmM0BV3Gl1mLQdv12KkSYu/KBIFOkihP1JJ+EasJRhG0Q8Mn4g=
X-Received: by 2002:a17:907:7f90:b0:af1:8be4:768 with SMTP id
 a640c23a62f3a-af9c6342033mr407595666b.5.1754686299856; Fri, 08 Aug 2025
 13:51:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618082313.549140-1-herve.codina@bootlin.com>
 <20250618082313.549140-2-herve.codina@bootlin.com> <CAL_JsqJ=jmXVwjtNCjRpUKj02dnJEz4GHMX2wMRaWw=M+sZQ0w@mail.gmail.com>
 <20250808180746.6fa6a6f9@booty>
In-Reply-To: <20250808180746.6fa6a6f9@booty>
From: Rob Herring <robh@kernel.org>
Date: Fri, 8 Aug 2025 15:51:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLxsfpaaCvV3AcniMYxAYVir7ddL4umCNY3u-ggVTiZcg@mail.gmail.com>
X-Gm-Features: Ac12FXyhc30cIfb-qG-xW4VJNYGcYBf6hXqiZhkdeEr39aHdgFnYaIY8y6lXS78
Message-ID: <CAL_JsqLxsfpaaCvV3AcniMYxAYVir7ddL4umCNY3u-ggVTiZcg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] schemas: i2c: Introduce I2C bus extensions
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Herve Codina <herve.codina@bootlin.com>, Ayush Singh <ayush@beagleboard.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 8, 2025 at 11:08=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Rob, Wolfram,
>
> [this e-mail is co-written with Herv=C3=A9]
>
> Rob, Wolfram: this e-mail mentions DT description together with
> implementation ideas, but both of your opinions are very relevant here.
>
> On Fri, 1 Aug 2025 13:09:54 -0500
> Rob Herring <robh@kernel.org> wrote:
>
> > On Wed, Jun 18, 2025 at 3:23=E2=80=AFAM Herve Codina <herve.codina@boot=
lin.com> wrote:
> > >
> > > An I2C bus can be wired to the connector and allows an add-on board t=
o
> > > connect additional I2C devices to this bus.
> > >
> > > Those additional I2C devices could be described as sub-nodes of the I=
2C
> > > bus controller node however for hotplug connectors described via devi=
ce
> > > tree overlays there is additional level of indirection, which is need=
ed
> > > to decouple the overlay and the base tree:
> > >
> > >   --- base device tree ---
> > >
> > >   i2c1: i2c@abcd0000 {
> > >       compatible =3D "xyz,foo";
> > >       i2c-bus-extension@0 {
> >
> > This is at I2C bus address 0? No. You are mixing 2 different address
> > spaces. Don't do that.
> >
> > You could solve this with just a property in the parent. If there's
> > more than 1, then it's just multiple phandles. However I don't think
> > you need this at all. You can just search the DT for 'i2c-parent' and
> > find phandles that match the i2c controller node. But why does the
> > controller driver need to know about connectors? Shouldn't the
> > connector driver drive this and tell the controller there's more
> > devices?
>
> These were the concerns you had raised last April [0], so let's continue
> from there and Herv=C3=A9's follow-up.
>
> Herv=C3=A9's position was that a double-reference is more effective as ev=
ery
> interested party (the i2c adapter and the i2c extension node) have an
> explicit description of the connected party/parties. Besides, this looks
> consistent with the bidirectional links in remote-endpoints, which has
> similarities.

In a complex graph, you need to be able to walk from any node to
another node. I don't think that applies here.

> OTOH I agree a single-direction link (i2c extension node to i2c
> adapter) should work, in principle. However there are issues, mainly in
> how an adapter finds out about the extensions when it is probed after
> them.

We've had other cases such as i2c-parent and ddc-i2c-bus for years.
Wouldn't those have the same issue? Maybe they do and just ignored it.
If so, too late to change their DT and the kernel has to solve the
problems there anyways...

> Your proposal of searching the whole tree involves a lot of searches in
> a potentially large tree, even though I don't expect it to happen often
> at least for the use cases I'm aware of.

Right. And the need to do that entirely depends on the I2C core
needing to scan the whole tree. Surely that's not actually the case.
How does adding a device by overlay (as a direct child) work? If the
I2C core just scans the child nodes again, don't we just need to
change it to scan somewhere else? Seems like that would be simple
enough change.

> But, more important, Herv=C3=A9 pointed out an "i2c-parent" property is
> already used for different purposes (i2c muxes). We could choose
> another string but that would be fragile too.

It's the same purpose. Linking an i2c bus to somewhere else in the
tree. I don't see why a connector/overlay is special here.

> One idea is to unambiguously mark i2c bus extension nodes with a
> compatible string:
>
>   connector {
>       i2c_ctrl: i2c-ctrl {
>           compatible =3D "i2c-bus-extension"; // <-----
>           i2c-parent =3D <&i2c1>;
>           #address-cells =3D <1>;
>           #size-cells =3D <0>;
>       };
>   };
>
> And then implementing a device driver for the i2c bus extension.

I generally will never argue against adding a compatible...

> This would allow to ensure extensions are probed after their adapter
> (thanks to probe deferral) and at that point can register themselves at
> the adapter. In other words the device driver core would provide the
> synchronization between adapter, bus extension, and devices on the bus
> extension.

Can't the parent (the connector node) driver do the same thing and
defer if any i2c-parent phandles drivers aren't probed?

> A different option is to only have the "i2c-parent" phandle in the
> extension node and nothing else in DT (no bidirectional link, no
> compatible string), without any full-tree searches.
>
> On the implementation side, the connector driver when probing would
> register the extension nodes at the I2C core, which would maintain a
> list of extension nodes. This is important when the connector probes
> first. Then when any adapter probes the core would iterate over the
> list to check whether the newly-probed adapter is pointed to by one of
> the registered bus extensions, and then start populating the devices on
> the matching bus extension(s).
>
> A lot of care would have to be put in the disconnection path and while
> removing any bus extension from the global list, which could race with
> the I2C core using the list itself. The drive core wouldn't do it for
> us for free.

I'll defer to Wolfram on I2C core implementation...


Rob

