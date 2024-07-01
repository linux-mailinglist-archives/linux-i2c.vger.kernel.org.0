Return-Path: <linux-i2c+bounces-4534-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9BE91E2B5
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 16:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA96828477A
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Jul 2024 14:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B869516C69E;
	Mon,  1 Jul 2024 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVQ2Xn9k"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723241607BC;
	Mon,  1 Jul 2024 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719845237; cv=none; b=gLTozdTWwZHQjMGl5XSF2h+MTo4vMdlGoC4bIvIhM800jGA8i0bc9WoVVC6cWARX0MKj8zKEhzUBwhp4YbmUrg3hA2zW5dFouBxqITeEAdyxJaOvyJ5/nhIFr9m9o4TCP/Idmiy12leIYQA6ZygVItDViYnxYolQUjnjQ61/OsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719845237; c=relaxed/simple;
	bh=j8XiGvWJ8XtpnCWRcFn+uOZrSEgcHJ4ERD16wxYfS5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbZ8InDVB4lZGZAhEgR+t7ifDUk2xzN03AnGcfmPA8+EkDb2QEdI4v4zc7K8uaQLi92pbRNZpDgcc9IIsWDcCMQd0r17LkAWS0Nnzae9AsB6vcu/ozLu0Y3buisbZ3T8h5TTp8g1vbnq2ZhWuLp6zI+uUETVhPhc1Iirb7JIIvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVQ2Xn9k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19279C116B1;
	Mon,  1 Jul 2024 14:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719845237;
	bh=j8XiGvWJ8XtpnCWRcFn+uOZrSEgcHJ4ERD16wxYfS5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FVQ2Xn9kH+d78Fm5CfMWf8q3qpIv2BGjxHUtI+unfUGoNgi5oahhz2O+ZLNwpsm3y
	 7MpTgmNZBmUlogjGIBphXcbZmQB2ZSJjhRTYLQxfMMAy+oHPUtkZpL7iwOhdFfzmbK
	 n1bCvfSRhwTMAPVusGkJ/8/kX5SjCMeUA3meUEjLau5rkkUNt30OwQ36dKpL3SYV3h
	 26cwDjCIGZeEs6cV+8cTYJjnm4GL/LFvr0rYbiG0ncgxrfa5gok8llXvBIpXudV5dJ
	 XVbYfrHZLx7RKIY5EHKx4ndZpCwMVfV/I1IV3z3yh0L0wkYT43a8oQMELa6i6doLuf
	 pFngdlhYfuAtQ==
Date: Mon, 1 Jul 2024 15:47:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrei.Simion@microchip.com
Cc: Conor.Dooley@microchip.com, brgl@bgdev.pl, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, arnd@arndb.de, gregkh@linuxfoundation.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/3] dt-bindings: eeprom: at24: Add Microchip
 24AA025E48/24AA025E64
Message-ID: <20240701-majorette-briskness-696746f3fde1@spud>
References: <20240628080146.49545-1-andrei.simion@microchip.com>
 <20240628080146.49545-4-andrei.simion@microchip.com>
 <20240628-plunder-wackiness-72b0acf3624b@wendy>
 <04278bf9-fb5f-4592-8edd-a45332fed24a@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="woyu5TzAIRUeYkBV"
Content-Disposition: inline
In-Reply-To: <04278bf9-fb5f-4592-8edd-a45332fed24a@microchip.com>


--woyu5TzAIRUeYkBV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 02:37:57PM +0000, Andrei.Simion@microchip.com wrote:
> On 28.06.2024 12:09, Conor Dooley wrote:
> > Hey,
> >=20
> > On Fri, Jun 28, 2024 at 11:01:46AM +0300, Andrei Simion wrote:
> >> Add compatible for Microchip 24AA025E48/24AA025E64 EEPROMs.
> >>
> >> Reviewed-by: Connor Dooley <conor.dooley@microchip.com>
> >                  ^^             ^
> > There's no way that I provided a tag with my name spelt incorrectly
> > given I use a macro to insert them. Please copy-paste tags or use b4
> > to pick them up, rather than type them out yourself.
> >=20
> >> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> >> ---
> >> v2 -> v3:
> >> - commit subject changed to reference Microchip 24AA025E48/24AA025E64
> >> - drop the pattern: mac02e4$ and mac02e6$ and a-z from regex
> >> - add these two devices down at the bottom
> >> - added Reviewed-by
> >>
> >> v1 -> v2:
> >> - change pattern into "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$" to keep si=
mpler
> >> ---
> >>  Documentation/devicetree/bindings/eeprom/at24.yaml | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Docu=
mentation/devicetree/bindings/eeprom/at24.yaml
> >> index 3c36cd0510de..699c2bbc16f5 100644
> >> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> >> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> >> @@ -132,6 +132,10 @@ properties:
> >>                - renesas,r1ex24128
> >>                - samsung,s524ad0xd1
> >>            - const: atmel,24c128
> >> +      - items:
> >> +          - const: microchip,24aa025e48
> >> +      - items:
> >> +          - const: microchip,24aa025e64
> >=20
> > I don't think this patch works, the schema has a select in it that only
> > matches ^atmel,(24(c|cs|mac)[0-9]+|spd)$. You either need to have these
> > fall back to an existing compatible (iff actually compatible) or else do
> > something like:
> > diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Docum=
entation/devicetree/bindings/eeprom/at24.yaml
> > index 699c2bbc16f5..4d46b8c5439d 100644
> > --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> > +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > @@ -18,7 +18,9 @@ select:
> >    properties:
> >      compatible:
> >        contains:
> > -        pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
> > +        anyOf:
> > +          - pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
> > +          - enum: ["microchip,24aa025e48", "microchip,24aa025e64"]
>=20
> If I use your solution (and drop both items: const) -> it is selected the=
 compatible but does not match anything.

My intention was that you added my diff to your existing patch.

Thanks,
Conor.

--woyu5TzAIRUeYkBV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoLBbwAKCRB4tDGHoIJi
0iuxAQD3nivIzehKWwsPswITcQpTaCzYeOEfQArdjN9Yfifw5AEArpZaFKJXjqW+
8ceF7VlRJqpYqfhZKKfZxBwFc+fQcAQ=
=A15X
-----END PGP SIGNATURE-----

--woyu5TzAIRUeYkBV--

