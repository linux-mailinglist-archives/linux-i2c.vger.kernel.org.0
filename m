Return-Path: <linux-i2c+bounces-10085-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 001D4A789B1
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Apr 2025 10:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D6753B008F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Apr 2025 08:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B44D2343D4;
	Wed,  2 Apr 2025 08:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cqDeX7tJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC7416BE17;
	Wed,  2 Apr 2025 08:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582099; cv=none; b=Oq65cxdxOl2J9kk1SD/JgqqU1NemmadwHnbUJMWyBakBKzL0wYoEJSLeiC4VSjJ07PbQCaRzljNaXbaxRmzedpoVns6FOdNiDw8NDsogtkpKW7PDy1Tl8/kvR1PRSDvx/CY/jFCKKhtJmKkzoRc9N/ItEmTvkz/k0MHj7CPNP8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582099; c=relaxed/simple;
	bh=FzIdtssoh1ZswIb6lX8OboLIPFlDBLaSDDX/2SSlt1I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e6n/k4qqfOO2YxhUMc2W0G2tg6TUaX63WaTn44wl7kEM8wR6WEP3+9y8IicIeom7hyPZIIJ87ppvGCLXsNPvYRDi0f6ekxRWGNTSRgFHxm5a51w4B1a/GoS2Ww4hf0/k4THfQofA4fLI365FagCXfQnlJwI5F5kZGqIDvB23Tbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cqDeX7tJ; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 742D342F79;
	Wed,  2 Apr 2025 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743582087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=10c1hcVtWwdn5TSf2bmqTet6eee8P0mCxC4dhOWTH74=;
	b=cqDeX7tJ6ChKUa0DuSlVoKLZRitka0bEK9LmJJlLGQhzKeqODIYXWWKaetPK8d5vOHvjPI
	Q2t5bYKdt04EBzn1BdYhHnb2xXntvTCqo82U7KnFsCjrwXXIsLYdtBa8geWLAc1BIhRhZ5
	bg52PcNE3NarSeqAJ7LaYFGPT1YssAHpoYxkYrXjRREg4D8pXDFOBLWFMGgzsFS3WQ/FDA
	pxP+N0T3gnJf3KhCrtliZI9oxCILidJmdaD3QG0ucg/C29NhyBD7W9ZouDBB7A5qWXCZEj
	3L8lZxHFxp22WCOyU6keKIkXCM2ejf50dfRWUX+05EELe+Pba2Nr1XrBy6POyA==
Date: Wed, 2 Apr 2025 10:21:23 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti
 <andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/2] schemas: i2c: Introduce I2C bus extensions
Message-ID: <20250402102123.30391c27@bootlin.com>
In-Reply-To: <CAL_JsqKQdzDzAYHDctP-nmrONBynRfi-qyncnyj10r4xZNrx1A@mail.gmail.com>
References: <20250401081041.114333-1-herve.codina@bootlin.com>
	<20250401081041.114333-3-herve.codina@bootlin.com>
	<CAL_JsqKQdzDzAYHDctP-nmrONBynRfi-qyncnyj10r4xZNrx1A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfefiefhiedvvdeljeekueeghfefffekgeeuheeludeiheetteejvdeiieejveeunecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhto
 heplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com

Hi Rob,

On Tue, 1 Apr 2025 09:03:23 -0500
Rob Herring <robh@kernel.org> wrote:

> On Tue, Apr 1, 2025 at 3:11=E2=80=AFAM Herve Codina <herve.codina@bootlin=
.com> wrote:
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
> >       compatible =3D "xyz,i2c-ctrl";
> >       i2c-bus-extension@0 { =20
>=20
> What does 0 represent? Some fake I2C address?
>=20
> Why do you even need a child node here?

0 represent the extension number. Multiple extensions can be connected
to a single i2c controller:
                                      +-------------+
  +------------+                 .----+ Connector 1 |
  |   i2c      |                 |    +-------------+
  | controller +---- i2c bus ----+
  +------------+                 |    +-------------+
                                 '----+ Connector 2 |
                                      +-------------+

I need a child node because extensions don't modify existing hardware (addi=
ng/removing
a property) but add an entry point, the extension for a new set of devices.
As it is not a existing hardware modification it is better represented as a=
 node.


Those extensions can be chained:
  +-----------------------------------+         +-------------------+
  | Base board                        |         | addon board       |
  |                                   |         |    +------------+ |
  | +------------+                    |         | .--+ i2c device | |
  | |   i2c      |             +-------------+  | |  +------------+ |
  | | controller +-- i2c bus --+ connector A +----+                 |
  | +------------+             +-------------+  | |          +-------------+
  +-----------------------------------+         | '----------+ connector B |
                                                |            +-------------+
                                                +-------------------+
The addon board is described using an overlay.

In that case, we have:
- base-board.dts:
    i2c0: i2c@cafe0000 {
        compatible =3D "xyz,i2c-ctrl";
        #address-cells =3D <1>;
        #size-cells =3D <0>;

        i2c-bus-extension@0 {
            reg =3D <0>;
            i2c-bus =3D <&i2c_connector_a>;
        };
        ...
    };

    connector-a {
        devices {
           /* Entry point for devices available on the addon
            * board that are not connected to a bus such as
            * fixed-clock, fixed-regulator, connectors, ...
            */
        };
        i2c_connector_a: i2c-connector-a {
            /* The i2c available at connector */
            #address-cells =3D <1>;
            #size-cells =3D <0>;
            i2c_parent <&i2c0>;
       };
    };

- addon-board.dtso
    __overlay__ { /* This is applied at connector_a node */
        i2c_connector_a: i2c-connector-a {
            /* We do not modify the existing device i2c_connector_a
             * by changing, adding or removing its properties but
             * we add new devices (sub-nodes)
             */

            /* The i2c device available in the addon-board */
            i2c-device@0x10 {
                compatible =3D "foo,bar";
                reg =3D 0x10;
            };

            /* The i2c extension forwarding the i2c bus */
            i2c-bus-extension@0 {
	        reg =3D <0>;
                i2c-bus =3D <&i2c_connector_b>;
            };
       };
      =20
       devices {
          /* addon-board connector b */
          connector_b {
              i2c_connector_b: i2c_connector_b {
              /* The i2c available at connector */
              #address-cells =3D <1>;
              #size-cells =3D <0>;
              i2c_parent =3D <&i2c_connector_a>;
          };
       };
   };

Without a child node for i2c-bus-extension, we need to add
properties on already existing node (i2c-connector-a) to add
the bus extension and adding/modifying/removing a property
on a device-tree node correspond to modifying the device
itself (description changed) whereas adding/removing sub-nodes
correspond to adding/removing devices handled by the parent
parent node of those sub-nodes.

=46rom the controller point of view, an extension is "a collection of
devices described somewhere else in the device-tree and connected
to the I2C SDA/SCL pins". Having that described as a sub-node seems
correct.

>=20
> >           i2c-bus =3D <&i2c_ctrl>;
> >       };
> >       ...
> >   };
> >
> >   i2c5: i2c@cafe0000 {
> >       compatible =3D "xyz,i2c-ctrl";
> >       i2c-bus-extension@0 {
> >           i2c-bus =3D <&i2c-sensors>;
> >       };
> >       ...
> >   };
> >
> >   connector {
> >       i2c_ctrl: i2c-ctrl {
> >           i2c-parent =3D <&i2c1>;
> >           #address-cells =3D <1>;
> >           #size-cells =3D <0>;
> >       };
> >
> >       i2c-sensors {
> >           i2c-parent =3D <&i2c5>;
> >           #address-cells =3D <1>;
> >           #size-cells =3D <0>;
> >       };
> >   };
> >
> >   --- device tree overlay ---
> >
> >   ...
> >   // This node will overlay on the i2c-ctrl node of the base tree
> >   i2c-ctrl {
> >       eeprom@50 { compatible =3D "atmel,24c64"; ... };
> >   };
> >   ...
> >
> >   --- resulting device tree ---
> >
> >   i2c1: i2c@abcd0000 {
> >       compatible =3D "xyz,i2c-ctrl";
> >       i2c-bus-extension@0 {
> >           i2c-bus =3D <&i2c_ctrl>;
> >       };
> >       ...
> >   };
> >
> >   i2c5: i2c@cafe0000 {
> >       compatible =3D "xyz,i2c-ctrl";
> >       i2c-bus-extension@0 {
> >           i2c-bus =3D <&i2c-sensors>;
> >       };
> >       ...
> >   };
> >
> >   connector {
> >       i2c-ctrl {
> >           i2c-parent =3D <&i2c1>;
> >           #address-cells =3D <1>;
> >           #size-cells =3D <0>;
> >
> >           eeprom@50 { compatible =3D "atmel,24c64"; ... };
> >       };
> >
> >       i2c-sensors {
> >           i2c-parent =3D <&i2c5>;
> >           #address-cells =3D <1>;
> >           #size-cells =3D <0>;
> >       };
> >   };
> >
> > Here i2c-ctrl (same goes for i2c-sensors) represent the part of I2C bus
> > that is on the hot-pluggable add-on. On hot-plugging it will physically
> > connect to the I2C adapter on the base board. Let's call the 'i2c-ctrl'
> > node an "extension node".
> >
> > In order to decouple the overlay from the base tree, the I2C adapter
> > (i2c@abcd0000) and the extension node (i2c-ctrl) are separate nodes.
> >
> > The extension node is linked to the I2C bus controller in two ways. The
> > first one with the i2c-bus-extension available in I2C controller
> > sub-node and the second one with the i2c-parent property available in
> > the extension node itself.
> >
> > The purpose of those two links is to provide the link in both direction
> > from the I2C controller to the I2C extension and from the I2C extension
> > to the I2C controller. =20
>=20
> Why do you need both directions? An i2c controller can search the tree
> for i2c-parent and find the one's that belong to it. Or the connector
> can register with the I2C controller somehow.

Yes, but this is sub-optimal compare to the double-link references.

I discarded any kind of registering from the connector which implies
extra complexity compared to a simple double-link reference. In the I2C
path, the connector is really a passive component and fully transparent.
It should be transparent as well in the implementation.

Using only i2c-parent (i.e. the reference from extension to i2c controller)
works when the walk from extension to i2c controller but using it on the
other direction is not as trivial as it could be.

Indeed, starting from the i2c controller, we have to search for the entire
tree any i2c-parent that references the i2c controller.
Those i2c-parent can exist in node that are not at all related to i2c
extensions.

i2c-parent in all cases represents an i2c parent bus but not only for i2c
extensions. I2C muxes and some other devices use this property.

Here also, searching the entire tree for i2c-parent and being sure that
the property found is related to an I2C extension adds extra complexity
that is simply not present with the double-link references.

Best regards,
Herv=C3=A9

