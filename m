Return-Path: <linux-i2c+bounces-12162-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1849CB1ECD2
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Aug 2025 18:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD59F1C21A67
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Aug 2025 16:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E3428640F;
	Fri,  8 Aug 2025 16:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kM6QnpNW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB7379CD;
	Fri,  8 Aug 2025 16:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754669280; cv=none; b=LuxN+AGblMQ93cGjyZZKAu9IkJEIdUNOJSuRHDa+P6ktsorPTCaORD18oV9gfWnecXgwJWjoC8cqeMnbio3g3iLsg8+fxdQg6xGvGdUTN3Tv25Xu7wKOdNzPSd3CV/TNvhFxCSDj+gAT3255ioXi59PCRYdYu45H5T6IxjeHFqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754669280; c=relaxed/simple;
	bh=X1HyUdIzzadSIJ9P6pejrZwtipW8T00o1QaRFEHmHyg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mYmzGSPDAGywr1Kuzru51ZYLmQyjj9WH8Ne/4pnEPKOE+M/opCwnNHTD4HzMd5h30lnhQzfntOD2nEPhf69SuLDR2mhT8Oc/iDeKMryq4ESB5ol121Ww0bNCfUZooMEiahHzDSyk7nbxAx6C5gyU9GgCVePU2UxrvI+AsXYve1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kM6QnpNW; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDB4D44380;
	Fri,  8 Aug 2025 16:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754669270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CwxuZRcIL0K9SXTSDkik9eTSLuO290wVxQgkHReMc0A=;
	b=kM6QnpNW/9J2Cb6+CuPw3sr+2Gg4t1/dVq2HzxRh4V6pfC+ri+0XrXJbkmtCuHEn3C4vPP
	zN4XeJFZ3jxsPlD+5yA0h13XBjGWONvhyhQMa3RU/+sQ7g0Vku4lQ4ExZZQkmiXR4oxLQ6
	eUh2R6UMOjDcVoOUYlRCBioDweQAeDhTt0f52U8y9U2yj/KcKsFosrs50Jv3vwPOiFRJAF
	rhz1Z1IDTKfNO1uQPDsPCMPvZbcX/+GV0UFVHLynD9Z0CP7LcYk/+faUdtaGQe7n1ew8Bl
	bWElCHXfhVAMDOcv9q8XvJYMwCTuqi2VktmwxbzyQmDhMAIxf+2vMqQi0ySXkA==
Date: Fri, 8 Aug 2025 18:07:46 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Ayush Singh
 <ayush@beagleboard.org>, Andi Shyti <andi.shyti@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree-spec@vger.kernel.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 1/1] schemas: i2c: Introduce I2C bus extensions
Message-ID: <20250808180746.6fa6a6f9@booty>
In-Reply-To: <CAL_JsqJ=jmXVwjtNCjRpUKj02dnJEz4GHMX2wMRaWw=M+sZQ0w@mail.gmail.com>
References: <20250618082313.549140-1-herve.codina@bootlin.com>
 <20250618082313.549140-2-herve.codina@bootlin.com>
 <CAL_JsqJ=jmXVwjtNCjRpUKj02dnJEz4GHMX2wMRaWw=M+sZQ0w@mail.gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdegvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfekieegtefhgeelieehhefgtdekffevgfegvdeggeelkeehjeetteethfevudfgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepjeekrddvuddvrddvjedrudduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejkedrvdduvddrvdejrdduudehpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdro
 hhrghdprhgtphhtthhopegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Rob, Wolfram,

[this e-mail is co-written with Herv=C3=A9]

Rob, Wolfram: this e-mail mentions DT description together with
implementation ideas, but both of your opinions are very relevant here.

On Fri, 1 Aug 2025 13:09:54 -0500
Rob Herring <robh@kernel.org> wrote:

> On Wed, Jun 18, 2025 at 3:23=E2=80=AFAM Herve Codina <herve.codina@bootli=
n.com> wrote:
> >
> > An I2C bus can be wired to the connector and allows an add-on board to
> > connect additional I2C devices to this bus.
> >
> > Those additional I2C devices could be described as sub-nodes of the I2C
> > bus controller node however for hotplug connectors described via device
> > tree overlays there is additional level of indirection, which is needed
> > to decouple the overlay and the base tree:
> >
> >   --- base device tree ---
> >
> >   i2c1: i2c@abcd0000 {
> >       compatible =3D "xyz,foo";
> >       i2c-bus-extension@0 { =20
>=20
> This is at I2C bus address 0? No. You are mixing 2 different address
> spaces. Don't do that.
>=20
> You could solve this with just a property in the parent. If there's
> more than 1, then it's just multiple phandles. However I don't think
> you need this at all. You can just search the DT for 'i2c-parent' and
> find phandles that match the i2c controller node. But why does the
> controller driver need to know about connectors? Shouldn't the
> connector driver drive this and tell the controller there's more
> devices?

These were the concerns you had raised last April [0], so let's continue
from there and Herv=C3=A9's follow-up.

Herv=C3=A9's position was that a double-reference is more effective as every
interested party (the i2c adapter and the i2c extension node) have an
explicit description of the connected party/parties. Besides, this looks
consistent with the bidirectional links in remote-endpoints, which has
similarities.

OTOH I agree a single-direction link (i2c extension node to i2c
adapter) should work, in principle. However there are issues, mainly in
how an adapter finds out about the extensions when it is probed after
them.

Your proposal of searching the whole tree involves a lot of searches in
a potentially large tree, even though I don't expect it to happen often
at least for the use cases I'm aware of.

But, more important, Herv=C3=A9 pointed out an "i2c-parent" property is
already used for different purposes (i2c muxes). We could choose
another string but that would be fragile too.


One idea is to unambiguously mark i2c bus extension nodes with a
compatible string:

  connector {
      i2c_ctrl: i2c-ctrl {
          compatible =3D "i2c-bus-extension"; // <-----
          i2c-parent =3D <&i2c1>;
          #address-cells =3D <1>;
          #size-cells =3D <0>;
      };
  };

And then implementing a device driver for the i2c bus extension.

This would allow to ensure extensions are probed after their adapter
(thanks to probe deferral) and at that point can register themselves at
the adapter. In other words the device driver core would provide the
synchronization between adapter, bus extension, and devices on the bus
extension.


A different option is to only have the "i2c-parent" phandle in the
extension node and nothing else in DT (no bidirectional link, no
compatible string), without any full-tree searches.

On the implementation side, the connector driver when probing would
register the extension nodes at the I2C core, which would maintain a
list of extension nodes. This is important when the connector probes
first. Then when any adapter probes the core would iterate over the
list to check whether the newly-probed adapter is pointed to by one of
the registered bus extensions, and then start populating the devices on
the matching bus extension(s).

A lot of care would have to be put in the disconnection path and while
removing any bus extension from the global list, which could race with
the I2C core using the list itself. The drive core wouldn't do it for
us for free.


Rob, Wolfram, what are your opinions about these options, and which is
worth pursuing? Do you have better proposals?

[0] https://lore.kernel.org/all/20250402102123.30391c27@bootlin.com/

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

