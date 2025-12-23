Return-Path: <linux-i2c+bounces-14737-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F49CD9B4E
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 15:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73A5D303A8DA
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 14:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FDC3451BD;
	Tue, 23 Dec 2025 14:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfAKWHuF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E171DE4CE;
	Tue, 23 Dec 2025 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766501031; cv=none; b=diOwc07pYdXh/CE6PdckCZ+vuIr2S1DP7rpnEXSrcnEwec5mo7V89RloxCP01LztlMCLs18rTEAd496xWPsmWSIK2XpfKWUKTUbLAQZU9zkKIUwdbnPrK1DhdgU4uHbg87+T21A7vvmH3R4JkGUNcwwWw1KGYX9OwMVAqjKDJQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766501031; c=relaxed/simple;
	bh=dB/+cWWuWt5zZaOF4WBQgVGeqRwXMeabHbV/nLVmbvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afUMqXPURdEdsimcOfigUyw5QTDYU7iMSSmt2aHwZ7z7fgWsfGcWOSA9xefcJgLg7etEHbptUaWlqGnFyqaj8YIapBwr8GRVcwqRgZU/lJmBtdyO53iND/d2BoxdzRg8ANHYnonqNf/hLURzHfmK2YT0k/Zmab1RHv7W2ALggcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfAKWHuF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193F0C113D0;
	Tue, 23 Dec 2025 14:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766501030;
	bh=dB/+cWWuWt5zZaOF4WBQgVGeqRwXMeabHbV/nLVmbvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MfAKWHuFbtD0xW1u7oSpiVKbCSBZjKXbHZgHHl/15nnW/uyFFf4XJP00SoR3z9JdD
	 rYuxJy4cH27U8+zKbhG9PznjFiDGu1ksCvBhMD3oJNWdMMZASOUQMjEAt3urdm9mD/
	 bHhglQTjnotVIWBdxXhf5rB20ugMOrsi+w8SGJeJyft2KAgP42HsndKPDkA3fEyKC6
	 qrkF48gedAccR7Gu+3jMczbHecCVYIrFS8TL1t1oj9DsyxGEVyc/jq3ddSmGNNhEcq
	 iXl7U4o2uZdWtSEG6/m1F/+GqTMGBBhPJN8lA5bBa172Z5ogGGJV9RTOqtTP98FPAF
	 hNURvzP+WpGwQ==
Date: Tue, 23 Dec 2025 14:43:39 +0000
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
	tudor.ambarus@linaro.org, kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org, mwalle@kernel.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v2 18/19] dt-bindings: arm: microchip: document EV23X71A
 board
Message-ID: <20251223-chrome-simile-8cf1e9afe155@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-18-robert.marko@sartura.hr>
 <20251216-endorse-password-ae692dda5a9c@spud>
 <CA+HBbNF-=W7A3Joftsqn+A6s170sqOZ77jpS105s5HPqkskQzA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pLErx9Z52ADLmcrz"
Content-Disposition: inline
In-Reply-To: <CA+HBbNF-=W7A3Joftsqn+A6s170sqOZ77jpS105s5HPqkskQzA@mail.gmail.com>


--pLErx9Z52ADLmcrz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 11:34:55AM +0100, Robert Marko wrote:
> On Tue, Dec 16, 2025 at 6:32=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Mon, Dec 15, 2025 at 05:35:35PM +0100, Robert Marko wrote:
> > > Microchip EV23X71A board is an LAN9696 based evaluation board.
> > >
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > >  Documentation/devicetree/bindings/arm/microchip.yaml | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/microchip.yaml b/D=
ocumentation/devicetree/bindings/arm/microchip.yaml
> > > index 910ecc11d5d7..b20441edaac7 100644
> > > --- a/Documentation/devicetree/bindings/arm/microchip.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/microchip.yaml
> > > @@ -239,6 +239,14 @@ properties:
> > >            - const: microchip,lan9668
> > >            - const: microchip,lan966
> > >
> > > +      - description: The LAN969x EVB (EV23X71A) is a 24x 1G + 4x 10G
> > > +          Ethernet development system board.
> > > +      - items:
> > > +          - enum:
> > > +              - microchip,ev23x71a
> > > +              - microchip,lan9696
> >
> > This looks wrong, unless "microchip,lan9696" is a board (which I suspect
> > it isn't).
>=20
> Hi,
> No, LAN9696 is the exact SoC SKU used on the board.
> I will drop it in v3.

Instead of dropping it, this should become an items list with 3 consts I
think.

--pLErx9Z52ADLmcrz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUqqhAAKCRB4tDGHoIJi
0kmEAPwMbSydapbKFensNMM3LBSQavqvbhont2R2vwPmXc9oUAEA++sW5lHhwJ+e
9LfhPrkmqekkXDEYUUHTET78Ply7Xgw=
=FgUt
-----END PGP SIGNATURE-----

--pLErx9Z52ADLmcrz--

