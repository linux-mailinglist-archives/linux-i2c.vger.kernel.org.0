Return-Path: <linux-i2c+bounces-14685-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16284CD727C
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 21:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D29DC30213F7
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 20:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C873E3370F3;
	Mon, 22 Dec 2025 20:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LP7gtx86"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527B730BF5C;
	Mon, 22 Dec 2025 20:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766436748; cv=none; b=P4vZu9OzXvxjPxH6Jf6FjB+EbGZJVdO096TXlQsXJvJ2sFu9ze2kiD3ebkVxbf05ljSda9crU2djaTw24ZMGXPkMKDiiMYEKdh5od/bhrRCxq22KJIuDDFxnpctSWIm7s42y8gC0LeNirJuVS7QpQXs23PDQnkuKyeRuLA4cgd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766436748; c=relaxed/simple;
	bh=OdmgDnlZXoaijslX7KX93Y/AqjvNgxBPHYAqXwXXxdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nG8DZIUFjajf0kCx5hBZ6Qz6Wx0FzHeuEPfWo657KjHhAz+vM+0RaiKtBNLR7NduQx0tbi5C6i7M9pzpac+w//aM8sXB/XywFXnwkpRbbPugpwfTGHBdNCaKWxG08P6xnyF0sSEPG36ZKtTwa7JMS4ZbE4NC1ax0hAmeS8wLaK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LP7gtx86; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B847C4CEF1;
	Mon, 22 Dec 2025 20:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766436747;
	bh=OdmgDnlZXoaijslX7KX93Y/AqjvNgxBPHYAqXwXXxdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LP7gtx86RAzVh7qT2KAGSn+4voGagDkW1iJjRP9zR2DHX1Gkye0aa7mpl26h01aLY
	 H2ymWDiTnXueFfgNVtKqlSkXS3TPx+LDfNTXfBMQCR5+AyeKuceONQCA+7M1D/CETo
	 zgAZsfuTEvRrpGhJrnS+4BxU0KPY2+iMpNcwxLtgQlgKR5okQBc39yUbWU5nA4UTUT
	 Fr1dPchs/v3bABcoZw4cFOcs/pTPumX0qg+2AvJQ8s94UU7LiPaGtyu+vR+WioKhgt
	 jMT5X+3diCmXjtgC9rKh7oo7GK+Kvksd4oiGgF3KVkaEGPCMlSL7rgkIt+AEzkCf3M
	 kYXgPlKyAUR/A==
Date: Mon, 22 Dec 2025 20:52:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	linux@roeck-us.net, andi.shyti@kernel.org, lee@kernel.org,
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linusw@kernel.org, olivia@selenic.com,
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, richardcochran@gmail.com,
	wsa+renesas@sang-engineering.com, romain.sioen@microchip.com,
	Ryan.Wanner@microchip.com, lars.povlsen@microchip.com,
	tudor.ambarus@linaro.org, charan.pedumuru@microchip.com,
	kavyasree.kotagiri@microchip.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org,
	mwalle@kernel.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v2 16/19] dt-bindings: pinctrl: pinctrl-microchip-sgpio:
 add LAN969x
Message-ID: <20251222-outsell-demotion-97b03a1bf42e@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-16-robert.marko@sartura.hr>
 <20251216-payback-ceremony-cfb7adad8ef1@spud>
 <CA+HBbNESUZ6KB0BbpZUMfh1rjZTZMgY1SwmFQbx+CRP+a_1x9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JhIlysxRG7haAr0O"
Content-Disposition: inline
In-Reply-To: <CA+HBbNESUZ6KB0BbpZUMfh1rjZTZMgY1SwmFQbx+CRP+a_1x9g@mail.gmail.com>


--JhIlysxRG7haAr0O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 08:57:14PM +0100, Robert Marko wrote:
> On Tue, Dec 16, 2025 at 6:34=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Mon, Dec 15, 2025 at 05:35:33PM +0100, Robert Marko wrote:
> > > Document LAN969x compatibles for SGPIO.
> > >
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > >  .../pinctrl/microchip,sparx5-sgpio.yaml       | 20 ++++++++++++++---=
--
> > >  1 file changed, 15 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,spar=
x5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-=
sgpio.yaml
> > > index fa47732d7cef..9fbbafcdc063 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpi=
o.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpi=
o.yaml
> > > @@ -21,10 +21,15 @@ properties:
> > >      pattern: '^gpio@[0-9a-f]+$'
> > >
> > >    compatible:
> > > -    enum:
> > > -      - microchip,sparx5-sgpio
> > > -      - mscc,ocelot-sgpio
> > > -      - mscc,luton-sgpio
> > > +    oneOf:
> > > +      - enum:
> > > +          - microchip,sparx5-sgpio
> > > +          - mscc,ocelot-sgpio
> > > +          - mscc,luton-sgpio
> > > +      - items:
> > > +          - enum:
> > > +              - microchip,lan9691-sgpio
> > > +          - const: microchip,sparx5-sgpio
> > >
> > >    '#address-cells':
> > >      const: 1
> > > @@ -80,7 +85,12 @@ patternProperties:
> > >      type: object
> > >      properties:
> > >        compatible:
> > > -        const: microchip,sparx5-sgpio-bank
> >
> > This should just be able to become "compatible: contains: const: microc=
hip,sparx5-sgpio-bank.
> > pw-bot: changes-requested
>=20
> Hi Conor,
> I have tried using contains, but it would fail to match with the
> following error:
> arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb:
> /axi/gpio@e2010230/gpio@0: failed to match any schema with compatible:
> ['microchip,lan9691-sgpio-bank', 'microchip,sparx5-sgpio-bank']
> arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dtb:
> /axi/gpio@e2010230/gpio@1: failed to match any schema with compatible:
> ['microchip,lan9691-sgpio-bank', 'microchip,sparx5-sgpio-bank']

Oh, I think I cocked up here and thought this was some restriction
imposition but it's a child with a compatible. My bad.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--JhIlysxRG7haAr0O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUmvfgAKCRB4tDGHoIJi
0tRXAP9gzDqYdpyBkIGlCjn7mhzBtUAutbY+XxoO8Nlc7hwxmwEAkw67FpKyZJTF
kOylRNmtyQKnS0TafkT2Y8FTAU67FwU=
=dRXc
-----END PGP SIGNATURE-----

--JhIlysxRG7haAr0O--

