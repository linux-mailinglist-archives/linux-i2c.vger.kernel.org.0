Return-Path: <linux-i2c+bounces-11033-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB990ABC20E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 17:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2E804A3166
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 15:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C200285404;
	Mon, 19 May 2025 15:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="frnhOcHk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875312746A;
	Mon, 19 May 2025 15:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667801; cv=none; b=sZk32WzQV91Xs6gRDqbj6qKzR8POhq9M0GCT1hBXmQOajEtejsiCGlfobSecp1lv8goR9TAIPejIerESm59DGSDzC1Lv7tX20V/WSdxe7krpN+06AbshGjF+0BoqLHojvC+O8OImUGdoCQ8Gf4en7pNdIHpiW0OG9iHjHIeYKwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667801; c=relaxed/simple;
	bh=dIjfsbvuKpv6FNDMYT0qk3KQ3CM+SITjSH1AsPbbXss=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WKu3q09LHfUSewT49WZo+oYaM65yocnEy8IgI07F5WtZlOKUCAzcfcPe0lLiKf7+77NPsV0i07IiuxZuJRhUuX/2Ok3Z2eUNSvgtdRENtqFp8QKQItk311cK+3qf2I74luzRIfDOqbihVY9E0u8g5jXrE/ITULtU83psruU5yA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=frnhOcHk; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06A8443A2F;
	Mon, 19 May 2025 15:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747667791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2wQIT894SQnF9B43BAXvpVRW81bs6p0fZUPIOxbNKi4=;
	b=frnhOcHkyXiwP6GvtKz99dhW7VYYrYNx7PpnkUB0nIG7MfN5HyqajRVS9TdcLY14i8gKWs
	8wAWcqLiVTDzZUC0WpPOWLOzvTYuC34UTtjUStslX4fTDku+OQXynL+sb25vu/3HryI8CY
	Lpskap2J9FdH5evionIK+RwIF6l+mLZ4BDUvG4jYYG5IbfK1iBNyeC/UrrjVkYg3ts4z0T
	wvGJoqX9gUSu5RtRDqijsiLH4mqvqUBjVuOeqOb9VLsIXnX/nojv+0OplD3rRoNrKLxjTw
	8o9dZHy7e6W4BY1ClOUHTyUOEOFyiW7ckAibvmXDHg0cjozHJS48TeT8kKddsg==
Date: Mon, 19 May 2025 17:16:26 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan
 <saravanak@google.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, Paul Kocialkowski
 <contact@paulk.fr>, =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v4 6/8] backlight: led-backlight: add devlink to
 supplier LEDs
Message-ID: <20250519171626.2885902f@booty>
In-Reply-To: <20240920144113.427606a7@booty>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
	<20240917-hotplug-drm-bridge-v4-6-bc4dfee61be6@bootlin.com>
	<20240919124323.GB28725@aspen.lan>
	<20240920144113.427606a7@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddujeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteekieeihfevhfffieehiefgfeeutdduueeggeffieejgeefhfdthfeugeefvdegnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefgedprhgtphhtthhopegurghnihgvlhdrthhhohhmphhsohhnsehlihhnrghrohdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodguthesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Daniel,

I wonder whether you remember about this conversation...

On Fri, 20 Sep 2024 14:41:13 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Hello Daniel,
>=20
> On Thu, 19 Sep 2024 14:43:23 +0200
> Daniel Thompson <daniel.thompson@linaro.org> wrote:
>=20
> > On Tue, Sep 17, 2024 at 10:53:10AM +0200, Luca Ceresoli wrote: =20
> > > led-backlight is a consumer of one or multiple LED class devices, but=
 no
> > > devlink is created for such supplier-producer relationship. One conse=
quence
> > > is that removal ordered is not correctly enforced.
> > >
> > > Issues happen for example with the following sections in a device tree
> > > overlay:
> > >
> > >     // An LED driver chip
> > >     pca9632@62 {
> > >         compatible =3D "nxp,pca9632";
> > >         reg =3D <0x62>;
> > >
> > > 	// ...
> > >
> > >         addon_led_pwm: led-pwm@3 {
> > >             reg =3D <3>;
> > >             label =3D "addon:led:pwm";
> > >         };
> > >     };
> > >
> > >     backlight-addon {
> > >         compatible =3D "led-backlight";
> > >         leds =3D <&addon_led_pwm>;
> > >         brightness-levels =3D <255>;
> > >         default-brightness-level =3D <255>;
> > >     };
> > >
> > > On removal of the above overlay, the LED driver can be removed before=
 the
> > > backlight device, resulting in:
> > >
> > >     Unable to handle kernel NULL pointer dereference at virtual addre=
ss 0000000000000010
> > >     ...
> > >     Call trace:
> > >      led_put+0xe0/0x140
> > >      devm_led_release+0x6c/0x98   =20
> >=20
> > This looks like the object became invalid whilst we were holding a refe=
rence
> > to it. Is that reasonable? Put another way, is using devlink here fixin=
g a
> > bug or merely hiding one? =20
>=20
> Thanks for your comment.
>=20
> Herv=C3=A9 and I just had a look at the code and there actually might be a
> bug here, which we will be investigating (probably next week).
>=20
> Still I think the devlink needs to be added to describe the
> relationship between the supplier (LED) and consumer (backlight).

It took "slightly more" than "next week", but we are here finally. In
reality this topics went pretty much forgotten until Alexander
Sverdlin's feedback [0].

About your concern, I'm not totally sure devlink is the tool expected
to solve this issue, but if it isn't I don't know any other tool that
should.

In other words, because devlink is exactly meant to represent
supplier-consumer relationships and enforce them to be respected, it
seems the appropriate tool. Moreover devlink already handles such
relationships quite well in many cases, and takes care of removing
consumers before their suppliers, when suppliers get removed.

One missing piece in devlink is it doesn't (yet) handle class devices
correctly. When the supplier is a class device (such as the LED device
in this case), then devlink creates a link to the parent of the
supplier, and not the supplier itself.

This problem is well known and it is under Saravana's radar. Adding
such devlinks at the device core level would be of course be the best
and most generic solution, but it seems to be much more tricky that it
may look. So other drivers and subsystems are "manually" creating
devlinks, to have the right links in place until devlink can figure
them out automatically. Some examples ('git grep device_link_add' for
more):

  https://elixir.bootlin.com/linux/v6.14.7/source/drivers/pwm/core.c#L1660
  https://elixir.bootlin.com/linux/v6.14.7/source/drivers/iio/industrialio-=
backend.c#L710
  https://elixir.bootlin.com/linux/v6.14.7/source/drivers/pmdomain/imx/gpc.=
c#L204

I hope this clarifies the need for this patch.

I am going to send this patch alone in a moment, detached from the
entire series because it is orthogonal.

[0]
https://lore.kernel.org/all/fa87471d31a62017067d4c3ba559cf79d6c3afec.camel@=
siemens.com/

Best regards,
Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

